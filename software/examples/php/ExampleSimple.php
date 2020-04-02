<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletLaserRangeFinderV2.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletLaserRangeFinderV2;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

$ipcon = new IPConnection(); // Create IP connection
$lrf = new BrickletLaserRangeFinderV2(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Turn laser on and wait 250ms for very first measurement to be ready
$lrf->setEnable(TRUE);
usleep(250*1000);

// Get current distance
$distance = $lrf->getDistance();
echo "Distance: $distance cm\n";

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));

// Turn laser off
$lrf->setEnable(FALSE);

$ipcon->disconnect();

?>
