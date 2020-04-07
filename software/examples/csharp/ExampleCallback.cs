using System;
using System.Threading;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

	// Callback function for distance callback
	static void DistanceCB(BrickletLaserRangeFinderV2 sender, short distance)
	{
		Console.WriteLine("Distance: " + distance + " cm");
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletLaserRangeFinderV2 lrf =
		  new BrickletLaserRangeFinderV2(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Turn laser on and wait 250ms for very first measurement to be ready
		lrf.SetEnable(true);
		Thread.Sleep(250);

		// Register distance callback to function DistanceCB
		lrf.DistanceCallback += DistanceCB;

		// Set period for distance callback to 0.2s (200ms) without a threshold
		lrf.SetDistanceCallbackConfiguration(200, false, 'x', 0, 0);

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();

		// Turn laser off
		lrf.SetEnable(false);

		ipcon.Disconnect();
	}
}
