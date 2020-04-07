program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLaserRangeFinderV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    lrf: TBrickletLaserRangeFinderV2;
  public
    procedure DistanceCB(sender: TBrickletLaserRangeFinderV2; const distance: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Laser Range Finder Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for distance callback }
procedure TExample.DistanceCB(sender: TBrickletLaserRangeFinderV2;
                              const distance: smallint);
begin
  WriteLn(Format('Distance: %d cm', [distance]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  lrf := TBrickletLaserRangeFinderV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Turn laser on and wait 250ms for very first measurement to be ready }
  lrf.SetEnable(true);
  Sleep(250);

  { Register distance callback to procedure DistanceCB }
  lrf.OnDistance := {$ifdef FPC}@{$endif}DistanceCB;

  { Set period for distance callback to 0.2s (200ms) without a threshold }
  lrf.SetDistanceCallbackConfiguration(200, false, 'x', 0, 0);

  WriteLn('Press key to exit');
  ReadLn;

  { Turn laser off }
  lrf.SetEnable(false);

  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
