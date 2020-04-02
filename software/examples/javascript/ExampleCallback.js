var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'XYZ'; // Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var lrf = new Tinkerforge.BrickletLaserRangeFinderV2(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function (error) {
        console.log('Error: ' + error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

ipcon.on(Tinkerforge.IPConnection.CALLBACK_CONNECTED,
    function (connectReason) {
        // Turn laser on and wait 250ms for very first measurement to be ready
        lrf.setEnable(true);

        setTimeout(function () {
            // Set period for distance callback to 0.2s (200ms) without a threshold
            lrf.setDistanceCallbackConfiguration(200, false, 'x', 0, 0);
        }, 250);
    }
);

// Register distance callback
lrf.on(Tinkerforge.BrickletLaserRangeFinderV2.CALLBACK_DISTANCE,
    // Callback function for distance callback
    function (distance) {
        console.log('Distance: ' + distance + ' cm');
    }
);

console.log('Press key to exit');
process.stdin.on('data',
    function (data) {
        // Turn laser off
        lrf.setEnable(false);

        ipcon.disconnect();
        process.exit(0);
    }
);
