Imports System
Imports System.Threading
Imports Tinkerforge

Module ExampleSimple
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim lrf As New BrickletLaserRangeFinderV2(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Turn laser on and wait 250ms for very first measurement to be ready
        lrf.SetEnable(True)
        Thread.Sleep(250)

        ' Get current distance
        Dim distance As Short = lrf.GetDistance()
        Console.WriteLine("Distance: " + distance.ToString() + " cm")

        Console.WriteLine("Press key to exit")
        Console.ReadLine()

        ' Turn laser off
        lrf.SetEnable(False)

        ipcon.Disconnect()
    End Sub
End Module
