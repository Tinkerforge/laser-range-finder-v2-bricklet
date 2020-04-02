<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletLaserRangeFinderV2.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletLaserRangeFinderV2;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

// Callback function for distance callback
function cb_distance($distance)
{
    echo "Distance: $distance cm\n";
}

$ipcon = new IPConnection(); // Create IP connection
$lrf = new BrickletLaserRangeFinderV2(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Turn laser on and wait 250ms for very first measurement to be ready
$lrf->setEnable(TRUE);
usleep(250*1000);

// Register distance callback to function cb_distance
$lrf->registerCallback(BrickletLaserRangeFinderV2::CALLBACK_DISTANCE, 'cb_distance');

// Set period for distance callback to 0.2s (200ms) without a threshold
$lrf->setDistanceCallbackConfiguration(200, FALSE, 'x', 0, 0);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
