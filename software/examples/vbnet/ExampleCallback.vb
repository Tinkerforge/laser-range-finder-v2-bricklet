Imports System
Imports System.Threading
Imports Tinkerforge

Module ExampleCallback
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change XYZ to the UID of your Laser Range Finder Bricklet 2.0

    ' Callback subroutine for distance callback
    Sub DistanceCB(ByVal sender As BrickletLaserRangeFinderV2, ByVal distance As Short)
        Console.WriteLine("Distance: " + distance.ToString() + " cm")
    End Sub

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim lrf As New BrickletLaserRangeFinderV2(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Turn laser on and wait 250ms for very first measurement to be ready
        lrf.SetEnable(True)
        Thread.Sleep(250)

        ' Register distance callback to subroutine DistanceCB
        AddHandler lrf.DistanceCallback, AddressOf DistanceCB

        ' Set period for distance callback to 0.2s (200ms) without a threshold
        lrf.SetDistanceCallbackConfiguration(200, False, "x"C, 0, 0)

        Console.WriteLine("Press key to exit")
        Console.ReadLine()

        ' Turn laser off
        lrf.SetEnable(False)

        ipcon.Disconnect()
    End Sub
End Module
