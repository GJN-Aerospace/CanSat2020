EESchema Schematic File Version 4
LIBS:CanSat2020Probe-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Píseň kosmická 2"
Date "2020-12-28"
Rev "v01"
Comp ""
Comment1 ""
Comment2 ""
Comment3 "CanSat2020Probe"
Comment4 "Author: Jakub Vávra/GJN Aerospace"
$EndDescr
$Comp
L CanSat2020Probe-rescue:TESEO-LIV3F-TESEO-LIV3F IC1
U 1 1 5DC79D26
P 5450 1200
F 0 "IC1" H 6250 1465 50  0000 C CNN
F 1 "TESEO-LIV3F" H 6250 1374 50  0000 C CNN
F 2 "TESEO-LIV3F:SON110P970X1010X230-18N" H 6900 1300 50  0001 L CNN
F 3 "https://www.st.com/resource/en/datasheet/teseo-liv3f.pdf" H 6900 1200 50  0001 L CNN
F 4 "GPS Modules Tiny GNSS module" H 6900 1100 50  0001 L CNN "Description"
F 5 "2.3" H 6900 1000 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 6900 900 50  0001 L CNN "Manufacturer_Name"
F 7 "TESEO-LIV3F" H 6900 800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "511-TESEO-LIV3F" H 6900 700 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=511-TESEO-LIV3F" H 6900 600 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6900 500 50  0001 L CNN "RS Part Number"
F 11 "" H 6900 400 50  0001 L CNN "RS Price/Stock"
	1    5450 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5DC873C6
P 5050 1250
F 0 "#PWR0101" H 5050 1000 50  0001 C CNN
F 1 "GND" V 5055 1122 50  0000 R CNN
F 2 "" H 5050 1250 50  0001 C CNN
F 3 "" H 5050 1250 50  0001 C CNN
	1    5050 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5DC87A58
P 8150 1850
F 0 "#PWR0102" H 8150 1600 50  0001 C CNN
F 1 "GND" H 8350 1850 50  0000 R CNN
F 2 "" H 8150 1850 50  0001 C CNN
F 3 "" H 8150 1850 50  0001 C CNN
	1    8150 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5DC88DBC
P 7300 2050
F 0 "#PWR0103" H 7300 1800 50  0001 C CNN
F 1 "GND" H 7500 2050 50  0000 R CNN
F 2 "" H 7300 2050 50  0001 C CNN
F 3 "" H 7300 2050 50  0001 C CNN
	1    7300 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5DC72AD2
P 7750 2200
F 0 "#PWR0106" H 7750 1950 50  0001 C CNN
F 1 "GND" H 7755 2027 50  0000 C CNN
F 2 "" H 7750 2200 50  0001 C CNN
F 3 "" H 7750 2200 50  0001 C CNN
	1    7750 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J1
U 1 1 5DCC1DF4
P 6550 3300
F 0 "J1" H 6450 3650 50  0000 L CNN
F 1 "BME280" H 6350 3550 50  0000 L CNN
F 2 "Switch:BME280" H 6550 3300 50  0001 C CNN
F 3 "~" H 6550 3300 50  0001 C CNN
	1    6550 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Female J2
U 1 1 5DCC21C4
P 6500 4850
F 0 "J2" H 6350 5500 50  0000 L CNN
F 1 "MPU-9250" H 6350 5400 50  0000 L CNN
F 2 "Switch:MPU-9250" H 6500 4850 50  0001 C CNN
F 3 "~" H 6500 4850 50  0001 C CNN
	1    6500 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3150 5650 3200
Wire Wire Line
	6350 3400 5900 3400
Wire Wire Line
	6350 3500 5900 3500
$Comp
L Connector:Micro_SD_Card J3
U 1 1 5DCC78DF
P 9500 3650
F 0 "J3" H 9450 4367 50  0000 C CNN
F 1 "Micro_SD_Card" H 9450 4276 50  0000 C CNN
F 2 "Connector_Card:microSD_HC_Wuerth_693072010801" H 10650 3950 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 9500 3650 50  0001 C CNN
	1    9500 3650
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LD3985M33R_SOT23 U3
U 1 1 5DCC45A6
P 3750 6650
F 0 "U3" H 3750 6992 50  0000 C CNN
F 1 "LD3985M33R_SOT23" H 3750 6901 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3750 6975 50  0001 C CIN
F 3 "http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00003395.pdf" H 3750 6650 50  0001 C CNN
	1    3750 6650
	1    0    0    -1  
$EndComp
Text Notes 6600 3200 0    50   ~ 0
VIN
Text Notes 6600 3300 0    50   ~ 0
GND\n
Text Notes 6600 3400 0    50   ~ 0
SCL\n
Text Notes 6600 3500 0    50   ~ 0
SDA
Wire Wire Line
	6300 4650 5850 4650
Wire Wire Line
	6300 4750 5850 4750
Wire Wire Line
	1550 6750 2500 6750
$Comp
L power:GND #PWR0105
U 1 1 5DDAB539
P 3750 7200
F 0 "#PWR0105" H 3750 6950 50  0001 C CNN
F 1 "GND" H 3755 7027 50  0000 C CNN
F 2 "" H 3750 7200 50  0001 C CNN
F 3 "" H 3750 7200 50  0001 C CNN
	1    3750 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6950 3750 7100
Text Notes 6550 4450 0    50   ~ 0
VCC\n
Text Notes 6550 4550 0    50   ~ 0
GND
Text Notes 6550 4650 0    50   ~ 0
SCL
Text Notes 6550 4750 0    50   ~ 0
SDA
Text Notes 6550 4850 0    50   ~ 0
EDA
Text Notes 6550 4950 0    50   ~ 0
ECL
Text Notes 6550 5050 0    50   ~ 0
ADO
Text Notes 6550 5150 0    50   ~ 0
INT
Text Notes 6550 5250 0    50   ~ 0
NCS
Text Notes 6550 5350 0    50   ~ 0
FSYNC
$Comp
L power:+3V3 #PWR0107
U 1 1 5DDB0211
P 4850 6500
F 0 "#PWR0107" H 4850 6350 50  0001 C CNN
F 1 "+3V3" V 4865 6628 50  0000 L CNN
F 2 "" H 4850 6500 50  0001 C CNN
F 3 "" H 4850 6500 50  0001 C CNN
	1    4850 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 6550 3250 6650
Wire Wire Line
	3250 7100 3750 7100
Wire Wire Line
	3250 6550 3450 6550
Connection ~ 3750 7100
Wire Wire Line
	3750 7100 3750 7200
$Comp
L Device:C C8
U 1 1 5DDBBBB2
P 3250 6850
F 0 "C8" H 3365 6896 50  0000 L CNN
F 1 "47uF" H 3365 6805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 3288 6700 50  0001 C CNN
F 3 "~" H 3250 6850 50  0001 C CNN
	1    3250 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 7000 3250 7100
$Comp
L Device:C C10
U 1 1 5DDBC64A
P 4600 6850
F 0 "C10" H 4715 6896 50  0000 L CNN
F 1 "47uF" H 4715 6805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 4638 6700 50  0001 C CNN
F 3 "~" H 4600 6850 50  0001 C CNN
	1    4600 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5DDBEA9B
P 2500 6900
F 0 "#PWR0109" H 2500 6650 50  0001 C CNN
F 1 "GND" H 2505 6727 50  0000 C CNN
F 2 "" H 2500 6900 50  0001 C CNN
F 3 "" H 2500 6900 50  0001 C CNN
	1    2500 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6750 2500 6900
Wire Wire Line
	3450 6650 3250 6650
Connection ~ 3250 6650
Wire Wire Line
	3250 6650 3250 6700
$Comp
L Device:C C9
U 1 1 5DDC7AEE
P 4150 6850
F 0 "C9" H 4265 6896 50  0000 L CNN
F 1 "10nF" H 4265 6805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4188 6700 50  0001 C CNN
F 3 "~" H 4150 6850 50  0001 C CNN
	1    4150 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 7100 4150 7100
Wire Wire Line
	4050 6550 4600 6550
Wire Wire Line
	4150 6700 4150 6650
Wire Wire Line
	4050 6650 4150 6650
Wire Wire Line
	4150 7000 4150 7100
Connection ~ 4150 7100
Wire Wire Line
	4600 7100 4600 7000
Wire Wire Line
	4150 7100 4600 7100
Wire Wire Line
	4600 6700 4600 6550
Connection ~ 4600 6550
Wire Wire Line
	4600 6550 4850 6550
$Comp
L power:+3V3 #PWR0111
U 1 1 5DDF9F5B
P 5650 3150
F 0 "#PWR0111" H 5650 3000 50  0001 C CNN
F 1 "+3V3" V 5665 3278 50  0000 L CNN
F 2 "" H 5650 3150 50  0001 C CNN
F 3 "" H 5650 3150 50  0001 C CNN
	1    5650 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5DDFB2EB
P 5800 3350
F 0 "#PWR0112" H 5800 3100 50  0001 C CNN
F 1 "GND" V 5805 3222 50  0000 R CNN
F 2 "" H 5800 3350 50  0001 C CNN
F 3 "" H 5800 3350 50  0001 C CNN
	1    5800 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5DDFBBF1
P 5750 4600
F 0 "#PWR0113" H 5750 4350 50  0001 C CNN
F 1 "GND" V 5755 4472 50  0000 R CNN
F 2 "" H 5750 4600 50  0001 C CNN
F 3 "" H 5750 4600 50  0001 C CNN
	1    5750 4600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0114
U 1 1 5DDFC98C
P 9150 900
F 0 "#PWR0114" H 9150 750 50  0001 C CNN
F 1 "+3V3" H 9165 1073 50  0000 C CNN
F 2 "" H 9150 900 50  0001 C CNN
F 3 "" H 9150 900 50  0001 C CNN
	1    9150 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 900  9150 950 
Wire Wire Line
	9250 2050 9250 2200
$Comp
L power:GND #PWR0115
U 1 1 5DE007C8
P 9250 2200
F 0 "#PWR0115" H 9250 1950 50  0001 C CNN
F 1 "GND" H 9255 2027 50  0000 C CNN
F 2 "" H 9250 2200 50  0001 C CNN
F 3 "" H 9250 2200 50  0001 C CNN
	1    9250 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J5
U 1 1 5DDA853E
P 7750 1900
F 0 "J5" H 7850 1875 50  0000 L CNN
F 1 "Conn_Coaxial" H 7850 1784 50  0000 L CNN
F 2 "Connector_Coaxial:U.FL_Hirose_U.FL-R-SMT-1_Vertical" H 7750 1900 50  0001 C CNN
F 3 " ~" H 7750 1900 50  0001 C CNN
	1    7750 1900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J6
U 1 1 5DDA9207
P 10400 1250
F 0 "J6" H 10500 1225 50  0000 L CNN
F 1 "Conn_Coaxial" H 10500 1134 50  0000 L CNN
F 2 "Connector_Coaxial:U.FL_Hirose_U.FL-R-SMT-1_Vertical" H 10400 1250 50  0001 C CNN
F 3 " ~" H 10400 1250 50  0001 C CNN
	1    10400 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 1900 7550 1900
Wire Wire Line
	7750 2100 7750 2200
$Comp
L power:GND #PWR0116
U 1 1 5DDB93FE
P 10400 1550
F 0 "#PWR0116" H 10400 1300 50  0001 C CNN
F 1 "GND" H 10405 1377 50  0000 C CNN
F 2 "" H 10400 1550 50  0001 C CNN
F 3 "" H 10400 1550 50  0001 C CNN
	1    10400 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 1450 10400 1550
Text Label 5850 4650 0    50   ~ 0
SCL
Text Label 5900 3500 0    50   ~ 0
SDA
Text Label 5900 3400 0    50   ~ 0
SCL
Text Label 4750 4550 0    50   ~ 0
SCL
Text Label 5850 4750 0    50   ~ 0
SDA
Text Label 4750 4650 0    50   ~ 0
SDA
$Comp
L power:+3V3 #PWR0119
U 1 1 5DDE30C9
P 5600 4400
F 0 "#PWR0119" H 5600 4250 50  0001 C CNN
F 1 "+3V3" V 5615 4528 50  0000 L CNN
F 2 "" H 5600 4400 50  0001 C CNN
F 3 "" H 5600 4400 50  0001 C CNN
	1    5600 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 1250 10200 1250
Wire Wire Line
	8650 1350 8250 1350
Wire Wire Line
	8650 1450 8250 1450
Text Label 8250 1450 0    50   ~ 0
MOSI
Text Label 8250 1350 0    50   ~ 0
MISO
Wire Wire Line
	8650 1250 8250 1250
Text Label 8250 1250 0    50   ~ 0
SCK
Wire Wire Line
	8650 1550 8250 1550
Text Label 8250 1550 0    50   ~ 0
CS_RAD
Wire Wire Line
	9650 1350 9900 1350
Text Label 9900 1350 0    50   ~ 0
DIO0
Wire Wire Line
	5450 1300 5200 1300
Wire Wire Line
	5450 1400 5200 1400
Text Label 5200 1300 0    50   ~ 0
TX
Text Label 5200 1400 0    50   ~ 0
RX
Wire Wire Line
	5450 1900 5300 1900
$Comp
L power:+3V3 #PWR0104
U 1 1 5DE1E14A
P 5050 1850
F 0 "#PWR0104" H 5050 1700 50  0001 C CNN
F 1 "+3V3" V 5100 1900 50  0000 L CNN
F 2 "" H 5050 1850 50  0001 C CNN
F 3 "" H 5050 1850 50  0001 C CNN
	1    5050 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 1700 5200 1700
Wire Wire Line
	5450 1800 5200 1800
Wire Wire Line
	5200 1700 5200 1800
Wire Wire Line
	5200 1800 5200 1900
Connection ~ 5200 1800
Connection ~ 5200 1900
Wire Wire Line
	8600 3450 8300 3450
Wire Wire Line
	8600 3550 8300 3550
Wire Wire Line
	8600 3750 8300 3750
$Comp
L power:GND #PWR0108
U 1 1 5DE66286
P 10450 4300
F 0 "#PWR0108" H 10450 4050 50  0001 C CNN
F 1 "GND" V 10455 4172 50  0000 R CNN
F 2 "" H 10450 4300 50  0001 C CNN
F 3 "" H 10450 4300 50  0001 C CNN
	1    10450 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0120
U 1 1 5DE772C3
P 7850 3600
F 0 "#PWR0120" H 7850 3450 50  0001 C CNN
F 1 "+3V3" V 7865 3728 50  0000 L CNN
F 2 "" H 7850 3600 50  0001 C CNN
F 3 "" H 7850 3600 50  0001 C CNN
	1    7850 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5DE7C350
P 8200 3900
F 0 "#PWR0121" H 8200 3650 50  0001 C CNN
F 1 "GND" V 8205 3772 50  0000 R CNN
F 2 "" H 8200 3900 50  0001 C CNN
F 3 "" H 8200 3900 50  0001 C CNN
	1    8200 3900
	1    0    0    -1  
$EndComp
Text Label 8300 3550 0    50   ~ 0
MOSI
Text Label 8300 3750 0    50   ~ 0
SCK
Text Label 8300 3450 0    50   ~ 0
CS_SD
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 5DE8C9E8
P 2400 1150
F 0 "J8" H 2450 1400 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2750 1300 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2400 1150 50  0001 C CNN
F 3 "~" H 2400 1150 50  0001 C CNN
	1    2400 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5E052D24
P 5650 3350
F 0 "C5" H 5535 3304 50  0000 R CNN
F 1 "100nF" H 5535 3395 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5688 3200 50  0001 C CNN
F 3 "~" H 5650 3350 50  0001 C CNN
	1    5650 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 5E0576CD
P 5650 3600
F 0 "#PWR0123" H 5650 3350 50  0001 C CNN
F 1 "GND" H 5655 3427 50  0000 C CNN
F 2 "" H 5650 3600 50  0001 C CNN
F 3 "" H 5650 3600 50  0001 C CNN
	1    5650 3600
	1    0    0    -1  
$EndComp
NoConn ~ 6300 4850
NoConn ~ 6300 4950
NoConn ~ 6300 5050
NoConn ~ 6300 5150
NoConn ~ 6300 5250
NoConn ~ 6300 5350
$Comp
L Device:C C4
U 1 1 5E08C21E
P 5600 4600
F 0 "C4" H 5485 4554 50  0000 R CNN
F 1 "100nF" H 5485 4645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5638 4450 50  0001 C CNN
F 3 "~" H 5600 4600 50  0001 C CNN
	1    5600 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 5E08C225
P 5600 4850
F 0 "#PWR0124" H 5600 4600 50  0001 C CNN
F 1 "GND" H 5605 4677 50  0000 C CNN
F 2 "" H 5600 4850 50  0001 C CNN
F 3 "" H 5600 4850 50  0001 C CNN
	1    5600 4850
	1    0    0    -1  
$EndComp
NoConn ~ 8650 1750
NoConn ~ 9650 1850
NoConn ~ 9650 1750
$Comp
L RF_Module:RFM69HW U2
U 1 1 5DC7018C
P 9150 1550
F 0 "U2" H 8800 2150 50  0000 C CNN
F 1 "RFM69HW" H 8800 2050 50  0000 C CNN
F 2 "RF_Module:HOPERF_RFM69HW" H 9150 950 50  0001 C CNN
F 3 "https://www.hoperf.com/data/upload/portal/20181127/5bfcbb56f1fd7.pdf" H 9150 1250 50  0001 C CNN
	1    9150 1550
	1    0    0    -1  
$EndComp
NoConn ~ 9650 1650
NoConn ~ 9650 1550
NoConn ~ 9650 1450
$Comp
L Device:C C7
U 1 1 5E0B6D13
P 9350 950
F 0 "C7" V 9600 850 50  0000 C CNN
F 1 "100nF" V 9500 850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9388 800 50  0001 C CNN
F 3 "~" H 9350 950 50  0001 C CNN
	1    9350 950 
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5E0B6D19
P 9650 1000
F 0 "#PWR0125" H 9650 750 50  0001 C CNN
F 1 "GND" H 9750 1000 50  0000 C CNN
F 2 "" H 9650 1000 50  0001 C CNN
F 3 "" H 9650 1000 50  0001 C CNN
	1    9650 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 950  9150 950 
Connection ~ 9150 950 
Wire Wire Line
	9150 950  9150 1050
$Comp
L Device:C C1
U 1 1 5E0C55B4
P 5300 2200
F 0 "C1" H 5185 2154 50  0000 R CNN
F 1 "100nF" H 5185 2245 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5338 2050 50  0001 C CNN
F 3 "~" H 5300 2200 50  0001 C CNN
	1    5300 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5E0C55BA
P 5300 2450
F 0 "#PWR0126" H 5300 2200 50  0001 C CNN
F 1 "GND" H 5305 2277 50  0000 C CNN
F 2 "" H 5300 2450 50  0001 C CNN
F 3 "" H 5300 2450 50  0001 C CNN
	1    5300 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2350 5300 2450
Wire Wire Line
	5300 1900 5300 2050
Connection ~ 5300 1900
Wire Wire Line
	5300 1900 5200 1900
NoConn ~ 5450 1500
NoConn ~ 5450 1600
NoConn ~ 5450 2000
NoConn ~ 7050 1200
NoConn ~ 7050 1300
NoConn ~ 7050 1400
NoConn ~ 7050 1500
NoConn ~ 7050 1600
NoConn ~ 7050 1700
$Comp
L Device:C C6
U 1 1 5E0FA2A6
P 7850 3850
F 0 "C6" H 7735 3804 50  0000 R CNN
F 1 "100nF" H 7735 3895 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7888 3700 50  0001 C CNN
F 3 "~" H 7850 3850 50  0001 C CNN
	1    7850 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 5E0FA2AC
P 7850 4100
F 0 "#PWR0127" H 7850 3850 50  0001 C CNN
F 1 "GND" H 7855 3927 50  0000 C CNN
F 2 "" H 7850 4100 50  0001 C CNN
F 3 "" H 7850 4100 50  0001 C CNN
	1    7850 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4000 7850 4100
Wire Wire Line
	7850 3700 7850 3650
NoConn ~ 8600 3350
NoConn ~ 8600 4050
Wire Wire Line
	8600 3950 8300 3950
Text Label 8300 3950 0    50   ~ 0
MISO
$Comp
L power:GND #PWR0128
U 1 1 5E12E4A8
P 2800 7150
F 0 "#PWR0128" H 2800 6900 50  0001 C CNN
F 1 "GND" H 2805 6977 50  0000 C CNN
F 2 "" H 2800 7150 50  0001 C CNN
F 3 "" H 2800 7150 50  0001 C CNN
	1    2800 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 7100 2800 7150
Wire Wire Line
	1200 1100 1450 1100
Text Label 1450 1100 0    50   ~ 0
SWCLOCK
Text Label 1450 1200 0    50   ~ 0
SWDIO
Text Label 1450 1300 0    50   ~ 0
SWO
Wire Wire Line
	1200 1200 1450 1200
Wire Wire Line
	1200 1300 1450 1300
Text Label 2800 1250 0    50   ~ 0
DBGRX
Text Label 2800 1150 0    50   ~ 0
DBGTX
$Comp
L power:GND #PWR0135
U 1 1 5E27C0B6
P 3400 5600
F 0 "#PWR0135" H 3400 5350 50  0001 C CNN
F 1 "GND" H 3405 5427 50  0000 C CNN
F 2 "" H 3400 5600 50  0001 C CNN
F 3 "" H 3400 5600 50  0001 C CNN
	1    3400 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 6550 3000 6550
Connection ~ 3250 6550
$Comp
L power:+BATT #PWR0136
U 1 1 5E2CFC22
P 3000 6550
F 0 "#PWR0136" H 3000 6400 50  0001 C CNN
F 1 "+BATT" H 3015 6723 50  0000 C CNN
F 2 "" H 3000 6550 50  0001 C CNN
F 3 "" H 3000 6550 50  0001 C CNN
	1    3000 6550
	1    0    0    -1  
$EndComp
Connection ~ 3000 6550
Wire Wire Line
	3000 6550 2800 6550
$Comp
L Device:D D4
U 1 1 5E41C413
P 2800 6950
F 0 "D4" V 2754 7029 50  0000 L CNN
F 1 "D" V 2845 7029 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2800 6950 50  0001 C CNN
F 3 "~" H 2800 6950 50  0001 C CNN
	1    2800 6950
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 6550 2800 6800
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 5E04C40D
P 1350 6650
F 0 "J4" H 1458 6931 50  0000 C CNN
F 1 "Conn_01x03_Male" H 1450 6850 50  0000 C CNN
F 2 "Connector:FanPinHeader_1x03_P2.54mm_Vertical" H 1350 6650 50  0001 C CNN
F 3 "~" H 1350 6650 50  0001 C CNN
	1    1350 6650
	1    0    0    -1  
$EndComp
NoConn ~ 1550 6650
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 5E1728CF
P 2250 6550
F 0 "SW1" H 2250 6300 50  0000 C CNN
F 1 "SW_DIP_x01" H 2250 6400 50  0000 C CNN
F 2 "Switch:Sw1" H 2250 6550 50  0001 C CNN
F 3 "~" H 2250 6550 50  0001 C CNN
	1    2250 6550
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 6550 1950 6550
Wire Wire Line
	2550 6550 2800 6550
Connection ~ 2800 6550
Wire Wire Line
	2600 1150 2800 1150
Wire Wire Line
	2600 1250 2800 1250
Wire Wire Line
	5800 3350 5800 3300
Wire Wire Line
	5800 3300 6350 3300
Connection ~ 5650 3200
Wire Wire Line
	5650 3500 5650 3600
Wire Wire Line
	5750 4550 5750 4600
Wire Wire Line
	5750 4550 6300 4550
Wire Wire Line
	5600 4850 5600 4750
Wire Wire Line
	5600 4450 5600 4400
Wire Wire Line
	5600 4450 6300 4450
Wire Wire Line
	5650 3200 6350 3200
Connection ~ 5600 4450
Wire Wire Line
	5050 1250 5050 1200
Wire Wire Line
	5050 1200 5450 1200
Wire Wire Line
	5200 1900 5050 1900
Wire Wire Line
	5050 1900 5050 1850
Wire Wire Line
	7300 2000 7300 2050
Wire Wire Line
	7050 2000 7300 2000
Wire Wire Line
	9650 950  9650 1000
Wire Wire Line
	9500 950  9650 950 
Wire Wire Line
	8200 3850 8200 3900
Wire Wire Line
	8200 3850 8600 3850
Wire Wire Line
	7850 3650 8600 3650
Wire Wire Line
	7850 3650 7850 3600
Connection ~ 7850 3650
Wire Wire Line
	10300 4250 10450 4250
Wire Wire Line
	10450 4250 10450 4300
Wire Wire Line
	4850 6550 4850 6500
Wire Wire Line
	8150 1800 8150 1850
Wire Wire Line
	7050 1800 8150 1800
Wire Wire Line
	1200 4250 1600 4250
Wire Wire Line
	1200 4300 1200 4250
Wire Wire Line
	1300 4450 1600 4450
Wire Wire Line
	1300 4450 1300 4500
Wire Wire Line
	1400 4650 1400 4700
Wire Wire Line
	2000 2250 2250 2250
Wire Wire Line
	2000 2250 2000 2300
Wire Wire Line
	2100 2450 2100 2500
Wire Wire Line
	1050 3200 1250 3200
Wire Wire Line
	1050 3250 1050 3200
Wire Wire Line
	1200 1500 1500 1500
Wire Wire Line
	1500 1500 1500 1550
$Comp
L power:GND #PWR0137
U 1 1 5E13BBF7
P 2100 2500
F 0 "#PWR0137" H 2100 2250 50  0001 C CNN
F 1 "GND" V 2105 2372 50  0000 R CNN
F 2 "" H 2100 2500 50  0001 C CNN
F 3 "" H 2100 2500 50  0001 C CNN
	1    2100 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2450 2100 2450
Wire Wire Line
	2700 2450 2550 2450
$Comp
L Device:C C11
U 1 1 5E129ABE
P 2400 2450
F 0 "C11" V 2300 2300 50  0000 C CNN
F 1 "4.7uF" V 2300 2600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2438 2300 50  0001 C CNN
F 3 "~" H 2400 2450 50  0001 C CNN
	1    2400 2450
	0    1    1    0   
$EndComp
NoConn ~ 2700 5150
NoConn ~ 2700 5050
NoConn ~ 2700 4950
NoConn ~ 2700 4850
NoConn ~ 2700 4750
NoConn ~ 2700 4650
NoConn ~ 2700 4250
NoConn ~ 2700 4150
NoConn ~ 2700 4050
NoConn ~ 2700 3950
NoConn ~ 2700 3850
NoConn ~ 2700 3750
NoConn ~ 2700 3650
NoConn ~ 2700 3450
NoConn ~ 4100 2050
NoConn ~ 4100 2150
NoConn ~ 4100 3250
NoConn ~ 4100 3350
NoConn ~ 4100 3750
NoConn ~ 4100 3850
NoConn ~ 4100 3950
NoConn ~ 4100 4150
NoConn ~ 4100 4250
NoConn ~ 4100 4350
NoConn ~ 4100 4450
NoConn ~ 4100 4750
NoConn ~ 4100 4850
NoConn ~ 4100 4950
NoConn ~ 4100 5050
NoConn ~ 4100 5150
Connection ~ 3500 5450
Wire Wire Line
	3600 5450 3500 5450
Wire Wire Line
	3600 5350 3600 5450
Wire Wire Line
	3400 5450 3400 5600
Wire Wire Line
	3400 5450 3500 5450
Connection ~ 3400 5450
Wire Wire Line
	3300 5450 3400 5450
Connection ~ 3300 5450
Wire Wire Line
	3200 5450 3300 5450
Wire Wire Line
	3500 5350 3500 5450
Wire Wire Line
	3400 5350 3400 5450
Wire Wire Line
	3300 5350 3300 5450
Wire Wire Line
	3200 5350 3200 5450
Wire Wire Line
	3450 1750 3500 1750
Connection ~ 3450 1750
Wire Wire Line
	3450 1750 3450 1600
Connection ~ 3600 1750
Wire Wire Line
	3600 1750 3700 1750
Connection ~ 3500 1750
Wire Wire Line
	3600 1750 3500 1750
Connection ~ 3400 1750
Wire Wire Line
	3400 1750 3450 1750
Connection ~ 3300 1750
Wire Wire Line
	3300 1750 3400 1750
Wire Wire Line
	3200 1750 3300 1750
Wire Wire Line
	3500 1850 3500 1750
Wire Wire Line
	3400 1850 3400 1750
Wire Wire Line
	3300 1850 3300 1750
Wire Wire Line
	3200 1850 3200 1750
Wire Wire Line
	3600 1850 3600 1750
Wire Wire Line
	3700 1850 3700 1750
Text Label 4500 2350 0    50   ~ 0
DBGRX
Text Label 4500 2250 0    50   ~ 0
DBGTX
Text Label 4150 4050 0    50   ~ 0
SWO
Text Label 4500 3550 0    50   ~ 0
SWDIO
Text Label 4500 3450 0    50   ~ 0
SWCLOCK
Wire Wire Line
	4100 2850 4500 2850
Wire Wire Line
	1200 1400 1450 1400
Wire Wire Line
	2700 2250 2550 2250
$Comp
L Device:R R6
U 1 1 5E1D7049
P 2400 2250
F 0 "R6" V 2300 2150 50  0000 C CNN
F 1 "100k" V 2300 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2330 2250 50  0001 C CNN
F 3 "~" H 2400 2250 50  0001 C CNN
	1    2400 2250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 5E1CCB96
P 2000 2300
F 0 "#PWR0133" H 2000 2050 50  0001 C CNN
F 1 "GND" V 2005 2172 50  0000 R CNN
F 2 "" H 2000 2300 50  0001 C CNN
F 3 "" H 2000 2300 50  0001 C CNN
	1    2000 2300
	1    0    0    -1  
$EndComp
Text Label 2200 2050 0    50   ~ 0
RST
Text Label 1450 1400 0    50   ~ 0
RST
$Comp
L power:GND #PWR0132
U 1 1 5E1C680C
P 1500 1550
F 0 "#PWR0132" H 1500 1300 50  0001 C CNN
F 1 "GND" V 1505 1422 50  0000 R CNN
F 2 "" H 1500 1550 50  0001 C CNN
F 3 "" H 1500 1550 50  0001 C CNN
	1    1500 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4650 1900 4650
Wire Wire Line
	2100 4450 1900 4450
Wire Wire Line
	2100 4250 1900 4250
Wire Wire Line
	1600 4650 1400 4650
$Comp
L power:GND #PWR0131
U 1 1 5E1A7B3F
P 1400 4700
F 0 "#PWR0131" H 1400 4450 50  0001 C CNN
F 1 "GND" V 1405 4572 50  0000 R CNN
F 2 "" H 1400 4700 50  0001 C CNN
F 3 "" H 1400 4700 50  0001 C CNN
	1    1400 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5E1A7B39
P 1750 4650
F 0 "D3" H 1600 4700 50  0000 C CNN
F 1 "LED" H 1750 4750 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 1750 4650 50  0001 C CNN
F 3 "~" H 1750 4650 50  0001 C CNN
	1    1750 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 5E1A2C7D
P 1300 4500
F 0 "#PWR0130" H 1300 4250 50  0001 C CNN
F 1 "GND" V 1305 4372 50  0000 R CNN
F 2 "" H 1300 4500 50  0001 C CNN
F 3 "" H 1300 4500 50  0001 C CNN
	1    1300 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5E1A2C77
P 1750 4450
F 0 "D2" H 1600 4500 50  0000 C CNN
F 1 "LED" H 1750 4550 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 1750 4450 50  0001 C CNN
F 3 "~" H 1750 4450 50  0001 C CNN
	1    1750 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 5E19C82C
P 1200 4300
F 0 "#PWR0129" H 1200 4050 50  0001 C CNN
F 1 "GND" V 1205 4172 50  0000 R CNN
F 2 "" H 1200 4300 50  0001 C CNN
F 3 "" H 1200 4300 50  0001 C CNN
	1    1200 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5E19B7B6
P 1750 4250
F 0 "D1" H 1600 4300 50  0000 C CNN
F 1 "LED" H 1750 4350 50  0000 C CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 1750 4250 50  0001 C CNN
F 3 "~" H 1750 4250 50  0001 C CNN
	1    1750 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4550 2700 4550
Wire Wire Line
	2400 4550 2400 4650
Wire Wire Line
	2400 4450 2700 4450
Wire Wire Line
	2400 4350 2700 4350
Wire Wire Line
	2400 4350 2400 4250
$Comp
L Device:R R3
U 1 1 5E18A692
P 2250 4250
F 0 "R3" V 2150 4150 50  0000 C CNN
F 1 "R" V 2150 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2180 4250 50  0001 C CNN
F 3 "~" H 2250 4250 50  0001 C CNN
	1    2250 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5E18648B
P 2250 4650
F 0 "R5" V 2150 4550 50  0000 C CNN
F 1 "R" V 2150 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2180 4650 50  0001 C CNN
F 3 "~" H 2250 4650 50  0001 C CNN
	1    2250 4650
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5E16BC61
P 2250 4450
F 0 "R4" V 2150 4350 50  0000 C CNN
F 1 "R" V 2150 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2180 4450 50  0001 C CNN
F 3 "~" H 2250 4450 50  0001 C CNN
	1    2250 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 3150 4100 3150
Wire Wire Line
	4100 2950 4500 2950
Wire Wire Line
	4100 3050 4500 3050
Wire Wire Line
	4100 3550 4500 3550
Wire Wire Line
	4100 3450 4500 3450
Wire Wire Line
	4100 4050 4150 4050
$Comp
L power:+3V3 #PWR0122
U 1 1 5DEA58CD
P 3450 1600
F 0 "#PWR0122" H 3450 1450 50  0001 C CNN
F 1 "+3V3" H 3465 1773 50  0000 C CNN
F 2 "" H 3450 1600 50  0001 C CNN
F 3 "" H 3450 1600 50  0001 C CNN
	1    3450 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2350 4500 2350
Wire Wire Line
	4100 2250 4500 2250
Wire Wire Line
	2700 2050 2200 2050
$Comp
L Connector:Conn_01x05_Male J7
U 1 1 5DE8D72E
P 1000 1300
F 0 "J7" H 1108 1681 50  0000 C CNN
F 1 "Conn_01x05_Male" H 1108 1590 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 1000 1300 50  0001 C CNN
F 3 "~" H 1000 1300 50  0001 C CNN
	1    1000 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2450 4500 2450
Text Label 4500 2450 0    50   ~ 0
CS_SD
Text Label 4500 3150 0    50   ~ 0
DIO0
Text Label 4500 2950 0    50   ~ 0
RX
Text Label 4500 2850 0    50   ~ 0
CS_RAD
Text Label 4500 3050 0    50   ~ 0
TX
Text Label 4500 2550 0    50   ~ 0
SCK
Wire Wire Line
	4100 2550 4500 2550
Text Label 4500 2650 0    50   ~ 0
MISO
Text Label 4500 2750 0    50   ~ 0
MOSI
Wire Wire Line
	4100 2750 4500 2750
Wire Wire Line
	4100 2650 4500 2650
Wire Wire Line
	4350 4100 4350 4000
Wire Wire Line
	4650 4150 4650 4050
Wire Wire Line
	4650 4650 4750 4650
Connection ~ 4650 4650
Wire Wire Line
	4650 4650 4650 4450
Wire Wire Line
	4100 4650 4650 4650
$Comp
L Device:R R2
U 1 1 5DDD44DC
P 4650 4300
F 0 "R2" H 4720 4346 50  0000 L CNN
F 1 "10k" H 4720 4255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4580 4300 50  0001 C CNN
F 3 "~" H 4650 4300 50  0001 C CNN
	1    4650 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DDD27B4
P 4350 4250
F 0 "R1" H 4420 4296 50  0000 L CNN
F 1 "10k" H 4420 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4280 4250 50  0001 C CNN
F 3 "~" H 4350 4250 50  0001 C CNN
	1    4350 4250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0118
U 1 1 5DDD1110
P 4350 4000
F 0 "#PWR0118" H 4350 3850 50  0001 C CNN
F 1 "+3V3" H 4365 4173 50  0000 C CNN
F 2 "" H 4350 4000 50  0001 C CNN
F 3 "" H 4350 4000 50  0001 C CNN
	1    4350 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0117
U 1 1 5DDD0670
P 4650 4050
F 0 "#PWR0117" H 4650 3900 50  0001 C CNN
F 1 "+3V3" H 4665 4223 50  0000 C CNN
F 2 "" H 4650 4050 50  0001 C CNN
F 3 "" H 4650 4050 50  0001 C CNN
	1    4650 4050
	1    0    0    -1  
$EndComp
Connection ~ 4350 4550
Wire Wire Line
	4350 4550 4750 4550
Wire Wire Line
	4350 4550 4350 4400
Wire Wire Line
	4100 4550 4350 4550
Wire Wire Line
	1250 3200 1250 3350
Connection ~ 1250 3200
$Comp
L power:GND #PWR0110
U 1 1 5DDECC5E
P 1050 3250
F 0 "#PWR0110" H 1050 3000 50  0001 C CNN
F 1 "GND" V 1055 3122 50  0000 R CNN
F 2 "" H 1050 3250 50  0001 C CNN
F 3 "" H 1050 3250 50  0001 C CNN
	1    1050 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3050 1250 3200
Wire Wire Line
	1400 3050 1250 3050
Wire Wire Line
	1400 3350 1250 3350
Connection ~ 2000 3350
Wire Wire Line
	2000 3350 1700 3350
Connection ~ 2000 3050
Wire Wire Line
	2000 3050 1700 3050
$Comp
L Device:C C3
U 1 1 5DD8A500
P 1550 3350
F 0 "C3" V 1400 3350 50  0000 C CNN
F 1 "15pF" V 1300 3350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1588 3200 50  0001 C CNN
F 3 "~" H 1550 3350 50  0001 C CNN
	1    1550 3350
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C2
U 1 1 5DD88EE9
P 1550 3050
F 0 "C2" V 1298 3050 50  0000 C CNN
F 1 "15pF" V 1389 3050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1588 2900 50  0001 C CNN
F 3 "~" H 1550 3050 50  0001 C CNN
	1    1550 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 3350 2000 3350
Wire Wire Line
	2250 3250 2250 3350
Wire Wire Line
	2700 3250 2250 3250
Wire Wire Line
	2250 3050 2000 3050
Wire Wire Line
	2250 3150 2250 3050
Wire Wire Line
	2700 3150 2250 3150
$Comp
L Device:Crystal Y1
U 1 1 5DC73CB4
P 2000 3200
F 0 "Y1" V 2050 3450 50  0000 C CNN
F 1 "Crystal" V 1950 3450 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_HC49-SD" H 2000 3200 50  0001 C CNN
F 3 "~" H 2000 3200 50  0001 C CNN
	1    2000 3200
	0    -1   -1   0   
$EndComp
$Comp
L MCU_ST_STM32F4:STM32F411RETx U1
U 1 1 5DC7644B
P 3400 3550
F 0 "U1" H 2750 1750 50  0000 C CNN
F 1 "STM32F411RETx" H 2750 1650 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 2800 1850 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00115249.pdf" H 3400 3550 50  0001 C CNN
	1    3400 3550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
