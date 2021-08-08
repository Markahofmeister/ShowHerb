EESchema Schematic File Version 4
EELAYER 30 0
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
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 61083BA3
P 4850 2650
F 0 "A?" V 4804 1606 50  0000 R CNN
F 1 "Arduino Nano Every" V 4895 1606 50  0000 R CNN
F 2 "Module:Arduino_Nano" H 4850 2650 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4850 2650 50  0001 C CNN
	1    4850 2650
	0    1    1    0   
$EndComp
$Comp
L Interface_Expansion:TCA9548AMRGER U
U 1 1 61085632
P 4850 4800
F 0 "U" V 4804 5744 50  0000 L CNN
F 1 "TCA9548AMRGER" V 4895 5744 50  0000 L CNN
F 2 "Package_DFN_QFN:Texas_RGE0024C_EP2.1x2.1mm" H 4850 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tca9548a.pdf" H 4900 5050 50  0001 C CNN
	1    4850 4800
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6108A057
P 6100 850
F 0 "#PWR?" H 6100 700 50  0001 C CNN
F 1 "+5V" H 6115 1023 50  0000 C CNN
F 2 "" H 6100 850 50  0001 C CNN
F 3 "" H 6100 850 50  0001 C CNN
	1    6100 850 
	-1   0    0    1   
$EndComp
Wire Wire Line
	6100 2550 5850 2550
$Comp
L Relay:DIPxx-1Cxx-51x K?
U 1 1 6108C61C
P 8800 2650
F 0 "K?" H 8370 2604 50  0000 R CNN
F 1 "DIPxx-1Cxx-51x" H 8370 2695 50  0000 R CNN
F 2 "Relay_THT:Relay_StandexMeder_DIP_LowProfile" H 9250 2600 50  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 8800 2650 50  0001 C CNN
	1    8800 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	4150 2150 4150 1550
$Comp
L power:GNDREF #PWR?
U 1 1 6108FD92
P 3850 6150
F 0 "#PWR?" H 3850 5900 50  0001 C CNN
F 1 "GNDREF" H 3855 5977 50  0000 C CNN
F 2 "" H 3850 6150 50  0001 C CNN
F 3 "" H 3850 6150 50  0001 C CNN
	1    3850 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US 1M
U 1 1 61091A26
P 8700 3950
F 0 "1M" H 8768 3996 50  0000 L CNN
F 1 "Current Limiter" H 8768 3905 50  0000 L CNN
F 2 "" V 8740 3940 50  0001 C CNN
F 3 "~" H 8700 3950 50  0001 C CNN
	1    8700 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2950 8700 3800
Wire Wire Line
	8700 4100 8700 6150
$Comp
L Motor:Motor_DC 12V
U 1 1 610952C2
P 8100 3900
F 0 "12V" H 8258 3896 50  0000 L CNN
F 1 "Valve Servo" H 8258 3805 50  0000 L CNN
F 2 "" H 8100 3810 50  0001 C CNN
F 3 "~" H 8100 3810 50  0001 C CNN
	1    8100 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 2950 8100 3700
Wire Wire Line
	8100 4200 8100 6150
Wire Wire Line
	5450 4400 5450 3600
Wire Wire Line
	5450 3600 4450 3600
Wire Wire Line
	4450 3600 4450 3150
Wire Wire Line
	4350 3150 4350 3750
Wire Wire Line
	4350 3750 5550 3750
Wire Wire Line
	5550 3750 5550 4400
$Comp
L Sensor_Humidity:SHTC1 5V
U 1 1 6109A4D0
P 6350 5450
F 0 "5V" H 6594 5496 50  0000 L CNN
F 1 "Stemma 1" H 6594 5405 50  0000 L CNN
F 2 "Sensor_Humidity:Sensirion_DFN-4-1EP_2x2mm_P1mm_EP0.7x1.6mm" H 6550 5100 50  0001 C CNN
F 3 "https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/0_Datasheets/Humidity/Sensirion_Humidity_Sensors_SHTC1_Datasheet.pdf" H 6050 5900 50  0001 C CNN
	1    6350 5450
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Humidity:SHTC1 5V
U 1 1 6109B433
P 7400 5450
F 0 "5V" H 7644 5496 50  0000 L CNN
F 1 "Stemma 2" H 7644 5405 50  0000 L CNN
F 2 "Sensor_Humidity:Sensirion_DFN-4-1EP_2x2mm_P1mm_EP0.7x1.6mm" H 7600 5100 50  0001 C CNN
F 3 "https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/0_Datasheets/Humidity/Sensirion_Humidity_Sensors_SHTC1_Datasheet.pdf" H 7100 5900 50  0001 C CNN
	1    7400 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 2950 8100 2950
Wire Wire Line
	9000 1550 9000 2350
Wire Wire Line
	4150 1550 9000 1550
$Comp
L power:+12V #PWR?
U 1 1 6109EBB6
P 8600 1850
F 0 "#PWR?" H 8600 1700 50  0001 C CNN
F 1 "+12V" H 8615 2023 50  0000 C CNN
F 2 "" H 8600 1850 50  0001 C CNN
F 3 "" H 8600 1850 50  0001 C CNN
	1    8600 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	8600 1950 8600 2350
Wire Wire Line
	5550 5200 5550 5350
Wire Wire Line
	5550 5350 6050 5350
Wire Wire Line
	5450 5200 5450 5550
Wire Wire Line
	5450 5550 6050 5550
Wire Wire Line
	5250 5200 5250 5850
Wire Wire Line
	5250 5850 7100 5850
Wire Wire Line
	7100 5850 7100 5550
Wire Wire Line
	5350 5200 5350 6000
Wire Wire Line
	5350 6000 7000 6000
Wire Wire Line
	7000 6000 7000 5350
Wire Wire Line
	7000 5350 7100 5350
Connection ~ 6050 5350
Wire Wire Line
	6050 5350 6150 5350
Connection ~ 6050 5550
Wire Wire Line
	6050 5550 6150 5550
Wire Wire Line
	6450 5750 6450 6150
Wire Wire Line
	6450 6150 7500 6150
Wire Wire Line
	7500 6150 7500 5750
Wire Wire Line
	5250 2150 5250 1750
Wire Wire Line
	5250 1750 6450 1750
Wire Wire Line
	6450 1750 6450 5150
Wire Wire Line
	5150 2150 5150 1700
Wire Wire Line
	5150 1700 7500 1700
Wire Wire Line
	7500 1700 7500 5150
Wire Wire Line
	9000 2950 9550 2950
Wire Wire Line
	9550 2950 9550 6150
Wire Wire Line
	5750 4800 6100 4800
$Comp
L RainSensor:Rain_Sensor U?
U 1 1 61102ED1
P 1500 2350
F 0 "U?" H 1770 2515 50  0000 C CNN
F 1 "Rain_Sensor" H 1770 2424 50  0000 C CNN
F 2 "" H 1650 2400 50  0001 C CNN
F 3 "" H 1650 2400 50  0001 C CNN
	1    1500 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2850 5900 2850
Wire Wire Line
	2500 2500 2400 2500
Wire Wire Line
	2500 2500 2500 1250
Wire Wire Line
	2500 1250 6100 1250
Wire Wire Line
	2500 2800 2500 3800
Wire Wire Line
	2500 3800 3850 3800
Wire Wire Line
	2500 2700 2800 2700
Wire Wire Line
	2800 2700 2800 3150
Wire Wire Line
	2800 3150 4150 3150
Wire Wire Line
	2400 2600 2900 2600
Wire Wire Line
	2900 2600 2900 2000
Wire Wire Line
	2900 2000 4250 2000
Wire Wire Line
	4250 2000 4250 2150
$Comp
L Device:R_PHOTO PhotoResistor
U 1 1 61127B73
P 6700 3050
F 0 "PhotoResistor" H 6770 3096 50  0000 L CNN
F 1 "Variable" H 6770 3005 50  0000 L CNN
F 2 "" V 6750 2800 50  0001 L CNN
F 3 "~" H 6700 3000 50  0001 C CNN
	1    6700 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R ReferenceResistor
U 1 1 611789C2
P 6700 3350
F 0 "ReferenceResistor" H 6770 3396 50  0000 L CNN
F 1 "R" H 6770 3305 50  0000 L CNN
F 2 "" V 6630 3350 50  0001 C CNN
F 3 "~" H 6700 3350 50  0001 C CNN
	1    6700 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3200 4850 3200
Wire Wire Line
	4850 3200 4850 3150
Connection ~ 6700 3200
Wire Wire Line
	6700 2900 6700 2650
Wire Wire Line
	6700 2650 6100 2650
Wire Wire Line
	6700 3500 3850 3500
Wire Notes Line
	6500 2900 6500 3600
Wire Notes Line
	6500 3600 7450 3600
Wire Notes Line
	7450 3600 7450 2900
Wire Notes Line
	7450 2900 6500 2900
Wire Bus Line
	3850 6150 9700 6150
Wire Bus Line
	3850 2650 3850 6150
Wire Bus Line
	6100 850  6100 4800
Text Notes 6850 2850 0    50   ~ 0
Voltage Divider\n
$EndSCHEMATC
