/* laser-range-finder-v2-bricklet
 * Copyright (C) 2019 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.c: TFP protocol message handling
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

#include "communication.h"

#include "bricklib2/utility/communication_callback.h"
#include "bricklib2/protocols/tfp/tfp.h"

#define CALLBACK_VALUE_TYPE CALLBACK_VALUE_TYPE_INT16
#include "bricklib2/utility/callback_value.h"
CallbackValue_int16_t callback_value_velocity;
CallbackValue_int16_t callback_value_distance;

#include "configs/config_lidar.h"
#include "lidar.h"

BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_GET_DISTANCE: return get_callback_value_int16_t(message, response, &callback_value_distance);
		case FID_SET_DISTANCE_CALLBACK_CONFIGURATION: return set_callback_value_callback_configuration_int16_t(message, &callback_value_distance);
		case FID_GET_DISTANCE_CALLBACK_CONFIGURATION: return get_callback_value_callback_configuration_int16_t(message, response, &callback_value_distance);
		case FID_GET_VELOCITY: return get_callback_value_int16_t(message, response, &callback_value_velocity);
		case FID_SET_VELOCITY_CALLBACK_CONFIGURATION: return set_callback_value_callback_configuration_int16_t(message, &callback_value_velocity);
		case FID_GET_VELOCITY_CALLBACK_CONFIGURATION: return get_callback_value_callback_configuration_int16_t(message, response, &callback_value_velocity);
		case FID_SET_ENABLE: return set_enable(message);
		case FID_GET_ENABLE: return get_enable(message, response);
		case FID_SET_CONFIGURATION: return set_configuration(message);
		case FID_GET_CONFIGURATION: return get_configuration(message, response);
		case FID_SET_MOVING_AVERAGE: return set_moving_average(message);
		case FID_GET_MOVING_AVERAGE: return get_moving_average(message, response);
		case FID_SET_OFFSET_CALIBRATION: return set_offset_calibration(message);
		case FID_GET_OFFSET_CALIBRATION: return get_offset_calibration(message, response);
		default: return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}


BootloaderHandleMessageResponse set_enable(const SetEnable *data) {
	lidar.enable_laser      = data->enable;
	lidar.new_enable_laser  = true;
	lidar.new_configuration = true;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_enable(const GetEnable *data, GetEnable_Response *response) {
	response->header.length = sizeof(GetEnable_Response);
	response->enable        = lidar.enable_laser;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_configuration(const SetConfiguration *data) {
	lidar.acquisition_count        = data->acquisition_count;
	lidar.enable_quick_termination = data->enable_quick_termination;
	lidar.threshold_value          = data->threshold_value;
	lidar.measurement_frequency    = data->measurement_frequency;

	lidar.new_configuration        = true;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_configuration(const GetConfiguration *data, GetConfiguration_Response *response) {
	response->header.length            = sizeof(GetConfiguration_Response);
	response->acquisition_count        = lidar.acquisition_count;
	response->enable_quick_termination = lidar.enable_quick_termination;
	response->threshold_value          = lidar.threshold_value;
	response->measurement_frequency    = lidar.measurement_frequency;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_moving_average(const SetMovingAverage *data) {
	lidar.moving_average_length_distance = data->distance_average_length;
	lidar.moving_average_length_velocity = data->velocity_average_length;
	moving_average_new_length(&lidar.moving_average_distance, lidar.moving_average_length_distance);
	moving_average_new_length(&lidar.moving_average_velocity, lidar.moving_average_length_velocity);

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_moving_average(const GetMovingAverage *data, GetMovingAverage_Response *response) {
	response->header.length           = sizeof(GetMovingAverage_Response);
	response->distance_average_length = lidar.moving_average_length_distance;
	response->velocity_average_length = lidar.moving_average_length_velocity;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_offset_calibration(const SetOffsetCalibration *data) {
	lidar.offset          = data->offset;
	lidar.new_calibration = true;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_offset_calibration(const GetOffsetCalibration *data, GetOffsetCalibration_Response *response) {
	response->header.length = sizeof(GetOffsetCalibration_Response);
	response->offset        = lidar.offset;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_distance_led_config(const SetDistanceLEDConfig *data) {
	if(data->config > LASER_RANGE_FINDER_V2_DISTANCE_LED_CONFIG_SHOW_DISTANCE) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	XMC_GPIO_CONFIG_t config_gpio = {
		.mode             = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
	};

	XMC_GPIO_CONFIG_t config_pwm = {
		.mode             = XMC_GPIO_MODE_OUTPUT_PUSH_PULL_ALT2,
		.input_hysteresis = XMC_GPIO_INPUT_HYSTERESIS_STANDARD,
		.output_level     = XMC_GPIO_OUTPUT_LEVEL_LOW,
	};

	switch(data->config) {
		case LASER_RANGE_FINDER_V2_DISTANCE_LED_CONFIG_OFF: {
			config_gpio.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH;
			XMC_GPIO_Init(LIDAR_LED_PIN, &config_gpio);
			break;
		}

		case LASER_RANGE_FINDER_V2_DISTANCE_LED_CONFIG_ON: // fall-through
		case LASER_RANGE_FINDER_V2_DISTANCE_LED_CONFIG_SHOW_HEARTBEAT: {
			config_gpio.output_level = XMC_GPIO_OUTPUT_LEVEL_LOW;
			XMC_GPIO_Init(LIDAR_LED_PIN, &config_gpio);
			break;
		}

		case LASER_RANGE_FINDER_V2_DISTANCE_LED_CONFIG_SHOW_DISTANCE: {
			XMC_GPIO_Init(LIDAR_LED_PIN, &config_pwm);
			break;
		}
	}

	lidar.led.config = data->config;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_distance_led_config(const GetDistanceLEDConfig *data, GetDistanceLEDConfig_Response *response) {
	response->header.length = sizeof(GetDistanceLEDConfig_Response);
	response->config        = lidar.led.config;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

bool handle_distance_callback(void) {
	return handle_callback_value_callback_int16_t(&callback_value_distance, FID_CALLBACK_DISTANCE);
}

bool handle_velocity_callback(void) {
	return handle_callback_value_callback_int16_t(&callback_value_velocity, FID_CALLBACK_VELOCITY);
}

void communication_tick(void) {
	communication_callback_tick();
}

void communication_init(void) {
	callback_value_init_int16_t(&callback_value_velocity, lidar_get_velocity);
	callback_value_init_int16_t(&callback_value_distance, lidar_get_distance);

	communication_callback_init();
}
