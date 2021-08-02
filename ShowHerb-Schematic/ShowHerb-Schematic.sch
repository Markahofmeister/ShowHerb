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
P 3000 2500
F 0 "A?" V 2954 1456 50  0000 R CNN
F 1 "Arduino Nano Every" V 3045 1456 50  0000 R CNN
F 2 "Module:Arduino_Nano" H 3000 2500 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 3000 2500 50  0001 C CNN
	1    3000 2500
	0    1    1    0   
$EndComp
$Comp
L Interface_Expansion:TCA9548AMRGER U
U 1 1 61085632
P 3000 4650
F 0 "U" V 2954 5594 50  0000 L CNN
F 1 "TCA9548AMRGER" V 3045 5594 50  0000 L CNN
F 2 "Package_DFN_QFN:Texas_RGE0024C_EP2.1x2.1mm" H 3000 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tca9548a.pdf" H 3050 4900 50  0001 C CNN
	1    3000 4650
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6108A057
P 4250 1700
F 0 "#PWR?" H 4250 1550 50  0001 C CNN
F 1 "+5V" H 4265 1873 50  0000 C CNN
F 2 "" H 4250 1700 50  0001 C CNN
F 3 "" H 4250 1700 50  0001 C CNN
	1    4250 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4250 2400 4000 2400
$Comp
L Relay:DIPxx-1Cxx-51x K?
U 1 1 6108C61C
P 6950 2500
F 0 "K?" H 6520 2454 50  0000 R CNN
F 1 "DIPxx-1Cxx-51x" H 6520 2545 50  0000 R CNN
F 2 "Relay_THT:Relay_StandexMeder_DIP_LowProfile" H 7400 2450 50  0001 L CNN
F 3 "https://standexelectronics.com/wp-content/uploads/datasheet_reed_relay_DIP.pdf" H 6950 2500 50  0001 C CNN
	1    6950 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 2000 2300 1400
$Comp
L power:GNDREF #PWR?
U 1 1 6108FD92
P 2000 6000
F 0 "#PWR?" H 2000 5750 50  0001 C CNN
F 1 "GNDREF" H 2005 5827 50  0000 C CNN
F 2 "" H 2000 6000 50  0001 C CNN
F 3 "" H 2000 6000 50  0001 C CNN
	1    2000 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US 1M
U 1 1 61091A26
P 6850 3800
F 0 "1M" H 6918 3846 50  0000 L CNN
F 1 "Current Limiter" H 6918 3755 50  0000 L CNN
F 2 "" V 6890 3790 50  0001 C CNN
F 3 "~" H 6850 3800 50  0001 C CNN
	1    6850 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2800 6850 3650
Wire Wire Line
	6850 3950 6850 6000
$Comp
L Motor:Motor_DC 12V
U 1 1 610952C2
P 6250 3750
F 0 "12V" H 6408 3746 50  0000 L CNN
F 1 "Valve Servo" H 6408 3655 50  0000 L CNN
F 2 "" H 6250 3660 50  0001 C CNN
F 3 "~" H 6250 3660 50  0001 C CNN
	1    6250 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2800 6250 3550
Wire Wire Line
	6250 4050 6250 6000
Wire Wire Line
	3600 4250 3600 3450
Wire Wire Line
	3600 3450 2600 3450
Wire Wire Line
	2600 3450 2600 3000
Wire Wire Line
	2500 3000 2500 3600
Wire Wire Line
	2500 3600 3700 3600
Wire Wire Line
	3700 3600 3700 4250
$Comp
L Sensor_Humidity:SHTC1 5V
U 1 1 6109A4D0
P 4500 5300
F 0 "5V" H 4744 5346 50  0000 L CNN
F 1 "Stemma 1" H 4744 5255 50  0000 L CNN
F 2 "Sensor_Humidity:Sensirion_DFN-4-1EP_2x2mm_P1mm_EP0.7x1.6mm" H 4700 4950 50  0001 C CNN
F 3 "https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/0_Datasheets/Humidity/Sensirion_Humidity_Sensors_SHTC1_Datasheet.pdf" H 4200 5750 50  0001 C CNN
	1    4500 5300
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Humidity:SHTC1 5V
U 1 1 6109B433
P 5550 5300
F 0 "5V" H 5794 5346 50  0000 L CNN
F 1 "Stemma 2" H 5794 5255 50  0000 L CNN
F 2 "Sensor_Humidity:Sensirion_DFN-4-1EP_2x2mm_P1mm_EP0.7x1.6mm" H 5750 4950 50  0001 C CNN
F 3 "https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/0_Datasheets/Humidity/Sensirion_Humidity_Sensors_SHTC1_Datasheet.pdf" H 5250 5750 50  0001 C CNN
	1    5550 5300
	1    0    0    -1  
$EndComp
Wire Bus Line
	2000 2600 2000 4650
Wire Wire Line
	6650 2800 6250 2800
Wire Wire Line
	7150 1400 7150 2200
Wire Wire Line
	2300 1400 7150 1400
$Comp
L power:+12V #PWR?
U 1 1 6109EBB6
P 6750 1700
F 0 "#PWR?" H 6750 1550 50  0001 C CNN
F 1 "+12V" H 6765 1873 50  0000 C CNN
F 2 "" H 6750 1700 50  0001 C CNN
F 3 "" H 6750 1700 50  0001 C CNN
	1    6750 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	6750 1800 6750 2200
Wire Wire Line
	3700 5050 3700 5200
Wire Wire Line
	3700 5200 4200 5200
Wire Wire Line
	3600 5050 3600 5400
Wire Wire Line
	3600 5400 4200 5400
Wire Wire Line
	3400 5050 3400 5700
Wire Wire Line
	3400 5700 5250 5700
Wire Wire Line
	5250 5700 5250 5400
Wire Wire Line
	3500 5050 3500 5850
Wire Wire Line
	3500 5850 5150 5850
Wire Wire Line
	5150 5850 5150 5200
Wire Wire Line
	5150 5200 5250 5200
Connection ~ 4200 5200
Wire Wire Line
	4200 5200 4300 5200
Connection ~ 4200 5400
Wire Wire Line
	4200 5400 4300 5400
Wire Wire Line
	4600 5600 4600 6000
Wire Wire Line
	4600 6000 5650 6000
Wire Wire Line
	5650 6000 5650 5600
Wire Bus Line
	2000 6000 4600 6000
Wire Wire Line
	3400 2000 3400 1600
Wire Wire Line
	3400 1600 4600 1600
Wire Wire Line
	4600 1600 4600 5000
Wire Bus Line
	4250 1800 4250 2400
Wire Wire Line
	3300 2000 3300 1550
Wire Wire Line
	3300 1550 5650 1550
Wire Wire Line
	5650 1550 5650 5000
Wire Wire Line
	7150 2800 7700 2800
Wire Wire Line
	7700 2800 7700 6000
Connection ~ 5650 6000
Wire Bus Line
	5650 6000 6250 6000
Connection ~ 4600 6000
Wire Bus Line
	4600 6000 5650 6000
Connection ~ 6250 6000
Wire Bus Line
	6250 6000 6850 6000
Connection ~ 6850 6000
Wire Bus Line
	6850 6000 7700 6000
Connection ~ 7700 6000
Wire Bus Line
	7700 6000 7850 6000
Connection ~ 2000 2600
Connection ~ 2000 4650
Wire Bus Line
	2000 4650 2000 6000
Connection ~ 5250 5200
Connection ~ 5250 5400
Wire Wire Line
	3900 4650 4250 4650
Connection ~ 4250 4650
Connection ~ 4250 2400
Wire Bus Line
	4250 2400 4250 4650
Connection ~ 6750 2200
Connection ~ 7150 2200
Connection ~ 6650 2800
Connection ~ 6850 2800
Connection ~ 7150 2800
$EndSCHEMATC
