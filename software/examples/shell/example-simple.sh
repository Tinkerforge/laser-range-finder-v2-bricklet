#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

# Turn laser on and wait 250ms for very first measurement to be ready
tinkerforge call laser-range-finder-v2-bricklet $uid set-enable true
sleep 0.25

# Get current distance
tinkerforge call laser-range-finder-v2-bricklet $uid get-distance

# Turn laser off
tinkerforge call laser-range-finder-v2-bricklet $uid set-enable false
