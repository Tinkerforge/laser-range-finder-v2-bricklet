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

// Configure threshold for distance "greater than 20 cm"
// with a debounce period of 1s (1000ms)
$lrf->setDistanceCallbackConfiguration(1000, FALSE, '>', 20, 0);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
