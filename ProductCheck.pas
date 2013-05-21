{*=============================================================================
 |        Project:  DigifleX Production Programmer Launch Pad
 |
 |         Author:  Robert Yi JIANG
 |       Language:  Delphi 7
 |     To Compile:  In Delphi 7 develop environment with LMD Tools
 |     Creat Date:  18 DEC 2010
 |  Last modified:  31 Mar 2011  <<============After modifing, update this date.
 |
 |        Version:  2.2.0
 |
 +-----------------------------------------------------------------------------
 |
 |  Description:  Display a module's details in the form. Operator will use this
 |                form to confirm what module or panel will be programmed.
 |
 |        Input:  Module Section ID which is intend to be programmed.
 |                User Action on form.
 |
 |       Output:  External executable file calling (Programmers)
 |
 |     Features:  This ProductCheck Form can display Product Name, Programmer Type
 |                and Product Photo. It can launch external executable application
 |
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

unit ProductCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomButton, LMDButton, ExtCtrls, LMDBaseControl,
  LMDBaseGraphicControl, LMDGraphicControl, LMDHTMLLabel,ModuleObject,
  LMDCustomComponent, LMDShBase, inifiles,LMDStarter,StrUtils, SerialNumberScan;

type
  TProductChecking = class(TForm)
    LMDHTMLLabel16: TLMDHTMLLabel;
    Image1: TImage;
    LaunchProgrammerButton: TLMDButton;
    ProductNameLabel: TLabel;
    LMDHTMLLabel1: TLMDHTMLLabel;
    ProgramTypeLabel: TLabel;
    LMDHTMLLabel2: TLMDHTMLLabel;
    exeLauncher: TLMDStarter;
    Label1: TLabel;
    Label2: TLabel;
    FirmwareNameLabel: TLabel;
    LMDHTMLLabel5: TLMDHTMLLabel;
    Timer1: TTimer;
    Label3: TLabel;
    Label4: TLabel;
    EraseButton: TLMDButton;
    OpenButton: TLMDButton;
    LMDHTMLLabel3: TLMDHTMLLabel;
    BetaCautionLabel: TLabel;
    CautionFlashTimer: TTimer;
    EraseResultLabel: TLabel;
    Label5: TLabel;
    OpenDialog: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure LaunchProgrammerButtonClick(Sender: TObject);
    procedure ProgramTypeLabelMouseEnter(Sender: TObject);
    procedure ProgramTypeLabelMouseLeave(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    function  IsFirmwareBeta(ModuleFirewareName: String):Boolean;
    procedure CautionFlashTimerTimer(Sender: TObject);
    procedure EraseButtonClick(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    

  private
    { Private declarations }
    //procedure ModifyScript(ScriptDir,FirmwareDir:String);
    procedure PreparNECsIniFile(ScriptDir,FirmwareDir:String);          overload;
    procedure PreparNECsIniFile(ScriptDir:String);                      Overload;
    procedure PrepareRenesasIniFile(ScriptDir: String);                 Overload;
    procedure PrepareRenesasIniFile(ScriptDir, FirmwareDir: String);    Overload;
    procedure JudgeAndAdjust();
    procedure CaptionRotateLeft();
    procedure CaptionShiftLeftRight();
    function  CreatTempMot(FirmwareDir:String):String;
    function  CreatDOMMot(ScriptDir,FirmwareDir:String):String;
    function  Creat_DOM_SN_HEX(ScriptDir,FirmwareDir:String):String;
    function  ICD3RunDos(DosApp:String;PassKeyWords,FailKeyWords:String): integer;
  public
    { Public declarations }
  end;

var
  ProductChecking: TProductChecking;
  Module: TModule;
  SectionID: String;
  iniFileName, TempPictureDir: String;
  TempProgrammerTag: integer;
  wIcon, wButton:integer;
  TheCaption,ExpandString: String;
  SpaceNum,RIndex,InsertSpaceNum: Integer;
  IsRotate,IsRightShift: Boolean;
  FlashCount: integer;
  BetaCautionFlash: Boolean;
const
  NO_PIC = '\NoPic.bmp';
  TEMP_SCRIPT = 'Renesas Programmer\FOUSB\Scripts\temp_script.script';
  ERASE_SCRIPT = 'Renesas Programmer\erase.script';
  UNLOCK_SCRIPT = 'Renesas Programmer\UNLOCK.script';
  TEMP_BAT = 'NEC Programmer\temp_bat.bat';
  NEC_INI = 'NEC Programmer\NEC Electronics Tools\QBP\V2.10\bin\qbp.ini' ;
  ERASE_INI ='NEC Programmer\NEC Electronics Tools\QBP\V2.10\bin\erase.ini';
  NEC_INI_DIR = 'NEC Programmer\NEC Electronics Tools\QBP\V2.10\bin\';

  DIGIFLEX_FLASH_PROGRAMMER = 1;
  NEC_PROGRAMMER            = 2;
  ICD3_PROGRAMMER           = 3;
  RENESAS_PROGRAMMER        = 4;
  RENESAS_PROGRAMMER_DOM    = 5;

  DIGIFLEX                  = 1;
  NEC                       = 2;
  ICD3                      = 3;
  RENESAS                   = 4;
  RENESAS_DOM               = 5;

  SERVER_FIRMWARE_DIR = 'S:\Digiflex\Production\Firmware_2';

  TEMP_MOT_R='Renesas Programmer\temp.mot';
  TEMP_HEX_R='NEC Programmer\Temp.Hex';
implementation

uses LaunchPad_frmMain, ProgramWizard;

{$R *.dfm}
var
FModule :TModule;


procedure TProductChecking.FormCreate(Sender: TObject);
var
ProgrammerType,FirmwareFileName: String;
j,i:Integer;
begin
     
     EraseResultLabel.Visible := False;
     Left:=(Screen.Width-Width)  div 2;
     Top:=(Screen.Height-Height) div 2;
     LaunchProgrammerButton.Tag := StrToInt(LaunchPad_frmMain.SectionID);
     EraseButton.Tag := StrToInt(LaunchPad_frmMain.SectionID);
     SectionID := IntToStr(LaunchProgrammerButton.Tag);

     FModule := TModule.Create;
     FModule.ReadINI(IniFile,SectionID);
     ProductNameLabel.Caption := FModule.ModuleName;
     FirmwareFileName := FModule.FirmwareDir;
      j :=LastDelimiter('\', FirmwareFileName);
      ProductChecking.Caption := ProductChecking.Caption
                                +'  '
                                +Copy(FirmwareFileName, 1, j);
      Delete(FirmwareFileName, 1, j);
      FirmwareNameLabel.Caption := FirmwareFileName;
     case FModule.Programmer of
       DIGIFLEX_FLASH_PROGRAMMER: ProgrammerType := 'DigifleX Flash Programmer (A-TYPE)';
       NEC_PROGRAMMER:            ProgrammerType := 'NEC Programmer (C-TYPE)';
       ICD3_PROGRAMMER:           ProgrammerType := 'ICD3 Programmer (D-TYPE)';
       RENESAS_PROGRAMMER:        ProgrammerType := 'Renasas Programmer (B-TYPE)';
       RENESAS_PROGRAMMER_DOM:    ProgrammerType:= 'Renasas Programmer (B-TYPE) with DOM';
     end;
     TempProgrammerTag :=  FModule.Programmer;
     ProgramTypeLabel.Caption := ProgrammerType;
     TempPictureDir := ExtractFileDir(ParamStr(0))+NO_PIC;//this line is simple Dir stack for switch two picturs.
     if (FModule.PicDir <>  '')and(FileExists(FModule.PicDir) = True) then
     begin
     Image1.Picture.LoadFromFile(FModule.PicDir );
     TempPictureDir := FModule.PicDir;
     end
     else image1.Picture.LoadFromFile(ExtractFileDir(ParamStr(0))+NO_PIC);

      TheCaption:=self.Caption + ': '+FModule.ModuleName;
      //take serial number out
      i := LastDelimiter('_', FModule.FirmwareDir);
      BetaCautionLabel.Caption := Copy(FModule.FirmwareDir,i-4,7);

  IsRotate:=False;
  IsRightShift:=False;
  wIcon:=GetSystemMetrics(SM_CXSIZE);
  wButton:=GetSystemMetrics(SM_CXSIZE);
  Timer1.Enabled:=True;

  RIndex:=0;
  JudgeAndAdjust;

  BetaCautionFlash :=IsFirmwareBeta(FModule.FirmwareDir);
  BetaCautionLabel.Visible := BetaCautionFlash;

  

end;



//**********************************************************************
//
//  PROCEDURE:    LaunchProgrammerButtonClick - When LaunchProgrammerButton
//                be clicked, this procedure will make decision that use
//                which programmer and how to use it.
//
//
//
//
//  PARAMETERS:   -TObject : This procedure will read the button's tag to
//                           recognize Products
//
//**********************************************************************
procedure TProductChecking.LaunchProgrammerButtonClick(Sender: TObject);
var
SectionID,TempMotR,TempHexR: String;
ParameterString,CommandString: String;
begin
     EraseResultLabel.Visible := False;
     With Sender as TLMDButton Do SectionID := IntToStr( Tag );

     iniFileName := ExtractFilePath(ParamStr(0))+ExtractFileName(ParamStr(0)) ;
     Delete(iniFileName,length(iniFileName)-3,4);
     iniFileName := iniFileName +'.ini';
     Module := TModule.Create(IniFileName,SectionID);
     IniFile := TIniFile.Create(IniFileName);
     
     Case Module.Programmer of

     /////////DIGIFLEX Parameter//////////
     // Parameter 1: CMD line parameter //
     /////////////////////////////////////
     DIGIFLEX:
     begin
     ParameterString := ' -actions=F|P|V -baudrate=57600 ';
     ParameterString := ParameterString + IniFile.ReadString('SerialPort','PortNumber',' -com1 ');
     ParameterString := ParameterString + '"' + FModule.FirmwareDir + '"';
     CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','DIGIFLEX_FLASH',' ');
     exeLauncher.Command := CommandString;
     exeLauncher.Parameters := ParameterString;
     exeLauncher.Execute;
     end;
     
     /////////////NEC Parameter///////////
     // Parameter 1: Module.FirmwareDir //
     // Parameter 2: Module.ModuleName  //
     // Parameter 3: .bat file dirctory //
     /////////////////////////////////////
     NEC:
     begin

          if Module.LanType = '1' then     //WIth Serial Number writing
          begin
               {PreparNECsIniFile(Module.ScriptDir);
               ParameterString := '"' + FModule.FirmwareDir + '" ';
               ParameterString := ParameterString + '"' + Module.ModuleName + '" ';
               ParameterString := ParameterString + '"' + ExtractFilePath(ParamStr(0))+TEMP_BAT + '" /s';
               CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','NEC_SN',' ');
               }

               TempHexR:=Creat_DOM_SN_HEX(Module.ScriptDir,Module.FirmwareDir);
               PreparNECsIniFile(Module.ScriptDir,TempHexR);
               CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','NEC',' ');
               exeLauncher.Command := CommandString;
               exeLauncher.Parameters := ParameterString;
               exeLauncher.Execute;
          end
          else                        //Without Serial Number Writing
          begin
               PreparNECsIniFile(Module.ScriptDir,FModule.FirmwareDir);
               CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','NEC',' ');
               exeLauncher.Command := CommandString;
               exeLauncher.Execute;
          end;
     end;

     ///////////ICD3 Parameter////////////
     // Parameter 1: Module.FirmwareDir //
     // Parameter 2: Module.ModuleName  //
     // Parameter 3: Module.Script      //
     /////////////////////////////////////
     ICD3:
     begin
     ParameterString := '"' + FModule.FirmwareDir + '" ';
     ParameterString := ParameterString + '"' + Module.ModuleName + '"';
     ParameterString := ParameterString + ' "' + Module.ScriptDir+ '"';
     CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','ICD3',' ') ;
     exeLauncher.Command := CommandString;
     exeLauncher.Parameters := ParameterString;
     exeLauncher.Execute;
     end;

      /////RENESAS Parameter with SN///////
      // Parameter 1: Module.FirmwareDir //
      // Parameter 2: Module.ModuleName  //
      // Parameter 3: fousb.exe Dirctory //
      // Parameter 4: Module.ScriptDir   //
      /////////////////////////////////////
     RENESAS:
     begin
          if Module.LanType = '1' then     //WIth Serial Number writing
          begin
               TempMotR := CreatTempMot(FModule.FirmwareDir);// make a temp mot file with short firmware name
               PrepareRenesasIniFile(Module.ScriptDir);
               //ParameterString := '"' + Module.FirmwareDir + '" ';                         //mot file dir
               ParameterString := '"' + TempMotR + '" ';
               ParameterString := ParameterString + '"' + Module.ModuleName + '"';         //module name
               ParameterString := ParameterString + ' "' + ExtractFilePath(ParamStr(0))+'Renesas Programmer\FOUSB\fousb.exe"';  //programmer dir (might not be used in Project1.exe, but it must be there to occupize paramstr(3) )
               ParameterString := ParameterString + ' "/s ' + ExtractFilePath(ParamStr(0)) + TEMP_SCRIPT + '"';
               CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','RENESAS_SN','Error');
               exeLauncher.Command := CommandString;
               exeLauncher.Parameters := ParameterString;
               exeLauncher.Execute;
          end
          /////RENESAS Parameter no SN/////////
          // Parameter 1: Script             //
          /////////////////////////////////////
          else                        //Without Serial Number Writing
          begin
                TempMotR := CreatTempMot(FModule.FirmwareDir);// make a temp mot file with short firmware name
               PrepareRenesasIniFile(Module.ScriptDir,TempMotR);

               ParameterString := '/s ' + ExtractFilePath(ParamStr(0))+TEMP_SCRIPT + ' ';
               CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','RENESAS',' ');
               exeLauncher.Command := CommandString;
               exeLauncher.Parameters := ParameterString;
               exeLauncher.Execute;
          end;

     end;

      ///RENESAS Parameter with SN & DOM///
      // Parameter 1: Module.FirmwareDir //
      // Parameter 2: Module.ModuleName  //
      // Parameter 3: fousb.exe Dirctory //
      // Parameter 4: Module.ScriptDir   //
      /////////////////////////////////////
     RENESAS_DOM:
     begin

          if Module.LanType = '1' then     //WIth Serial Number writing
          begin
               TempMotR := CreatDOMMot(Module.ScriptDir,FModule.FirmwareDir);// make a temp mot file with short firmware name
               PrepareRenesasIniFile(Module.ScriptDir);                       //mot file dir
               ParameterString := '"' + TempMotR + '" ';
               ParameterString := ParameterString + '"' + Module.ModuleName + '"';         //module name
               ParameterString := ParameterString + ' "' + ExtractFilePath(ParamStr(0))+'Renesas Programmer\FOUSB\fousb.exe"';  //programmer dir (might not be used in Project1.exe, but it must be there to occupize paramstr(3) )
               ParameterString := ParameterString + ' "/s ' + ExtractFilePath(ParamStr(0)) + TEMP_SCRIPT + '"';
               CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','RENESAS_SN','Error');
               exeLauncher.Command := CommandString;
               exeLauncher.Parameters := ParameterString;
               exeLauncher.Execute;
          end;

     end;
   end;
   Label1.Caption := CommandString;
   Label2.Caption := ParameterString;
end;

//**********************************************************************
//
//  PROCEDURE:    CreatTempMot - Creat a temp mot file with short renesas
//                mot file name.
//
//  PARAMETER:    -FirmwareDir:String  The Firmware .mot directory.
//
//  RETURN:String                      The temp mot file dir
//**********************************************************************
function TProductChecking.CreatTempMot(FirmwareDir:String):String;
var
   TempMotDir,line: String;
   SourceText,TargetText :textFile;
begin
    TempMotDir := ExtractFilePath(ParamStr(0))+TEMP_MOT_R;
    AssignFile(SourceText,FirmwareDir);
    AssignFile(TargetText,TempMotDir);
    Reset(SourceText);
    Rewrite(TargetText);
    while not eof(SourceText) do
    begin
      Readln(SourceText,Line);
      WriteLn(TargetText,Line);
    end;
    CloseFile(SourceText);
    CloseFile(TargetText);
    result := TempMotDir;
end;

//**********************************************************************
//
//  PROCEDURE:    CreatDOMMot - Creat a temp mot file with short renesas
//                mot file name.
//
//  PARAMETER:    -FirmwareDir:String  The Firmware .mot directory.
//
//  RETURN:String                      The temp mot file dir
//**********************************************************************
function TProductChecking.CreatDOMMot(ScriptDir,FirmwareDir:String):String;
var
   TempMotDir,line,vAddrString,vDomAddrString,vDOMLineString,vCentury,vDecade,vDoM: String;
   SourceText,TargetText,ScriptFile :textFile;
   vCount,vChkSum,i :integer;
   vDOMLineFlagBool :Boolean;
begin
    vChkSum := 0;
    vDOM := StringReplace(FormatDateTime('ddmmyyyy',Date),'/','',[rfReplaceAll]);
    TempMotDir := ExtractFilePath(ParamStr(0))+TEMP_MOT_R;
    AssignFile(SourceText,FirmwareDir);
    AssignFile(TargetText,TempMotDir);
    //
    //read Script File to get DoM address
    //
    AssignFile(ScriptFile,ScriptDir);
    Reset(ScriptFile);
    while not eof(ScriptFile) do
    begin
      Readln(ScriptFile,Line);
      if 0<>pos('DOM Address=',Line) then
         begin
              vDomAddrString := copy(line,15,10);
              break;
         end;
    end;
    CloseFile(ScriptFile);
    //
    //prepair the line of DOM
    //
    //vDoM := StringReplace(DateToStr(Date),'/','',[rfReplaceAll]);
    vCentury := copy(vDoM,5,2);
    vDecade  := copy(vDoM,7,2);
    vDoM := StuffString(vDoM, 5, 2, vDecade);
    vDoM := StuffString(vDoM, 7, 2, vCentury);
    vDoMLineString := vDomAddrString + vDoM;
    //
    //Check Sum for line of DOM
    //
    vCount := Strtoint('$'+copy(vDoMLineString,3,2));
    for i := 1 to vCount do
         vChkSum := vChkSum + Strtoint('$'+copy(vDoMLineString,i*2+1,2));
    vChkSum := 255 - (vChkSum mod 256);
    vDoMLineString := Concat (vDoMLineString, IntToHex(vChkSum,2));

    //
    //find the DOM line number
    //
    Reset(SourceText);
    Rewrite(TargetText);
    vDOMLineFlagBool := False; //line point is not over the DOM line
    while not eof(SourceText) do
    begin
         Readln(SourceText,Line);
         if vDOMLineFlagBool = False then
         begin
              Case StrToInt('$'+Copy(Line,2,1)) of
              1: vAddrString := Copy(Line,5,4);
              2: vAddrString := Copy(Line,5,6);
              3: vAddrString := Copy(Line,5,8);
              else vAddrString := '000000';
              end;
              if StrToInt('$'+vAddrString)>StrTOInt('$'+Copy(vDoMLineString,5,6)) then
              begin
                   vDOMLineFlagBool := True; //mark reading point is over the DOM line
                   //
                   //write DOM line into target file.
                   //
                   WriteLn(TargetText,vDoMLineString);
              end;
         end;
      WriteLn(TargetText,Line);
    end;
    CloseFile(SourceText);
    CloseFile(TargetText);
    result := TempMotDir;
end;


//**********************************************************************
//
//  PROCEDURE:    Creat_DOM_SN_HEX - Creat a temp HEX file with short NEC
//                HEX file name.
//
//  PARAMETER:    -FirmwareDir:String  The Firmware .HEX directory.
//
//  RETURN:String                      The temp mot file dir
//**********************************************************************
function TProductChecking.Creat_DOM_SN_HEX(ScriptDir,FirmwareDir:String):String;
var
   TempHEXDir,line,vAddrString,vDomAddrString,vDOMLineString,vSNAddrString,vSNLineString,vCentury,vDecade,vDoM,vSN: String;
   SourceText,TargetText,ScriptFile :textFile;
   vCount,vChkSum,i :integer;
   vLineFlagBool:Boolean;
   snInputForm: TsnInputForm;
   //DateOfManu: TDateTime;
begin
    vDomAddrString :=':04009400';
    vSNAddrString := ':04009000';
    TempHEXDir := ExtractFilePath(ParamStr(0))+TEMP_HEX_R;
    AssignFile(SourceText,FirmwareDir);
    AssignFile(TargetText,TempHEXDir);
    //
    //read Script File to get DoM and SN address
    //
    AssignFile(ScriptFile,ScriptDir);
    Reset(ScriptFile);
    while not eof(ScriptFile) do
    begin
      Readln(ScriptFile,Line);
      if 0<>pos('DOM Address=',Line) then
         begin
              vDomAddrString := copy(line,15,9);
         end;

      if 0<>pos('SN Address=',Line) then
         begin
              vSNAddrString := copy(line,14,9);
         end;
    end;
    CloseFile(ScriptFile);
    //
    //prepair the line of DOM
    //
    //DateOfManu := FormatDateTime('ddmmyyyy',Date);

    vDoM := StringReplace(FormatDateTime('ddmmyyyy',Date),'/','',[rfReplaceAll]);
    vCentury := copy(vDoM,5,2);
    vDecade  := copy(vDoM,7,2);
    vDoM := StuffString(vDoM, 5, 2, vDecade);
    vDoM := StuffString(vDoM, 7, 2, vCentury);
    vDoMLineString := vDomAddrString + vDoM;
    //
    //Check Sum for line of DOM
    //
    vChkSum := 0;
    vCount := Strtoint('$'+copy(vDoMLineString,2,2))+4;
    for i := 1 to vCount do
         vChkSum := vChkSum + Strtoint('$'+copy(vDoMLineString,i*2,2));
    vChkSum := 256 - (vChkSum mod 256);
    vDoMLineString := Concat (vDoMLineString, IntToHex(vChkSum,2));

    //
    //prepair the line of SN
    //
    snInputForm := TsnInputForm.Create(nil);
    snInputForm.ShowModal;
    vSN := snInputForm.readSN;
    vSNLineString := vSNAddrString + vSN;
    snInputForm.Free;
    //
    //Check Sum for line of SN
    //
    vCount := Strtoint('$'+copy(vSNLineString,2,2))+4;
    vChkSum:= 0;
    for i := 1 to vCount do
         vChkSum := vChkSum + Strtoint('$'+copy(vSNLineString,i*2,2));
    vChkSum := 256 - (vChkSum mod 256);
    vSNLineString := Concat (vSNLineString, IntToHex(vChkSum,2));


    //
    //find the DOM line number
    //
    Reset(SourceText);
    Rewrite(TargetText);
    vLineFlagBool := False; //line point is not over the SN & DOM lines
    while not eof(SourceText) do
    begin
         Readln(SourceText,Line);
         if vLineFlagBool = False then
         begin
              //
              // make sure this line is data line.
              //
              If StrToInt('$'+Copy(Line,8,2))= 0 then vAddrString := Copy(Line,4,4);
              if StrToInt('$'+vAddrString)>StrTOInt('$'+Copy(vSNLineString,4,4)) then
              begin
                   vLineFlagBool := True; //mark reading point is over the DOM line
                   //
                   //write DOM line into target file.
                   //
                   WriteLn(TargetText,vSNLineString);
                   WriteLn(TargetText,vDoMLineString);
              end;
         end;
         WriteLn(TargetText,Line);
    end;
    CloseFile(SourceText);
    CloseFile(TargetText);
    result := TempHexDir;
end;



//**********************************************************************
//
//  PROCEDURE:    PreparNECsIniFile - Prepar correct Ini File and bat File
//                for NEC Programmer without serial number. Because the NEC
//                programmer without SN function will call qbp.ese directly.
//
//                It just needs modify the .prm file directory and Firmware
//                directory in qbp.ini.
//
//
//  PARAMETERS:   -ScriptDir : The .ini file directory.
//                -FirmwareDir : The Firmware directory.
//
//**********************************************************************
procedure TProductChecking.PreparNECsIniFile(ScriptDir,FirmwareDir:String);     //without serial number;
var
   Line:String;
    FileText,TargetText :textFile;
    //CountNo:Integer;
    i: Integer;
    IniFile: TIniFile;
    PrmStr: String;
begin
     //modify ini file.
     //CountTimes := 0;
     IniFile := TIniFile.Create(ScriptDir);
     //Firmware dir change
     IniFile.WriteString('Load File','Name',FirmwareDir);// Firmware dir change
     //Parameter dir change
     PrmStr := IniFile.ReadString('Parameter File','Name','');
     i:= pos('\NEC Programmer\',PrmStr);
     Delete(PrmStr, 1, i-1);
     PrmStr := ExtractFilePath(ParamStr(0))+PrmStr;
     IniFile.WriteString('Parameter File','Name',PrmStr);
     IniFile.Free ;

    AssignFile(FileText,ScriptDir);  //ini
    AssignFile(TargetText,ExtractFilePath(ParamStr(0))+NEC_INI);   //qbp.ini
    Reset(FileText);
    Rewrite(TargetText);
    //CountNo := 0;
    while not eof(FileText) do
    begin
      Readln(FileText,Line);
      WriteLn(TargetText,Line);
    end;
    CloseFile(FileText);
    CloseFile(TargetText);

end;


//**********************************************************************
//
//  PROCEDURE:    PreparNECsIniFile - Prepar correct Ini File and bat File
//                for NEC Programmer with serial number.
//                1. It copies the Original .bat file to temp_bat.bat, and
//                modifies the qbp.ini directory in .bat file.
//                2. It also modifies the .prm file directory in qbp.ini.
//
//
//  PARAMETERS:   -ScriptDir : The .bat file directory.
//                (the Ini file dirctory is in .bat file)
//
//**********************************************************************

procedure TProductChecking.PreparNECsIniFile(ScriptDir:String);//for NEC with SN
var
   Line:String;
    FileText,TargetText :textFile;
    //CountNo:Integer;
    //CountTimes: Integer;
    IniFile: TIniFile;
    PrmStr,LoadFile: String;
    i: Integer;
    s: String;
begin
     //CountTimes := 0;
     //build a new bat file
    AssignFile(FileText,ScriptDir);  // .bat
    AssignFile(TargetText,ExtractFilePath(ParamStr(0))+TEMP_BAT); //temp_bat.bat
    Reset(FileText);
    Rewrite(TargetText);    //temp_bat.bat
    //CountNo := 0;
    while not eof(FileText) do
    begin
      Readln(FileText,Line);
      if (0 < pos('..\',Line))then
      begin
        Line := StringReplace(Line,'..\', ExtractFilePath(ParamStr(0))+'NEC Programmer\',[rfIgnoreCase]);
       // inc(CountTimes);
      end;
      WriteLn(TargetText,Line); //temp_bat.bat
      if (0 < pos('copy',Line)) then         //in the line: copy ??????.ini qbp.ini
      begin
           i:= pos(' qbp.ini',Line);
           s:= Copy(Line, 6, i-5); //get ini file name ??????.ini form bat file.
      end;

    end;
    CloseFile(FileText);
    CloseFile(TargetText);
    //modify ini file
     IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0))+NEC_INI_DIR+s);
     //firmware dir change
     LoadFile:= IniFile.ReadString('Load File','Name','');
     i:=LastDelimiter('\', LoadFile);
     Delete(LoadFile, 1, i);
     LoadFile := 'C:\temp\sn' + FirmwareNameLabel.Caption ;//firmware name
     IniFile.WriteString('Load File','Name',LoadFile);
     //Parameter dir change
     PrmStr := IniFile.ReadString('Parameter File','Name','');
     i:= pos('\NEC Electronics Tools\',PrmStr);
     Delete(PrmStr, 1, i-1);
     PrmStr := ExtractFilePath(ParamStr(0))+'NEC Programmer'+PrmStr;
     IniFile.WriteString('Parameter File','Name',PrmStr);// add current dir into .prm file
     IniFile.Free;
end;





//**********************************************************************
// 
//  PROCEDURE:    ProgramTypeLabelMouseEnter - When mouse moves into button
//                the image on the form will be changed to programmer
//                photo.
//
//  PARAMETERS:   -TObejct
//
//
//**********************************************************************

procedure TProductChecking.ProgramTypeLabelMouseEnter(Sender: TObject);
var
tempDir: string;
begin
 With Sender as TLabel Do
    begin
      Case TempProgrammerTag of
      DIGIFLEX_FLASH_PROGRAMMER:
        begin
        tempDir := ExtractFilePath(ParamStr(0))+ 'DIGIFLEX FLASH Programmer\DigifleX Flash Programmer.bmp';
        image1.Picture.LoadFromFile(tempDir);
        end;
      NEC_PROGRAMMER:
        begin
        tempDir := ExtractFilePath(ParamStr(0))+ 'NEC Programmer\NEC Programmer.bmp';
        image1.Picture.LoadFromFile(tempDir);
        end;
      ICD3_PROGRAMMER:
        begin
        tempDir := ExtractFilePath(ParamStr(0))+ 'ICD3 Programmer\ICD3 Programmer.bmp';
        image1.Picture.LoadFromFile(tempDir);
        end;
      RENESAS_PROGRAMMER:
        begin
        tempDir := ExtractFilePath(ParamStr(0))+ 'Renesas Programmer\Renesas Programmer.bmp';
        image1.Picture.LoadFromFile(tempDir);
        end;
      RENESAS_PROGRAMMER_DOM:
        begin
        tempDir := ExtractFilePath(ParamStr(0))+ 'Renesas Programmer\Renesas Programmer.bmp';
        image1.Picture.LoadFromFile(tempDir);
        end;
      else
        begin
        end;
      end;

    end;
end;


//**********************************************************************
// 
//  PROCEDURE:    ProgramTypeLabelMouseLeave - When mouse moves out button,
//                the image on the form will switch back to product photo.
//
//  PARAMETERS:   -TObejct
//
//
//**********************************************************************

procedure TProductChecking.ProgramTypeLabelMouseLeave(Sender: TObject);
begin
image1.Picture.LoadFromFile(TempPictureDir);
end;




procedure TProductChecking.PrepareRenesasIniFile(ScriptDir: String);  //with Serial Number
var
   Line:String;
   FileText,TargetText :textFile;
   CountTimes: Integer;
begin

     CountTimes := 0;
     AssignFile(FileText,ScriptDir);
     AssignFile(TargetText,ExtractFilePath(ParamStr(0))+TEMP_SCRIPT);
     Reset(FileText);
     Rewrite(TargetText);

     while not eof(FileText) do
     begin
      Readln(FileText,Line);
      if (0 < pos('File=',Line))then
      begin
        Line := 'File=C:\temp\sntemp.mot';
        inc(CountTimes);
      end;
      WriteLn(TargetText,Line);
     end;
     if (CountTimes > 2) then  ShowMessage('Error in script modifing');
     CloseFile(FileText);
     CloseFile(TargetText);
end;

procedure TProductChecking.PrepareRenesasIniFile(ScriptDir,  FirmwareDir: String); //Without Serial Number
var
   Line:String;
   FileText,TargetText :textFile;
   //CountNo:Integer;
   CountTimes: Integer;
begin
     CountTimes := 0;
     AssignFile(FileText,ScriptDir);
     AssignFile(TargetText,ExtractFilePath(ParamStr(0))+TEMP_SCRIPT);
     Reset(FileText);
     Rewrite(TargetText);

     while not eof(FileText) do
     begin
      Readln(FileText,Line);
      if (0 < pos('File=',Line)) then
      begin
        Line := 'File=' + FirmwareDir;
        inc(CountTimes);
      end;
      WriteLn(TargetText,Line);
     end;
     if (CountTimes > 2) then  ShowMessage('Error in script modifing');
     CloseFile(FileText);
     CloseFile(TargetText);
end;

procedure TProductChecking.CaptionRotateLeft();
var
  Tstr:String;
  Lstr:Integer;
begin
  Tstr:=ExpandString;
  Lstr:=Length(Tstr);
  if Ord(Tstr[RIndex])>127 then
  begin
    self.Caption:=Concat(Copy(Tstr,RIndex+2,Lstr-RIndex-1),Copy(Tstr,1,RIndex+1));
    Inc(RIndex);
  end
  else
    self.Caption:=Concat(Copy(Tstr,RIndex+1,Lstr-RIndex),Copy(Tstr,1,RIndex));
  Inc(RIndex);
  if RIndex>Lstr then
    RIndex:=1;
end;

procedure TProductChecking.CaptionShiftLeftRight();
begin
  if IsRightShift then
    begin
      Inc(InsertSpaceNum);
      if InsertSpaceNum>=SpaceNum then
        IsRightShift:=False;
    end
  else
    begin
      Dec(InsertSpaceNum);
      if InsertSpaceNum<=0 then
        IsRightShift:=True;
    end;
  self.Caption:=Concat(StringOfChar(' ',InsertSpaceNum),TheCaption);
end;

procedure TProductChecking.Timer1Timer(Sender: TObject);
begin
  if IsRotate then
    CaptionRotateLeft
  else
    CaptionShiftLeftRight;
end;

procedure TProductChecking.JudgeAndAdjust();
var
   i,Formeri,Lstr:integer;
begin
  Label3.Caption:=TheCaption;
  SpaceNum:=((Width-wIcon-wButton)-Label3.Width) div 3;
  if SpaceNum>=0 then
    begin
      ExpandString:=Concat(StringOfChar(' ',SpaceNum),TheCaption);
      self.Caption:=ExpandString;
    end
  else
    begin
      Timer1.Enabled:=False;
      Lstr:=Length(TheCaption)+Length(self.Caption);
      i:=0;Formeri:=i;
      Label3.Caption:='...';
      while (Label3.Width<(Width-wIcon-wButton)) and (i<Lstr) do
        begin
          Formeri:=i;
          if Ord(TheCaption[Lstr-i])>127 then
              Inc(i);
          Inc(i);
          Label3.Caption:=Concat('...',Copy(TheCaption,Lstr-(i-1),i));
        end;
      self.Caption:=Concat('...',Copy(TheCaption,Lstr-(Formeri-1),Formeri));
      
    end;
end;

function TProductChecking.IsFirmwareBeta(ModuleFirewareName: String):Boolean;
var
   i:integer;
   Status: String;
begin
     i := length(ModuleFirewareName);
     Status := copy(ModuleFirewareName,i-5,2);
     if Status <> '00' then
               begin Result := true;
                     CautionFlashTimer.Enabled:=true;
               end
     else begin Result := false;
     CautionFlashTimer.Enabled:=False;
     end;
end;


procedure TProductChecking.CautionFlashTimerTimer(Sender: TObject);
begin
     FlashCount := FlashCount mod 2; //Beta Caution Flash has THREE color, 1:Red, 2:Yellow, 3:Lime.
     case FlashCount of
     0:BetaCautionLabel.Font.Color := clRed;
     1:BetaCautionLabel.Font.Color := clBlue;
     end;
     inc(FlashCount);
     BetaCautionLabel.Refresh;
end;

procedure TProductChecking.EraseButtonClick(Sender: TObject);
var
SectionID,CMDString: String;
ParameterString,CommandString: String;
EraseSuccessful: integer;
MCUCode:String;
ScriptIni:TInifile;
IniFile: TIniFile;
begin
     EraseResultLabel.Visible := False;
     With Sender as TLMDButton Do SectionID := IntToStr( Tag );
     iniFileName := ExtractFilePath(ParamStr(0))+ExtractFileName(ParamStr(0)) ;
     Delete(iniFileName,length(iniFileName)-3,4);
     iniFileName := iniFileName +'.ini';
     Module := TModule.Create(IniFileName,SectionID);
     IniFile := TIniFile.Create(IniFileName);
     Case Module.Programmer of

     /////////DIGIFLEX Eraser ////////////
     // Parameter 1:                    //
     /////////////////////////////////////
     DIGIFLEX:
     begin
     ParameterString := ' -actions=F -baudrate=57600 ';
     ParameterString := ParameterString + IniFile.ReadString('SerialPort','PortNumber',' -com1 ');
     CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','DIGIFLEX_FLASH',' ');
     exeLauncher.Command := CommandString;
     exeLauncher.Parameters := ParameterString;
     exeLauncher.Execute;

     end;
     
     /////////////NEC Eraser//////////////
     // Parameter 1:                    //
     // Parameter 2:                    //
     // Parameter 3:                    //
     /////////////////////////////////////
     NEC:
     begin
               PreparNECsIniFile(ExtractFilePath(ParamStr(0))+ERASE_INI,'');
               CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','NEC',' ');
               exeLauncher.Command := CommandString;
               exeLauncher.Execute;

     end;

     ///////////ICD3 Eraser///////////////
     // Parameter 1:                    //
     // Parameter 2:                    //
     // Parameter 3:                    //
     /////////////////////////////////////
     ICD3:
     begin
          ScriptIni := TIniFile.Create(Module.ScriptDir);
          MCUCode := ScriptIni.ReadString('MCU','MCU_Code','-P24FJ64GA004');
          ScriptIni.Free;
          CMDString := Concat(ExtractFileDir(ParamStr(0)),'\ICD3 Programmer\ICD3_Pack\ICD3CMD ',MCUCode,' -E');
          EraseSuccessful:=ICD3RunDos(CMDString,'Erase device complete','RobertFilled');
     end;

      ////////////RENESAS Eraser //////////
      // Parameter 1:                    //
      // Parameter 2:                    //
      // Parameter 3:                    //
      // Parameter 4:                    //
      /////////////////////////////////////
     RENESAS:
     begin
          ParameterString := '/s ' + ExtractFilePath(ParamStr(0))+ERASE_SCRIPT ;
          CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','RENESAS',' ');
          exeLauncher.Command := CommandString;
          exeLauncher.Parameters := ParameterString;
          exeLauncher.Execute;
     end;
      ////////////RENESAS_DOM Eraser //////////
      // Parameter 1:                    //
      // Parameter 2:                    //
      // Parameter 3:                    //
      // Parameter 4:                    //
      /////////////////////////////////////
     RENESAS_DOM:
     begin
          ParameterString := '/s ' + ExtractFilePath(ParamStr(0))+ERASE_SCRIPT ;
          CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','RENESAS',' ');
          exeLauncher.Command := CommandString;
          exeLauncher.Parameters := ParameterString;
          exeLauncher.Execute;
     end;
     end;
   ProductChecking.EraseResultLabel.Visible := true;
   if EraseSuccessful=1 then
   begin
        EraseResultLabel.Font.Color := clLime;
        EraseResultLabel.Caption:= 'Erase Done';
        EraseResultLabel.Visible := true;
        EraseResultLabel.Refresh;
   end
   else
   begin
        EraseResultLabel.Font.Color := clRed;
        EraseResultLabel.Caption:= 'Erase Fail';
        EraseResultLabel.Visible := true;
        EraseResultLabel.Refresh;
   end;
   

   ProductChecking.EraseResultLabel.Visible := true;
   if EraseSuccessful=1 then
   begin
        EraseResultLabel.Font.Color := clLime;
        EraseResultLabel.Caption:= 'Erase Done';
        EraseResultLabel.Visible := true;
        EraseResultLabel.Refresh;
   end
   else
   begin
        EraseResultLabel.Font.Color := clRed;
        EraseResultLabel.Caption:= 'Erase Fail';
        EraseResultLabel.Visible := true;
        EraseResultLabel.Refresh;
   end;
end;


function TProductChecking.ICD3RunDos(DosApp:String;PassKeyWords,FailKeyWords:String): integer;
  const
    ReadBuffer = 2400;
  var
   Security : TSecurityAttributes;
   ReadPipe,WritePipe : THandle;
   start : TStartUpInfo;
   ProcessInfo : TProcessInformation;
   Buffer : Pchar;
   BytesRead : DWord;
   Apprunning : DWord;
   PassCMD, FailCMD : integer;
  begin
   Result := -1;
   With Security do begin
    nlength := SizeOf(TSecurityAttributes) ;
    binherithandle := true;
    lpsecuritydescriptor := nil;
   end;
   if Createpipe (ReadPipe, WritePipe,
                  @Security, 0) then begin
    Buffer := AllocMem(ReadBuffer + 1) ;
    FillChar(Start,Sizeof(Start),#0) ;
    start.cb := SizeOf(start) ;
    start.hStdOutput := WritePipe;
    start.hStdInput := ReadPipe;
    start.dwFlags := STARTF_USESTDHANDLES +  STARTF_USESHOWWINDOW;
    start.wShowWindow := SW_HIDE;

    if CreateProcess(nil,
           PChar(DosApp),
           @Security,
           @Security,
           true,
           NORMAL_PRIORITY_CLASS,
           nil,
           nil,
           start,
           ProcessInfo)
    then
    begin
     repeat
      Apprunning := WaitForSingleObject
                   (ProcessInfo.hProcess,100) ;
      Application.ProcessMessages;
     until (Apprunning <> WAIT_TIMEOUT) ;
      Repeat
        BytesRead := 0;
        ReadFile(ReadPipe,Buffer[0],
        ReadBuffer,BytesRead,nil) ;
        Buffer[BytesRead]:= #0;
        OemToAnsi(Buffer,Buffer) ;
        //Temp
        if (0 < pos(PassKeyWords,String(Buffer))) then PassCMD := 1 else PassCMD := -1;
        if (0 < pos(FailKeyWords,String(Buffer))) then FailCMD := -1 else FailCMD := 0;
        Result := PassCMD;

      until (BytesRead < ReadBuffer) ;
   end;
   FreeMem(Buffer) ;
   CloseHandle(ProcessInfo.hProcess) ;
   CloseHandle(ProcessInfo.hThread) ;
   CloseHandle(ReadPipe) ;
   CloseHandle(WritePipe) ;
   end;
end;

procedure TProductChecking.OpenButtonClick(Sender: TObject);
var
temp_string, dir_string: string;
i: integer;
begin
     EraseResultLabel.Visible := False;
     temp_string := FModule.FirmwareDir;
     dir_string := FModule.FirmwareDir;
     Opendialog.FileName := '';
     if FileExists(FModule.FirmwareDir) then
     begin
          i:= LastDelimiter('\', dir_string) ;
          SetLength(dir_string, i );
          Opendialog.InitialDir := dir_string;
     end
     else Opendialog.InitialDir := SERVER_FIRMWARE_DIR;
     OpenDialog.Filter := 'Firmware File(*.hex; *.mot)|*.hex;*.mot';
     OpenDialog.Execute;
     if OpenDialog.FileName = '' then FModule.FirmwareDir := temp_string
     else FModule.FirmwareDir := Opendialog.FileName;
     OpenDialog.Filter := '';
     FirmwareNameLabel.Caption := ExtractFileName(FModule.FirmwareDir);
     BetaCautionLabel.Caption := Copy(FModule.FirmwareDir,LastDelimiter('_', FModule.FirmwareDir)-4,7);
end;

end.





