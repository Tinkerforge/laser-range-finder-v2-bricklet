/* laser-range-finder-v2-bricklet
 * Copyright (C) 2019 Olaf Lüke <olaf@tinkerforge.com>
 *
 * lidar.c: Driver for lidar lite v3
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "lidar.h"

#include "configs/config_lidar.h"

#include "bricklib2/os/coop_task.h"
#include "bricklib2/hal/i2c_fifo/i2c_fifo.h"
#include "bricklib2/hal/ccu4_pwm/ccu4_pwm.h"
#include "bricklib2/hal/system_timer/system_timer.h"

#include "bricklib2/utility/util_definitions.h"
#include "bricklib2/bootloader/bootloader.h"

#include "communication.h"

#define LIDAR_MOVING_AVERAGE_DEFAULT_LENGTH 10
#define LIDAR_OFFSET_DEFAULT -9

Lidar lidar;
CoopTask lidar_task;

void lidar_write_calibration(void) {
	uint32_t page[EEPROM_PAGE_SIZE/sizeof(uint32_t)];

	page[LIDAR_CALIBRATION_MAGIC_POS]  = LIDAR_CALIBRATION_MAGIC;
	page[LIDAR_CALIBRATION_OFFSET_POS] = INT16_MAX + lidar.offset;

	bootloader_write_eeprom_page(LIDAR_CALIBRATION_PAGE, page);
}

void lidar_read_calibration(void) {
	uint32_t page[EEPROM_PAGE_SIZE/sizeof(uint32_t)];
	bootloader_read_eeprom_page(LIDAR_CALIBRATION_PAGE, page);

	// The magic number is not where it is supposed to be.
	// This is either our first startup or something went wrong.
	// We initialize the calibration data with sane default values.
	if(page[0] != LIDAR_CALIBRATION_MAGIC) {
		lidar.offset = INT16_MAX + LIDAR_OFFSET_DEFAULT;
		lidar_write_calibration();
		return;
	}

	lidar.offset = page[LIDAR_CALIBRATION_OFFSET_POS] - INT16_MAX;
}


bool lidar_task_is_busy(void) {
	uint8_t status = 0;
	i2c_fifo_coop_write_register(&lidar.i2c_fifo, LIDAR_REG_STATUS, 0, NULL, true);
	i2c_fifo_coop_read_direct(&lidar.i2c_fifo, 1, &status, false);

	return status & 1;
}

uint32_t lidar_task_read_registers(const uint8_t reg, const uint8_t length, uint8_t *data) {
	i2c_fifo_coop_write_register(&lidar.i2c_fifo, length > 1 ? (reg | LIDAR_CONTINOUS_RW) : reg, 0, NULL, true);
	return i2c_fifo_coop_read_direct(&lidar.i2c_fifo, length, data, false);
}

uint32_t lidar_task_write_register(const uint8_t reg, uint8_t data) {
	return i2c_fifo_coop_write_register(&lidar.i2c_fifo, reg, 1, &data, true);
}

void lidar_task_tick(void) {
	XMC_GPIO_CONFIG_t output_high = {
		.mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH
	};

	XMC_GPIO_CONFIG_t output_low = {
		.mode = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_LOW
	};

	XMC_GPIO_Init(LIDAR_ENABLE_PIN, &output_low);
	coop_task_sleep_ms(100);
	XMC_GPIO_Init(LIDAR_ENABLE_PIN, &output_high);
	coop_task_sleep_ms(200);
	lidar_task_write_register(LIDAR_REG_ACQ_COMMAND,      0x00); // reset
	coop_task_sleep_ms(200);

	lidar_task_write_register(LIDAR_REG_OUTER_LOOP_COUNT, 0xFF); // continuous measurement
	lidar_task_write_register(LIDAR_REG_ACQ_COMMAND,      0x04); // start measurement

	uint8_t data[2];
	while(true) {
		if(lidar.new_calibration) {
			lidar.new_calibration = false;
			lidar_write_calibration();
		}

		if(lidar.enable_laser) {
			if(lidar.new_configuration) {
				uint8_t sig_count_val = lidar.acquisition_count;
				uint8_t acq_config = 0;
				if(!lidar.enable_quick_termination) {
					acq_config |= (1 << 3);
				}
				if(lidar.measurement_frequency != 0) {
					acq_config |= (1 << 5);
				}
				uint8_t threshold_bypass = lidar.threshold_value;

				uint8_t measure_delay = 0x14;
				if(lidar.measurement_frequency != 0) {
					measure_delay = 2000/lidar.measurement_frequency;
				}

				lidar_task_write_register(LIDAR_REG_SIG_COUNT_VAL,    sig_count_val);
				lidar_task_write_register(LIDAR_REG_ACQ_CONFIG,       acq_config);
				lidar_task_write_register(LIDAR_REG_THRESHOLD_BYPASS, threshold_bypass);
				lidar_task_write_register(LIDAR_REG_MEASURE_DELAY,    measure_delay);

				lidar.new_configuration = false;
			} else {
				lidar_task_read_registers(LIDAR_REG_FULL_DELAY_HIGH, 2, data);
				uint16_t distance = (data[0] << 8) | data[1];
				int16_t  velocity = 0;
				if((distance & (1 << 15)) != (1 << 15)) { // If the MSB is 1 then the reading is not considered valid
					distance = MAX(0, distance + lidar.offset);
					lidar_task_read_registers(LIDAR_REG_VELOCITY, 1, data);
					velocity = (((int8_t)data[0]) - lidar.offset)*lidar.measurement_frequency;

					if(lidar.first_value) {
						lidar.first_value = false;
						lidar.distance = distance;
						lidar.velocity = velocity;
						moving_average_init(&lidar.moving_average_distance, distance, lidar.moving_average_length_distance);
						moving_average_init(&lidar.moving_average_velocity, velocity, lidar.moving_average_length_velocity);
					} else {
						lidar.distance = moving_average_handle_value(&lidar.moving_average_distance, distance);
						lidar.velocity = moving_average_handle_value(&lidar.moving_average_velocity, velocity);
					}
	
					coop_task_sleep_ms(2);
				}
			}
		}
		coop_task_yield();
	}
}

void lidar_init_i2c(void) {
	memset(&lidar, 0, sizeof(Lidar));

	lidar.i2c_fifo.baudrate         = LIDAR_I2C_BAUDRATE;
	lidar.i2c_fifo.address          = LIDAR_I2C_ADDRESS;
	lidar.i2c_fifo.i2c              = LIDAR_I2C;

	lidar.i2c_fifo.scl_port         = LIDAR_SCL_PORT;
	lidar.i2c_fifo.scl_pin          = LIDAR_SCL_PIN;
	lidar.i2c_fifo.scl_mode         = LIDAR_SCL_PIN_MODE;
	lidar.i2c_fifo.scl_input        = LIDAR_SCL_INPUT;
	lidar.i2c_fifo.scl_source       = LIDAR_SCL_SOURCE;
	lidar.i2c_fifo.scl_fifo_size    = LIDAR_SCL_FIFO_SIZE;
	lidar.i2c_fifo.scl_fifo_pointer = LIDAR_SCL_FIFO_POINTER;

	lidar.i2c_fifo.sda_port         = LIDAR_SDA_PORT;
	lidar.i2c_fifo.sda_pin          = LIDAR_SDA_PIN;
	lidar.i2c_fifo.sda_mode         = LIDAR_SDA_PIN_MODE;
	lidar.i2c_fifo.sda_input        = LIDAR_SDA_INPUT;
	lidar.i2c_fifo.sda_source       = LIDAR_SDA_SOURCE;
	lidar.i2c_fifo.sda_fifo_size    = LIDAR_SDA_FIFO_SIZE;
	lidar.i2c_fifo.sda_fifo_pointer = LIDAR_SDA_FIFO_POINTER;

	i2c_fifo_init(&lidar.i2c_fifo);

	lidar.enable_laser = false;
	lidar.acquisition_count = 0x80;
	lidar.enable_quick_termination = true;
	lidar.threshold_value = 0;
	lidar.measurement_frequency = 0;
	lidar.moving_average_length_distance = LIDAR_MOVING_AVERAGE_DEFAULT_LENGTH;
	lidar.moving_average_length_velocity = LIDAR_MOVING_AVERAGE_DEFAULT_LENGTH;
	lidar.led.config = LASER_RANGE_FINDER_V2_DISTANCE_LED_CONFIG_SHOW_DISTANCE;
			
	lidar.new_configuration = true;
	lidar.first_value = true;

	ccu4_pwm_init(LIDAR_LED_PIN, LIDAR_LED_CCU4_SLICE, 255);
	lidar_read_calibration();
}

void lidar_init(void) {
	lidar_init_i2c();

	coop_task_init(&lidar_task, lidar_task_tick);	
}

void lidar_tick(void) {
	if(lidar.led.config == LASER_RANGE_FINDER_V2_DISTANCE_LED_CONFIG_SHOW_DISTANCE) {
		ccu4_pwm_set_duty_cycle(LIDAR_LED_CCU4_SLICE, 255-BETWEEN(0, SCALE(lidar_get_distance(), 30, 100, 0, 255), 255));
	} else {
		led_flicker_tick(&lidar.led, system_timer_get_ms(), LIDAR_LED_PIN);
	}

	coop_task_tick(&lidar_task);
}

int16_t lidar_get_velocity(void) {
	return lidar.velocity;
}

int16_t lidar_get_distance(void) {
	return lidar.distance;
}