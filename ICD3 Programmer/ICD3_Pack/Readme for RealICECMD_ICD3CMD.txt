Release Notes for MPLAB RealICE/ICD3 Command Line Interface
MPLAB® IDE v8.56
REAL ICE Software and Firmware versions:
 MPRealICE.dll	v6.0.3.58	
 RealICECMD.exe	v1.00.09
 MPLAB REAL ICE Suite (OS/FW)	v1.26.26	(RIFW_012626.jam)
ICD 3 Software and Firmware versions:
 MPICD3.dll	v1.0.3.22	
 ICD3CMD.exe	v1.00.09
 MPLAB ICD 3 Suite (OS/FW)	v1.26.26	(ICD3FW_012626.jam)


August 13, 2010


-----------------------------------------------------------------------------
Table of Contents
-----------------------------------------------------------------------------
1.  Tool Definition
2.  Device Support List
3.  Operating System Support List
4.  What's New or Updated
5.  Known Problems
6.  Important Notes
7.  Upgrading the Firmware
8.  Command Line Options
9.  Exit codes
10. Troubleshooting
11. Command Line Examples
12. Customer Support

----------------------------------------------------------------------------
1. Tool Definition
----------------------------------------------------------------------------
     RealICECMD/ICD3CMD is a 32 bit command-line interface to
MPLAB RealICE/ICD3 device programming support.

The REALICECMD executable may be found, by default, in:
C:\Program Files\Microchip\MPLAB IDE\Programmer Utilities\RealICE

The ICD3CMD executable may be found, by default, in:
C:\Program Files\Microchip\MPLAB IDE\Programmer Utilities\ICD3

Note:  RealICECMD/ICD3CMD will only work with MPLAB IDE v8.30 and above
-----
----------------------------------------------------------------------------
2. Device Support List
----------------------------------------------------------------------------
- PICmicro devices: drop "PIC", e.g., PIC16F877 becomes 16F877
- dsPIC devices:    drop "dsPIC", e.g., dsPIC30F6014 becomes 30F6014


----------------------------------------------------------------------------
3. Operating System Support List
----------------------------------------------------------------------------
Windows 98, Windows® 2000 SP4, Windows XP SP2 and Windows Vista™ (32-Bit)* OSs

* Only initial testing has been performed on 32-bit Vista for this release.
 
NOTE: Windows NT® and Windows ME OSs are NOT supported.

----------------------------------------------------------------------------
4. What's New or Updated
----------------------------------------------------------------------------

 1.0.2	Auto Update Firmware
 1.0.3  SQTP Support and Batch mode Operation
 1.0.4  Power Target from ICD3
 1.0.5  Programming Calibration memory 
 1.0.6  Hold in Reset 
 1.0.7  Release From Reset,Reporgramming and Read specific region
 1.0.8  High Voltage MCLR and Program only selected Program Memory Range
 1.0.9  REALICE Command line utility (RealICECMD) now supports programming 
        and reading program memory ranges.

----------------------------------------------------------------------------
5. Known Problems
----------------------------------------------------------------------------

ICD3-243: RealICECMD/ICD3CMD does not work on 64-bit OSs. The issue is that 
if the command line tool has to switch firmware versions, it will not be 
able to do that as it times out early.

Workaround: Download the correct firmware for the device using MPLAB IDE. 
Once that is done the command line utility will detect the device. 

----------------------------------------------------------------------------
6. Important Notes
----------------------------------------------------------------------------
   a. RealICECMD/ICD3CMD will auto update Firmware, this will cause delay to the operation
   b. Part name should be mentioned without Family Information like PIC/dsPIC
      Example. PIC18F67J50 should be mentioned as -P18F67J50
   c. Program and Verify Operation makes use of Selected Hex File using -F<file>
   d. Only Single session of RealICE/ICD3 communication is allowed
   e. Command line arguments are parsed alphabetically
   f. Batch Mode Operation will Initialize the RealICE/ICD3 once and perform the 
      same operations repeatedly. On each repeat operation user intervention is required.
      Batch Mode will exit on following condition, Failure of operation or user request   
      to stop.
      Warning: Batch Mode is suggested to use only for the .bat or direct invocation of 
               RealICECMD/ICD3CMD as because it will enter into wait state for the user input.
   g. To generate SQTP file use MPLAB IDE, Select 'Programmer' under that 'MPLAB PM3',    
      then select 'Settings' and open 'SQTP' tab.
   h. Reprogram will enable the user to update the selected part of memory.
      The reprogram hex file should contain only data for the selected memory range that
      needs to be updated. This option first read the device and update the selected memory 
      then writes it back to the device. 
   i. Program Memory Range Address must be aligned to the device's program memory boundary size.

----------------------------------------------------------------------------
9.  Upgrading the Firmware
----------------------------------------------------------------------------
    RealICECMD/ICD3CMD will automatically download the latest firmware if required

----------------------------------------------------------------------------
10. Command Line Options
----------------------------------------------------------------------------
The following commands are available in the command line interface.


 Description			Options
----------------------------------------------------------------------------
 Part/Device			-P<Part name>
 Batch Mode Operation		-B 	 	 
 Blank Check			-C			  
 Erase Flash			-E			  
 Hex File Selection		-F<file>		  
 Read to file			-G<Region>F<file>
				   Region:
				     P= Program Memory
				     E= EEPROM	
				     I= ID Memory
				     C= Configuration Memory
				     B= Boot Flash Memory
				     If no region is entered, 
                                     the entire device will be read
 Hold in Reset 			-H
 Release from Reset		-L
 High Voltage MCLR		-I
 Program			-M<Region>
				   Region:
				     P= Program Memory
  				     E= EEPROM	
				     I= ID Memory
				     C= Configuration Memory
				     B= Boot Flash Memory
				     If no region is entered, 
                                     the entire device will be programmed
 Program Memory Range           -N####,####
				  #### is a hexidecimal number representing 
                                  Start and End Address in sequence
 Reprogram			-R<file>
 SQTP File Selection		-S<file>
 Program Calibration memory	-U##
				   ## is a hexidecimal number representing
	                           the least significant byte of the 
                                   calibration value to be programmed		 	
 Power Target(only for ICD3)	-V<Voltage>
 Verify				-Y
 Help				-?	
 Exit Code			-?E

Note: Commands are not case sensitive. Escape character can be a ‘-‘ or  ‘/’.  
-----

----------------------------------------------------------------------------
11. Exit Codes
----------------------------------------------------------------------------

     0 - All of the selected operations complete successfully
     1 - Invalid Command Line Argument
     2 - RealICE/ICD3 Communication Failed
     3 - Selected Operation Failed
     4 - Unknown Runtime Failure
     5 - Invalid Device Detected
     6 - SQTP Failed

----------------------------------------------------------------------------
12. Troubleshooting
----------------------------------------------------------------------------
I. Failed to communicate to RealICE/ICD3:
   a. Make sure only one session is communication with RealICE/ICD3, 
      If RealICE/ICD3 is already loaded in MPLAB this will fail to communicate.
   b. Make sure computable Firmware type loaded on RealICE/ICD3 for the selected Device.
      To do that open MPLAB select the specific Device and Select RealICE/ICD3,
      MPLAB will detect the FW if need it will update the RealICE/ICD3.
      (By Default RealICECMD/ICD3CMD will automatically update Firmware)

II. Programming Failed:
   a. Make sure the Selected Hex file computable with the current device
   b. Check the selected Memory Region it available in the Device 
   c. Check the selected device requires Erase before programming


----------------------------------------------------------------------------
11. Command Line Examples
----------------------------------------------------------------------------

Program:
--------
	Program Entire Device:	
		REALICECMD -P18F67J50 -FC:\DemoCode.Hex -M
		ICD3CMD	   -P18F67J50 -FC:\DemoCode.Hex -M	
	
	Program Entire device with SQTP file loaded	
		REALICECMD -P18F67J50 -Sc:\IdSQTP.NUM -FC:\DemoCode.Hex -M
		ICD3CMD	   -P18F67J50 -Sc:\IdSQTP.NUM -FC:\DemoCode.Hex -M	
			
	Program PROGRAM Memory:	
		REALICECMD -P18F67J50 -FC:\DemoCode.Hex -MP
		ICD3CMD	   -P18F67J50 -FC:\DemoCode.Hex -MP		

	Program CONFIG Memory:	
		REALICECMD -P18F67J50 -FC:\DemoCode.Hex -MC
		ICD3CMD	   -P18F67J50 -FC:\DemoCode.Hex -MC		

	Program EEPROM Memory:	
		REALICECMD -P18F67J50 -FC:\DemoCode.Hex -ME
		ICD3CMD	   -P18F67J50 -FC:\DemoCode.Hex -ME		

	Program USER ID Memory:	
		REALICECMD -P18F67J50 -FC:\DemoCode.Hex -MI
		ICD3CMD	   -P18F67J50 -FC:\DemoCode.Hex -MI		

	Program BOOT Memory:	
		REALICECMD -P18F67J50 -FC:\DemoCode.Hex -MB
		ICD3CMD	   -P18F67J50 -FC:\DemoCode.Hex -MB		

	Program only selected Program Memory Range:
		REALICECMD -P18F67J50 -FC:\DemoCode.Hex -M -N100,2FF	
		ICD3CMD	   -P18F67J50 -FC:\DemoCode.Hex -M -N100,2FF		


Hold in Reset: 
--------------
		REALICECMD -P18F67J50 -H
		ICD3CMD	   -P18F67J50 -H


Release from Reset:
-------------------
		REALICECMD -P18F67J50 -L
		ICD3CMD	   -P18F67J50 -L



Programming Calibration Memory:
-------------------------------
		REALICECMD -P10F206 -FC:\DemoCode.Hex -M -U45
		ICD3CMD	   -P10F206 -FC:\DemoCode.Hex -M -U45		

Read:
-----
	Read Entire Device to File:	
		REALICECMD -P18F67J50 -GFC:\DemoCode.Hex 
		ICD3CMD	   -P18F67J50 -GFC:\DemoCode.Hex 		

	Read PROGRAM Memory:	
		REALICECMD -P18F67J50 -GPFC:\DemoCode.Hex 
		ICD3CMD	   -P18F67J50 -GPFC:\DemoCode.Hex 		

	Read CONFIG Memory:	
		REALICECMD -P18F67J50 -GCFC:\DemoCode.Hex 
		ICD3CMD	   -P18F67J50 -GCFC:\DemoCode.Hex 		

	Read EEPROM Memory:	
		REALICECMD -P18F67J50 -GEFC:\DemoCode.Hex 
		ICD3CMD	   -P18F67J50 -GEFC:\DemoCode.Hex 		

	Read USER ID Memory:	
		REALICECMD -P18F67J50 -GIFC:\DemoCode.Hex 
		ICD3CMD	   -P18F67J50 -GIFC:\DemoCode.Hex 		

	Read BOOT Memory:	
		REALICECMD -P18F67J50 -GBFC:\DemoCode.Hex 
		ICD3CMD	   -P18F67J50 -GBFC:\DemoCode.Hex 		

	Read selected Program Memory Range:
		REALICECMD -P18F67J50 -GPFC:\DemoCode.Hex -N100,2FF	
		ICD3CMD	   -P18F67J50 -GPFC:\DemoCode.Hex -N100,2FF	

Verify:
-------	
	Verify Data from File:
		REALICECMD -P18F67J50 -FC:\DemoCode.Hex -Y
		ICD3CMD	   -P18F67J50 -FC:\DemoCode.Hex -Y	


Erase:
------
	Erase Entire Device:
		REALICECMD -P18F67J50 -E
		ICD3CMD	   -P18F67J50 -E	


Blank Check:
-----------
	Blank Check Entire Device:
		REALICECMD -P18F67J50 -C
		ICD3CMD	   -P18F67J50 -C	

Batch Mode Operation:
---------------------
	Batch Mode can be combined with any operation:
		REALICECMD -P18F67J50 -B -C
		ICD3CMD	   -P18F67J50 -B -C	

Power Target:
-------------
	Power Target from ICD3:
		ICD3CMD	   -P18F67J50 -V3.000 -B -C	


Reprogram :
-----------
        Reprogram with new Hex File:
		REALICECMD -P18F67J50 -RF:\NewCode.hex -GFC:\OLDCode.Hex 
		ICD3CMD    -P18F67J50 -RF:\NewCode.hex -GFC:\OLDCode.Hex 

High Voltage MCLR :
-------------------
	Use High Voltage MCLR:
		REALICECMD -P18F67J50  -I
		ICD3CMD    -P18F67J50  -I

Help:
-----
	Help for All commands
		REALICECMD -?
		ICD3CMD	   -?

	Help for Exit Code	
		REALICECMD -?E
		ICD3CMD	   -?E


		
----------------------------------------------------------------------------
12. Customer Support
----------------------------------------------------------------------------
The Microchip Web Site
----------------------

Microchip provides online support via our web site at www.microchip.com.
This web site is used as a means to make files and information easily
available to customers. Accessible by using your favorite Internet browser,
the web site contains the following information:

* Product Support - Data sheets and errata, application notes and sample
  programs, design resources, user's guides and hardware support documents,
  latest software releases and archived software

* General Technical Support - Frequently Asked Questions (FAQs), technical
  support requests, online discussion groups, Microchip consultant program
  member listing

* Business of Microchip - Product selector and ordering guides, latest
  Microchip press releases, listing of seminars and events, listings of
  Microchip sales offices, distributors and factory representatives

myMICROCHIP Personalized Notification Service
---------------------------------------------

Microchip's personal notification service helps keep customers current on
their Microchip products of interest. Subscribers will receive e-mail 
notification whenever there are changes, updates, revisions or errata related
to a specified product family or development tool.

Please visit http://www.microchip.com/pcn to begin the registration process 
and select your preferences to receive personalized notifications. A FAQ and registration details are available on the page, which can be opened by 
selecting the link above.

When you are selecting your preferences, choosing “Development Systems” will populate the list with available development tools. The main categories of 
tools are listed below:

Compilers – These include all MPLAB C compilers; all MPLAB assemblers 
(including MPASM™ assembler); all MPLAB linkers (including MPLINK™ object 
linker); and all MPLAB librarians (including MPLIB™ object librarian), 
as well as HI-TECH C compilers.

Emulators – These include the MPLAB REAL ICE™ and MPLAB ICE 2000 in-circuit emulators

In-Circuit Debuggers – These include the MPLAB ICD 3 in-circuit debugger, 
MPLAB ICD 2 in-circuit debugger, PICkit™ 3 debug express and PICkit 2 debug express.

MPLAB IDE – This includes MPLAB IDE, the Windows® Integrated Development Environment for development systems tools, MPLAB IDE Project Manager, 
MPLAB Editor and MPLAB SIM simulator, as well as general editing and 
debugging features.

Programmers –These include the MPLAB PM3 and PRO MATE II device programmers
and the PICSTART® Plus and PICkit 1, 2 and 3 development programmers.

Starter/Demo Boards – These include MPLAB Starter Kit boards,
PICDEM demo boards, and various other evaluation boards.

Additional Support
------------------

Users of Microchip products can receive assistance through several
channels:

* Distributor or Representative
* Local Sales Office
* Field Application Engineer (FAE)
* Technical Support

Customers should contact their distributor, representative or field
application engineer (FAE) for support. Local sales offices are also
available to help customers. A listing of sales offices and locations
is available on our website.

Technical support is available through the web site at:
http://support.microchip.com

