/* laser-range-finder-v2-bricklet
 * Copyright (C) 2019 Olaf Lüke <olaf@tinkerforge.com>
 *
 * lidar.h: Driver for lidar lite v3
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

#ifndef LIDAR_H
#define LIDAR_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/hal/i2c_fifo/i2c_fifo.h"
#include "bricklib2/utility/moving_average.h"
#include "bricklib2/utility/led_flicker.h"

#define LIDAR_CALIBRATION_PAGE           1
#define LIDAR_CALIBRATION_MAGIC_POS      0
#define LIDAR_CALIBRATION_OFFSET_POS     1
#define LIDAR_CALIBRATION_MAGIC          0x12345678

#define LIDAR_CONTINOUS_RW         0x80

#define LIDAR_REG_ACQ_COMMAND      0x00
#define LIDAR_REG_STATUS           0x01
#define LIDAR_REG_SIG_COUNT_VAL    0x02
#define LIDAR_REG_ACQ_CONFIG       0x04
#define LIDAR_REG_VELOCITY         0x09
#define LIDAR_REG_PEAK_CORR        0x0c
#define LIDAR_REG_NOISE_PEAK       0x0d
#define LIDAR_REG_SIGNAL_STRENGTH  0x0e
#define LIDAR_REG_FULL_DELAY_HIGH  0x0f
#define LIDAR_REG_FULL_DELAY_LOW   0x10
#define LIDAR_REG_OUTER_LOOP_COUNT 0x11
#define LIDAR_REG_REF_COUNT_VAL    0x12
#define LIDAR_REG_LAST_DELAY_HIGH  0x14
#define LIDAR_REG_LAST_DELAY_LOW   0x15
#define LIDAR_REG_UNIT_ID_HIGH     0x16
#define LIDAR_REG_UNIT_ID_LOW      0x17
#define LIDAR_REG_I2C_ID_HIGH      0x18
#define LIDAR_REG_I2C_ID_LOW       0x19
#define LIDAR_REG_I2C_SEC_ADDR     0x1a
#define LIDAR_REG_THRESHOLD_BYPASS 0x1c
#define LIDAR_REG_I2C_CONFIG       0x1e
#define LIDAR_REG_COMMAND          0x40
#define LIDAR_REG_MEASURE_DELAY    0x45
#define LIDAR_REG_PEAK_BCK         0x4c
#define LIDAR_REG_CORR_DATA        0x52
#define LIDAR_REG_CORR_DATA_SIGN   0x53
#define LIDAR_REG_ACQ_SETTINGS     0x5d
#define LIDAR_REG_POWER_CONTROL    0x65

typedef struct {
    I2CFifo i2c_fifo;

	MovingAverage moving_average_distance;
	MovingAverage moving_average_velocity;

	bool new_calibration;
    bool new_configuration;
	bool enable_laser;
	bool new_enable_laser;

	uint8_t acquisition_count;
	bool enable_quick_termination;
	uint8_t threshold_value;
	uint8_t measurement_frequency;

	uint16_t distance;
	int16_t velocity;

	bool first_value;

	uint8_t moving_average_length_distance;
	uint8_t moving_average_length_velocity;

	int16_t offset;

	LEDFlickerState led;
} Lidar;

extern Lidar lidar;

void lidar_init(void);
void lidar_tick(void);

int16_t lidar_get_velocity(void);
int16_t lidar_get_distance(void);

#endif