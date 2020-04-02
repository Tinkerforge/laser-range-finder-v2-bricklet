#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletLaserRangeFinderV2;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

# Callback subroutine for distance callback
sub cb_distance
{
    my ($distance) = @_;

    print "Distance: $distance cm\n";
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $lrf = Tinkerforge::BrickletLaserRangeFinderV2->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Turn laser on and wait 250ms for very first measurement to be ready
$lrf->set_enable(1);
select(undef, undef, undef, 0.25);

# Register distance callback to subroutine cb_distance
$lrf->register_callback($lrf->CALLBACK_DISTANCE, 'cb_distance');

# Configure threshold for distance "greater than 20 cm"
# with a debounce period of 1s (1000ms)
$lrf->set_distance_callback_configuration(1000, 0, '>', 20, 0);

print "Press key to exit\n";
<STDIN>;

# Turn laser off
$lrf->set_enable(0);

$ipcon->disconnect();
