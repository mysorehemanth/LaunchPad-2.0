unit ModifyINI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDBaseControl, LMDBaseGraphicControl,
  LMDGraphicControl, LMDHTMLLabel, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDEdit,
  LMDDockButton, LMDCustomButton, LMDButton, ActnList, LMDActnList,
  LMDCustomSwitch, LMDSwitch, Menus, CheckLst, ComCtrls, ExtDlgs,
  LMDBaseImage, LMDCustomLImage, LMDLImage, ExtCtrls,inifiles,
  LMDCustomComponent, LMDContainerComponent, LMDBaseDialog,ModuleObject, LMDInputDlg,
  LMDCustomCheckListDlg, LMDCheckListDlg;
type
  TProduct = record
      ProductListIndex: integer;
      SectionID: String;
      ProductName: String;
      Firmware: String;
      Programmer: Integer;
      Script: String;
      Picture: String;
end;

type
  TEditor = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    ModuleNameEdit: TLMDEdit;
    LMDHTMLLabel1: TLMDHTMLLabel;
    FirmwareDirEdit: TLMDEdit;
    LMDHTMLLabel2: TLMDHTMLLabel;
    LMDHTMLLabel3: TLMDHTMLLabel;
    ProgrammerTypeCombo: TComboBox;
    LMDHTMLLabel4: TLMDHTMLLabel;
    ScriptDirEdit: TLMDEdit;
    LMDButton1: TLMDButton;
    SaveKeyValue: TLMDButton;
    LMDButton3: TLMDButton;
    DeleteModuleButton: TLMDButton;
    PreviousModuleButton: TLMDButton;
    NextModuleButton: TLMDButton;
    ReadLastModuleCfgButton: TLMDButton;
    ReadFirstModuleCfgButton: TLMDButton;
    LMDHTMLLabel5: TLMDHTMLLabel;
    ModuleSectionIDLabel: TLMDHTMLLabel;
    LMDDockButton: TLMDDockButton;
    LMDDockButton2: TLMDDockButton;
    ModuleCfgLocker: TLMDButton;
    MainMenu1: TMainMenu;
    NewModule1: TMenuItem;
    Edit1: TMenuItem;
    Search1: TMenuItem;
    Format1: TMenuItem;
    Help1: TMenuItem;
    AboutINIEditor1: TMenuItem;
    ViewHelp1: TMenuItem;
    FormatSecure1: TMenuItem;
    ByName1: TMenuItem;
    ByProgrammer1: TMenuItem;
    ByiniSectionFile1: TMenuItem;
    New1: TMenuItem;
    OpeniniFile1: TMenuItem;
    NewModule2: TMenuItem;
    ModifyModule1: TMenuItem;
    Exit: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog: TOpenDialog;
    OpenPictureDialog: TOpenPictureDialog;
    LMDHTMLLabel9: TLMDHTMLLabel;
    PhotoDirEdit: TLMDEdit;
    LMDDockButton3: TLMDDockButton;
    Image1: TImage;
    NextModuleTypeButton: TLMDButton;
    PreviousModuleTypeButton: TLMDButton;
    Label1: TLabel;
    SearchInputDialog: TLMDInputDlg;
    SearchResultList: TLMDCheckListDlg;
    Label2: TLabel;
    LMDHTMLLabel6: TLMDHTMLLabel;
    LMDHTMLLabel7: TLMDHTMLLabel;
    LanTypeLabel: TLMDHTMLLabel;
    ModuleTypeLabel: TLMDHTMLLabel;
    SearchNameInputDlg: TLMDInputDlg;
    LanTypeCheckListDlg: TLMDCheckListDlg;
    ModuleTypeCheckListDlg: TLMDCheckListDlg;
    ProgrammerTypeCheckListDlg: TLMDCheckListDlg;
    FindModuleByNameButton: TLMDButton;
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
    procedure DeleteModuleButtonClick(Sender: TObject);
    procedure NextModuleTypeButtonClick(Sender: TObject);
    procedure PreviousModuleTypeButtonClick(Sender: TObject);
    procedure ModifyModule1Click(Sender: TObject);
    procedure FormatSecure1Click(Sender: TObject);
    procedure PhotoDirEditChange(Sender: TObject);
    procedure LMDButton1Click(Sender: TObject);
    procedure NewModule2Click(Sender: TObject);
    procedure ByiniSectionFile1Click(Sender: TObject);
    procedure ByProgrammer1Click(Sender: TObject);
    procedure LMDButton3Click(Sender: TObject);
    procedure ByName1Click(Sender: TObject);
    procedure FindModuleByNameButtonClick(Sender: TObject);
    procedure AboutINIEditor1Click(Sender: TObject);
    procedure FirmwareDirEditChange(Sender: TObject);
    procedure ScriptDirEditChange(Sender: TObject);

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
    procedure SearchMatchedModules(ProgrammerType: integer);  Overload;
    procedure SearchMatchedModules(LanType,ModuleType: integer); Overload;
    procedure SearchMatchedModules(PartModuleName: String); Overload;
    procedure UnlockInterface;
    procedure LockInterface;
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
  SERVER_ARTWORKS_DIR = 'S:\Digiflex\Production\Firmware_2';
var
   Module: TModule;
  Editor: TEditor;
  CurrentLanTypeNo, CurrentModuleTypeNo, CurrentModuleTagNo: Integer;
  IniFileName, ParamStr1: String;
  IniFile : TIniFile;
  ProductList: array of TProduct;
implementation

uses AddNewModule;

{$R *.dfm}

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.FormatINI;
var
  iniFileText : TextFile;
  LanTypeNo,ModuleTypeNo,ModuleTagNo: Integer;
begin

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
      5: WriteLn(iniFileText,';--------------Control Panel--------------');
      6: WriteLn(iniFileText,';--------------Door Controller------------');
      7: WriteLn(iniFileText,';------------------Other 1----------------');
      8: WriteLn(iniFileText,';------------------Other 2----------------');
    end;     
      for ModuleTagNo:=1 to 20 do
      begin
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
      end;
    end;
   end;
   CloseFile(iniFileText);
   Checkbox1.Checked := False ;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.Button1Click(Sender: TObject);
begin
  if Checkbox1.Checked then FormatINI;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.FormCreate(Sender: TObject);
var
SectionID: String;
begin

Checkbox1.Checked := False ;
ParamStr1 := ParamStr(1);
if ParamStr1 <> '' then iniFileName := ParamStr1
     else iniFileName := ExtractFileDir(ParamStr(0))+ DEFAULT_INI_FILE_NAME;
Label1.Caption := Label1.Caption + iniFileName;
SectionID := Editor.ModuleSectionIDLabel.Caption;
Delete(SectionID,1,1);
Delete(SectionID,5,1);
ReadModuleCfg(SectionID);
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.LMDDockButtonClick(Sender: TObject);
var
temp_string, dir_string: string;
i: integer;
begin
     temp_string := FirmwareDirEdit.Text;
     dir_string := FirmwareDirEdit.Text;
     Opendialog.FileName := '';
     if FileExists(FirmwareDirEdit.Text) then
     begin
          i:= LastDelimiter('\', dir_string) ;
          SetLength(dir_string, i );
          Opendialog.InitialDir := dir_string;
     end
     else Opendialog.InitialDir := SERVER_FIRMWARE_DIR;
     OpenDialog.Filter := 'Firmware File(*.hex; *.mot)|*.hex;*.mot';
     OpenDialog.Execute;
     if OpenDialog.FileName = '' then FirmwareDirEdit.Text := temp_string
     else FirmwareDirEdit.Text := Opendialog.FileName;
     OpenDialog.Filter := '';
     //OpenDialog.Free;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.LMDDockButton2Click(Sender: TObject);
var
   temp_string, dir_string: string;
   i: integer;
begin
     //add a specific file type of Script file.
     temp_string := ScriptDirEdit.Text;
     dir_string := ScriptDirEdit.Text;
     Opendialog.FileName := '';
     if FileExists(ScriptDirEdit.Text) then
     begin
          i:= LastDelimiter('\', dir_string) ;
          SetLength(dir_string,i );
          Opendialog.InitialDir := dir_string;
     end
     else Opendialog.InitialDir := SERVER_FIRMWARE_DIR;
     //if FileExists(ScriptDirEdit.Text) then ScriptDirEdit.Color:=clWindow
     //else if ScriptDirEdit.Text = '' then ScriptDirEdit.Color:=clWindow
     //else ScriptDirEdit.Color:=clYellow;
     OpenDialog.Filter := 'Script File(*.script, *.bat, *.ini)|*.Script;*.bat;*.ini';
     OpenDialog.Execute;

     if OpenDialog.FileName = '' then ScriptDirEdit.Text := temp_string
     else ScriptDirEdit.Text := Opendialog.FileName;
     OpenDialog.Filter := '';
     //OpenDialog.Free;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.LMDDockButton3Click(Sender: TObject);
var
   temp_string, dir_string: string;
   i: integer;
begin
     //add a specific file type of Picture file.
     temp_string := PhotoDirEdit.Text;
     dir_string := PhotoDirEdit.Text;
     if FileExists(PhotoDirEdit.Text) then
     begin
          i:= LastDelimiter('\', dir_string) ;
          SetLength(dir_string,i );
          OpenPictureDialog.InitialDir := dir_string;
     end
     else OpenPictureDialog.InitialDir := SERVER_FIRMWARE_DIR;
     OpenPictureDialog.FileName := '';
     OpenPictureDialog.Filter := 'Photo File(*.BMP)|*.bmp';
     OpenPictureDialog.Execute;
     PhotoDirEdit.Text := OpenPictureDialog.FileName;
     if FileExists(PhotoDirEdit.Text) = false then image1.Picture.LoadFromFile(ExtractFileDir(ParamStr(0))+NO_PIC)
     else image1.Picture.LoadFromFile(PhotoDirEdit.Text);

     if OpenPictureDialog.FileName = '' then PhotoDirEdit.Text := temp_string
     else PhotoDirEdit.Text := OpenPictureDialog.FileName;
     //OpenPictureDialog.Free;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.SaveKeyValueClick(Sender: TObject);
var
   SectionID: String;
begin
      //based on the Module Section ID to write key value.
      if  ModuleCfgLocker.Tag = LOCKED then ShowMessage('This Module Config is Locked!')
     else begin
     SectionID := Editor.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     ModuleCfgLocker.Tag := LOCKED;
     WriteModuleCfg(SectionID);
     ModuleCfgLocker.Caption := 'Locked';
     LockInterface;
     end;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.NextModuleButtonClick(Sender: TObject);
var
   SectionID: String;
begin
     SectionID := Editor.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     SectionID := GetNeighborModuleSectionID(SectionID,'Next');
     ReadModuleCfg(SectionID);
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.PreviousModuleButtonClick(Sender: TObject);
var
   SectionID: String;
begin
     SectionID := Editor.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     SectionID := GetNeighborModuleSectionID(SectionID,'Previous');
     ReadModuleCfg(SectionID);
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.ReadFirstModuleCfgButtonClick(Sender: TObject);
begin
     ReadModuleCfg(FIRST_MODULE_SECTION_NO);
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.ReadLastModuleCfgButtonClick(Sender: TObject);
begin
     ReadModuleCfg(LAST_MODULE_SECTION_NO);
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.ModuleCfgLockerClick(Sender: TObject);
var
   SectionID: String;
begin
     SectionID := Editor.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     Case ModuleCfgLocker.Tag of
     UNLOCK:
       begin
            ModuleCfgLocker.Tag := UNUSED;
            WriteModuleCfg(SectionID,'Locker',UNUSED);
            ModuleCfgLocker.Caption := 'Unused';
            ModuleCfgLocker.Color := clGreen;
            UnlockInterface;
       end;
     UNUSED:
       begin
            ModuleCfgLocker.Tag := LOCKED;
            WriteModuleCfg(SectionID,'Locker',LOCKED);
            ModuleCfgLocker.Caption := 'Locked';
            ModuleCfgLocker.Color := clRed;
            LockInterface;
       end;
     LOCKED:
       begin
            ModuleCfgLocker.Tag := UNLOCK;
            WriteModuleCfg(SectionID,'Locker',UNLOCK);
            ModuleCfgLocker.Caption := 'UnLocked';
            ModuleCfgLocker.Color := clBlue;
            UnlockInterface;
       end;
     else ShowMessage('Locker Status Value Error!');
     end;
     LockerCfgSetting(Editor.ModuleCfgLocker.Tag);
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
Function TEditor.GetNeighborModuleSectionID(SectionID,Dirction: String):String;
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

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.ReadModuleCfg(SectionID:String);
var
   IniFile : TIniFile;
begin
     case  StrToInt(SectionID) div 1000 of
     1:  LanTypeLabel.Caption := 'RS485';
     2:  LanTypeLabel.Caption := 'OLD LAN';
     else ShowMessage('Module ID is Wrong');
     end;

     case  (StrToInt(SectionID) div 100) mod 10 of
     1:  ModuleTypeLabel.Caption := 'Input';
     2:  ModuleTypeLabel.Caption := 'Output';
     3:  ModuleTypeLabel.Caption := 'Keypad';
     4:  ModuleTypeLabel.Caption := 'PowerSuppler';
     5:  ModuleTypeLabel.Caption := 'Panel';
     6:  ModuleTypeLabel.Caption := 'Door Ctr';
     7:  ModuleTypeLabel.Caption := 'Expander';
     8:  ModuleTypeLabel.Caption := 'Others';
     else ShowMessage('Module ID is Wrong');
     end;
     
     IniFile := TIniFile.Create(iniFileName);
     Editor.ModuleSectionIDLabel.Caption := '['+SectionID+']';
     Editor.ModuleNameEdit.Text := IniFile.ReadString(SectionID,'ModuleName','Nothing read');
     Editor.FirmwareDirEdit.Text := IniFile.ReadString(SectionID,'FirmwareDir','Nothing read');
     Editor.ProgrammerTypeCombo.ItemIndex := IniFile.ReadInteger(SectionID,'Programmer',0);
     Editor.ScriptDirEdit.Text := IniFile.ReadString(SectionID,'ScriptDir','Nothing read');
     Editor.PhotoDirEdit.Text := IniFile.ReadString(SectionID,'ModulePicDir','Nothing read');
     Editor.ModuleCfgLocker.Tag :=IniFile.ReadInteger(SectionID,'Locker',0);
     LockerCfgSetting(Editor.ModuleCfgLocker.Tag);
     if (FileExists(PhotoDirEdit.Text) = false) or (PhotoDirEdit.Text = '') then image1.Picture.LoadFromFile(ExtractFileDir(ParamStr(0))+NO_PIC)
     else image1.Picture.LoadFromFile(PhotoDirEdit.Text);

     IniFile.Free;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.WriteModuleCfg(SectionID:String; Keyword:String; value:String);
var
   IniFile : TIniFile;
begin
     IniFile := TIniFile.Create(iniFileName);
     IniFile.WriteString(SectionID,Keyword,value);
     IniFile.Free;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.WriteModuleCfg(SectionID,Keyword:String;value:Integer);
var
   IniFile : TIniFile;
begin
     IniFile := TIniFile.Create(iniFileName);
     IniFIle.WriteInteger(SectionID,Keyword,value);
     IniFile.Free;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.WriteModuleCfg(SectionID:String);
var
   IniFile : TIniFile;
begin
     IniFile := TIniFile.Create(iniFileName);
     IniFile.WriteString(SectionID,'ModuleName',Editor.ModuleNameEdit.Text );
     IniFile.WriteString(SectionID,'FirmwareDir',Editor.FirmwareDirEdit.Text);
     IniFile.WriteInteger(SectionID,'Programmer', Editor.ProgrammerTypeCombo.ItemIndex);
     IniFile.WriteString(SectionID,'ScriptDir', Editor.ScriptDirEdit.Text);
     IniFile.WriteString(SectionID,'ModulePicDir',Editor.PhotoDirEdit.Text);
     IniFIle.WriteInteger(SectionID,'Locker',Editor.ModuleCfgLocker.Tag);
     IniFile.Free;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.OpeniniFile1Click(Sender: TObject);
var
   SectionID: String;
begin
     OpenDialog.Filter := 'Initialize File(*.ini)|*.ini';
     OpenDialog.Execute;
     ParamStr1 := Opendialog.FileName;
     if ParamStr1 <> '' then iniFileName := ParamStr1
     else iniFileName := ExtractFileDir(ParamStr(0))+ DEFAULT_INI_FILE_NAME;
     SectionID := Editor.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     ReadModuleCfg(SectionID);
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.ExitClick(Sender: TObject);
begin
Editor.Close;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.DeleteModuleButtonClick(Sender: TObject);
var
   IniFile : TIniFile;
   SectionID: String;
begin
     SectionID := Editor.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     IniFile := TIniFile.Create(iniFileName);

     if Editor.ModuleCfgLocker.Tag = LOCKED then ShowMessage('This Module Configuration is LOCKED!')
     else begin
          IniFile.WriteString(SectionID,'ModuleName','' );
          IniFile.WriteString(SectionID,'FirmwareDir','');
          IniFile.WriteString(SectionID,'Programmer','');
          IniFile.WriteString(SectionID,'ScriptDir', '');
          IniFile.WriteString(SectionID,'ModulePicDir','');
          IniFIle.WriteInteger(SectionID,'Locker',UNUSED);
          end;
     ReadModuleCfg(SectionID);
     UnlockInterface;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
Procedure TEditor.LockerCfgSetting(LockTag:Integer);
begin
     Case Editor.ModuleCfgLocker.Tag of
     UNLOCK :
       begin
            Editor.ModuleCfgLocker.Caption := 'UnLocked';
            Editor.ModuleCfgLocker.Color := clBlue;
            UnlockInterface;
       end;
     UNUSED :
       begin
            Editor.ModuleCfgLocker.Caption := 'Unused';
            Editor.ModuleCfgLocker.Color := clGreen;
            UnlockInterface;
       end;
     LOCKED :
       begin
            Editor.ModuleCfgLocker.Caption := 'Locked';
            Editor.ModuleCfgLocker.Color := clRed;
            LockInterface;
       end

     else ShowMessage('Locker Status Value Error!');
     end;


end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.NextModuleTypeButtonClick(Sender: TObject);
var
   SectionID: String;
begin
     SectionID := Editor.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     SectionID := GetNeighborTypeSectionID(SectionID,'Next');
     ReadModuleCfg(SectionID);
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.PreviousModuleTypeButtonClick(Sender: TObject);
var
   SectionID: String;
begin
     SectionID := Editor.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     SectionID := GetNeighborTypeSectionID(SectionID,'Previous');
     ReadModuleCfg(SectionID);
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
Function TEditor.GetNeighborTypeSectionID(SectionID,Dirction: String):String;
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

       end

     else if Dirction = 'Previous' then
       begin

               if countModuleTypeNo <= 1 then
                  if countLanTypeNo <= 1 then
                  else begin
                           Dec(countLanTypeNo);
                           countModuleTypeNo := MAX_MODULE_TYPE_NO;
                           countModuleTagNo := 1;
                       end
               else begin
                         Dec(countModuleTypeNo);
                         countModuleTagNo := 1;
                    end

       end
     else ShowMessage('Dirction Error!');
     countSectionIDNumber :=  countLanTypeNo*1000+countModuleTypeNo*100+countModuleTagNo;
     Result := IntToStr(countSectionIDNumber);
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.ModifyModule1Click(Sender: TObject);
var
   SectionID: String;
begin
     SectionID := Editor.ModuleSectionIDLabel.Caption;
     Delete(SectionID,1,1);
     Delete(SectionID,5,1);
     ModuleCfgLocker.Tag := LOCKED;
     WriteModuleCfg(SectionID);
     ModuleCfgLocker.Caption := 'Locked';
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.FormatSecure1Click(Sender: TObject);
begin
    if CheckBox1.Checked = true then CheckBox1.Checked := False
    else CheckBox1.Checked := true;
    FormatSecure1.Checked := CheckBox1.Checked;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.PhotoDirEditChange(Sender: TObject);
begin
if FileExists(PhotoDirEdit.Text) then
   begin
        PhotoDirEdit.Color:=clWindow;
        image1.Picture.LoadFromFile(PhotoDirEdit.Text);
   end
else if PhotoDirEdit.Text = '' then
     begin
          PhotoDirEdit.Color:=clWindow;
          image1.Picture.LoadFromFile(ExtractFileDir(ParamStr(0))+NO_PIC);
     end
else PhotoDirEdit.Color:=clYellow;

end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.LMDButton1Click(Sender: TObject);
var
FAddNewModule: TAddNewModuleForm;
begin
FAddNewModule := TAddNewModuleForm.Create(nil);
FAddNewModule.ShowModal;
FAddNewModule.Release;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.NewModule2Click(Sender: TObject);
var
FAddNewModule: TAddNewModuleForm;
begin
FAddNewModule := TAddNewModuleForm.Create(nil);
FAddNewModule.ShowModal;
FAddNewModule.Release;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.ByiniSectionFile1Click(Sender: TObject);
var
SectionID : String;
begin
     SectionID := '';
     SearchInputDialog.ShowDialog('Search By Section ID','Please input Section ID: ','1101',nil);
     SectionID := SearchInputDialog.Value;
     if SectionID <> '' then
     ReadModuleCfg(SectionID);
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.ByProgrammer1Click(Sender: TObject);
var
ProgrammerType,SelectedItemNumber,ListValue: integer;
begin
     if ProgrammerTypeCheckListDlg.Execute then
     begin
     ProgrammerType := ProgrammerTypeCheckListDlg.Value + 1;
     SearchMatchedModules(ProgrammerType);
     SearchResultList.Execute;
     SelectedItemNumber := 0;
     ListValue := SearchResultList.Value;
     SelectedItemNumber := ListValue;
     Label2.Caption := inttostr(SelectedItemNumber);
     if ListValue>=0 then
     ReadModuleCfg(ProductList[ListValue].SectionID);
     end;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.SearchMatchedModules(ProgrammerType: integer);
var
  LanTypeNo,ModuleTypeNo,ModuleTagNo,Counter: Integer;
  SectionID:String;
  IniFile: TIniFile;
begin
   SearchResultList.Items.Clear;
   if ParamStr1 <> '' then iniFileName := ParamStr1
     else iniFileName := ExtractFileDir(ParamStr(0))+ DEFAULT_INI_FILE_NAME;
  IniFile := TIniFile.Create(IniFileName);
  Counter :=0;
  for LanTypeNo:=1 to 2 do
  begin
    for ModuleTypeNo:=1 to 8 do
        begin
        for ModuleTagNo:=1 to 20 do
           begin
           SectionID := IntToStr(LanTypeNo*1000+ModuleTypeNo*100+ModuleTagNo);
           if (IniFile.ReadInteger(SectionID,'Locker ',0)=1)
           and(IniFile.ReadInteger(SectionID,'Programmer',0)=ProgrammerType)
           then Counter := Counter +1;
           label2.Caption := inttostr(IniFile.ReadInteger(SectionID,'Programmer',0));
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
             if (IniFile.ReadInteger(SectionID,'Locker ',0)=1)
             and(IniFile.ReadInteger(SectionID,'Programmer ',0)=ProgrammerType)
             then
             begin
             ProductList[Counter].SectionID := SectionID;
             ProductList[Counter].ProductListIndex := Counter;
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

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.SearchMatchedModules(LanType,ModuleType: integer);
var
  LanTypeNo,ModuleTypeNo,ModuleTagNo,Counter: Integer;
  SectionID:String;
  IniFile: TIniFile;
begin
     SearchResultList.Items.Clear;
     if ParamStr1 <> '' then iniFileName := ParamStr1
     else iniFileName := ExtractFileDir(ParamStr(0))+ DEFAULT_INI_FILE_NAME;
     IniFile := TIniFile.Create(IniFileName);
  Counter :=0;
  for LanTypeNo:=1 to 2 do
  if LanTypeNo = LanType then
     begin
     for ModuleTypeNo:=1 to 8 do
     if ModuleTypeNo = ModuleType then
        begin
        for ModuleTagNo:=1 to 20 do
           begin
           SectionID := IntToStr(LanTypeNo*1000+ModuleTypeNo*100+ModuleTagNo);
           if (IniFile.ReadInteger(SectionID,'Locker ',0)=1)then Counter := Counter +1;
           label2.Caption := inttostr(IniFile.ReadInteger(SectionID,'Programmer',0));
           end;
         end;
    end;

  SetLength(ProductList, Counter);
  Counter :=0;

  for LanTypeNo:=1 to 2 do
  if LanTypeNo = LanType then
  begin
    for ModuleTypeNo:=1 to 8 do
    if ModuleTypeNo = ModuleType then
    begin
      for ModuleTagNo:=1 to 20 do
           begin
             SectionID := IntToStr(LanTypeNo*1000+ModuleTypeNo*100+ModuleTagNo);
             if (IniFile.ReadInteger(SectionID,'Locker ',0)=1) then
             begin
             ProductList[Counter].SectionID := SectionID;
             ProductList[Counter].ProductListIndex := Counter;
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

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.LMDButton3Click(Sender: TObject);
var
   LanTypeSelected,ModuleTypeSelected,SelectedItemNumber,ListValue: integer;
begin
     if LanTypeCheckListDlg.Execute then
     begin
     LanTypeSelected :=  LanTypeCheckListDlg.Value +1;
     if ModuleTypeCheckListDlg.Execute then
     begin
     ModuleTypeSelected :=  ModuleTypeCheckListDlg.Value +1;
     SearchMatchedModules(LanTypeSelected,ModuleTypeSelected);
     SearchResultList.Execute;
     ListValue := SearchResultList.Value;
     SelectedItemNumber := ListValue div 2;
     Label2.Caption := inttostr(SelectedItemNumber);
     if ListValue>=0 then
     ReadModuleCfg(ProductList[ListValue].SectionID);
     end;
     end;
end;

//**********************************************************************
//
//  PROCEDURE:
//
//  PARAMETERS:
//
//**********************************************************************
procedure TEditor.LockInterface;
begin
      LMDDockButton.Enabled := False;
      LMDDockButton2.Enabled := False;
      LMDDockButton3.Enabled := False;
     ProgrammerTypeCombo.Enabled := False;
      Editor.ModuleNameEdit.ReadOnly := True;
      Editor.FirmwareDirEdit.ReadOnly := True;
      Editor.ScriptDirEdit.ReadOnly := True;
      Editor.PhotoDirEdit.ReadOnly := True;
end;

//**********************************************************************
//
//  PROCEDURE:  UnlockInterface: Unlock 5 Editors in form, and change
//                               view of Unlock Button.
//
//  PARAMETERS: NUN
//
//**********************************************************************
procedure TEditor.UnlockInterface;
begin
     LMDDockButton.Enabled := True;
     LMDDockButton2.Enabled := True;
     LMDDockButton3.Enabled := True;
     ProgrammerTypeCombo.Enabled := True;
     Editor.ModuleNameEdit.ReadOnly := False;
     Editor.FirmwareDirEdit.ReadOnly := False;
     Editor.ScriptDirEdit.ReadOnly := False;
     Editor.PhotoDirEdit.ReadOnly := False;
end;

//**********************************************************************
//
//  PROCEDURE:   ByName1Click: Popup an input dialoge to user for write search
//                             name. Search ini file by module's name or part name.
//                             Then, show search results list for user.
//
//  PARAMETERS:  Sender: TObject
//
//**********************************************************************
procedure TEditor.ByName1Click(Sender: TObject);
Var
   PartModuleName: String;
   ListValue: Integer;
begin
     PartModuleName := '';
     if SearchNameInputDlg.Execute then
     begin
     PartModuleName := SearchNameInputDlg.Value;
     if PartModuleName <> '' then
        begin
        SearchMatchedModules(PartModuleName);
        SearchResultList.Execute;
        ListValue := SearchResultList.Value;
               if ListValue>=0 then
               ReadModuleCfg(ProductList[ListValue].SectionID);
        end;
     end;
end;

//**********************************************************************
//
//  PROCEDURE:   SearchMatchedModules: Search Ini file by module's name.
//                                     Save all results into array
//                                     of ProductList.
//
//  PARAMETERS:  PartModuleName: String
//
//**********************************************************************
procedure TEditor.SearchMatchedModules(PartModuleName: String);
var
  LanTypeNo,ModuleTypeNo,ModuleTagNo,Counter: Integer;
  SectionID:String;
  IniFile: TIniFile;
begin
     SearchResultList.Items.Clear;
     if ParamStr1 <> '' then iniFileName := ParamStr1
     else iniFileName := ExtractFileDir(ParamStr(0))+ DEFAULT_INI_FILE_NAME;
     IniFile := TIniFile.Create(IniFileName);
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
             ProductList[Counter].ProductListIndex := Counter;
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

//**********************************************************************
//
//  PROCEDURE:   FindModuleByNameButtonClick :Start a form for find module
//                                            by name, when the button be
//                                            pressed.
//
//  PARAMETERS:  Sender: TObject
//
//**********************************************************************
procedure TEditor.FindModuleByNameButtonClick(Sender: TObject);
Var
   PartModuleName: String;
   ListValue: Integer;
begin
     PartModuleName := '';
     if SearchNameInputDlg.Execute then
     begin
     PartModuleName := SearchNameInputDlg.Value;
     if PartModuleName <> '' then
     begin
     SearchMatchedModules(PartModuleName);
     SearchResultList.Execute;
     ListValue := SearchResultList.Value;
     if ListValue>=0 then
     ReadModuleCfg(ProductList[ListValue].SectionID);
     end;
     end;
end;

//**********************************************************************
//
//  PROCEDURE:  AboutINIEditor1Click: Show INI Editor's version number
//                                    message.
//
//  PARAMETERS: Sender: TObject
//
//**********************************************************************
procedure TEditor.AboutINIEditor1Click(Sender: TObject);
begin
     ShowMessage('INI Editor Version 1.1.0');
end;

procedure TEditor.FirmwareDirEditChange(Sender: TObject);
begin
if FileExists(FirmwareDirEdit.Text) then FirmwareDirEdit.Color:=clWindow
else if FirmwareDirEdit.Text = '' then FirmwareDirEdit.Color:=clWindow
else FirmwareDirEdit.Color:=clYellow;

end;

procedure TEditor.ScriptDirEditChange(Sender: TObject);
begin
if FileExists(ScriptDirEdit.Text) then ScriptDirEdit.Color:=clWindow
else if ScriptDirEdit.Text = '' then ScriptDirEdit.Color:=clWindow
else ScriptDirEdit.Color:=clYellow;
end;

end.
