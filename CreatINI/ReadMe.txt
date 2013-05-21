;---------------------------LaunchPad 2.0 ini file-------------------------------
;This ini file works with LaunchPad Version 2.0.0 or later. 
;

[Programer]
NEC = '' 
RENESAS = ''
LabVIEW = ''
PK3 = ''


;The Module Section contains 200 pre-builded Module properties. Because of the space of GUI
;and this software's life cycle, we don't intend to make a dynamic Module list in this ini file.
;
;The rule of those codes in this ini file is similar with Naming Rule of LMDTextButton in LaunchPad_frmMain.
;
;
;    [XXXX]            	
;     ||||
;     ||||___
;     |||____|-Text Button number in TabSheel (1..20)
;     ||------ Sort of Module (Input,Output,PowerSuppler,Keypad,Other)(1..5)
;     |--------LAN type of Mudule (RS485 LAN or OLD LAN)(1..2) 
; 