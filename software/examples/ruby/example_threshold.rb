#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_laser_range_finder_v2'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

ipcon = IPConnection.new # Create IP connection
lrf = BrickletLaserRangeFinderV2.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Turn laser on and wait 250ms for very first measurement to be ready
lrf.set_enable true
sleep 0.25

# Register distance callback
lrf.register_callback(BrickletLaserRangeFinderV2::CALLBACK_DISTANCE) do |distance|
  puts "Distance: #{distance} cm"
end

# Configure threshold for distance "greater than 20 cm"
# with a debounce period of 1s (1000ms)
lrf.set_distance_callback_configuration 1000, false, '>', 20, 0

puts 'Press key to exit'
$stdin.gets

# Turn laser off
lrf.set_enable false

ipcon.disconnect
