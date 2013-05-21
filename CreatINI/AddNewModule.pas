unit AddNewModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomButton, LMDButton, Menus,
  LMDCustomSheetControl, LMDPageControl, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDButtonPanel, LMDControl,
  LMDCustomControl, LMDCustomPanel, ExtCtrls, LMDDockButton,
  LMDBaseControl, LMDBaseGraphicControl, LMDGraphicControl, LMDHTMLLabel,
  LMDBaseEdit, LMDCustomEdit, LMDEdit, ModuleObject,inifiles,ModifyINI,
  LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton, ExtDlgs,
  LMDFill;

type
  TAddNewModuleForm = class(TForm)
    FrontStepButton: TLMDButton;
    NextStepButton: TLMDButton;
    CancelButton: TLMDButton;
    ModuleSelectionPageCtr: TLMDPageControl;
    ModuleTypeSheet: TLMDTabSheet;
    InputModuleButton: TLMDButton;
    OutputModuleButton: TLMDButton;
    KeyPadModuleButton: TLMDButton;
    PowerSupplerModuleButton: TLMDButton;
    PanelButton: TLMDButton;
    DoorCtrModuleButton: TLMDButton;
    ExpanderButton: TLMDButton;
    OtherTypeModuleButton: TLMDButton;
    LANTypeSheet: TLMDTabSheet;
    ModuleCfgSheet1: TLMDTabSheet;
    SaveButton: TLMDButton;
    ModuleNameEdit: TLMDEdit;
    LMDHTMLLabel1: TLMDHTMLLabel;
    LMDHTMLLabel2: TLMDHTMLLabel;
    FirmwareDirEdit: TLMDEdit;
    FirmwareDockButton: TLMDDockButton;
    ModuleSectionIDLabel1: TLMDHTMLLabel;
    LMDHTMLLabel5: TLMDHTMLLabel;
    ModuleCfgSheet2: TLMDTabSheet;
    ModuleCfgSheet3: TLMDTabSheet;
    Image1: TImage;
    LMDDockButton3: TLMDDockButton;
    PhotoDirEdit: TLMDEdit;
    LMDHTMLLabel9: TLMDHTMLLabel;
    ModuleSectionIDLabel3: TLMDHTMLLabel;
    LMDHTMLLabel16: TLMDHTMLLabel;
    LMDHTMLLabel14: TLMDHTMLLabel;
    SelectedModuleTypeText: TLMDHTMLLabel;
    OpenDialog: TOpenDialog;
    OpenPictureDialog: TOpenPictureDialog;
    IniFileDir: TLabel;
    LMDHTMLLabel12: TLMDHTMLLabel;
    SelectedLANTypeText: TLMDHTMLLabel;
    RS485Button: TLMDButton;
    OldLANButton: TLMDButton;
    LMDHTMLLabel13: TLMDHTMLLabel;
    LMDHTMLLabel10: TLMDHTMLLabel;
    ProgrammerTypeCombo: TComboBox;
    ScriptDirEdit: TLMDEdit;
    LMDHTMLLabel11: TLMDHTMLLabel;
    ModuleSectionIDLabel2: TLMDHTMLLabel;
    ScriptDockButton: TLMDDockButton;
    LMDFill1: TLMDFill;
    procedure ModuleTypeButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LanTypeButtonClick(Sender: TObject);

    procedure NextStepButtonClick(Sender: TObject);
    procedure FrontStepButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FirmwareDockButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure PhotoDirEditChange(Sender: TObject);
    procedure LMDDockButton3Click(Sender: TObject);
    procedure ScriptDockButtonClick(Sender: TObject);
  private
    { Private declarations }
    IniFileName,SectionID : String;
    Function FindFirstFreeSectionID(IniFileName,LanType,ModuleType:String):String;
    Function FindLastFreeSectionID(IniFileName,LanType,ModuleType:String):String;
  public
    { Public declarations }

  end;

var
  AddNewModuleForm: TAddNewModuleForm;

  Module: TModule;
  LanTypeTag,ModuleTypeTag: String;
implementation

{$R *.dfm}

//**********************************************************************
//
//  PROCEDURE:  ModuleTypeButtonClick
//
//  PARAMETERS: Sender: TObject
//
//**********************************************************************
procedure TAddNewModuleForm.ModuleTypeButtonClick(Sender: TObject);
begin
     SelectedModuleTypeText.Font.Color := ClBlue;
     ModuleTypeTag :=IntToStr((Sender as TLMDButton).Tag);
     SelectedModuleTypeText.Caption := (Sender as TLMDButton).Caption;
     ModuleSelectionPageCtr.ActivePageIndex :=2;
        ModuleSectionIDLabel1.Caption := '['+Self.FindFirstFreeSectionID(IniFileName,LanTypeTag,ModuleTypeTag)+']';
        ModuleSectionIDLabel2.Caption := ModuleSectionIDLabel1.Caption;
        ModuleSectionIDLabel3.Caption := ModuleSectionIDLabel1.Caption;
        Module := TModule.Create(ModuleSectionIDLabel1.Caption);

end;


//**********************************************************************
//
//  PROCEDURE:   LanTypeButtonClick
//
//  PARAMETERS:  Sender: TObject
//
//**********************************************************************
procedure TAddNewModuleForm.LanTypeButtonClick(Sender: TObject);
begin
     SelectedLANTypeText.Font.Color:= clBlue;
     LanTypeTag :=IntToStr((Sender as TLMDButton).Tag);
     SelectedLANTypeText.Caption := (Sender as TLMDButton).Caption;
     ModuleSelectionPageCtr.ActivePageIndex :=1;
     FrontStepButton.Visible := True;
end;


//**********************************************************************
//
//  PROCEDURE:  FormCreate
//
//  PARAMETERS: Sender: TObject
//
//**********************************************************************
procedure TAddNewModuleForm.FormCreate(Sender: TObject);
begin
     //SectionID := 'NNNN';
     self.IniFileName := ModifyINI.IniFileName;
     FrontStepButton.Visible := False;
     SaveButton.Visible := False;
end;


//**********************************************************************
//
//  Function:    FindFirstFreeSectionID
//
//  PARAMETERS:  IniFileName :String
//               LanType :String
//               ModuleType:String
//  RESULT:
//
//**********************************************************************
Function TAddNewModuleForm.FindFirstFreeSectionID(IniFileName,LanType,ModuleType:String):String;
var
   SectionID,SectionIDNumber,ModuleTagStr: String;
   ModuleTag: integer;
   IniFile: TInifile;
begin
IniFIle := TIniFile.Create(IniFileName);
ModuleTag := 1;
SectionID := 'LMT';    //L: Lan Type Number; M: Module Type Number; T: Module Tag Number
SectionID := StringReplace(SectionID,'L',LanType,[]);

SectionID := StringReplace(SectionID,'M',ModuleType,[]);

SectionIDNumber := StringReplace(SectionID,'T','01',[]);
While IniFile.ReadInteger(SectionIDNumber,'Locker',0) = LOCKED do
      begin
           inc(ModuleTag);
           if ModuleTag<10 then ModuleTagStr := '0'+IntToStr(ModuleTag)
           else ModuleTagStr := IntToStr(ModuleTag);

           SectionIDNumber := StringReplace(SectionID,'T',ModuleTagStr,[]);
      end;//{While}
if ModuleTag>20 then Result := '0' else Result := SectionIDNumber;
Inifile.Free;
end;//{Function FindFirstFreeSectionID}


//**********************************************************************
//
//  Function:   FindLastFreeSectionID
//
//  PARAMETERS: IniFileName :String
//              LanType :String
//              ModuleType:String
//  RESULT:     String
//
//**********************************************************************
Function TAddNewModuleForm.FindLastFreeSectionID(IniFileName,LanType,ModuleType:String):String;
var
   SectionID,SectionIDNumber,ModuleTagStr: String;
   ModuleTag: integer;
   IniFile: TInifile;
begin
IniFile := TIniFile.Create(IniFileName);
ModuleTag := 20;
SectionID := 'LMT';    //L: Lan Type Number; M: Module Type Number; T: Module Tag Number
SectionID := StringReplace(SectionID,'L',LanType,[]);

SectionID := StringReplace(SectionID,'M',ModuleType,[]);

SectionIDNumber := StringReplace(SectionID,'T','20',[]);
While IniFile.ReadInteger(SectionIDNumber,'Locker',0) = LOCKED do
      begin
           dec(ModuleTag);
           if ModuleTag<10 then ModuleTagStr := '0'+IntToStr(ModuleTag)
           else ModuleTagStr := IntToStr(ModuleTag);

           SectionIDNumber := StringReplace(SectionID,'T',ModuleTagStr,[]);
      end;//{While}
if ModuleTag<1 then Result := '0' else Result := SectionIDNumber;
Inifile.Free;
end;//{Function FindFirstFreeSectionID}


//**********************************************************************
//
//  PROCEDURE:  NextStepButtonClick
//
//  PARAMETERS: Sender: TObject
//
//**********************************************************************
procedure TAddNewModuleForm.NextStepButtonClick(Sender: TObject);
begin

case ModuleSelectionPageCtr.ActivePageIndex of
0: begin
        if SelectedLANTypeText.Caption <> 'LAN Type' then
        begin
        ModuleSelectionPageCtr.ActivePageIndex :=1;
        FrontStepButton.Visible := True;
        
        end;
   end;

1: begin
        if SelectedModuleTypeText.Caption <> 'Module Type' then
        ModuleSelectionPageCtr.ActivePageIndex :=2;
        ModuleSectionIDLabel1.Caption := '['+Self.FindFirstFreeSectionID(IniFileName,LanTypeTag,ModuleTypeTag)+']';
        ModuleSectionIDLabel2.Caption :=ModuleSectionIDLabel1.Caption;
        ModuleSectionIDLabel3.Caption :=ModuleSectionIDLabel1.Caption;
        Module := TModule.Create(Self.FindFirstFreeSectionID(IniFileName,LanTypeTag,ModuleTypeTag));
   end;

2: begin
        if (ModuleNameEdit.Text <> '') and (FirmwareDirEdit.Text <> '') then
        begin
             Module.ModuleName := ModuleNameEdit.Text;
             Module.SectionID := Self.FindFirstFreeSectionID(IniFileName,LanTypeTag,ModuleTypeTag);
             if Pos('est',ModuleNameEdit.Text)>0 then
             begin
                  Module.SectionID := Self.FindLastFreeSectionID(IniFileName,LanTypeTag,ModuleTypeTag);
                  ModuleSectionIDLabel1.Caption := Module.SectionID;
                  ModuleSectionIDLabel2.Caption :=Module.SectionID;
                  ModuleSectionIDLabel3.Caption :=Module.SectionID;
             end;
             Module.FirmwareDir := FirmwareDirEdit.Text;
             ModuleSelectionPageCtr.ActivePageIndex :=3;
        end;
   end;

3: begin
        if ProgrammerTypeCombo.Text <> '' then
        begin
        ModuleSelectionPageCtr.ActivePageIndex :=4;
        Module.Programmer := ProgrammerTypeCombo.ItemIndex;
        Module.ScriptDir := ScriptDirEdit.Text;
        NextStepButton.Visible := False;
        SaveButton.Visible := True;
        end;
   end;

4: ShowMessage('Next Step should not be pressed.');
  end;

end;


//**********************************************************************
//
//  PROCEDURE:   FrontStepButtonClick
//
//  PARAMETERS:  Sender: TObject
//
//**********************************************************************
procedure TAddNewModuleForm.FrontStepButtonClick(Sender: TObject);
begin
case ModuleSelectionPageCtr.ActivePageIndex of
4: begin
        NextStepButton.Visible := true;
        SaveButton.Visible := False;
        ModuleSelectionPageCtr.ActivePageIndex :=3;
   end;

3: begin
        ModuleSelectionPageCtr.ActivePageIndex :=2;
   end;

2: begin
        ModuleSelectionPageCtr.ActivePageIndex :=1;
   end;

1: begin
        ModuleSelectionPageCtr.ActivePageIndex :=0;
        FrontStepButton.Visible := False;
   end;

0: ShowMessage('Front Step should not be pressed.');
  end;
end;


//**********************************************************************
//
//  PROCEDURE:   CancelButtonClick
//
//  PARAMETERS:  Sender: TObject
//
//**********************************************************************
procedure TAddNewModuleForm.CancelButtonClick(Sender: TObject);
begin
     Close;
     module.Free;
end;


//**********************************************************************
//
//  PROCEDURE:   FirmwareDockButtonClick
//
//  PARAMETERS:  Sender: TObject
//
//**********************************************************************
procedure TAddNewModuleForm.FirmwareDockButtonClick(Sender: TObject);
begin

     Opendialog.FileName := '';
     Opendialog.InitialDir := SERVER_FIRMWARE_DIR;
     OpenDialog.Filter := 'Firmware File(*.hex) or MOT File(*.mot)|*.hex;*.mot';
     OpenDialog.Execute;
     FirmwareDirEdit.Text := Opendialog.FileName;
     OpenDialog.Filter := '';

end;


//**********************************************************************
//
//  PROCEDURE:   SaveButtonClick
//
//  PARAMETERS:  Sender: TObject
//
//**********************************************************************
procedure TAddNewModuleForm.SaveButtonClick(Sender: TObject);
begin

     IniFile := TIniFile.Create(IniFileName);
     IniFileDir.Caption :=  IniFileName;
     Module.PicDir := PhotoDirEdit.Text;
     Module.Locker := LOCKED;
     Module.WriteINI(IniFile);
     Inifile.Free;
     module.Free;
     Close;
end;


//**********************************************************************
//
//  PROCEDURE:  PhotoDirEditChange
//
//  PARAMETERS: Sender: TObject
//
//**********************************************************************
procedure TAddNewModuleForm.PhotoDirEditChange(Sender: TObject);
begin
if FileExists(PhotoDirEdit.Text) = false then image1.Picture.LoadFromFile(ExtractFileDir(ParamStr(0))+NO_PIC)
else image1.Picture.LoadFromFile(PhotoDirEdit.Text);
end;


//**********************************************************************
//
//  PROCEDURE:  LMDDockButton3Click
//
//  PARAMETERS: Sender: TObject
//
//**********************************************************************
procedure TAddNewModuleForm.LMDDockButton3Click(Sender: TObject);
begin
//add a specific file type of Picture file.
     OpenPictureDialog.InitialDir := SERVER_ARTWORKS_DIR;
     OpenPictureDialog.FileName := '';
     OpenPictureDialog.Filter := 'Bit Map File(*.BMP)|*.bmp';
     OpenPictureDialog.Execute;
     PhotoDirEdit.Text := OpenPictureDialog.FileName;
     if FileExists(PhotoDirEdit.Text) = false then image1.Picture.LoadFromFile(ExtractFileDir(ParamStr(0))+NO_PIC)
     else image1.Picture.LoadFromFile(PhotoDirEdit.Text);
end;


//**********************************************************************
//
//  PROCEDURE:  ScriptDockButtonClick
//
//  PARAMETERS: Sender: TObject
//
//**********************************************************************
procedure TAddNewModuleForm.ScriptDockButtonClick(Sender: TObject);
begin
     Opendialog.FileName := '';
     Opendialog.InitialDir := SERVER_FIRMWARE_DIR;
     OpenDialog.Filter := 'Script File(*.script, *.bat, *.ini)|*.Script;*.bat;*.ini';
     OpenDialog.Execute;
     ScriptDirEdit.Text := Opendialog.FileName;
     OpenDialog.Filter := '';
end;

end.
