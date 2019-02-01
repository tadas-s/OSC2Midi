EESchema Schematic File Version 4
LIBS:esp8266-midi-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ESP8266 MIDI<>OSC wifi gateway"
Date ""
Rev ""
Comp "Tadas Sasnauskas"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector1:DIN-5_180degree J2
U 1 1 5AA0E52B
P 9125 5175
F 0 "J2" H 9250 5400 50  0000 C CNN
F 1 "MIDI out" H 9125 4925 50  0000 C CNN
F 2 "Connectors:SDS-50J" H 9125 5175 50  0001 C CNN
F 3 "" H 9125 5175 50  0001 C CNN
	1    9125 5175
	-1   0    0    -1  
$EndComp
$Comp
L Connector1:DIN-5_180degree J1
U 1 1 5AA0E5AD
P 9125 2900
F 0 "J1" H 9250 3125 50  0000 C CNN
F 1 "MIDI in" H 9125 2650 50  0000 C CNN
F 2 "Connectors:SDS-50J" H 9125 2900 50  0001 C CNN
F 3 "" H 9125 2900 50  0001 C CNN
	1    9125 2900
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR01
U 1 1 5AA0E6C2
P 8925 4675
F 0 "#PWR01" H 8925 4425 50  0001 C CNN
F 1 "GND" H 8925 4525 50  0000 C CNN
F 2 "" H 8925 4675 50  0001 C CNN
F 3 "" H 8925 4675 50  0001 C CNN
	1    8925 4675
	-1   0    0    -1  
$EndComp
$Comp
L esp8266-midi-rescue:R-RESCUE-esp8266-midi R2
U 1 1 5AA0E7F1
P 9675 5075
F 0 "R2" V 9755 5075 50  0000 C CNN
F 1 "120R" V 9675 5075 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9605 5075 50  0001 C CNN
F 3 "" H 9675 5075 50  0001 C CNN
	1    9675 5075
	0    -1   1    0   
$EndComp
$Comp
L esp8266-midi-rescue:R-RESCUE-esp8266-midi R5
U 1 1 5AA0E839
P 8575 5075
F 0 "R5" V 8655 5075 50  0000 C CNN
F 1 "120R" V 8575 5075 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8505 5075 50  0001 C CNN
F 3 "" H 8575 5075 50  0001 C CNN
	1    8575 5075
	0    -1   1    0   
$EndComp
$Comp
L esp8266-midi-rescue:6N138 U2
U 1 1 5AA1AD61
P 8225 3150
F 0 "U2" H 8225 3450 50  0000 C CNN
F 1 "6N138" H 8225 2850 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_SMDSocket_SmallPads" H 8225 3150 60  0001 C CNN
F 3 "" H 8225 3150 60  0000 C CNN
	1    8225 3150
	-1   0    0    -1  
$EndComp
$Comp
L device:D D1
U 1 1 5AA1AFB6
P 8675 3150
F 0 "D1" H 8675 3250 50  0000 C CNN
F 1 "1N4148" H 8725 3350 50  0000 C CNN
F 2 "Diodes_SMD:D_SOD-323_HandSoldering" H 8675 3150 50  0001 C CNN
F 3 "" H 8675 3150 50  0001 C CNN
	1    8675 3150
	0    1    1    0   
$EndComp
$Comp
L esp8266-midi-rescue:R-RESCUE-esp8266-midi R1
U 1 1 5AA1B0FD
P 9125 3400
F 0 "R1" V 9205 3400 50  0000 C CNN
F 1 "220R" V 9125 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9055 3400 50  0001 C CNN
F 3 "" H 9125 3400 50  0001 C CNN
	1    9125 3400
	0    1    1    0   
$EndComp
$Comp
L esp8266-midi-rescue:R-RESCUE-esp8266-midi R4
U 1 1 5AA1C352
P 7775 3100
F 0 "R4" V 7855 3100 50  0000 C CNN
F 1 "10K" V 7775 3100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7705 3100 50  0001 C CNN
F 3 "" H 7775 3100 50  0001 C CNN
	1    7775 3100
	0    -1   1    0   
$EndComp
$Comp
L power1:GND #PWR04
U 1 1 5AA1CB1B
P 7875 3450
F 0 "#PWR04" H 7875 3200 50  0001 C CNN
F 1 "GND" H 7875 3300 50  0000 C CNN
F 2 "" H 7875 3450 50  0001 C CNN
F 3 "" H 7875 3450 50  0001 C CNN
	1    7875 3450
	-1   0    0    -1  
$EndComp
Text Notes 1675 3125 0    60   ~ 0
RESET\nRXD\nTXD\nVCC\nFLASH\nGND\n
NoConn ~ 8825 5175
NoConn ~ 9425 5175
NoConn ~ 8825 2900
NoConn ~ 9425 2900
$Comp
L regul:LD1117S50TR_SOT223 U3
U 1 1 5AA2FC6F
P 5775 1675
F 0 "U3" H 5625 1800 50  0000 C CNN
F 1 "LD1117S50TR_SOT223" H 5775 1800 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-223" H 5775 1875 50  0001 C CNN
F 3 "" H 5875 1425 50  0001 C CNN
	1    5775 1675
	1    0    0    -1  
$EndComp
$Comp
L device:CP C4
U 1 1 5AA30545
P 7375 1925
F 0 "C4" H 7400 2025 50  0000 L CNN
F 1 "220uF" H 7400 1825 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_6.3x5.8" H 7413 1775 50  0001 C CNN
F 3 "" H 7375 1925 50  0001 C CNN
	1    7375 1925
	1    0    0    -1  
$EndComp
$Comp
L esp8266-midi-rescue:C-RESCUE-esp8266-midi C3
U 1 1 5AA305EE
P 6175 1925
F 0 "C3" H 6200 2025 50  0000 L CNN
F 1 "100nF" H 6200 1825 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6213 1775 50  0001 C CNN
F 3 "" H 6175 1925 50  0001 C CNN
	1    6175 1925
	1    0    0    -1  
$EndComp
$Comp
L esp8266-midi-rescue:C-RESCUE-esp8266-midi C2
U 1 1 5AA30688
P 5375 1925
F 0 "C2" H 5400 2025 50  0000 L CNN
F 1 "100nF" H 5400 1825 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5413 1775 50  0001 C CNN
F 3 "" H 5375 1925 50  0001 C CNN
	1    5375 1925
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR07
U 1 1 5AA310B5
P 5775 2275
F 0 "#PWR07" H 5775 2025 50  0001 C CNN
F 1 "GND" H 5775 2125 50  0000 C CNN
F 2 "" H 5775 2275 50  0001 C CNN
F 3 "" H 5775 2275 50  0001 C CNN
	1    5775 2275
	1    0    0    -1  
$EndComp
$Comp
L Connector1:Conn_01x01_Male J4
U 1 1 5AA3271F
P 4975 1675
F 0 "J4" H 4975 1775 50  0000 C CNN
F 1 "Bat+" H 4975 1575 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_0-8mmDrill" H 4975 1675 50  0001 C CNN
F 3 "" H 4975 1675 50  0001 C CNN
	1    4975 1675
	1    0    0    -1  
$EndComp
$Comp
L Connector1:Conn_01x01_Male J5
U 1 1 5AA327AB
P 4975 2175
F 0 "J5" H 4975 2275 50  0000 C CNN
F 1 "Bat-" H 4975 2075 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_0-8mmDrill" H 4975 2175 50  0001 C CNN
F 3 "" H 4975 2175 50  0001 C CNN
	1    4975 2175
	1    0    0    -1  
$EndComp
$Comp
L esp8266-midi-rescue:R-RESCUE-esp8266-midi R7
U 1 1 5AC28C1B
P 5250 5250
F 0 "R7" V 5330 5250 50  0000 C CNN
F 1 "10K" V 5250 5250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5180 5250 50  0001 C CNN
F 3 "" H 5250 5250 50  0001 C CNN
	1    5250 5250
	1    0    0    1   
$EndComp
NoConn ~ 9125 2600
$Comp
L rfcom:ESP-12E U1
U 1 1 5AC3DEE1
P 4200 4600
F 0 "U1" H 3500 5600 50  0000 C CNN
F 1 "ESP-12E" H 4800 3600 50  0000 C CNN
F 2 "RF_Modules:ESP-12E" H 4200 4850 50  0001 C CNN
F 3 "" H 3850 4900 50  0001 C CNN
	1    4200 4600
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR08
U 1 1 5AC3E798
P 4200 5800
F 0 "#PWR08" H 4200 5550 50  0001 C CNN
F 1 "GND" H 4200 5650 50  0000 C CNN
F 2 "" H 4200 5800 50  0001 C CNN
F 3 "" H 4200 5800 50  0001 C CNN
	1    4200 5800
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR011
U 1 1 5AC41342
P 5250 5500
F 0 "#PWR011" H 5250 5250 50  0001 C CNN
F 1 "GND" H 5250 5350 50  0000 C CNN
F 2 "" H 5250 5500 50  0001 C CNN
F 3 "" H 5250 5500 50  0001 C CNN
	1    5250 5500
	1    0    0    -1  
$EndComp
NoConn ~ 3300 4200
NoConn ~ 3300 4300
NoConn ~ 3300 4400
NoConn ~ 3300 4500
NoConn ~ 3300 4600
NoConn ~ 3300 4700
NoConn ~ 5100 5200
NoConn ~ 5100 5100
NoConn ~ 5100 4300
$Comp
L pspice1:R R6
U 1 1 5B127227
P 3850 3450
F 0 "R6" V 3930 3450 50  0000 C CNN
F 1 "10K" V 3850 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 3850 3450 50  0001 C CNN
F 3 "" H 3850 3450 50  0001 C CNN
	1    3850 3450
	0    1    1    0   
$EndComp
$Comp
L pspice1:R R8
U 1 1 5B1275B7
P 4550 3450
F 0 "R8" V 4630 3450 50  0000 C CNN
F 1 "10K" V 4550 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 4550 3450 50  0001 C CNN
F 3 "" H 4550 3450 50  0001 C CNN
	1    4550 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	9125 4875 9125 4575
Wire Wire Line
	8925 4575 8925 4675
Wire Wire Line
	8825 5075 8725 5075
Wire Wire Line
	9525 5075 9425 5075
Wire Wire Line
	9925 5075 9825 5075
Wire Wire Line
	7975 3100 7925 3100
Wire Wire Line
	7625 3100 7575 3100
Wire Wire Line
	7575 3100 7575 3350
Wire Wire Line
	7575 3350 7875 3350
Wire Wire Line
	7875 3350 7875 3450
Connection ~ 7875 3350
Wire Wire Line
	6075 1675 6175 1675
Wire Wire Line
	6175 1675 6175 1775
Wire Wire Line
	6175 2175 6175 2075
Wire Wire Line
	5775 1975 5775 2175
Connection ~ 5775 2175
Connection ~ 5375 1675
Wire Wire Line
	5375 1675 5375 1775
Wire Wire Line
	5375 2075 5375 2175
Connection ~ 5375 2175
Wire Wire Line
	8475 3050 8575 3050
Wire Wire Line
	8575 3050 8575 3000
Wire Wire Line
	8575 3000 8675 3000
Wire Wire Line
	8475 3250 8575 3250
Wire Wire Line
	8575 3250 8575 3300
Wire Wire Line
	8575 3300 8675 3300
Wire Wire Line
	8675 3300 8675 3400
Wire Wire Line
	8675 3400 8975 3400
Wire Wire Line
	9275 3400 9525 3400
Wire Wire Line
	9525 3400 9525 2800
Wire Wire Line
	9525 2800 9425 2800
Wire Wire Line
	8675 3000 8675 2800
Wire Wire Line
	8675 2800 8825 2800
Wire Wire Line
	4200 5700 4200 5800
Wire Wire Line
	4200 3375 4200 3450
Connection ~ 4200 3450
Wire Wire Line
	9125 4575 8925 4575
Wire Wire Line
	7875 2750 7875 2950
Wire Wire Line
	7875 2950 7975 2950
Wire Wire Line
	4100 3450 4200 3450
Wire Wire Line
	5150 3450 5150 3800
Wire Wire Line
	5100 3800 5150 3800
Wire Wire Line
	3250 3450 3250 3800
Wire Wire Line
	3250 3800 3300 3800
$Comp
L pspice1:R R3
U 1 1 5B12802D
P 3000 4000
F 0 "R3" V 3080 4000 50  0000 C CNN
F 1 "10K" V 3000 4000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 3000 4000 50  0001 C CNN
F 3 "" H 3000 4000 50  0001 C CNN
	1    3000 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 4000 3250 4000
Wire Wire Line
	2750 4000 2700 4000
$Comp
L Connector1:Conn_01x06 J3
U 1 1 5AA1FA8A
P 2025 2900
F 0 "J3" H 2025 3200 50  0000 C CNN
F 1 "TTL-232R-3V3 connector" H 2025 2500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 2025 2900 50  0001 C CNN
F 3 "" H 2025 2900 50  0001 C CNN
	1    2025 2900
	-1   0    0    1   
$EndComp
NoConn ~ 2225 2900
NoConn ~ 5100 4100
Wire Wire Line
	5175 1675 5375 1675
Wire Wire Line
	5175 2175 5375 2175
Wire Wire Line
	7875 3350 7975 3350
Wire Wire Line
	5775 2175 5775 2275
Wire Wire Line
	5775 2175 6175 2175
Wire Wire Line
	5375 1675 5475 1675
Wire Wire Line
	5375 2175 5775 2175
Wire Wire Line
	4200 3450 4200 3500
Wire Wire Line
	4200 3450 4300 3450
$Comp
L 74xGxx:74LVC2G14 U4
U 1 1 5BF9B0A9
P 7475 4075
F 0 "U4" H 7450 4342 50  0000 C CNN
F 1 "74LVC2G14" H 7450 4251 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 7475 4075 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 7475 4075 50  0001 C CNN
	1    7475 4075
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G14 U4
U 2 1 5BF9B343
P 8100 4075
F 0 "U4" H 8075 4342 50  0000 C CNN
F 1 "74LVC2G14" H 8075 4251 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 8100 4075 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 8100 4075 50  0001 C CNN
	2    8100 4075
	1    0    0    -1  
$EndComp
$Comp
L Connector1:DIN-5_180degree J6
U 1 1 5BF9BC6A
P 9125 4175
F 0 "J6" H 9250 4400 50  0000 C CNN
F 1 "MIDI through" H 9125 3925 50  0000 C CNN
F 2 "Connectors:SDS-50J" H 9125 4175 50  0001 C CNN
F 3 "" H 9125 4175 50  0001 C CNN
	1    9125 4175
	-1   0    0    -1  
$EndComp
$Comp
L power1:GND #PWR012
U 1 1 5BF9BC71
P 8925 3675
F 0 "#PWR012" H 8925 3425 50  0001 C CNN
F 1 "GND" H 8925 3525 50  0000 C CNN
F 2 "" H 8925 3675 50  0001 C CNN
F 3 "" H 8925 3675 50  0001 C CNN
	1    8925 3675
	-1   0    0    -1  
$EndComp
$Comp
L esp8266-midi-rescue:R-RESCUE-esp8266-midi R10
U 1 1 5BF9BC7D
P 9675 4075
F 0 "R10" V 9755 4075 50  0000 C CNN
F 1 "120R" V 9675 4075 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9605 4075 50  0001 C CNN
F 3 "" H 9675 4075 50  0001 C CNN
	1    9675 4075
	0    -1   1    0   
$EndComp
$Comp
L esp8266-midi-rescue:R-RESCUE-esp8266-midi R9
U 1 1 5BF9BC84
P 8575 4075
F 0 "R9" V 8655 4075 50  0000 C CNN
F 1 "120R" V 8575 4075 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8505 4075 50  0001 C CNN
F 3 "" H 8575 4075 50  0001 C CNN
	1    8575 4075
	0    -1   1    0   
$EndComp
NoConn ~ 8825 4175
NoConn ~ 9425 4175
Wire Wire Line
	9125 3875 9125 3575
Wire Wire Line
	8925 3575 8925 3675
Wire Wire Line
	8825 4075 8725 4075
Wire Wire Line
	9525 4075 9425 4075
Wire Wire Line
	9925 4075 9825 4075
Wire Wire Line
	9125 3575 8925 3575
Wire Wire Line
	8350 4075 8425 4075
Wire Wire Line
	7725 4075 7800 4075
Connection ~ 8675 3000
Connection ~ 8675 3300
Wire Wire Line
	7175 4075 7125 4075
Wire Wire Line
	7125 3200 7975 3200
Text GLabel 2325 2700 2    49   Input ~ 0
UART0_TXD
Text GLabel 2325 2800 2    49   Input ~ 0
UART0_RXD
Wire Wire Line
	7125 3200 7125 3650
Wire Wire Line
	7025 3650 7125 3650
Connection ~ 7125 3650
Wire Wire Line
	7125 3650 7125 4075
Wire Wire Line
	3250 3450 3600 3450
$Comp
L power1:GND #PWR05
U 1 1 5C00E9E6
P 2325 3200
F 0 "#PWR05" H 2325 2950 50  0001 C CNN
F 1 "GND" H 2325 3050 50  0000 C CNN
F 2 "" H 2325 3200 50  0001 C CNN
F 3 "" H 2325 3200 50  0001 C CNN
	1    2325 3200
	-1   0    0    -1  
$EndComp
Text GLabel 5200 4700 2    49   Input ~ 0
UART0_TXD
Text GLabel 5200 4800 2    49   Input ~ 0
UART0_RXD
Wire Wire Line
	5100 4700 5200 4700
Wire Wire Line
	5100 4800 5200 4800
NoConn ~ 5100 3900
NoConn ~ 5100 4000
$Comp
L Connector1:Conn_01x02 J7
U 1 1 5C040B63
P 3375 2025
F 0 "J7" H 3455 2017 50  0000 L CNN
F 1 "Debug serial out" H 3455 1926 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 3375 2025 50  0001 C CNN
F 3 "~" H 3375 2025 50  0001 C CNN
	1    3375 2025
	1    0    0    1   
$EndComp
$Comp
L power1:GND #PWR014
U 1 1 5C0439C0
P 3075 2125
F 0 "#PWR014" H 3075 1875 50  0001 C CNN
F 1 "GND" H 3075 1975 50  0000 C CNN
F 2 "" H 3075 2125 50  0001 C CNN
F 3 "" H 3075 2125 50  0001 C CNN
	1    3075 2125
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3075 2125 3075 2025
$Comp
L esp8266-midi-rescue:C-RESCUE-esp8266-midi C1
U 1 1 5C00D6C8
P 6575 1925
F 0 "C1" H 6600 2025 50  0000 L CNN
F 1 "100nF" H 6600 1825 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6613 1775 50  0001 C CNN
F 3 "" H 6575 1925 50  0001 C CNN
	1    6575 1925
	1    0    0    -1  
$EndComp
Wire Wire Line
	6175 1675 6575 1675
Connection ~ 6175 1675
Wire Wire Line
	6175 2175 6575 2175
Connection ~ 6175 2175
Wire Wire Line
	6575 2075 6575 2175
Connection ~ 6575 2175
Wire Wire Line
	6575 2175 6975 2175
Wire Wire Line
	6575 1775 6575 1675
Connection ~ 6575 1675
Wire Wire Line
	6575 1675 6975 1675
$Comp
L power:VCC #PWR0101
U 1 1 5C039076
P 7575 1675
F 0 "#PWR0101" H 7575 1525 50  0001 C CNN
F 1 "VCC" V 7592 1803 50  0000 L CNN
F 2 "" H 7575 1675 50  0001 C CNN
F 3 "" H 7575 1675 50  0001 C CNN
	1    7575 1675
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0102
U 1 1 5C03C08A
P 4200 3375
F 0 "#PWR0102" H 4200 3225 50  0001 C CNN
F 1 "VCC" H 4217 3548 50  0000 C CNN
F 2 "" H 4200 3375 50  0001 C CNN
F 3 "" H 4200 3375 50  0001 C CNN
	1    4200 3375
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 5C04A4B7
P 2700 4000
F 0 "#PWR0103" H 2700 3850 50  0001 C CNN
F 1 "VCC" V 2718 4127 50  0000 L CNN
F 2 "" H 2700 4000 50  0001 C CNN
F 3 "" H 2700 4000 50  0001 C CNN
	1    2700 4000
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5C0530C7
P 7875 2750
F 0 "#PWR0104" H 7875 2600 50  0001 C CNN
F 1 "VCC" H 7892 2923 50  0000 C CNN
F 2 "" H 7875 2750 50  0001 C CNN
F 3 "" H 7875 2750 50  0001 C CNN
	1    7875 2750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0105
U 1 1 5C05BBAA
P 9925 4075
F 0 "#PWR0105" H 9925 3925 50  0001 C CNN
F 1 "VCC" V 9942 4203 50  0000 L CNN
F 2 "" H 9925 4075 50  0001 C CNN
F 3 "" H 9925 4075 50  0001 C CNN
	1    9925 4075
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0106
U 1 1 5C06708F
P 9925 5075
F 0 "#PWR0106" H 9925 4925 50  0001 C CNN
F 1 "VCC" V 9942 5203 50  0000 L CNN
F 2 "" H 9925 5075 50  0001 C CNN
F 3 "" H 9925 5075 50  0001 C CNN
	1    9925 5075
	0    1    1    0   
$EndComp
Wire Wire Line
	3075 2025 3175 2025
Text GLabel 5200 4500 2    60   Input ~ 0
UART1_TXD
Wire Wire Line
	5100 4500 5200 4500
Text GLabel 3075 1925 0    60   Input ~ 0
UART1_TXD
Wire Wire Line
	3075 1925 3175 1925
Text GLabel 5200 3800 2    60   Input ~ 0
FLASH_EN
Wire Wire Line
	5150 3800 5200 3800
Connection ~ 5150 3800
Wire Wire Line
	4800 3450 5150 3450
Text GLabel 2325 3000 2    49   Input ~ 0
FLASH_EN
Text GLabel 3200 3800 0    60   Input ~ 0
RESET
Wire Wire Line
	3200 3800 3250 3800
Connection ~ 3250 3800
Text GLabel 2325 2600 2    49   Input ~ 0
RESET
Wire Wire Line
	2225 3100 2325 3100
Wire Wire Line
	2325 3100 2325 3200
Wire Wire Line
	2225 3000 2325 3000
Wire Wire Line
	2225 2600 2325 2600
Wire Wire Line
	2225 2800 2325 2800
Wire Wire Line
	2225 2700 2325 2700
$Comp
L 74xGxx:74LVC2G14 U5
U 1 1 5C2FE134
P 7450 5075
F 0 "U5" H 7425 5342 50  0000 C CNN
F 1 "74LVC2G14" H 7425 5251 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 7450 5075 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 7450 5075 50  0001 C CNN
	1    7450 5075
	1    0    0    -1  
$EndComp
$Comp
L 74xGxx:74LVC2G14 U5
U 2 1 5C2FE229
P 8100 5075
F 0 "U5" H 8075 5342 50  0000 C CNN
F 1 "74LVC2G14" H 8075 5251 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 8100 5075 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 8100 5075 50  0001 C CNN
	2    8100 5075
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 5075 7800 5075
Wire Wire Line
	8350 5075 8425 5075
Text GLabel 7050 5075 0    60   Input ~ 0
UART0_ALT_TXD
Text GLabel 7025 3650 0    60   Input ~ 0
UART0_ALT_RXD
Wire Wire Line
	7050 5075 7150 5075
Text GLabel 5350 5000 2    49   Input ~ 0
UART0_ALT_TXD
Wire Wire Line
	5250 5000 5250 5100
Wire Wire Line
	5100 5000 5250 5000
Wire Wire Line
	5250 5400 5250 5500
Wire Wire Line
	5250 5000 5350 5000
Connection ~ 5250 5000
Text GLabel 5350 4900 2    49   Input ~ 0
UART0_ALT_RXD
Wire Wire Line
	5100 4900 5350 4900
$Comp
L esp8266-midi-rescue:C-RESCUE-esp8266-midi C5
U 1 1 5C346FDF
P 6975 1925
F 0 "C5" H 7000 2025 50  0000 L CNN
F 1 "100nF" H 7000 1825 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7013 1775 50  0001 C CNN
F 3 "" H 6975 1925 50  0001 C CNN
	1    6975 1925
	1    0    0    -1  
$EndComp
Wire Wire Line
	6975 1675 6975 1775
Wire Wire Line
	6975 2075 6975 2175
Wire Wire Line
	6975 1675 7375 1675
Connection ~ 6975 1675
Wire Wire Line
	7375 1675 7375 1775
Connection ~ 7375 1675
Wire Wire Line
	7375 1675 7575 1675
Wire Wire Line
	7375 2075 7375 2175
Wire Wire Line
	7375 2175 6975 2175
Connection ~ 6975 2175
$EndSCHEMATC
