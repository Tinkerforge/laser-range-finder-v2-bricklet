import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletLaserRangeFinderV2;

public class ExampleThreshold {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;

	// Change XYZ to the UID of your Laser Range Finder Bricklet 2.0
	private static final String UID = "XYZ";

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletLaserRangeFinderV2 lrf =
		  new BrickletLaserRangeFinderV2(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Turn laser on and wait 250ms for very first measurement to be ready
		lrf.setEnable(true);
		Thread.sleep(250);

		// Add distance listener
		lrf.addDistanceListener(new BrickletLaserRangeFinderV2.DistanceListener() {
			public void distance(int distance) {
				System.out.println("Distance: " + distance + " cm");
			}
		});

		// Configure threshold for distance "greater than 20 cm"
		// with a debounce period of 1s (1000ms)
		lrf.setDistanceCallbackConfiguration(1000, false, '>', 20, 0);

		System.out.println("Press key to exit"); System.in.read();

		// Turn laser off
		lrf.setEnable(false);

		ipcon.disconnect();
	}
}
