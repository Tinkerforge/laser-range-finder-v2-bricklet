function matlab_example_callback()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletLaserRangeFinderV2;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

    ipcon = IPConnection(); % Create IP connection
    lrf = handle(BrickletLaserRangeFinderV2(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Turn laser on and wait 250ms for very first measurement to be ready
    lrf.setEnable(true);
    pause(0.25);

    % Register distance callback to function cb_distance
    set(lrf, 'DistanceCallback', @(h, e) cb_distance(e));

    % Set period for distance callback to 0.2s (200ms) without a threshold
    lrf.setDistanceCallbackConfiguration(200, false, 'x', 0, 0);

    input('Press key to exit\n', 's');

    % Turn laser off
    lrf.setEnable(false);

    ipcon.disconnect();
end

% Callback function for distance callback
function cb_distance(e)
    fprintf('Distance: %i cm\n', e.distance);
end
