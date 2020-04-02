function octave_example_simple()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    lrf = javaObject("com.tinkerforge.BrickletLaserRangeFinderV2", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Turn laser on and wait 250ms for very first measurement to be ready
    lrf.setEnable(true);
    pause(0.25);

    % Get current distance
    distance = lrf.getDistance();
    fprintf("Distance: %d cm\n", distance);

    input("Press key to exit\n", "s");

    % Turn laser off
    lrf.setEnable(false);

    ipcon.disconnect();
end
