#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

# Turn laser on and wait 250ms for very first measurement to be ready
tinkerforge call laser-range-finder-v2-bricklet $uid set-enable true
sleep 0.25

# Handle incoming distance callbacks
tinkerforge dispatch laser-range-finder-v2-bricklet $uid distance &

# Configure threshold for distance "greater than 20 cm"
# with a debounce period of 1s (1000ms)
tinkerforge call laser-range-finder-v2-bricklet $uid set-distance-callback-configuration 1000 false threshold-option-greater 20 0

echo "Press key to exit"; read dummy

# Turn laser off
tinkerforge call laser-range-finder-v2-bricklet $uid set-enable false

kill -- -$$ # Stop callback dispatch in background
