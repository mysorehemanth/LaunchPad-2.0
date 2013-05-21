
{*=============================================================================
 |        Project:  DigifleX Production Programmer Launch Pad
 |
 |         Author:  Robert Yi JIANG
 |       Language:  Delphi 7
 |     To Compile:  In Delphi 7 develop environment with LMD Tools
 |     Creat Date:  16 DEC 2010
 |  Last modified:  17 JAN 2012  <<============After modifing, update this date.
 |
 |        Version:  2.2.0
 |
 +-----------------------------------------------------------------------------
 |
 |  Description:  A launch pad for different module programming applications.This
 |                launch pad can helps operator to find out correct programming
 |                application. Then, this application can inserts serial number
 |                into Hex file or Mot file. After programming, it will loops back
 |                to be ready to program another same module or abort by user.
 |
 |        Input:  User selection on GUI
 |                Serial Number on bar-code sticker
 |                Configuration ini file for initialization
 |
 |       Output:  Modified Hex or MOT file with Serial Number or Not
 |                External executable file calling (Programmers)
 |
 |     Features:  I. Before programming, operator has to go through a takeoff
 |                configuration checklist to make sure the Programmer, Firmware
 |                and PCB are perfect match. Operator should follow the process
 |                procedure as following.
 |
 |                 Step 1: Select product type.
 |                        (Panel, Input, Output, Keypad, Power Supply, Others)
 |                 Step 2: Select LAN type.
 |                        (OLD LAN or RS485)
 |                 Step 3: Tick the drop down list or scroll list to pick product
 |                        Number.
 |                 Step 4: Compare the PCB in hand with the Picture on the form.
 |                 Step 5: Connect necessary connection on module, then, scan
 |                        bar-code to start programming.
 |                 Step 6: disconnect module, then, repeat Step 5 until finish job.
 |
 |                II. Administrator can adds and modify modules to LaunchPad by 
 |                menually change ini file or by Setting GUI Dialog. The ini file
 |                name is similar with exe file name.
 |
 |Features Not Included: 1.This application does not stop wrong firmware programing
 |                         into wrong module with same MCU.
 |                       2.This application does not connect any Database to store
 |                         product's programming results.
 |                       3.This application does not synchronize ini file and new 
 |                         version application with server automatically.
 |
 |   Known Bugs:  There are no known bugs remaining in this program.
 |
 *============================================================================}

 

 {**********************************************************
 ==============Naming Rule of LMDTextButton============

  The LMDTextButtonXXXX got numbers to indicate witch
  sort module the TextButton belone.
  LMDTextButtonXXXX
               ||||
               ||||___
               |||____|-Text Button number in TabSheel
               ||------ Sort of Module
               |--------LAN type of Mudule
  LAN type: 1: RS485_LAN
            2: OLD_LAN

  Sort tab: 1: Input
            2: Output
            3: Keypad
            4: PowerSuppler
            5: Panel
            6: Door Controller
            7: Expander
            8: Others

        Example: LMDTextButton2304
                              ||||
                              ||||___
                              |||____|-4th Button
                              ||-------PowerSuppler Tab
                              |--------OLD_Lan Tab
************************************************************}

unit LaunchPad_frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, LMDCustomComponent, LMDShBase, LMDStarter, ImgList,
  LMDCustomImageList, LMDBitmapList, StdCtrls, LMDCustomButton,
  LMDTextButton, LMDBaseControl, LMDBaseGraphicControl, LMDGraphicControl,
  LMDBaseImage, LMDCustomLImage, LMDLImage, LMDButton, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDCustomSheetControl,ProductCheck,
  LMDPageControl, LMDControl, LMDCustomControl, LMDCustomPanel, ProgramWizard,inifiles,
  LMDContainerComponent, LMDBaseDialog, LMDInputDlg, LMDCustomCheckListDlg,StrUtils,
  LMDCheckListDlg, LMDBaseLabel, LMDCustomLabel, LMDLabel, ExtCtrls, DevLogin, Customize,ShellAPI;

type
  TProduct = record
      ListBoxItemIndex: integer;
      SectionID: String;
      ProductName: String;
      Firmware: String;
      Programmer: Integer;
      Script: String;
      Picture: String;
end;

type
  TUserAccount = record
             AccountName: String;
             KeyHash: String;
             TimeStamp: String;
             Status: Integer;
end;

type
  TfrmMain = class(TForm)
    exeOne: TLMDStarter;
    PageControl1: TLMDPageControl;
    RS485_LAN: TLMDTabSheet;
    OLD_LAN: TLMDTabSheet;
    PageControl2: TLMDPageControl;
    TabSheet21: TLMDTabSheet;
    TabSheet22: TLMDTabSheet;
    TabSheet23: TLMDTabSheet;
    TabSheet24: TLMDTabSheet;
    Button2109: TLMDTextButton;
    Button2111: TLMDTextButton;
    Button2113: TLMDTextButton;
    Button2115: TLMDTextButton;
    Button2117: TLMDTextButton;
    Button2119: TLMDTextButton;
    Button2104: TLMDTextButton;
    Button2106: TLMDTextButton;
    Button2108: TLMDTextButton;
    Button2102: TLMDTextButton;
    TabSheet25: TLMDTabSheet;
    Button2110: TLMDTextButton;
    Button2112: TLMDTextButton;
    Button2114: TLMDTextButton;
    Button2116: TLMDTextButton;
    Button2118: TLMDTextButton;
    Button2120: TLMDTextButton;
    TabSheet26: TLMDTabSheet;
    TabSheet27: TLMDTabSheet;
    TabSheet28: TLMDTabSheet;
    Button2201: TLMDTextButton;
    Button2202: TLMDTextButton;
    Button2204: TLMDTextButton;
    Button2206: TLMDTextButton;
    Button2208: TLMDTextButton;
    Button2210: TLMDTextButton;
    Button2212: TLMDTextButton;
    Button2214: TLMDTextButton;
    Button2216: TLMDTextButton;
    Button2218: TLMDTextButton;
    Button2220: TLMDTextButton;
    Button2219: TLMDTextButton;
    Button2217: TLMDTextButton;
    Button2215: TLMDTextButton;
    Button2213: TLMDTextButton;
    Button2211: TLMDTextButton;
    Button2209: TLMDTextButton;
    Button2207: TLMDTextButton;
    Button2205: TLMDTextButton;
    Button2203: TLMDTextButton;
    Button2301: TLMDTextButton;
    Button2302: TLMDTextButton;
    Button2304: TLMDTextButton;
    Button2306: TLMDTextButton;
    Button2308: TLMDTextButton;
    Button2310: TLMDTextButton;
    Button2312: TLMDTextButton;
    Button2314: TLMDTextButton;
    Button2316: TLMDTextButton;
    Button2318: TLMDTextButton;
    Button2320: TLMDTextButton;
    Button2319: TLMDTextButton;
    Button2317: TLMDTextButton;
    Button2315: TLMDTextButton;
    Button2313: TLMDTextButton;
    Button2311: TLMDTextButton;
    Button2309: TLMDTextButton;
    Button2307: TLMDTextButton;
    Button2305: TLMDTextButton;
    Button2303: TLMDTextButton;
    Button2401: TLMDTextButton;
    Button2402: TLMDTextButton;
    Button2404: TLMDTextButton;
    Button2406: TLMDTextButton;
    Button2408: TLMDTextButton;
    Button2410: TLMDTextButton;
    Button2412: TLMDTextButton;
    Button2414: TLMDTextButton;
    Button2416: TLMDTextButton;
    Button2418: TLMDTextButton;
    Button2420: TLMDTextButton;
    Button2419: TLMDTextButton;
    Button2417: TLMDTextButton;
    Button2415: TLMDTextButton;
    Button2413: TLMDTextButton;
    Button2411: TLMDTextButton;
    Button2409: TLMDTextButton;
    Button2407: TLMDTextButton;
    Button2405: TLMDTextButton;
    Button2403: TLMDTextButton;
    Button2501: TLMDTextButton;
    Button2502: TLMDTextButton;
    Button2504: TLMDTextButton;
    Button2506: TLMDTextButton;
    Button2508: TLMDTextButton;
    Button2510: TLMDTextButton;
    Button2512: TLMDTextButton;
    Button2514: TLMDTextButton;
    Button2516: TLMDTextButton;
    Button2518: TLMDTextButton;
    Button2520: TLMDTextButton;
    Button2519: TLMDTextButton;
    Button2517: TLMDTextButton;
    Button2515: TLMDTextButton;
    Button2513: TLMDTextButton;
    Button2511: TLMDTextButton;
    Button2509: TLMDTextButton;
    Button2507: TLMDTextButton;
    Button2505: TLMDTextButton;
    Button2503: TLMDTextButton;
    Button2601: TLMDTextButton;
    Button2602: TLMDTextButton;
    Button2604: TLMDTextButton;
    Button2606: TLMDTextButton;
    Button2608: TLMDTextButton;
    Button2610: TLMDTextButton;
    Button2612: TLMDTextButton;
    Button2614: TLMDTextButton;
    Button2616: TLMDTextButton;
    Button2618: TLMDTextButton;
    Button2620: TLMDTextButton;
    Button2619: TLMDTextButton;
    Button2617: TLMDTextButton;
    Button2615: TLMDTextButton;
    Button2613: TLMDTextButton;
    Button2611: TLMDTextButton;
    Button2609: TLMDTextButton;
    Button2607: TLMDTextButton;
    Button2605: TLMDTextButton;
    Button2603: TLMDTextButton;
    Button2701: TLMDTextButton;
    Button2702: TLMDTextButton;
    Button2704: TLMDTextButton;
    Button2706: TLMDTextButton;
    Button2708: TLMDTextButton;
    Button2710: TLMDTextButton;
    Button2712: TLMDTextButton;
    Button2714: TLMDTextButton;
    Button2716: TLMDTextButton;
    Button2718: TLMDTextButton;
    Button2720: TLMDTextButton;
    Button2719: TLMDTextButton;
    Button2717: TLMDTextButton;
    Button2715: TLMDTextButton;
    Button2713: TLMDTextButton;
    Button2711: TLMDTextButton;
    Button2709: TLMDTextButton;
    Button2707: TLMDTextButton;
    Button2705: TLMDTextButton;
    Button2703: TLMDTextButton;
    Button2801: TLMDTextButton;
    Button2802: TLMDTextButton;
    Button2804: TLMDTextButton;
    Button2806: TLMDTextButton;
    Button2808: TLMDTextButton;
    Button2810: TLMDTextButton;
    Button2812: TLMDTextButton;
    Button2814: TLMDTextButton;
    Button2816: TLMDTextButton;
    Button2818: TLMDTextButton;
    Button2820: TLMDTextButton;
    Button2819: TLMDTextButton;
    Button2817: TLMDTextButton;
    Button2815: TLMDTextButton;
    Button2813: TLMDTextButton;
    Button2811: TLMDTextButton;
    Button2809: TLMDTextButton;
    Button2807: TLMDTextButton;
    Button2805: TLMDTextButton;
    Button2803: TLMDTextButton;
    TabSheet11: TLMDTabSheet;
    Button1101: TLMDTextButton;
    Button1102: TLMDTextButton;
    Button1103: TLMDTextButton;
    Button1104: TLMDTextButton;
    Button1105: TLMDTextButton;
    Button1106: TLMDTextButton;
    Button1107: TLMDTextButton;
    Button1108: TLMDTextButton;
    Button1109: TLMDTextButton;
    Button1110: TLMDTextButton;
    Button1111: TLMDTextButton;
    Button1112: TLMDTextButton;
    Button1118: TLMDTextButton;
    Button1117: TLMDTextButton;
    Button1116: TLMDTextButton;
    Button1115: TLMDTextButton;
    Button1114: TLMDTextButton;
    Button1113: TLMDTextButton;
    Button1119: TLMDTextButton;
    Button1120: TLMDTextButton;
    TabSheet12: TLMDTabSheet;
    Button1201: TLMDTextButton;
    Button1211: TLMDTextButton;
    Button1212: TLMDTextButton;
    Button1202: TLMDTextButton;
    Button1203: TLMDTextButton;
    Button1213: TLMDTextButton;
    Button1214: TLMDTextButton;
    Button1204: TLMDTextButton;
    TabSheet13: TLMDTabSheet;
    Button1301: TLMDTextButton;
    Button1302: TLMDTextButton;
    Button1304: TLMDTextButton;
    Button1306: TLMDTextButton;
    Button1308: TLMDTextButton;
    Button1310: TLMDTextButton;
    Button1312: TLMDTextButton;
    Button1314: TLMDTextButton;
    Button1316: TLMDTextButton;
    Button1318: TLMDTextButton;
    Button1320: TLMDTextButton;
    Button1319: TLMDTextButton;
    Button1317: TLMDTextButton;
    Button1315: TLMDTextButton;
    Button1313: TLMDTextButton;
    Button1311: TLMDTextButton;
    Button1309: TLMDTextButton;
    Button1307: TLMDTextButton;
    Button1305: TLMDTextButton;
    Button1303: TLMDTextButton;
    TabSheet14: TLMDTabSheet;
    Button1401: TLMDTextButton;
    Button1402: TLMDTextButton;
    Button1404: TLMDTextButton;
    Button1406: TLMDTextButton;
    Button1408: TLMDTextButton;
    Button1410: TLMDTextButton;
    Button1412: TLMDTextButton;
    Button1414: TLMDTextButton;
    Button1416: TLMDTextButton;
    Button1418: TLMDTextButton;
    Button1420: TLMDTextButton;
    Button1419: TLMDTextButton;
    Button1417: TLMDTextButton;
    Button1415: TLMDTextButton;
    Button1413: TLMDTextButton;
    Button1411: TLMDTextButton;
    Button1409: TLMDTextButton;
    Button1407: TLMDTextButton;
    Button1405: TLMDTextButton;
    Button1403: TLMDTextButton;
    TabSheet15: TLMDTabSheet;
    Button1501: TLMDTextButton;
    Button1502: TLMDTextButton;
    Button1504: TLMDTextButton;
    Button1506: TLMDTextButton;
    Button1508: TLMDTextButton;
    Button1510: TLMDTextButton;
    Button1512: TLMDTextButton;
    Button1514: TLMDTextButton;
    Button1516: TLMDTextButton;
    Button1518: TLMDTextButton;
    Button1520: TLMDTextButton;
    Button1519: TLMDTextButton;
    Button1517: TLMDTextButton;
    Button1515: TLMDTextButton;
    Button1513: TLMDTextButton;
    Button1511: TLMDTextButton;
    Button1509: TLMDTextButton;
    Button1507: TLMDTextButton;
    Button1505: TLMDTextButton;
    Button1503: TLMDTextButton;
    TabSheet16: TLMDTabSheet;
    Button1601: TLMDTextButton;
    Button1602: TLMDTextButton;
    Button1604: TLMDTextButton;
    Button1606: TLMDTextButton;
    Button1608: TLMDTextButton;
    Button1610: TLMDTextButton;
    Button1612: TLMDTextButton;
    Button1614: TLMDTextButton;
    Button1616: TLMDTextButton;
    Button1618: TLMDTextButton;
    Button1620: TLMDTextButton;
    Button1619: TLMDTextButton;
    Button1617: TLMDTextButton;
    Button1615: TLMDTextButton;
    Button1613: TLMDTextButton;
    Button1611: TLMDTextButton;
    Button1609: TLMDTextButton;
    Button1607: TLMDTextButton;
    Button1605: TLMDTextButton;
    Button1603: TLMDTextButton;
    TabSheet17: TLMDTabSheet;
    Button1701: TLMDTextButton;
    Button1702: TLMDTextButton;
    Button1704: TLMDTextButton;
    Button1706: TLMDTextButton;
    Button1708: TLMDTextButton;
    Button1710: TLMDTextButton;
    Button1712: TLMDTextButton;
    Button1714: TLMDTextButton;
    Button1716: TLMDTextButton;
    Button1718: TLMDTextButton;
    Button1720: TLMDTextButton;
    Button1719: TLMDTextButton;
    Button1717: TLMDTextButton;
    Button1715: TLMDTextButton;
    Button1713: TLMDTextButton;
    Button1711: TLMDTextButton;
    Button1709: TLMDTextButton;
    Button1707: TLMDTextButton;
    Button1705: TLMDTextButton;
    Button1703: TLMDTextButton;
    TabSheet18: TLMDTabSheet;
    Button1801: TLMDTextButton;
    Button1802: TLMDTextButton;
    Button1804: TLMDTextButton;
    Button1806: TLMDTextButton;
    Button1808: TLMDTextButton;
    Button1810: TLMDTextButton;
    Button1812: TLMDTextButton;
    Button1814: TLMDTextButton;
    Button1816: TLMDTextButton;
    Button1818: TLMDTextButton;
    Button1820: TLMDTextButton;
    Button1819: TLMDTextButton;
    Button1817: TLMDTextButton;
    Button1815: TLMDTextButton;
    Button1813: TLMDTextButton;
    Button1811: TLMDTextButton;
    Button1809: TLMDTextButton;
    Button1807: TLMDTextButton;
    Button1805: TLMDTextButton;
    Button1803: TLMDTextButton;
    Button1218: TLMDTextButton;
    Button1208: TLMDTextButton;
    Button1207: TLMDTextButton;
    Button1206: TLMDTextButton;
    Button1205: TLMDTextButton;
    Button1215: TLMDTextButton;
    Button1216: TLMDTextButton;
    Button1217: TLMDTextButton;
    Button1210: TLMDTextButton;
    Button1209: TLMDTextButton;
    Button1219: TLMDTextButton;
    Button1220: TLMDTextButton;
    LMDButton1: TLMDButton;
    MainMenu2: TMainMenu;
    NewModule1: TMenuItem;
    Exit: TMenuItem;
    MenuItem1: TMenuItem;
    ViewHelp1: TMenuItem;
    AboutINIEditor1: TMenuItem;
    Model1: TMenuItem;
    Operator1: TMenuItem;
    Developer1: TMenuItem;
    Button2101: TLMDTextButton;
    Button2103: TLMDTextButton;
    Button2105: TLMDTextButton;
    Button2107: TLMDTextButton;
    AddNewModule1: TMenuItem;
    PageControl3: TLMDPageControl;
    ProgramWizard2Button: TLMDButton;
    SearchNameInputDlg: TLMDInputDlg;
    SearchResultList: TLMDCheckListDlg;
    Image1: TImage;
    Customiz1: TMenuItem;
    LogOffDeveloper: TMenuItem;
    
    procedure LMDButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSectionIDClick(Sender: TObject);
    procedure AddNewModule1Click(Sender: TObject);
    procedure Operator1Click(Sender: TObject);
    procedure Developer1Click(Sender: TObject);
    procedure AboutINIEditor1Click(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure ProgramWizard2ButtonClick(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure Customiz1Click(Sender: TObject);
    procedure LogOffDeveloperClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }

    Function  DelTree(DirName: string): Boolean;
    procedure RefreshButtons;
    procedure SearchMatchedModules(PartModuleName: String);

  public
    procedure CheckPassword(HashString: String); { Public declarations }
    function ReadAccountStatus: TUserAccount;
  published                                         
    
  end;

var
  UserAccount: TUserAccount;
  frmMain: TfrmMain;
  FProgWizardForm: TProgWizardForm;
  //iniFileName,rootIniFileName: String;

  LocalIniFileName,RootIniFileName: String;
  SectionID: String;
  IniFile: TInifile;
  ProductList: array of TProduct;
  //UserAccount: TUserAccount;
  HashFile : TextFile;
  HashString: String;
const
     DEFAULT_INI_FILE_NAME = '\LaunchPad2.ini';
     VERSION_NUMBER = '2.0.0';
implementation

{$R *.dfm}


//**********************************************************************
//
//  PROCEDURE:    LMDButton1Click -
//
//
//  PARAMETERS:   -Sender :
//
//**********************************************************************
procedure TfrmMain.LMDButton1Click(Sender: TObject);

begin
frmMain.Visible := False;
FProgWizardForm := TProgWizardForm.Create(nil);
FProgWizardForm.ShowModal;
FProgWizardForm.Release;
frmMain.Visible := True;

end;


//**********************************************************************
//
//  PROCEDURE:    LMDButton1Click -
//
//
//  PARAMETERS:   -Sender :
//
//**********************************************************************
procedure TfrmMain.RefreshButtons;
var

  LanTypeNo,ModuleTypeNo,ModuleTagNo: Integer;
  SectionID,ButtonName,Pad:String;

begin
  IniFile := TIniFile.Create(LocalIniFileName);

  for LanTypeNo:=1 to 2 do
  begin
    for ModuleTypeNo:=1 to 8 do
    begin
      for ModuleTagNo:=1 to 20 do
      begin
           if ModuleTagNo<10 then Pad := '0' else Pad := '' ;             
           SectionID := IntToStr(LanTypeNo)+IntToStr(ModuleTypeNo)+Pad+IntToStr(ModuleTagNo);
           ButtonName := 'Button'+ SectionID;
           (FindComponent(ButtonName) as TLMDTextButton).Caption := IniFile.ReadString(SectionID,'ModuleName','Empty');
           (FindComponent(ButtonName) as TLMDTextButton).Tag := StrToInt(SectionID);
           (FindComponent(ButtonName) as TLMDTextButton).Font.Size := 10;
           if IniFile.ReadInteger(SectionID,'Locker',0)=0 then (FindComponent(ButtonName) as TLMDTextButton).Visible := false
           else (FindComponent(ButtonName) as TLMDTextButton).Visible := true;
           if Pos('est', (FindComponent(ButtonName) as TLMDTextButton).Caption)>0 then
           begin
           (FindComponent(ButtonName) as TLMDTextButton).Font.Color := clRed;
           end;
      end;
    end;
  end;

end;

//**********************************************************************
//
//  PROCEDURE:    FormCreate -
//
//
//  PARAMETERS:   -Sender :
//
//**********************************************************************
procedure TfrmMain.FormCreate(Sender: TObject);
var
  buffer: array[0..255] of char;
  size: dword;
  PcName:String;
  //LocalIniFileName,RootIniFileName: String;
  LocalIniFile,RootIniFile:TInifile;
  localIniAge, serverIniAge: Integer;
  ButtonSelected: Integer;
  IniUpdateTool:String;
  IniUpdateToolPara:String;
  ProductName,Firmware,Picture,Script :String;
  Programmer,locker: Integer;
  LanTypeNo,ModuleTypeNo,ModuleTagNo:Integer;
begin

Left:=(Screen.Width-Width)  div 2;
Top:=(Screen.Height-Height) div 2;
frmMain.Height := 730;
ProgramWizard2Button.Visible := False;
LocalIniFileName := ExtractFilePath(ParamStr(0))+ExtractFileName(ParamStr(0)) ;
Delete(LocalIniFileName,length(LocalIniFileName)-3,4);
LocalIniFileName := LocalIniFileName +'.ini';
SectionID := '1101';
PageControl1.Visible := False;
RefreshButtons;
Operator1.Checked := True;

////////////////////synchronous Ini File  Module with server//////////////////////////
//1.read local ini file to get root of Server ini file
LocalIniFile := TIniFile.Create(LocalIniFileName);
if LocalIniFile.ReadString('DefaultDirs','ExeFileRootDir','Error')<>'' then
begin
  RootIniFileName := ExtractFileName(ParamStr(0));
  Delete(RootIniFileName,length(RootIniFileName)-3,4);
  RootIniFileName := LocalIniFile.ReadString('DefaultDirs','ExeFileRootDir','Error')+ RootIniFileName + '.ini';
  RootIniFile := TIniFile.Create(RootIniFileName);

  //2. Synchronous all module records
  if RootIniFileName<>LocaliniFileName then
  begin
    for LanTypeNo:=1 to 2 do
    begin
      for ModuleTypeNo:=1 to 8 do
      begin
        for ModuleTagNo:=1 to 20 do
        begin
        SectionID := IntToStr(LanTypeNo*1000+ModuleTypeNo*100+ModuleTagNo);
        ProductName := RootIniFile.ReadString(SectionID,'ModuleName','Empty');
        Firmware := RootIniFile.ReadString(SectionID,'FirmwareDir','Empty');
        Programmer := RootIniFile.ReadInteger(SectionID,'Programmer',0);
        Picture := RootIniFile.ReadString(SectionID,'ModulePicDir','Empty');
        Script := RootIniFile.ReadString(SectionID,'ScriptDir','Empty');
        Locker := RootIniFile.ReadInteger(SectionID,'Locker',0);
        LocalIniFile.WriteString(SectionID,'ModuleName',ProductName);
        LocalIniFile.WriteString(SectionID,'FirmwareDir',Firmware);
        LocalIniFile.WriteInteger(SectionID,'Programmer',Programmer);
        LocalIniFile.WriteString(SectionID,'ModulePicDir',Picture);
        LocalIniFile.WriteString(SectionID,'ScriptDir',Script);
        LocalIniFile.WriteInteger(SectionID,'Locker',Locker);
        end;
      end;
    end;
  end;
  LocalIniFile.Free;
  RootIniFile.Free;
end
else RootIniFileName := LocalIniFileName;

//show exe in which driver
size := 256;
if GetComputerName(buffer, size) then PcName :=buffer else PcName :='';
frmMain.Caption := frmMain.Caption +'  ('+ PcName+'\\'+ExtractFileDrive(ParamStr(0))+')';
//FOR PASSWORD
AssignFile(HashFile, 'MD5Hash');
Reset(HashFile);
ReadLn(HashFile, HashString);
CloseFile(HashFile);
UserAccount.KeyHash := HashString;  //<<<--------temp !!!!!!!!
LogOffDeveloper.Visible := false;
end;


//**********************************************************************
//
//  PROCEDURE:    ButtonSectionIDClick -
//
//
//  PARAMETERS:   -Sender :
//
//**********************************************************************
procedure TfrmMain.ButtonSectionIDClick(Sender: TObject);
var
 FProductChecking: TProductChecking;
begin
 With Sender as TLMDTextButton Do
    begin
      SectionID := IntToStr(Tag);
    end;
frmMain.Visible := False;
FProductChecking := TProductChecking.Create(nil);
FproductChecking.LaunchProgrammerButton.Tag := StrToInt(SectionID);
FProductChecking.ShowModal;
FProductChecking.Release;
frmMain.Visible := True;
end;


//**********************************************************************
//
//  PROCEDURE:    AddNewModule1Click -
//
//
//  PARAMETERS:   -Sender :
//
//**********************************************************************
procedure TfrmMain.AddNewModule1Click(Sender: TObject);
var
  IniEditorName,IniEditorDir,InifileDir : String;
begin
     if UserAccount.Status = 0 then
    begin
    Login := TLogin.Create(nil);
    Login.ShowModal;
    CheckPassword(Login.HashString);
    Login.Release;
    end;

    if UserAccount.Status = 1 then begin
     frmMain.Visible := false;
     IniEditorName := 'INI.exe';
     IniEditorDir := ExtractFilePath(ParamStr(0))+'CreatINI\'+IniEditorName;
     InifileDir := '"'+RootIniFileName+'"';

     exeOne.Command := IniEditorDir;
     exeOne.Parameters := InifileDir;
     exeOne.Execute;
     RefreshButtons;
     frmMain.Visible := True;
    end;


end;


//**********************************************************************
//
//  PROCEDURE:    Operator1Click -
//
//
//  PARAMETERS:   -Sender :
//
//**********************************************************************
procedure TfrmMain.Operator1Click(Sender: TObject);
begin
     PageControl1.Visible := False;
     Developer1.Checked := False;
     Image1.Visible := True;
     ProgramWizard2Button.Visible := False;
     frmMain.Height := 730;
end;


//**********************************************************************
//
//  PROCEDURE:    Developer1Click -
//
//
//  PARAMETERS:   -Sender :
//
//**********************************************************************
procedure TfrmMain.Developer1Click(Sender: TObject);
begin
    if UserAccount.Status = 0 then
    begin
    Login := TLogin.Create(nil);
    Login.ShowModal;
    CheckPassword(Login.HashString);
    Login.Release;
    end;

    if UserAccount.Status = 1 then begin
     PageControl1.Visible := True;
     Image1.Visible := False;
     Operator1.Checked := False;
     Image1.Visible := False;
     ProgramWizard2Button.Visible := True;
     frmMain.Height := 810;
    end else
    begin
    Developer1.Checked := False;
    Operator1.Checked := True;
    end;

     
end;

//**********************************************************************
//
//  PROCEDURE:    AboutINIEditor1Click -
//
//
//  PARAMETERS:   -Sender :
//
//**********************************************************************
procedure TfrmMain.AboutINIEditor1Click(Sender: TObject);
begin
ShowMessage('Programmer LaunchPad'+VERSION_NUMBER);
end;

//**********************************************************************
//
//  PROCEDURE:    ExitClick -
//
//
//  PARAMETERS:   -Sender :
//
//**********************************************************************
procedure TfrmMain.ExitClick(Sender: TObject);
begin
frmMain.Close;
application.Destroy;
end;


//**********************************************************************
//
//  PROCEDURE:    ProgramWizard2ButtonClick -
//
//
//  PARAMETERS:   -Sender :
//
//**********************************************************************
procedure TfrmMain.ProgramWizard2ButtonClick(Sender: TObject);
Var
   PartModuleName: String;
   ListValue, i: Integer;
   FProductChecking: TProductChecking;
begin
     PartModuleName := '';
     if SearchNameInputDlg.Execute then
     begin
          PartModuleName := SearchNameInputDlg.Value;
          if PartModuleName <> '' then
          begin
               SearchMatchedModules(PartModuleName);
               if Length(ProductList) >=1 then
               begin
                    SearchResultList.Execute;
                    ListValue := SearchResultList.Value;
                    if ListValue>=0 then
                    begin
                         i := StrToInt(ProductList[ListValue].SectionID);
                         SectionID := ProductList[ListValue].SectionID;
                         FProductChecking := TProductChecking.Create(nil);
                         FproductChecking.LaunchProgrammerButton.Tag := i;
                         FProductChecking.ShowModal;
                         FProductChecking.Release;
                    end;
               end
               else ShowMessage('Cannot Find the Module Name include: '+PartModuleName+'. Please try again use other Name!' );
          end;
     end;
end;

//**********************************************************************
//
//  PROCEDURE:    SearchMatchedModules -
//
//
//  PARAMETERS:   -PartModuleName :
//
//**********************************************************************
procedure TfrmMain.SearchMatchedModules(PartModuleName: String);
var
  LanTypeNo,ModuleTypeNo,ModuleTagNo,Counter: Integer;
  SectionID:String;
  IniFile: TIniFile;
begin
  SearchResultList.Items.Clear;
     
  IniFile := TIniFile.Create(LocalIniFileName);
  Counter :=0;
  for LanTypeNo:=1 to 2 do
  begin
     for ModuleTypeNo:=1 to 8 do
     begin
        for ModuleTagNo:=1 to 20 do
           begin
           SectionID := IntToStr(LanTypeNo*1000+ModuleTypeNo*100+ModuleTagNo);
           if pos(LowerCase(PartModuleName),LowerCase(IniFile.ReadString(SectionID,'ModuleName','')))<>0 then Counter := Counter +1;

           end;
         end;
    end;

  SetLength(ProductList, Counter);
  Counter :=0;

  for LanTypeNo:=1 to 2 do
  begin
    for ModuleTypeNo:=1 to 8 do
    begin
      for ModuleTagNo:=1 to 20 do
           begin
             SectionID := IntToStr(LanTypeNo*1000+ModuleTypeNo*100+ModuleTagNo);
             if pos(LowerCase(PartModuleName),LowerCase(IniFile.ReadString(SectionID,'ModuleName','')))<>0 then
             begin
             ProductList[Counter].SectionID := SectionID;
             ProductList[Counter].ListBoxItemIndex := Counter;
             ProductList[Counter].ProductName := IniFile.ReadString(SectionID,'ModuleName','Empty');
             ProductList[Counter].Firmware := IniFile.ReadString(SectionID,'FirmwareDir','Empty');
             ProductList[Counter].Programmer := IniFile.ReadInteger(SectionID,'Programmer',0);
             ProductList[Counter].Picture := IniFile.ReadString(SectionID,'ModulePicDir','Empty');
             ProductList[Counter].Script := IniFile.ReadString(SectionID,'ScriptDir','Empty');
             SearchResultList.Items.Add(ProductList[Counter].ProductName);
             Counter := Counter +1;
             end;
           end;
    end;
  end;

end;

 
procedure TfrmMain.PageControl3Change(Sender: TObject);
var
   ModuleTypeName: String;
begin
     ModuleTypeName := PageControl3.ActivePage.Name;
     ModuleTypeName := StuffString(ModuleTypeName,9,1,'2');
     PageControl2.ActivePageByName(ModuleTypeName);
end;

procedure TfrmMain.PageControl2Change(Sender: TObject);
var
   ModuleTypeName: String;
begin
     ModuleTypeName := PageControl2.ActivePage.Name;
     ModuleTypeName := StuffString(ModuleTypeName,9,1,'1');
     PageControl3.ActivePageByName(ModuleTypeName);

end;

procedure TfrmMain.Customiz1Click(Sender: TObject);
begin
    if UserAccount.Status <> 1 then
    begin
    Login := TLogin.Create(nil);
    Login.ShowModal;
    CheckPassword(Login.HashString);
    Login.Release;
    end;

    if UserAccount.Status = 1 then begin
    CustomizeForm := TCustomizeForm.Create(nil);
    CustomizeForm.ShowModal;
    CustomizeForm.Close;
    CustomizeForm.Release;
    end;

    //FOR PASSWORD
    AssignFile(HashFile, 'MD5Hash');
    Reset(HashFile);
    ReadLn(HashFile, HashString);
    CloseFile(HashFile);
    UserAccount.KeyHash := HashString;  //<<<--------temp !!!!!!!!

end;

procedure TfrmMain.CheckPassword(HashString: String);
begin
    if UserAccount.KeyHash = HashString then
    begin
    UserAccount.Status := 1;
    LogOffDeveloper.Visible := true;
    end
    else if HashString = 'Cancelled' then 
    else
    begin
    UserAccount.Status := 0;
    ShowMessage('Wrong Password!!!');
    end;
end;

function TfrmMain.ReadAccountStatus: TUserAccount;
begin
     Result:= UserAccount;
end;

procedure TfrmMain.LogOffDeveloperClick(Sender: TObject);
begin
     UserAccount.Status := 0;
     LogOffDeveloper.Visible := false;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     {
     if DelTree('c:\Temp') then         //Careful!!! Do not touch this Directory!!!!
        ShowMessage('Temp File Directory deleted!')
     else
     ShowMessage('Temp File Directory delete FAILED!') ;
     }
end;

Function TfrmMain.DelTree(DirName : string): Boolean;
 var
   SHFileOpStruct : TSHFileOpStruct;
   DirBuf : array [0..255] of char;
 begin
   try
    Fillchar(SHFileOpStruct,Sizeof(SHFileOpStruct),0) ;
    FillChar(DirBuf, Sizeof(DirBuf), 0 ) ;
    StrPCopy(DirBuf, DirName) ;
    with SHFileOpStruct do begin
     Wnd := 0;
     pFrom := @DirBuf;
     wFunc := FO_DELETE;
     fFlags := FOF_ALLOWUNDO;
     fFlags := fFlags or FOF_NOCONFIRMATION;
     fFlags := fFlags or FOF_SILENT;
    end; 
     Result := (SHFileOperation(SHFileOpStruct) = 0) ;
    except
     Result := False;
   end;
 end;

end.


