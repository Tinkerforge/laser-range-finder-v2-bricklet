#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletLaserRangeFinderV2;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $lrf = Tinkerforge::BrickletLaserRangeFinderV2->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Turn laser on and wait 250ms for very first measurement to be ready
$lrf->set_enable(1);
select(undef, undef, undef, 0.25);

# Get current distance
my $distance = $lrf->get_distance();
print "Distance: $distance cm\n";

print "Press key to exit\n";
<STDIN>;

# Turn laser off
$lrf->set_enable(0);

$ipcon->disconnect();
