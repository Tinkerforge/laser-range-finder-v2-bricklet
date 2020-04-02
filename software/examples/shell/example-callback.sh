#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

# Turn laser on and wait 250ms for very first measurement to be ready
tinkerforge call laser-range-finder-v2-bricklet $uid set-enable true
sleep 0.25

# Handle incoming distance callbacks
tinkerforge dispatch laser-range-finder-v2-bricklet $uid distance &

# Set period for distance callback to 0.2s (200ms) without a threshold
tinkerforge call laser-range-finder-v2-bricklet $uid set-distance-callback-configuration 200 false threshold-option-off 0 0

echo "Press key to exit"; read dummy

# Turn laser off
tinkerforge call laser-range-finder-v2-bricklet $uid set-enable false

kill -- -$$ # Stop callback dispatch in background
