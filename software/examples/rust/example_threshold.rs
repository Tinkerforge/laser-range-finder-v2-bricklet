use std::{error::Error, io, thread, time::Duration};
use tinkerforge::{ip_connection::IpConnection, laser_range_finder_v2_bricklet::*};

const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Laser Range Finder Bricklet 2.0.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let lrf = LaserRangeFinderV2Bricklet::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
                                          // Don't use device before ipcon is connected.

    // Turn laser on and wait 250ms for very first measurement to be ready
    lrf.set_enable(true).recv()?;
    thread::sleep(Duration::from_millis(250));

    let distance_receiver = lrf.get_distance_callback_receiver();

    // Spawn thread to handle received callback messages.
    // This thread ends when the `lrf` object
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for distance in distance_receiver {
            println!("Distance: {} cm", distance);
        }
    });

    // Configure threshold for distance "greater than 20 cm"
    // with a debounce period of 1s (1000ms).
    lrf.set_distance_callback_configuration(1000, false, '>', 20, 0);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;

    // Turn laser off
    lrf.set_enable(false).recv()?;

    ipcon.disconnect();
    Ok(())
}
