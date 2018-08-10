EESchema Schematic File Version 4
LIBS:laser-range-finder-v2-bricklet-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L laser-range-finder-v2-bricklet-rescue:CON-SENSOR2 P1
U 1 1 5B5B0B02
P 1100 1750
F 0 "P1" H 950 2150 60  0000 C CNN
F 1 "CON-SENSOR2" V 1250 1750 60  0000 C CNN
F 2 "CON-SENSOR2" H 1200 1600 60  0001 C CNN
F 3 "" H 1200 1600 60  0000 C CNN
	1    1100 1750
	-1   0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:R_PACK4 RP1
U 1 1 5B5B1A4C
P 2300 1700
F 0 "RP1" H 2300 2150 50  0000 C CNN
F 1 "82" H 2300 1650 50  0000 C CNN
F 2 "4X0603" H 2300 1700 50  0001 C CNN
F 3 "" H 2300 1700 50  0000 C CNN
	1    2300 1700
	1    0    0    1   
$EndComp
Text GLabel 3050 1750 2    47   Output ~ 0
S-CS
Text GLabel 3050 1850 2    47   Output ~ 0
S-CLK
Text GLabel 3050 1950 2    47   Output ~ 0
S-MOSI
Text GLabel 3050 2050 2    47   Input ~ 0
S-MISO
$Comp
L laser-range-finder-v2-bricklet-rescue:C C1
U 1 1 5B5B1CC1
P 1800 2250
F 0 "C1" H 1850 2350 50  0000 L CNN
F 1 "220pF" H 1850 2150 50  0000 L CNN
F 2 "C0402E" H 1800 2250 60  0001 C CNN
F 3 "" H 1800 2250 60  0000 C CNN
	1    1800 2250
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:GND #PWR01
U 1 1 5B5B1D24
P 1800 2500
F 0 "#PWR01" H 1800 2500 30  0001 C CNN
F 1 "GND" H 1800 2430 30  0001 C CNN
F 2 "" H 1800 2500 60  0000 C CNN
F 3 "" H 1800 2500 60  0000 C CNN
	1    1800 2500
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:GND #PWR02
U 1 1 5B5B1D64
P 1100 2500
F 0 "#PWR02" H 1100 2500 30  0001 C CNN
F 1 "GND" H 1100 2430 30  0001 C CNN
F 2 "" H 1100 2500 60  0000 C CNN
F 3 "" H 1100 2500 60  0000 C CNN
	1    1100 2500
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:+5V #PWR03
U 1 1 5B5B1DC0
P 1600 900
F 0 "#PWR03" H 1600 750 50  0001 C CNN
F 1 "+5V" H 1600 1040 50  0000 C CNN
F 2 "" H 1600 900 50  0000 C CNN
F 3 "" H 1600 900 50  0000 C CNN
	1    1600 900 
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:C C2
U 1 1 5B5B1DF2
P 2150 1250
F 0 "C2" H 2200 1350 50  0000 L CNN
F 1 "10uF" H 2200 1150 50  0000 L CNN
F 2 "C0402E" H 2150 1250 60  0001 C CNN
F 3 "" H 2150 1250 60  0000 C CNN
	1    2150 1250
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:C C3
U 1 1 5B5B1E37
P 2550 1250
F 0 "C3" H 2600 1350 50  0000 L CNN
F 1 "1uF" H 2600 1150 50  0000 L CNN
F 2 "C0402E" H 2550 1250 60  0001 C CNN
F 3 "" H 2550 1250 60  0000 C CNN
	1    2550 1250
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:3V3 #PWR04
U 1 1 5B5B1FD2
P 2550 850
F 0 "#PWR04" H 2550 950 40  0001 C CNN
F 1 "3V3" H 2550 975 40  0000 C CNN
F 2 "" H 2550 850 60  0000 C CNN
F 3 "" H 2550 850 60  0000 C CNN
	1    2550 850 
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:GND #PWR05
U 1 1 5B5B2027
P 2600 1600
F 0 "#PWR05" H 2600 1600 30  0001 C CNN
F 1 "GND" H 2600 1530 30  0001 C CNN
F 2 "" H 2600 1600 60  0000 C CNN
F 3 "" H 2600 1600 60  0000 C CNN
	1    2600 1600
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:XMC1XXX24 U1
U 1 1 5B5B218B
P 3950 7000
F 0 "U1" H 3950 7450 60  0000 C CNN
F 1 "XMC1XXX24" H 3950 6550 60  0000 C CNN
F 2 "QFN24-4x4mm-0.5mm" H 4100 7750 60  0001 C CNN
F 3 "" H 4100 7750 60  0000 C CNN
	1    3950 7000
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:XMC1XXX24 U1
U 2 1 5B5B2270
P 3950 3450
F 0 "U1" H 3950 4050 60  0000 C CNN
F 1 "XMC1XXX24" H 3950 2850 60  0000 C CNN
F 2 "QFN24-4x4mm-0.5mm" H 4100 4200 60  0001 C CNN
F 3 "" H 4100 4200 60  0000 C CNN
	2    3950 3450
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:XMC1XXX24 U1
U 3 1 5B5B22BE
P 3950 4650
F 0 "U1" H 3950 4950 60  0000 C CNN
F 1 "XMC1XXX24" H 3950 4350 60  0000 C CNN
F 2 "QFN24-4x4mm-0.5mm" H 4100 5400 60  0001 C CNN
F 3 "" H 4100 5400 60  0000 C CNN
	3    3950 4650
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:XMC1XXX24 U1
U 4 1 5B5B2343
P 3950 5750
F 0 "U1" H 3950 6250 60  0000 C CNN
F 1 "XMC1XXX24" H 3950 5250 60  0000 C CNN
F 2 "QFN24-4x4mm-0.5mm" H 4100 6500 60  0001 C CNN
F 3 "" H 4100 6500 60  0000 C CNN
	4    3950 5750
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:C C6
U 1 1 5B62C94F
P 7600 1950
F 0 "C6" H 7625 2050 50  0000 L CNN
F 1 "1µF" H 7625 1850 50  0000 L CNN
F 2 "C0603E" H 7638 1800 50  0001 C CNN
F 3 "" H 7600 1950 50  0000 C CNN
	1    7600 1950
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:C C5
U 1 1 5B62C9E0
P 6500 1950
F 0 "C5" H 6525 2050 50  0000 L CNN
F 1 "1µF" H 6525 1850 50  0000 L CNN
F 2 "C0603E" H 6538 1800 50  0001 C CNN
F 3 "" H 6500 1950 50  0000 C CNN
	1    6500 1950
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:CP1 C7
U 1 1 5B62CA57
P 8150 1950
F 0 "C7" H 8175 2050 50  0000 L CNN
F 1 "100µF" H 8175 1850 50  0000 L CNN
F 2 "3528-21" H 8150 1950 50  0001 C CNN
F 3 "" H 8150 1950 50  0000 C CNN
	1    8150 1950
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:INDUCTOR L1
U 1 1 5B62CAB2
P 7050 1700
F 0 "L1" V 7000 1700 50  0000 C CNN
F 1 "FB-2" V 7150 1700 50  0000 C CNN
F 2 "R0603E" H 7050 1700 50  0001 C CNN
F 3 "" H 7050 1700 50  0000 C CNN
	1    7050 1700
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:GND #PWR06
U 1 1 5B62CD4D
P 6500 2400
F 0 "#PWR06" H 6500 2150 50  0001 C CNN
F 1 "GND" H 6500 2250 50  0000 C CNN
F 2 "" H 6500 2400 50  0000 C CNN
F 3 "" H 6500 2400 50  0000 C CNN
	1    6500 2400
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:GND #PWR07
U 1 1 5B62CD7D
P 7600 2400
F 0 "#PWR07" H 7600 2150 50  0001 C CNN
F 1 "GND" H 7600 2250 50  0000 C CNN
F 2 "" H 7600 2400 50  0000 C CNN
F 3 "" H 7600 2400 50  0000 C CNN
	1    7600 2400
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:GND #PWR08
U 1 1 5B62CDAD
P 8150 2400
F 0 "#PWR08" H 8150 2150 50  0001 C CNN
F 1 "GND" H 8150 2250 50  0000 C CNN
F 2 "" H 8150 2400 50  0000 C CNN
F 3 "" H 8150 2400 50  0000 C CNN
	1    8150 2400
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:+5V #PWR09
U 1 1 5B62CF98
P 6500 1550
F 0 "#PWR09" H 6500 1400 50  0001 C CNN
F 1 "+5V" H 6500 1690 50  0000 C CNN
F 2 "" H 6500 1550 50  0000 C CNN
F 3 "" H 6500 1550 50  0000 C CNN
	1    6500 1550
	1    0    0    -1  
$EndComp
Text GLabel 9500 1800 0    47   Input ~ 0
ENABLE
Text GLabel 8750 2000 0    47   Input ~ 0
SCL
Text GLabel 8750 2100 0    47   Input ~ 0
SDA
$Comp
L laser-range-finder-v2-bricklet-rescue:GND #PWR010
U 1 1 5B62D49D
P 9650 2650
F 0 "#PWR010" H 9650 2400 50  0001 C CNN
F 1 "GND" H 9650 2500 50  0000 C CNN
F 2 "" H 9650 2650 50  0000 C CNN
F 3 "" H 9650 2650 50  0000 C CNN
	1    9650 2650
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:GND #PWR011
U 1 1 5B62D981
P 3400 7450
F 0 "#PWR011" H 3400 7200 50  0001 C CNN
F 1 "GND" H 3400 7300 50  0000 C CNN
F 2 "" H 3400 7450 50  0000 C CNN
F 3 "" H 3400 7450 50  0000 C CNN
	1    3400 7450
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:3V3 #PWR012
U 1 1 5B62D9DC
P 3400 6550
F 0 "#PWR012" H 3400 6650 40  0001 C CNN
F 1 "3V3" H 3400 6675 40  0000 C CNN
F 2 "" H 3400 6550 60  0000 C CNN
F 3 "" H 3400 6550 60  0000 C CNN
	1    3400 6550
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:C C4
U 1 1 5B62DA0C
P 3400 6950
F 0 "C4" H 3425 7050 50  0000 L CNN
F 1 "100nF" H 3425 6850 50  0000 L CNN
F 2 "C0603F" H 3438 6800 50  0001 C CNN
F 3 "" H 3400 6950 50  0000 C CNN
	1    3400 6950
	1    0    0    -1  
$EndComp
Text GLabel 3300 5400 0    47   Output ~ 0
S-MISO
$Comp
L laser-range-finder-v2-bricklet-rescue:LED D1
U 1 1 5B62E369
P 2050 3100
F 0 "D1" H 2050 3200 50  0000 C CNN
F 1 "BLUE" H 2050 3000 50  0000 C CNN
F 2 "D0603F" H 2050 3100 50  0001 C CNN
F 3 "" H 2050 3100 50  0000 C CNN
	1    2050 3100
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:3V3 #PWR013
U 1 1 5B62E43D
P 1500 3000
F 0 "#PWR013" H 1500 3100 40  0001 C CNN
F 1 "3V3" H 1500 3125 40  0000 C CNN
F 2 "" H 1500 3000 60  0000 C CNN
F 3 "" H 1500 3000 60  0000 C CNN
	1    1500 3000
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:CONN_01X02 P3
U 1 1 5B62E89C
P 3150 4650
F 0 "P3" H 3150 4800 50  0000 C CNN
F 1 "BOOT" V 3250 4650 50  0000 C CNN
F 2 "SolderJumper" H 3150 4650 50  0001 C CNN
F 3 "" H 3150 4650 50  0000 C CNN
	1    3150 4650
	-1   0    0    1   
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:GND #PWR014
U 1 1 5B62E929
P 3400 4900
F 0 "#PWR014" H 3400 4650 50  0001 C CNN
F 1 "GND" H 3400 4750 50  0000 C CNN
F 2 "" H 3400 4900 50  0000 C CNN
F 3 "" H 3400 4900 50  0000 C CNN
	1    3400 4900
	1    0    0    -1  
$EndComp
NoConn ~ 3600 4700
NoConn ~ 3600 4800
Text GLabel 3250 3200 0    47   Input ~ 0
SDA
Text GLabel 3250 3400 0    47   Input ~ 0
SCL
Text GLabel 3250 3700 0    47   Input ~ 0
S-CS
Text GLabel 3250 3800 0    47   Input ~ 0
S-CLK
Text GLabel 3250 3900 0    47   Input ~ 0
S-MOSI
Wire Wire Line
	2500 1750 3050 1750
Wire Wire Line
	2500 1850 3050 1850
Wire Wire Line
	2500 2050 3050 2050
Wire Wire Line
	2500 1950 3050 1950
Connection ~ 1800 2050
Wire Wire Line
	1100 2200 1100 2500
Wire Wire Line
	1600 900  1600 1450
Wire Wire Line
	1600 1450 1450 1450
Wire Wire Line
	1450 1550 2150 1550
Connection ~ 2150 1550
Wire Wire Line
	1450 1750 2100 1750
Wire Wire Line
	2100 1850 1450 1850
Wire Wire Line
	1450 1950 2100 1950
Wire Wire Line
	1450 2050 1800 2050
Wire Wire Line
	1450 1650 1950 1650
Wire Wire Line
	1950 1650 1950 950 
Wire Wire Line
	1950 950  2150 950 
Connection ~ 2150 950 
Wire Wire Line
	2600 1550 2600 1600
Connection ~ 2550 1550
Wire Wire Line
	7350 1700 7600 1700
Wire Wire Line
	6750 1700 6500 1700
Connection ~ 7600 1700
Connection ~ 8150 1700
Connection ~ 6500 1700
Connection ~ 2550 950 
Wire Wire Line
	9750 1800 9500 1800
Wire Wire Line
	8750 2000 8950 2000
Wire Wire Line
	8750 2100 9250 2100
Wire Wire Line
	9750 2200 9650 2200
Wire Wire Line
	3400 7200 3600 7200
Connection ~ 3400 7200
Wire Wire Line
	3400 7300 3600 7300
Connection ~ 3400 7300
Wire Wire Line
	3400 6700 3600 6700
Connection ~ 3400 6700
Wire Wire Line
	3600 5400 3300 5400
Wire Wire Line
	1850 3100 1500 3100
Wire Wire Line
	1500 3100 1500 3000
Wire Wire Line
	3350 4600 3600 4600
Wire Wire Line
	3350 4700 3400 4700
Wire Wire Line
	3400 4700 3400 4900
Wire Wire Line
	3250 3200 3600 3200
Wire Wire Line
	3250 3400 3600 3400
Wire Wire Line
	3300 3000 3600 3000
Wire Wire Line
	3250 3700 3600 3700
Wire Wire Line
	3600 3800 3250 3800
Wire Wire Line
	3250 3900 3600 3900
$Comp
L laser-range-finder-v2-bricklet-rescue:R_PACK4 RP3
U 1 1 5B62FA37
P 8900 2500
F 0 "RP3" H 8900 2950 50  0000 C CNN
F 1 "4k7" H 8900 2450 50  0000 C CNN
F 2 "4X0603" H 8900 2500 50  0001 C CNN
F 3 "" H 8900 2500 50  0000 C CNN
	1    8900 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	8950 2300 8950 2000
Connection ~ 8950 2000
Wire Wire Line
	9250 2300 9250 2100
Connection ~ 9250 2100
$Comp
L laser-range-finder-v2-bricklet-rescue:3V3 #PWR015
U 1 1 5B62FBF1
P 9100 2950
F 0 "#PWR015" H 9100 3050 40  0001 C CNN
F 1 "3V3" H 9100 3075 40  0000 C CNN
F 2 "" H 9100 2950 60  0000 C CNN
F 3 "" H 9100 2950 60  0000 C CNN
	1    9100 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 2700 8950 2950
Wire Wire Line
	8950 2950 9100 2950
Wire Wire Line
	9250 2950 9250 2700
Connection ~ 9100 2950
NoConn ~ 9050 2300
NoConn ~ 9150 2300
NoConn ~ 9150 2700
NoConn ~ 9050 2700
Text GLabel 2600 5500 0    47   Input ~ 0
ENABLE
$Comp
L laser-range-finder-v2-bricklet-rescue:R R1
U 1 1 5B630290
P 2750 5750
F 0 "R1" V 2830 5750 50  0000 C CNN
F 1 "1k" V 2750 5750 50  0000 C CNN
F 2 "R0603E" V 2680 5750 50  0001 C CNN
F 3 "" H 2750 5750 50  0000 C CNN
	1    2750 5750
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:GND #PWR016
U 1 1 5B63030B
P 2750 6150
F 0 "#PWR016" H 2750 5900 50  0001 C CNN
F 1 "GND" H 2750 6050 50  0000 C CNN
F 2 "" H 2750 6150 50  0000 C CNN
F 3 "" H 2750 6150 50  0000 C CNN
	1    2750 6150
	1    0    0    -1  
$EndComp
Connection ~ 2750 5500
NoConn ~ 9750 1900
NoConn ~ 3600 3300
NoConn ~ 3600 3600
NoConn ~ 3600 5600
NoConn ~ 3600 5700
NoConn ~ 3600 5800
NoConn ~ 3600 5900
Text Notes 4450 3650 0    47   ~ 0
SPI Slave/CH0\nP0.13 : USIC0_CH0-DX2F : SEL\nP0.14 : USIC0_CH0-DX1A : CLK\nP0.15 : USIC0_CH0-DX0B : MOSI\nP2.0 : USIC0_CH0-DOUT0 : MISO
Text Notes 4450 3150 0    47   ~ 0
I2C Master/CH1\nP0.6 :USIC0_CH1-DOUT0/DX0C : SDA\nP0.8: USIC0_CH1-SCLKOUT/DX1B : SCL
Text Notes 550  7750 0    40   ~ 0
Copyright Tinkerforge GmbH 2018.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
Wire Wire Line
	2600 5500 2750 5500
NoConn ~ 3600 6000
NoConn ~ 3600 6100
NoConn ~ 9900 3900
$Comp
L laser-range-finder-v2-bricklet-rescue:CONN_01X01 P2
U 1 1 5B62EAFF
P 3000 2850
F 0 "P2" H 3000 2950 50  0000 C CNN
F 1 "DEBUG" V 3100 2850 50  0000 C CNN
F 2 "DEBUG_PAD" H 3000 2850 50  0001 C CNN
F 3 "" H 3000 2850 50  0000 C CNN
	1    3000 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 3000 3300 2850
Wire Wire Line
	3300 2850 3200 2850
$Comp
L laser-range-finder-v2-bricklet-rescue:3V3 #PWR017
U 1 1 5B631B35
P 1500 4300
F 0 "#PWR017" H 1500 4400 40  0001 C CNN
F 1 "3V3" H 1500 4425 40  0000 C CNN
F 2 "" H 1500 4300 60  0000 C CNN
F 3 "" H 1500 4300 60  0000 C CNN
	1    1500 4300
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:LED D2
U 1 1 5B63192B
P 2050 4450
F 0 "D2" H 2050 4550 50  0000 C CNN
F 1 "GREEN" H 2050 4350 50  0000 C CNN
F 2 "D0603F" H 2050 4450 50  0001 C CNN
F 3 "" H 2050 4450 50  0000 C CNN
	1    2050 4450
	1    0    0    1   
$EndComp
Wire Wire Line
	1850 4450 1500 4450
$Comp
L laser-range-finder-v2-bricklet-rescue:R_PACK4 RP2
U 1 1 5B633639
P 2500 3950
F 0 "RP2" H 2500 4400 50  0000 C CNN
F 1 "1k" H 2500 3900 50  0000 C CNN
F 2 "4X0603" H 2500 3950 50  0001 C CNN
F 3 "" H 2500 3950 50  0000 C CNN
	1    2500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3600 2300 3100
Wire Wire Line
	2300 3100 2250 3100
Wire Wire Line
	2700 3600 2700 3100
Wire Wire Line
	2700 3100 3600 3100
Wire Wire Line
	2700 3900 2700 4500
Wire Wire Line
	2700 4500 3600 4500
NoConn ~ 2300 3700
NoConn ~ 2300 3800
NoConn ~ 2700 3700
NoConn ~ 2700 3800
Wire Wire Line
	2300 3900 2300 4450
Wire Wire Line
	2300 4450 2250 4450
$Comp
L laser-range-finder-v2-bricklet-rescue:DRILL U5
U 1 1 5B633E5A
P 11050 6400
F 0 "U5" H 11100 6450 60  0001 C CNN
F 1 "DRILL" H 11050 6400 60  0000 C CNN
F 2 "DRILL_NP" H 11050 6400 60  0001 C CNN
F 3 "" H 11050 6400 60  0000 C CNN
	1    11050 6400
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:DRILL U3
U 1 1 5B633F4A
P 10750 6400
F 0 "U3" H 10800 6450 60  0001 C CNN
F 1 "DRILL" H 10750 6400 60  0000 C CNN
F 2 "DRILL_NP" H 10750 6400 60  0001 C CNN
F 3 "" H 10750 6400 60  0000 C CNN
	1    10750 6400
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:DRILL U4
U 1 1 5B633F8A
P 11050 6200
F 0 "U4" H 11100 6250 60  0001 C CNN
F 1 "DRILL" H 11050 6200 60  0000 C CNN
F 2 "DRILL_NP" H 11050 6200 60  0001 C CNN
F 3 "" H 11050 6200 60  0000 C CNN
	1    11050 6200
	1    0    0    -1  
$EndComp
$Comp
L laser-range-finder-v2-bricklet-rescue:DRILL U2
U 1 1 5B633FCA
P 10750 6200
F 0 "U2" H 10800 6250 60  0001 C CNN
F 1 "DRILL" H 10750 6200 60  0000 C CNN
F 2 "DRILL_NP" H 10750 6200 60  0001 C CNN
F 3 "" H 10750 6200 60  0000 C CNN
	1    10750 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 950  2150 1050
Wire Wire Line
	2550 850  2550 950 
Wire Wire Line
	2150 1450 2150 1550
Wire Wire Line
	2550 1550 2550 1450
Wire Wire Line
	2750 6150 2750 6000
Wire Wire Line
	3400 7150 3400 7200
Wire Wire Line
	3400 6550 3400 6700
Wire Wire Line
	6500 2150 6500 2400
Wire Wire Line
	7600 1750 7600 1700
Wire Wire Line
	7600 2150 7600 2400
Wire Wire Line
	8150 1750 8150 1700
Wire Wire Line
	8150 2150 8150 2400
Wire Wire Line
	1800 2500 1800 2450
Wire Wire Line
	6500 1550 6500 1700
Wire Wire Line
	1500 4450 1500 4300
NoConn ~ 3600 3500
Wire Wire Line
	1800 2050 2100 2050
Wire Wire Line
	2150 1550 2550 1550
Wire Wire Line
	2150 950  2550 950 
Wire Wire Line
	2550 1550 2600 1550
Wire Wire Line
	7600 1700 8150 1700
Wire Wire Line
	8150 1700 9750 1700
Wire Wire Line
	6500 1700 6500 1750
Wire Wire Line
	2550 950  2550 1050
Wire Wire Line
	3400 7200 3400 7300
Wire Wire Line
	3400 7300 3400 7450
Wire Wire Line
	3400 6700 3400 6750
Wire Wire Line
	8950 2000 9750 2000
Wire Wire Line
	9250 2100 9750 2100
Wire Wire Line
	9100 2950 9250 2950
Wire Wire Line
	2750 5500 3600 5500
$Comp
L tinkerforge:JST_GHR_6 P4
U 1 1 5B6DD879
P 10100 1950
F 0 "P4" H 10050 2300 50  0000 L CNN
F 1 "JST_GHR_6" V 10200 1750 50  0000 L CNN
F 2 "JST_GHR_6" H 10150 2000 50  0001 C CNN
F 3 "" H 10150 2000 50  0001 C CNN
	1    10100 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 2200 9650 2450
Wire Wire Line
	10050 2450 9650 2450
Connection ~ 9650 2450
Wire Wire Line
	9650 2450 9650 2650
$EndSCHEMATC
