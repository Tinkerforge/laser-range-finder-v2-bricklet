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

# Set period for distance callback to 0.2s (200ms) without a threshold
lrf.set_distance_callback_configuration 200, false, 'x', 0, 0

puts 'Press key to exit'
$stdin.gets

# Turn laser off
lrf.set_enable false

ipcon.disconnect
