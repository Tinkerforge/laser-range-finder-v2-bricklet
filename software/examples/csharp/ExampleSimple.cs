using System;
using System.Threading;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

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

		// Get current distance
		int distance = lrf.GetDistance();
		Console.WriteLine("Distance: " + distance + " cm");

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();

		// Turn laser off
		lrf.SetEnable(false);

		ipcon.Disconnect();
	}
}
