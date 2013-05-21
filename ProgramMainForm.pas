unit ProgramMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDBaseControl, LMDBaseGraphicControl,
  LMDGraphicControl, LMDHTMLLabel, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDEdit,
  LMDDockButton, LMDCustomButton, LMDButton, ActnList, LMDActnList,
  LMDCustomSwitch, LMDSwitch, Menus, CheckLst, ComCtrls, ExtDlgs,
  LMDBaseImage, LMDCustomLImage, LMDLImage, ExtCtrls,inifiles;

type
  TProgramForm = class(TForm)
    ModuleNameEdit: TLMDEdit;
    LMDHTMLLabel1: TLMDHTMLLabel;
    FirmwareDirEdit: TLMDEdit;
    LMDHTMLLabel2: TLMDHTMLLabel;
    LMDHTMLLabel3: TLMDHTMLLabel;
    ProgrammerTypeCombo: TComboBox;
    ScriptDirEdit: TLMDEdit;
    LMDButton1: TLMDButton;
    SaveKeyValue: TLMDButton;
    PreviousModuleButton: TLMDButton;
    NextModuleButton: TLMDButton;
    ReadLastModuleCfgButton: TLMDButton;
    ReadFirstModuleCfgButton: TLMDButton;
    LMDHTMLLabel5: TLMDHTMLLabel;
    ModuleSectionIDLabel: TLMDHTMLLabel;
    MainMenu1: TMainMenu;
    NewModule1: TMenuItem;
    Edit1: TMenuItem;
    Search1: TMenuItem;
    Format1: TMenuItem;
    Help1: TMenuItem;
    AboutINIProgramForm1: TMenuItem;
    ViewHelp1: TMenuItem;
    FormatSecure1: TMenuItem;
    ByName1: TMenuItem;
    ByHexFile1: TMenuItem;
    ByProgrammer1: TMenuItem;
    ByiniSectionFile1: TMenuItem;
    New1: TMenuItem;
    OpeniniFile1: TMenuItem;
    SaveIniFile: TMenuItem;
    NewModule2: TMenuItem;
    ModifyModule1: TMenuItem;
    SaveAsOther: TMenuItem;
    Exit: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog: TOpenDialog;
    OpenPictureDialog: TOpenPictureDialog;
    PhotoDirEdit: TLMDEdit;
    Image1: TImage;
    NextModuleTypeButton: TLMDButton;
    PreviousModuleTypeButton: TLMDButton;
    LMDHTMLLabel4: TLMDHTMLLabel;
    ProgrammerName: TLMDHTMLLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LMDDockButtonClick(Sender: TObject);
    procedure LMDDockButton2Click(Sender: TObject);
    procedure LMDDockButton3Click(Sender: TObject);
    procedure SaveKeyValueClick(Sender: TObject);
    procedure NextModuleButtonClick(Sender: TObject);
    procedure PreviousModuleButtonClick(Sender: TObject);
    procedure ReadFirstModuleCfgButtonClick(Sender: TObject);
    procedure ReadLastModuleCfgButtonClick(Sender: TObject);
    procedure ModuleCfgLockerClick(Sender: TObject);
    procedure OpeniniFile1Click(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure LMDButton4Click(Sender: TObject);
    procedure NextModuleTypeButtonClick(Sender: TObject);
    procedure PreviousModuleTypeButtonClick(Sender: TObject);
    procedure ModifyModule1Click(Sender: TObject);
    procedure FormatSecure1Click(Sender: TObject);
    procedure PhotoDirEditChange(Sender: TObject);
    procedure LMDButton1Click(Sender: TObject);

  private
    { Private declarations }

    procedure FormatINI;
    Function  GetNeighborModuleSectionID(SectionID,Dirction:String):String;
    Function  GetNeighborTypeSectionID(SectionID,Dirction: String):String;
    procedure ReadModuleCfg(SectionID:String);
    procedure WriteModuleCfg(SectionID,Keyword,value:String); Overload;
    procedure WriteModuleCfg(SectionID,Keyword:String;value:Integer); Overload;
    procedure WriteModuleCfg(SectionID:String); Overload;
    procedure LockerCfgSetting(LockTag:Integer);
  public
    { Public declarations }
  end;
const
  DEFAULT_INI_FILE_NAME = '\LaunchPad2_Test.ini';
  LOCKED = 1;
  UNLOCK = -1;
  UNUSED = 0;
  MAX_MODULE_TAG_NO = 20;
  MAX_MODULE_TYPE_NO = 8;
  MAX_LAN_TYPE_NO = 2;
  FIRST_MODULE_SECTION_NO = '1101';
  LAST_MODULE_SECTION_NO = '2820';
  NO_PIC = '\NoPic.bmp';
  SERVER_FIRMWARE_DIR = 'S:\Digiflex\Production\Firmware_2';
  SERVER_ARTWORKS_DIR = 'S:\Digiflex\Products';
var
  ProgramForm: TProgramForm;
  CurrentLanTypeNo, CurrentModuleTypeNo, CurrentModuleTagNo: Integer;
  IniFileName, ParamStr1: String;
  IniFile : TIniFile;
implementation

uses AddNewModule;

{$R *.dfm}


procedure TProgramForm.FormatINI;
var
  iniFileText : TextFile;
  //text   : String;
  LanTypeNo,ModuleTypeNo,ModuleTagNo: Integer;
begin
//if ParamStr1 <> '' then iniFileName := ParamStr1
 //      else iniFileName := Concat(ExtractFileDir(ParamStr(0)),DEFAULT_INI_FILE_NAME);
AssignFile(iniFileText, iniFileName);

  ReWrite(iniFileText);

  WriteLn(iniFileText);
  for LanTypeNo:=1 to 2 do
  begin
  
    for ModuleTypeNo:=1 to 8 do
    begin if LanTypeNo=1 then WriteLn(iniFileText,';==================RS485==================')
  else WriteLn(iniFileText,';=================OLD LAN=================');
    case ModuleTypeNo of
      1: WriteLn(iniFileText,';------------------Input------------------');
      2: WriteLn(iniFileText,';------------------Output-----------------');
      3: WriteLn(iniFileText,';---------------Power Suppler-------------');
      4: WriteLn(iniFileText,';------------------Keypad-----------------');
      5: WriteLn(iniFileText,';------------------Panel------------------');
      6: WriteLn(iniFileText,';--------------Door Controller------------');
      7: WriteLn(iniFileText,';------------------Other 1----------------');
      8: WriteLn(iniFileText,';------------------Other 2----------------');
    end;     
      for ModuleTagNo:=1 to 20 do
      begin
      //if k<=10 then
      //  begin
        WriteLn(iniFileText);
        if ModuleTagNo>=10 then Write(iniFileText,'[',LanTypeNo,ModuleTypeNo,ModuleTagNo,']')
        else Write(iniFileText,'[',LanTypeNo,ModuleTypeNo,'0',ModuleTagNo,']');
        WriteLn(iniFileText);
        Write(iniFileText,'ModuleName = ');
        WriteLn(iniFileText);
        Write(iniFileText,'ModulePicDir = ');
        WriteLn(iniFileText);
        Write(iniFileText,'FirmwareDir = ');
        WriteLn(iniFileText);
        Write(iniFileText,'Programmer = ');
        WriteLn(iniFileText);
        Write(iniFileText,'ScriptDir = ');
        WriteLn(iniFileText);
        Write(iniFileText,'Locker = '+ IntToStr(UNUSED));
        WriteLn(iniFileText);

      //  end
      end;
    end;
   end;
   CloseFile(iniFileText);
   Checkbox1.Checked := False ;
end;

procedure TProgramForm.Button1Click(Sender: TObject);
begin
  if Checkbox1.Checked then FormatINI;
end;

procedure TProgramForm.FormCreate(Sender: TObject);
var
SectionID: String;
begin
Checkbox1.Checked := False ;
ParamStr1 := ParamStr(1);
if ParamStr1 <> '' then iniFileName := ParamStr1
     else iniFileName := ExtractFileDir(ParamStr(0))+ DEFAULT_INI_FILE_NAME;

SectionID := ProgramForm.ModuleSectionIDLabel.Caption;
Delete(SectionID,1,1);
Delete(SectionID,5,1);
ReadModuleCfg(SectionID);
end;

procedure TProgramForm.LMDDockButtonClick(Sender: TObject);
begin
     Opendialog.FileName := '';
     Opendialog.InitialDir := SERVER_FIRMWARE_DIR;
     OpenDialog.Filter := 'Firmware File(*.hex; *.mot)|*.hex;*.mot';
     OpenDialog.Execute;
     FirmwareDirEdit.Text := Opendialog.FileName;
     OpenDialog.Filter := '';
end;

procedure TProgramForm.LMDDockButton2Click(Sender: TObject);
begin
     //add a specific file type of Script file.
     Opendialog.FileName := '';
     Opendialog.InitialDir := SERVER_FIRMWARE_DIR;
     OpenDialog.Filter := 'Script File(*.script; *.bat)|*.Script;*.bat';
     OpenDialog.Execute;
     ScriptDirEdit.Text := Opendialog.FileName;
     OpenDialog.Filter := '';

end;

procedure TProgramForm.LMDDockButton3Click(Sender: TObject);
begin
     //add a specific file type of Picture file.
     OpenPictureDialog.InitialDir := SERVER_ARTWORKS_DIR;
     OpenPictureDialog.FileName := '';
     OpenPictureDialog.Filter := 'Bit Map File(*.BMP)|*.bmp';
     OpenPictureDialog.Execute;
     PhotoDirEdit.Text := OpenPictureDialog.FileName;
     if FileExists(PhotoDirEdit.Text) = false then image1.Picture.LoadFromFile(ExtractFileDir(ParamStr(0))+NO_PIC)
     else image1.Picture.LoadFromFile(PhotoDirEdit.Text);
     //Image1.Picture.
end;

procedure TProgramForm.SaveKeyValueClick(Sender: TObject);
var
   SectionID: String;
begin
      //based on the Module Section ID to write key value.
      if  ModuleCfgLocker.Tag = LOCKED then ShowMessage('This Module Config is Locked!')
     else begin
     SectionID := ProgramForm.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     ModuleCfgLocker.Tag := LOCKED;
     WriteModuleCfg(SectionID);
     ModuleCfgLocker.Caption := 'Locked';
     end;
end;

procedure TProgramForm.NextModuleButtonClick(Sender: TObject);
var
   SectionID: String;
begin
     SectionID := ProgramForm.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     SectionID := GetNeighborModuleSectionID(SectionID,'Next');
     ReadModuleCfg(SectionID);
end;

procedure TProgramForm.PreviousModuleButtonClick(Sender: TObject);
var
   SectionID: String;
begin
     SectionID := ProgramForm.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     SectionID := GetNeighborModuleSectionID(SectionID,'Previous');
     ReadModuleCfg(SectionID);
end;

procedure TProgramForm.ReadFirstModuleCfgButtonClick(Sender: TObject);
begin
     ReadModuleCfg(FIRST_MODULE_SECTION_NO);
end;

procedure TProgramForm.ReadLastModuleCfgButtonClick(Sender: TObject);
begin
     ReadModuleCfg(LAST_MODULE_SECTION_NO);
end;

procedure TProgramForm.ModuleCfgLockerClick(Sender: TObject);
var
  
begin

end;

Function TProgramForm.GetNeighborModuleSectionID(SectionID,Dirction: String):String;
var
countSectionIDNumber: Integer;
countLanTypeNo, countModuleTypeNo, countModuleTagNo: Integer;
begin
     countSectionIDNumber := StrToInt(SectionID);
     countLanTypeNo := countSectionIDNumber Div 1000;
     countModuleTypeNo := ((countSectionIDNumber Mod 1000) Div 100);
     countModuleTagNo := countSectionIDNumber Mod 100;
     if Dirction = 'Next' then
       begin
            if countModuleTagNo >= MAX_MODULE_TAG_NO then
               if countModuleTypeNo >= MAX_MODULE_TYPE_NO then
                  if countLanTypeNo >= MAX_LAN_TYPE_NO then
                  else begin
                           Inc(countLanTypeNo);
                           countModuleTypeNo := 1;
                           countModuleTagNo := 1;
                       end
               else begin
                         Inc(countModuleTypeNo);
                         countModuleTagNo := 1;
                    end
            else begin
                      Inc(countModuleTagNo);
                 end
       end

     else if Dirction = 'Previous' then
       begin
            if countModuleTagNo <= 1 then
               if countModuleTypeNo <= 1 then
                  if countLanTypeNo <= 1 then
                  else begin
                           Dec(countLanTypeNo);
                           countModuleTypeNo := MAX_MODULE_TYPE_NO;
                           countModuleTagNo := MAX_MODULE_TAG_NO;
                       end
               else begin
                         Dec(countModuleTypeNo);
                         countModuleTagNo := MAX_MODULE_TAG_NO;
                    end
            else begin
                      Dec(countModuleTagNo);
                 end
       end
     else ShowMessage('Dirction Error!');
countSectionIDNumber :=  countLanTypeNo*1000+countModuleTypeNo*100+countModuleTagNo;
Result := IntToStr(countSectionIDNumber);
end;


procedure TProgramForm.ReadModuleCfg(SectionID:String);
var
   IniFile : TIniFile;
begin
     //if ParamStr1 <> '' then iniFileName := ParamStr1
     //else    iniFileName := iniFileName;
     //iniFileName := DEFAULT_INI_FILE_NAME;
     IniFile := TIniFile.Create(iniFileName);
     ProgramForm.ModuleSectionIDLabel.Caption := '['+SectionID+']';
     ProgramForm.ModuleNameEdit.Text := IniFile.ReadString(SectionID,'ModuleName','Nothing read');
     ProgramForm.FirmwareDirEdit.Text := IniFile.ReadString(SectionID,'FirmwareDir','Nothing read');
     //ProgramForm.ProgrammerTypeCombo.Text := IniFile.ReadString(SectionID,'Programmer','Nothing read');
     ProgramForm.ProgrammerTypeCombo.ItemIndex := IniFile.ReadInteger(SectionID,'Programmer',0);
     ProgramForm.ScriptDirEdit.Text := IniFile.ReadString(SectionID,'ScriptDir','Nothing read');
     ProgramForm.PhotoDirEdit.Text := IniFile.ReadString(SectionID,'ModulePicDir','Nothing read');
     ProgramForm.ModuleCfgLocker.Tag :=IniFile.ReadInteger(SectionID,'Locker',0);
     LockerCfgSetting(ProgramForm.ModuleCfgLocker.Tag);


     IniFile.Free;
end;

procedure TProgramForm.WriteModuleCfg(SectionID:String; Keyword:String; value:String);
var
   IniFile : TIniFile;
begin
     //if ParamStr1 <> '' then iniFileName := ParamStr1
     //else iniFileName := iniFileName;

     IniFile := TIniFile.Create(iniFileName);
     IniFile.WriteString(SectionID,Keyword,value);
     IniFile.Free;
end;

procedure TProgramForm.WriteModuleCfg(SectionID,Keyword:String;value:Integer);
var
   IniFile : TIniFile;
begin
     //if ParamStr1 <> '' then iniFileName := ParamStr1
     //else    iniFileName := iniFileName;
     IniFile := TIniFile.Create(iniFileName);
     IniFIle.WriteInteger(SectionID,Keyword,value);
     IniFile.Free;
end;

procedure TProgramForm.WriteModuleCfg(SectionID:String); 
var
   IniFile : TIniFile;
begin
     //if ParamStr1 <> '' then iniFileName := ParamStr1
     //else    iniFileName := iniFileName;
     IniFile := TIniFile.Create(iniFileName);

     IniFile.WriteString(SectionID,'ModuleName',ProgramForm.ModuleNameEdit.Text );
     IniFile.WriteString(SectionID,'FirmwareDir',ProgramForm.FirmwareDirEdit.Text);
     IniFile.WriteInteger(SectionID,'Programmer', ProgramForm.ProgrammerTypeCombo.ItemIndex);
     IniFile.WriteString(SectionID,'ScriptDir', ProgramForm.ScriptDirEdit.Text);
     IniFile.WriteString(SectionID,'ModulePicDir',ProgramForm.PhotoDirEdit.Text);
     IniFIle.WriteInteger(SectionID,'Locker',ProgramForm.ModuleCfgLocker.Tag);
     IniFile.Free;
end;

procedure TProgramForm.OpeniniFile1Click(Sender: TObject);
var
   SectionID: String;
begin
     OpenDialog.Filter := 'Initialize File(*.ini)|*.ini';
     OpenDialog.Execute;
     ParamStr1 := Opendialog.FileName;
     if ParamStr1 <> '' then iniFileName := ParamStr1
     else iniFileName := ExtractFileDir(ParamStr(0))+ DEFAULT_INI_FILE_NAME;
     SectionID := ProgramForm.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     ReadModuleCfg(SectionID);
end;

procedure TProgramForm.ExitClick(Sender: TObject);
begin
ProgramForm.Close;
end;

procedure TProgramForm.LMDButton4Click(Sender: TObject);
var
   IniFile : TIniFile;
   SectionID: String;
begin
     SectionID := ProgramForm.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     IniFile := TIniFile.Create(iniFileName);

     if ProgramForm.ModuleCfgLocker.Tag = LOCKED then ShowMessage('This Module Configuration is LOCKED!')
     else begin
          IniFile.WriteString(SectionID,'ModuleName','' );
          IniFile.WriteString(SectionID,'FirmwareDir','');
          IniFile.WriteString(SectionID,'Programmer','');
          IniFile.WriteString(SectionID,'ScriptDir', '');
          IniFile.WriteString(SectionID,'ModulePicDir','');
          IniFIle.WriteInteger(SectionID,'Locker',UNUSED);
          end;
     ReadModuleCfg(SectionID);
end;

Procedure TProgramForm.LockerCfgSetting(LockTag:Integer);
begin
     Case ProgramForm.ModuleCfgLocker.Tag of
     UNLOCK :
       begin
            //EnableCfgGUI;
            ProgramForm.ModuleCfgLocker.Caption := 'UnLocked';
            ProgramForm.ModuleCfgLocker.Color := clBlue;
       end;
     UNUSED :
       begin
            //EnableCfgGUI;
            ProgramForm.ModuleCfgLocker.Caption := 'Unused';
            ProgramForm.ModuleCfgLocker.Color := clGreen;
       end;
     LOCKED :
       begin
            //DisableCfgGUI;
            ProgramForm.ModuleCfgLocker.Caption := 'Locked';
            ProgramForm.ModuleCfgLocker.Color := clRed;
       end

     else ShowMessage('Locker Status Value Error!');
     end;

     if LockTag = LOCKED then
        begin
             ProgramForm.ModuleNameEdit.ReadOnly := True;
             ProgramForm.FirmwareDirEdit.ReadOnly := True;
             //ProgramForm.ProgrammerTypeCombo.AutoComplete
             ProgramForm.ScriptDirEdit.ReadOnly := True;
             ProgramForm.PhotoDirEdit.ReadOnly := True;
        end
     else begin
               ProgramForm.ModuleNameEdit.ReadOnly := False;
               ProgramForm.FirmwareDirEdit.ReadOnly := False;
               //ProgramForm.ProgrammerTypeCombo
               ProgramForm.ScriptDirEdit.ReadOnly := False;
               ProgramForm.PhotoDirEdit.ReadOnly := False;

          end;

end;

procedure TProgramForm.NextModuleTypeButtonClick(Sender: TObject);
var
   SectionID: String;
begin
     SectionID := ProgramForm.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     SectionID := GetNeighborTypeSectionID(SectionID,'Next');
     ReadModuleCfg(SectionID);
end;

procedure TProgramForm.PreviousModuleTypeButtonClick(Sender: TObject);
var
   SectionID: String;
begin
     SectionID := ProgramForm.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     SectionID := GetNeighborTypeSectionID(SectionID,'Previous');
     ReadModuleCfg(SectionID);
end;

Function TProgramForm.GetNeighborTypeSectionID(SectionID,Dirction: String):String;
var
countSectionIDNumber: Integer;
countLanTypeNo, countModuleTypeNo, countModuleTagNo: Integer;
begin
     countSectionIDNumber := StrToInt(SectionID);
     countLanTypeNo := countSectionIDNumber Div 1000;
     countModuleTypeNo := ((countSectionIDNumber Mod 1000) Div 100);
     countModuleTagNo := countSectionIDNumber Mod 100;
     if Dirction = 'Next' then
       begin
            //if countModuleTagNo >= MAX_MODULE_TAG_NO then
               if countModuleTypeNo >= MAX_MODULE_TYPE_NO then
                  if countLanTypeNo >= MAX_LAN_TYPE_NO then
                  else begin
                           Inc(countLanTypeNo);
                           countModuleTypeNo := 1;
                           countModuleTagNo := 1;
                       end
               else begin
                         Inc(countModuleTypeNo);
                         countModuleTagNo := 1;
                    end
            //else begin
            //          Inc(countModuleTagNo);
            //     end
       end

     else if Dirction = 'Previous' then
       begin
            //if countModuleTagNo <= 1 then
               if countModuleTypeNo <= 1 then
                  if countLanTypeNo <= 1 then
                  else begin
                           Dec(countLanTypeNo);
                           countModuleTypeNo := MAX_MODULE_TYPE_NO;
                           countModuleTagNo := MAX_MODULE_TAG_NO;
                       end
               else begin
                         Dec(countModuleTypeNo);
                         countModuleTagNo := MAX_MODULE_TAG_NO;
                    end
            //else begin
            //          Dec(countModuleTagNo);
            //     end
       end
     else ShowMessage('Dirction Error!');
     countSectionIDNumber :=  countLanTypeNo*1000+countModuleTypeNo*100+countModuleTagNo;
     Result := IntToStr(countSectionIDNumber);
end;




procedure TProgramForm.ModifyModule1Click(Sender: TObject);
var
   SectionID: String;
begin
     SectionID := ProgramForm.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     ModuleCfgLocker.Tag := LOCKED;
     WriteModuleCfg(SectionID);
     ModuleCfgLocker.Caption := 'Locked';
end;

procedure TProgramForm.FormatSecure1Click(Sender: TObject);
begin
    if CheckBox1.Checked = true then CheckBox1.Checked := False
    else CheckBox1.Checked := true;
    FormatSecure1.Checked := CheckBox1.Checked;
end;

procedure TProgramForm.PhotoDirEditChange(Sender: TObject);
begin
if FileExists(PhotoDirEdit.Text) = false then image1.Picture.LoadFromFile(ExtractFileDir(ParamStr(0))+NO_PIC)
else image1.Picture.LoadFromFile(PhotoDirEdit.Text);
end;

procedure TProgramForm.LMDButton1Click(Sender: TObject);
var
FAddNewModule: TAddNewModuleForm;
begin
FAddNewModule := TAddNewModuleForm.Create(nil);
FAddNewModule.ShowModal;
FAddNewModule.Release;
end;

end.
