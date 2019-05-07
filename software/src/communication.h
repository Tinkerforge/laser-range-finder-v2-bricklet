/* laser-range-finder-v2-bricklet
 * Copyright (C) 2019 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.h: TFP protocol message handling
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

#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/bootloader/bootloader.h"

// Default functions
BootloaderHandleMessageResponse handle_message(const void *data, void *response);
void communication_tick(void);
void communication_init(void);

// Constants
#define LASER_RANGE_FINDER_V2_THRESHOLD_OPTION_OFF 'x'
#define LASER_RANGE_FINDER_V2_THRESHOLD_OPTION_OUTSIDE 'o'
#define LASER_RANGE_FINDER_V2_THRESHOLD_OPTION_INSIDE 'i'
#define LASER_RANGE_FINDER_V2_THRESHOLD_OPTION_SMALLER '<'
#define LASER_RANGE_FINDER_V2_THRESHOLD_OPTION_GREATER '>'

#define LASER_RANGE_FINDER_V2_BOOTLOADER_MODE_BOOTLOADER 0
#define LASER_RANGE_FINDER_V2_BOOTLOADER_MODE_FIRMWARE 1
#define LASER_RANGE_FINDER_V2_BOOTLOADER_MODE_BOOTLOADER_WAIT_FOR_REBOOT 2
#define LASER_RANGE_FINDER_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_REBOOT 3
#define LASER_RANGE_FINDER_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_ERASE_AND_REBOOT 4

#define LASER_RANGE_FINDER_V2_BOOTLOADER_STATUS_OK 0
#define LASER_RANGE_FINDER_V2_BOOTLOADER_STATUS_INVALID_MODE 1
#define LASER_RANGE_FINDER_V2_BOOTLOADER_STATUS_NO_CHANGE 2
#define LASER_RANGE_FINDER_V2_BOOTLOADER_STATUS_ENTRY_FUNCTION_NOT_PRESENT 3
#define LASER_RANGE_FINDER_V2_BOOTLOADER_STATUS_DEVICE_IDENTIFIER_INCORRECT 4
#define LASER_RANGE_FINDER_V2_BOOTLOADER_STATUS_CRC_MISMATCH 5

#define LASER_RANGE_FINDER_V2_STATUS_LED_CONFIG_OFF 0
#define LASER_RANGE_FINDER_V2_STATUS_LED_CONFIG_ON 1
#define LASER_RANGE_FINDER_V2_STATUS_LED_CONFIG_SHOW_HEARTBEAT 2
#define LASER_RANGE_FINDER_V2_STATUS_LED_CONFIG_SHOW_STATUS 3

// Function and callback IDs and structs
#define FID_GET_DISTANCE 1
#define FID_SET_DISTANCE_CALLBACK_CONFIGURATION 2
#define FID_GET_DISTANCE_CALLBACK_CONFIGURATION 3
#define FID_GET_VELOCITY 5
#define FID_SET_VELOCITY_CALLBACK_CONFIGURATION 6
#define FID_GET_VELOCITY_CALLBACK_CONFIGURATION 7
#define FID_SET_ENABLE 9
#define FID_GET_ENABLE 10
#define FID_SET_CONFIGURATION 11
#define FID_GET_CONFIGURATION 12
#define FID_SET_MOVING_AVERAGE 13
#define FID_GET_MOVING_AVERAGE 14
#define FID_SET_OFFSET_CALIBRATION 15
#define FID_GET_OFFSET_CALIBRATION 16

#define FID_CALLBACK_DISTANCE 4
#define FID_CALLBACK_VELOCITY 8

typedef struct {
	TFPMessageHeader header;
	bool enable;
} __attribute__((__packed__)) SetEnable;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetEnable;

typedef struct {
	TFPMessageHeader header;
	bool enable;
} __attribute__((__packed__)) GetEnable_Response;

typedef struct {
	TFPMessageHeader header;
	uint8_t acquisition_count;
	bool enable_quick_termination;
	uint8_t threshold_value;
	uint16_t measurement_frequency;
} __attribute__((__packed__)) SetConfiguration;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetConfiguration;

typedef struct {
	TFPMessageHeader header;
	uint8_t acquisition_count;
	bool enable_quick_termination;
	uint8_t threshold_value;
	uint16_t measurement_frequency;
} __attribute__((__packed__)) GetConfiguration_Response;

typedef struct {
	TFPMessageHeader header;
	uint8_t distance_average_length;
	uint8_t velocity_average_length;
} __attribute__((__packed__)) SetMovingAverage;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetMovingAverage;

typedef struct {
	TFPMessageHeader header;
	uint8_t distance_average_length;
	uint8_t velocity_average_length;
} __attribute__((__packed__)) GetMovingAverage_Response;

typedef struct {
	TFPMessageHeader header;
	int16_t offset;
} __attribute__((__packed__)) SetOffsetCalibration;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetOffsetCalibration;

typedef struct {
	TFPMessageHeader header;
	int16_t offset;
} __attribute__((__packed__)) GetOffsetCalibration_Response;


// Function prototypes
BootloaderHandleMessageResponse set_enable(const SetEnable *data);
BootloaderHandleMessageResponse get_enable(const GetEnable *data, GetEnable_Response *response);
BootloaderHandleMessageResponse set_configuration(const SetConfiguration *data);
BootloaderHandleMessageResponse get_configuration(const GetConfiguration *data, GetConfiguration_Response *response);
BootloaderHandleMessageResponse set_moving_average(const SetMovingAverage *data);
BootloaderHandleMessageResponse get_moving_average(const GetMovingAverage *data, GetMovingAverage_Response *response);
BootloaderHandleMessageResponse set_offset_calibration(const SetOffsetCalibration *data);
BootloaderHandleMessageResponse get_offset_calibration(const GetOffsetCalibration *data, GetOffsetCalibration_Response *response);

// Callbacks
bool handle_distance_callback(void);
bool handle_velocity_callback(void);

#define COMMUNICATION_CALLBACK_TICK_WAIT_MS 1
#define COMMUNICATION_CALLBACK_HANDLER_NUM 2
#define COMMUNICATION_CALLBACK_LIST_INIT \
	handle_distance_callback, \
	handle_velocity_callback, \


#endif
