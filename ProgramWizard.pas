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
 |  Description:  A Programmer Wizard for Product Line Operators to launch right
 |                programmer processes.This wizard could guide Operators to follow
 |                4 Steps to program correct module with correct firmware.
 |
 |        Input:  An Obejct of TLMDButton with its tag (Module ID)
 |
 |
 |       Output:  External executable file calling (Programmers)
 |
 |     Features:  This Wizard takesoff by one click on the [Programmer Wizard]
 |                button. Operator should follow the process procedure as following.
 |
 |                 Step 1: Select product type.
 |                        (Panel, Input, Output, Keypad, Power Supply, Others)
 |                 Step 2: Tick the product list to select
 |                 Step 3: Compare the PCB in hand with the Picture on the form.
 |                 Step 4: Launch the correct programmer with correct configuration.
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


unit ProgramWizard;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, LMDDockButton, LMDBaseEdit, LMDCustomEdit, LMDEdit,
  StdCtrls, LMDCustomButton, LMDButton, LMDBaseControl,
  LMDBaseGraphicControl, LMDGraphicControl, LMDHTMLLabel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomPanelFill,
  LMDCustomSheetControl, LMDPageControl, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomListBox, LMDCustomImageListBox, SerialNumberScan,
  LMDCustomCheckListBox, LMDCheckListBox,ModuleObject, LMDCustomScrollBox,
  LMDListBox, DBCtrls, ElXPThemedControl, ElListBox,inifiles, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, LMDCustomComponent, LMDShBase, LMDStarter,StrUtils;
type
  TProduct = record
      SectionID: String;
      ListBoxItemIndex: integer;
      ProductName: String;
  end;

type
  TProgWizardForm = class(TForm)
    ModuleSelectionPageCtr: TLMDPageControl;
    ModuleTypeSheet: TLMDTabSheet;
    LMDHTMLLabel14: TLMDHTMLLabel;
    InputModuleButton: TLMDButton;
    OutputModuleButton: TLMDButton;
    KeyPadModuleButton: TLMDButton;
    PowerSupplerModuleButton: TLMDButton;
    PanelButton: TLMDButton;
    DoorCtrModuleButton: TLMDButton;
    ExpanderButton: TLMDButton;
    OtherTypeModuleButton: TLMDButton;
    ProductsListSheet: TLMDTabSheet;
    PListTitleLabel: TLMDHTMLLabel;
    ProgrammerLauncher: TLMDTabSheet;
    Image1: TImage;
    LMDHTMLLabel16: TLMDHTMLLabel;
    LaunchProgrammerButton: TLMDButton;
    Label1: TLabel;
    LMDListBox1: TLMDListBox;
    Label2: TLabel;
    ModuleNameLabel: TLMDLabel;
    //NextPageButton: TLMDButton;
    PreviousPageButton: TLMDButton;
    LMDHTMLLabel1: TLMDHTMLLabel;
    LMDHTMLLabel2: TLMDHTMLLabel;
    ProgramTypeLabel: TLabel;
    exeLauncher: TLMDStarter;
    Label3: TLabel;
    Label4: TLabel;
    LMDButton1: TLMDButton;
    LMDButton2: TLMDButton;
    LMDButton3: TLMDButton;
    LMDButton4: TLMDButton;
    LMDButton5: TLMDButton;
    LMDButton6: TLMDButton;
    LMDButton7: TLMDButton;
    LMDButton8: TLMDButton;
    LMDHTMLLabel3: TLMDHTMLLabel;
    LMDHTMLLabel4: TLMDHTMLLabel;
    LMDHTMLLabel5: TLMDHTMLLabel;
    FirmwareNameLabel: TLabel;
    Timer1: TTimer;
    CautionFlashTimer: TTimer;
    BetaCautionLabel: TLMDHTMLLabel;
    ExitButton: TLMDButton;
    procedure ModuleTypeButtonClick(Sender: TObject);
    procedure LMDListBox1Select(Sender: TObject);
    procedure LMDListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PreviousPageButtonClick(Sender: TObject);
    //procedure NextPageButtonClick(Sender: TObject);
    procedure LaunchProgrammerButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProgramTypeLabelMouseEnter(Sender: TObject);
    procedure ProgramTypeLabelMouseLeave(Sender: TObject);
    procedure LMDListBox1DrawItem(Control: TWinControl; Index: Integer;
              Rect: TRect; State: TOwnerDrawState);
    procedure Timer1Timer(Sender: TObject);
    function  IsFirmwareBeta(ModuleFirewareName: String):Boolean;
    procedure CautionFlashTimerTimer(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    //procedure NextPageButtonClick(Sender: TObject);


  private
    { Private declarations }
    procedure SearchMatchedModules(ModuleTypeIndex: integer);
    procedure UpdateProductCheckForm(ItemIndex:integer);
    function  CreatTempMot(FirmwareDir:String):String;
    function  CreatDOMMot(ScriptDir,FirmwareDir:String):String;
    function  Creat_DOM_SN_HEX(ScriptDir,FirmwareDir:String):String;
    procedure PreparNECsIniFile(ScriptDir,FirmwareDir:String);   Overload;
    procedure PreparNECsIniFile(ScriptDir:String);   Overload;
    procedure HideButtons;
    procedure PrepareRenesasIniFile(ScriptDir: String); Overload;
    procedure PrepareRenesasIniFile(ScriptDir, FirmwareDir: String);    Overload;
    procedure JudgeAndAdjust();
    procedure CaptionRotateLeft();
    procedure CaptionShiftLeftRight();
  published
     
  public
    { Public declarations }

  end;

var
  ProgWizardForm: TProgWizardForm;
  ProductList: array of TProduct;
  iniFileName, TempPictureDir: String;
  Module: TModule;
  TempProgrammerTag: integer;
  wIcon, wButton:integer;
  TheCaption,ExpandString: String;
  SpaceNum,RIndex,InsertSpaceNum: Integer;
  IsRotate,IsRightShift,BetaCautionFlash: Boolean;
  FlashCount: integer;
const
     INPUT_MODULE = 1;
     OUTPUT_MODULE = 2;
     KEYPAD_MODULE = 3;
     POWERSUPPLER_MODULE = 4;
     PANEL = 5;
     DOOR_CONTROLER_MODULE = 6;
     EXPANDER_MODULE = 7;
     OTHER_TYPE_MODULE = 8;
     NO_PIC = '\NoPic.bmp';
     DEFAULT_INI_FILE_NAME = '\LaunchPad.ini';
     LOCKED = 1;
     UNLOCK = -1;
     UNUSED = 0;
      DIGIFLEX_FLASH_PROGRAMMER =1;
      NEC_PROGRAMMER = 2;
      ICD3_PROGRAMMER = 3;
      RENESAS_PROGRAMMER = 4;
      RENESAS_PROGRAMMER_DOM = 5;
      DIGIFLEX = 1;
      NEC = 2;
      ICD3 = 3;
      RENESAS = 4;
      RENESAS_DOM = 5;
      TEMP_SCRIPT = 'Renesas Programmer\FOUSB\Scripts\temp_script.script';
      //TEMP_SCRIPT = 'tempScript.script';
      TEMP_BAT = 'NEC Programmer\temp_bat.bat';
      NEC_INI = 'NEC Programmer\NEC Electronics Tools\QBP\V2.10\bin\qbp.ini' ;
      NEC_INI_DIR = 'NEC Programmer\NEC Electronics Tools\QBP\V2.10\bin\';
      TEMP_MOT_R='Renesas Programmer\temp.mot';
      TEMP_HEX_R='NEC Programmer\Temp.Hex';
implementation

{$R *.dfm}

function TProgWizardForm.IsFirmwareBeta(ModuleFirewareName: String):Boolean;
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
     CautionFlashTimer.Enabled:=False;end;
end;

procedure TProgWizardForm.ModuleTypeButtonClick(Sender: TObject);
var
   ModuleTypeTagStr: String;
   ModuleTypeTagInt: integer;
begin
    ModuleTypeTagInt := (Sender as TLMDButton).Tag;
    ModuleTypeTagStr := IntToStr(ModuleTypeTagInt);
    ModuleSelectionPageCtr.ActivePageIndex :=1;
    SearchMatchedModules(ModuleTypeTagInt);
    PreviousPageButton.Visible := True;
    //NextPageButton.Visible := False;

end;

procedure TProgWizardForm.LMDListBox1Select(Sender: TObject);
begin
     ModuleSelectionPageCtr.ActivePageIndex :=2;
     //NextPageButton.Visible := False;
     PreviousPageButton.Visible := True;
     UpdateProductCheckForm(LMDListBox1.ItemIndex);
end;

//**********************************************************************
//
//  PROCEDURE:    LMDListBox1MouseMove -
//
//
//
//  PARAMETERS:   -Sender: TObject;
//                -Shift: TShiftState;
//                -X, Y: Integer
//
//**********************************************************************
procedure TProgWizardForm.LMDListBox1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
{var lstIndex : Integer ;

begin
   with LMDListBox1 do
   begin
   if Items.Capacity <>0 then begin
    lstIndex:=SendMessage(Handle, LB_ITEMFROMPOINT, 0, MakeLParam(x,y)) ;
    if (lstIndex >= 0) and (lstIndex <= Items.Count) then
      begin
      Hint := Items[lstIndex];

      end
    else
      Hint := '';
    end;}
   var
      p: TPoint;
   begin
        p.x := x;
        p.y := y;
        LMDListBox1.ItemIndex := LMDListBox1.ItemAtPos(P, True);
   end;

 //end;



//**********************************************************************
//
//  PROCEDURE:    SearchMatchedModules - Search the matched modules by a
//                given index of module type. Store those key values into
//                an array of TProduct, which is public various.
//
//  PARAMETERS:   -ModuleTypeIndex : an integer which is reperesant Module
//                type.
//
//**********************************************************************
procedure TProgWizardForm.SearchMatchedModules(ModuleTypeIndex: integer);
var

  LanTypeNo,ModuleTypeNo,ModuleTagNo,Counter, EmptyPadNo,i,
  LastProductPin,PadNoleft: Integer;
  SectionID:String;
  IniFile: TIniFile;
begin
   LMDListBox1.Items.Clear;
   iniFileName := ExtractFilePath(ParamStr(0))+ExtractFileName(ParamStr(0)) ;
   Delete(iniFileName,length(iniFileName)-3,4);
  iniFileName := iniFileName +'.ini';
  IniFile := TIniFile.Create(IniFileName);
  Counter :=0;
  //EmptyPadNo := 0;

  for LanTypeNo:=1 to 2 do
  begin
    if LanTypeNo = (ModuleTypeIndex div 10) then
    for ModuleTypeNo:=1 to 8 do
    begin
      if ModuleTypeNo = (ModuleTypeIndex mod 10) then
         begin
           for ModuleTagNo:=1 to 20 do
           begin
           SectionID := IntToStr(LanTypeNo*1000+ModuleTypeNo*100+ModuleTagNo);
           if (IniFile.ReadInteger(SectionID,'Locker',0)=1) then Counter := Counter +1;
           end;
         end;
    end;
  end;
  label1.Caption := IntToStr(Counter);
  SetLength(ProductList, Counter);
  EmptyPadNo := 20- Counter;
  Counter :=0;
  LastProductPin := 1;
  //LastTestPin:=20;
  PadNoleft:= EmptyPadNo;

  for LanTypeNo:=1 to 2 do
    if LanTypeNo = (ModuleTypeIndex div 10) then
    begin
    if LanTypeNo = 1 then PListTitleLabel.Caption := 'RS485 Product List'
    else PListTitleLabel.Caption := 'OLD LAN Product List';
    for ModuleTypeNo:=1 to 8 do
      begin
      if ModuleTypeNo = (ModuleTypeIndex mod 10) then
         begin
           for ModuleTagNo:=1 to 20 do
           begin
           SectionID := IntToStr(LanTypeNo*1000+ModuleTypeNo*100+ModuleTagNo);
             if IniFile.ReadInteger(SectionID,'Locker',0)=1 then
             begin
             ProductList[Counter].SectionID := SectionID;
             ProductList[Counter].ProductName := IniFile.ReadString(SectionID,'ModuleName','Empty');
             //ProductList[Counter].ListBoxItemIndex := Counter;

             //Find out boundary of Final firmware and Test firmware, then pad suitable pads for separate them.
             if (Pos('est', ProductList[Counter].ProductName) = 0) and (Counter = 0)
                then
                begin
                ProductList[Counter].ListBoxItemIndex := Counter;
                LMDListBox1.Items.Add(ProductList[Counter].ProductName);
                LastProductPin := 1;
                end
             else if (Pos('est', ProductList[Counter-1].ProductName) =0)
                and
                (Pos('est', ProductList[Counter].ProductName) >0)
                then
                 begin
                      For i:=1 to EmptyPadNo do LMDListBox1.Items.Add('');
                      ProductList[Counter].ListBoxItemIndex := Counter+EmptyPadNo;
                      LMDListBox1.Items.Add(ProductList[Counter].ProductName);
                      PadNoleft :=0;
                      LMDListBox1.Items[Counter+EmptyPadNo-1] := 'TEST Firmwares';
                 end
             else if (Pos('est', ProductList[Counter-1].ProductName) >0)
                     and
                     (Pos('est', ProductList[Counter].ProductName) >0)
                  then
                  begin
                      LMDListBox1.Items.Add(ProductList[Counter].ProductName);
                      ProductList[Counter].ListBoxItemIndex := Counter+EmptyPadNo;
                  end
             else if (Pos('est', ProductList[Counter].ProductName) =0) and (Counter >0)
                  then
                  begin
                      LMDListBox1.Items[LastProductPin] := ProductList[Counter].ProductName;
                      ProductList[Counter].ListBoxItemIndex := LastProductPin;
                      LastProductPin := LastProductPin+1;
                  end;
             Counter := Counter +1;
             end;
           end;
         end;
      end;
      For i:=1 to PadNoleft do LMDListBox1.Items.Add('');

  end;
end;

//**********************************************************************
//
//  PROCEDURE:    UpdateProductCheckForm - Renew the last page of TabSheet
//                by reading the public various an array of TProduct.
//
//  PARAMETERS:   -ItemIndex : an integer index of the Item in previous
//                 page's listbox. This procedure will read item's tag as
//                 product's section ID in ini file.
//
//**********************************************************************
procedure TProgWizardForm.UpdateProductCheckForm(ItemIndex:integer);
var
IniFile: TIniFile;
PicDir,ProgrammerType,FirmwareFileName: String;
ProductListIndex,i,j:Integer;
begin
  iniFileName := ExtractFilePath(ParamStr(0))+ExtractFileName(ParamStr(0)) ;
  Delete(iniFileName,length(iniFileName)-3,4);
  IniFileName := iniFileName +'.ini';

  IniFile := TIniFile.Create(IniFileName);
  FModule := TModule.Create;
  ProductListIndex :=-1;

  for i:=0 to length(ProductList)-1 do
      if ProductList[i].ListBoxItemIndex = ItemIndex then ProductListIndex := i;

  if ProductListIndex = -1 then
     begin
       ModuleSelectionPageCtr.ActivePageIndex :=1;
       //NextPageButton.Visible := False;
       PreviousPageButton.Visible := True;
       end
  else
      begin
      FModule.ReadINI(IniFile,ProductList[ProductListIndex].SectionID);
      Label2.Caption := ProductList[ProductListIndex].SectionID;
      LaunchProgrammerButton.Tag := StrToInt(ProductList[ProductListIndex].SectionID);
      ModuleNameLabel.Caption := ProductList[ProductListIndex].ProductName;
      PicDir := IniFile.ReadString(ProductList[ProductListIndex].SectionID,'ModulePicDir','');
      ModuleNameLabel.Caption :=  FModule.ModuleName;
      FirmwareFileName := FModule.FirmwareDir;
      j :=LastDelimiter('\', FirmwareFileName);
      ProgWizardForm.Caption := ProgWizardForm.Caption + '  '+Copy(FirmwareFileName, 1, j);
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
       TempPictureDir := ExtractFileDir(ParamStr(0))+NO_PIC; //this line is simple Dir stack for switch two picturs.
       if (FileExists(PicDir) = false) then
          image1.Picture.LoadFromFile(ExtractFileDir(ParamStr(0))+NO_PIC)
       else begin
          image1.Picture.LoadFromFile(PicDir);
          TempPictureDir := PicDir;
       end;
       BetaCautionFlash :=IsFirmwareBeta(FModule.FirmwareDir);
       BetaCautionLabel.Visible := BetaCautionFlash;
  end;

end;

//**********************************************************************
//
//  PROCEDURE:    PreviousPageButtonClick - When PreviousPageButton be
//                clicked, this procedure will turn TabSheet to Previous
//                page if it is possible.
//
//  PARAMETERS:   -TObject :
//
//**********************************************************************
procedure TProgWizardForm.PreviousPageButtonClick(Sender: TObject);
begin
case ModuleSelectionPageCtr.ActivePageIndex of
2: begin
        ModuleSelectionPageCtr.ActivePageIndex :=1;
        //NextPageButton.Visible := True;
        PreviousPageButton.Visible := True;
   end;

1: begin
        ModuleSelectionPageCtr.ActivePageIndex :=0;
        //NextPageButton.Visible := True;
        PreviousPageButton.Visible := False;
   end;

0: begin
        ShowMessage('Front Step should not be pressed.');
        //NextPageButton.Visible := True;
        PreviousPageButton.Visible := False;
   end;
  end;
end;

//**********************************************************************
//
//  PROCEDURE:    NextPageButtonClick - When NextPageButton be clicked,
//                this procedure will turn TabSheet to next page if it is
//                possible.
//
//  PARAMETERS:   -TObject :
//
//**********************************************************************
{procedure TProgWizardForm.NextPageButtonClick(Sender: TObject);
begin

case ModuleSelectionPageCtr.ActivePageIndex of
0: begin
        ModuleSelectionPageCtr.ActivePageIndex :=1;
        NextPageButton.Visible := True;
        PreviousPageButton.Visible := True;
   end;

1: begin
        ModuleSelectionPageCtr.ActivePageIndex :=2;
        NextPageButton.Visible := False;
        PreviousPageButton.Visible := True;
   end;

2: begin
        ShowMessage('Front Step should not be pressed.');
        NextPageButton.Visible := False;
        PreviousPageButton.Visible := True;
   end;
  end;
  
end;}

//**********************************************************************
//
//  PROCEDURE:    LaunchProgrammerButtonClick - When LaunchProgrammerButton
//                be clicked, this procedure will make decision that use
//                which programmer and how to use it.
//
//  PARAMETERS:   -TObject : This procedure will read the button's tag to
//                           recognize Products
//
//**********************************************************************
procedure TProgWizardForm.LaunchProgrammerButtonClick(Sender: TObject);
var
SectionID,TempMotR,TempHexR: String;
ParameterString,CommandString: String;
begin
     With Sender as TLMDButton Do SectionID := IntToStr( Tag );
     iniFileName := ExtractFilePath(ParamStr(0))+ExtractFileName(ParamStr(0)) ;
     Delete(iniFileName,length(iniFileName)-3,4);
     iniFileName := iniFileName +'.ini';
     Module := TModule.Create(IniFileName,SectionID);
     IniFile := TIniFile.Create(IniFileName);
     ProgWizardForm.DoHide;
     Case Module.Programmer of

     /////////DIGIFLEX Parameter//////////
     // Parameter 1: CMD line parameter //
     /////////////////////////////////////
     DIGIFLEX:
     begin
     if (Pos('est', ModuleNameLabel.Caption) = 0) then
     ParameterString := '-actions=F|P|V -baudrate=57600 '
     else
     ParameterString := '-actions=F|P -baudrate=57600 ';

     ParameterString := ParameterString + IniFile.ReadString('SerialPort','PortNumber',' -com1 ');
     ParameterString := ParameterString + '"' + Module.FirmwareDir + '"';
     //ParameterString := ParameterString + ' "' + Module.ScriptDir+ '"';
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
               ParameterString := '"' + Module.FirmwareDir + '" ';
               ParameterString := ParameterString + '"' + Module.ModuleName + '" ';
               ParameterString := ParameterString + '"' + ExtractFilePath(ParamStr(0))+TEMP_BAT + '" /s';
               CommandString := ExtractFilePath(ParamStr(0))+IniFile.ReadString('Programmer','NEC_SN',' ');
               exeLauncher.Command := CommandString;
               // <FirmwareDir, ModuleName, .bat, /s>
               exeLauncher.Parameters := ParameterString;
               exeLauncher.Execute;
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
               PreparNECsIniFile(Module.ScriptDir,Module.FirmwareDir);
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
     ParameterString := '"' + Module.FirmwareDir + '" ';                 //paramete 1
     ParameterString := ParameterString + '"' + Module.ModuleName + '"'; //paramete 1+ paramete 2
     ParameterString := ParameterString + ' "' + Module.ScriptDir+ '" '; //paramete 1+ paramete 2+ Paramete 3
     //ParameterString := ParameterString + ' ' +    self.ReadAccountStatus
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
               TempMotR := CreatTempMot(Module.FirmwareDir);// make a temp mot file with short firmware name
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
     // Parameter 1: Module.ScriptDir   //
     /////////////////////////////////////
          else                        //Without Serial Number Writing
          begin
               TempMotR := CreatTempMot(Module.FirmwareDir);// make a temp mot file with short firmware name
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
               TempMotR := CreatDOMMot(Module.ScriptDir,Module.FirmwareDir);// make a temp mot file with short firmware name
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
          end;
     end;
   end;
   Label3.Caption := CommandString;
   Label4.Caption := ParameterString;
   ProgWizardForm.DoShow;
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
function TProgWizardForm.CreatTempMot(FirmwareDir:String):String;
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
//  PROCEDURE:    CreatTempMot - Creat a temp mot file with short renesas
//                mot file name.
//
//  PARAMETER:    -FirmwareDir:String  The Firmware .mot directory.
//
//  RETURN:String                      The temp mot file dir
//**********************************************************************
function TProgWizardForm.CreatDOMMot(ScriptDir,FirmwareDir:String):String;
var
   TempMotDir,line,vAddrString,vDomAddrString,vDOMLineString,vCentury,vDecade,vDoM: String;
   SourceText,TargetText,ScriptFile :textFile;
   vCount,vChkSum,i :integer;
   vDOMLineFlagBool :Boolean;
begin
    vChkSum := 0;
    //vCount := 0;
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
procedure TProgWizardForm.PreparNECsIniFile(ScriptDir,FirmwareDir:String);     //without serial number;
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
     i:= pos('NEC Programmer\',PrmStr);
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
procedure TProgWizardForm.PreparNECsIniFile(ScriptDir:String);      //for NEC with serial number
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
        //inc(CountTimes);
      end;
      WriteLn(TargetText,Line); //temp_bat.bat
      if (0 < pos('copy',Line)) then //in the line: copy ??????.ini qbp.ini
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




procedure TProgWizardForm.FormCreate(Sender: TObject);
begin

Left:=(Screen.Width-Width)  div 2;
Top:=0;
PreviousPageButton.Visible := false;
LMDListBox1.Style := LbOwnerDrawFixed;
//NextPageButton.Visible := false;
HideButtons;
BetaCautionFlash := false;
FlashCount := 1;
  IsRotate:=False;
  IsRightShift:=False;
  wIcon:=GetSystemMetrics(SM_CXSIZE);
  wButton:=GetSystemMetrics(SM_CXSIZE);
  Timer1.Enabled:=True;

  RIndex:=0;
  JudgeAndAdjust;
end;



//**********************************************************************
// 
//  PROCEDURE:    ProgramTypeLabelMouseEnter - When mouse moves into button
//                the image on the form will be changed to programmer
//                photo.
//
//  PARAMETERS:   -TObejct
//
//**********************************************************************
procedure TProgWizardForm.ProgramTypeLabelMouseEnter(Sender: TObject);
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

procedure TProgWizardForm.ProgramTypeLabelMouseLeave(Sender: TObject);
begin
     image1.Picture.LoadFromFile(TempPictureDir);
end;

procedure TProgWizardForm.LMDListBox1DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
 i:Integer;
begin

     LMDListBox1.Canvas.Pen.Style := PsClear;
     if odSelected in State then LMDListBox1.Canvas.Brush.Color := clMenuHighlight     //**************KEY POINT!!!!  "odSelected in State "
     else LMDListBox1.Canvas.Brush.Color := ClWhite;
     LMDListBox1.Canvas.Rectangle( Rect);

     //i := 0;
     if Pos('Test',LMDListBox1.ItemPart(Index,0))>0 then  // Item is test program
     begin
     LMDListBox1.Canvas.Font.Color := clRed;              //Change the test program item to red color.
     end;
     i := ((Rect.Right - Rect.Left)div 2)-(LMDListBox1.Canvas.TextWidth(LMDListBox1.ItemPart(Index,0))div 2);  //The start point of item word

     if Pos('TEST Firmwares',LMDListBox1.ItemPart(Index,0))>0 then    //Item is the title of test programmers
     begin
          LMDListBox1.Canvas.Font.Size :=20;                           //Give title a bigger font size
          i := ((Rect.Right - Rect.Left)div 2)-(LMDListBox1.Canvas.TextWidth('TEST Firmwares')div 2);//The start point of title word
          LMDListBox1.Canvas.Font.Style :=[fsBold];
          //Rect.Bottom := (Rect.Bottom + LMDListBox1.Canvas.Font.Height - Rect.Top) div 2 +Rect.Bottom;
         
          Rect.Top := Rect.Bottom + LMDListBox1.Canvas.Font.Height;
     end;

     LMDListBox1.ItemHeight := LMDListBox1.Canvas.Font.Height + 4;
     LMDListBox1.Canvas.TextOut(Rect.left+i,Rect.Top,LMDListBox1.Items[Index]);

   
//end;

end;

procedure TProgWizardForm.HideButtons;
var
  IniFile: TIniFile;
begin
   iniFileName := ExtractFilePath(ParamStr(0))+ExtractFileName(ParamStr(0)) ;
   Delete(iniFileName,length(iniFileName)-3,4);
   iniFileName := iniFileName +'.ini';
   IniFile := TIniFile.Create(IniFileName); 
   if (IniFile.ReadInteger('CustomizeButtoms','RS485_INPUT',1)=0) then InputModuleButton.Enabled := false else InputModuleButton.Enabled := true;
   if (IniFile.ReadInteger('CustomizeButtoms','RS485_OUTPUT',1)=0) then OutputModuleButton.Enabled:= false else OutputModuleButton.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','RS485_KEYPAD',1)=0) then KeyPadModuleButton.Enabled := false else KeyPadModuleButton.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','RS485_POWERSUPPLIER',1)=0) then PowerSupplerModuleButton.Enabled := false else PowerSupplerModuleButton.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','RS485_CONTROL_PANEL',1)=0) then PanelButton.Enabled := false else PanelButton.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','RS485_DOOR_CONTROLER',1)=0) then DoorCtrModuleButton.Enabled := false else DoorCtrModuleButton.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','RS485_EXPANDER',1)=0) then ExpanderButton.Enabled := false else ExpanderButton.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','RS485_OTHER',1)=0) then OtherTypeModuleButton.Enabled := false else OtherTypeModuleButton.Enabled:= true;

   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_INPUT',1)=0) then LMDButton1.Enabled := false else LMDButton1.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_OUTPUT',1)=0) then LMDButton2.Enabled := false else LMDButton2.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_KEYPAD',1)=0) then LMDButton3.Enabled := false else LMDButton3.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_POWERSUPPLIER',1)=0) then LMDButton4.Enabled := false else LMDButton4.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_CONTROL_PANEL',1)=0) then LMDButton5.Enabled := false else LMDButton5.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_DOOR_CONTROLER',1)=0) then LMDButton6.Enabled := false else LMDButton6.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_EXPANDER',1)=0) then LMDButton7.Enabled := false else LMDButton7.Enabled:= true;
   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_OTHER',1)=0) then LMDButton8.Enabled := false else LMDButton8.Enabled:= true;

end;


procedure TProgWizardForm.PrepareRenesasIniFile(ScriptDir: String);  //with Serial Number
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
      if (0 < pos('File=',Line))then
      begin
        //Line := 'File=C:\temp\sn'+FirmwareNameLabel.Caption;
        Line := 'File=C:\temp\sntemp.mot';
        inc(CountTimes);
      end;
      WriteLn(TargetText,Line);
     end;
     if (CountTimes > 2) then  ShowMessage('Error in script modifing');
     CloseFile(FileText);
     CloseFile(TargetText);
end;

procedure TProgWizardForm.PrepareRenesasIniFile(ScriptDir,  FirmwareDir: String); //Without Serial Number
var
   Line:String;
   FileText,TargetText :textFile;
   //CountNo:Integer;
   CountTimes: Integer;
begin
     CountTimes := 0;
     //LineNunber := 0;
     AssignFile(FileText,ScriptDir);
     AssignFile(TargetText,ExtractFilePath(ParamStr(0))+TEMP_SCRIPT);
     //AssignFile(TargetText,'C:\'+TEMP_SCRIPT);
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
      //inc(LineNunber);
     end;
     if (CountTimes > 2) then  ShowMessage('Error in script modifing');
     CloseFile(FileText);
     CloseFile(TargetText);
end;

procedure TProgWizardForm.CaptionRotateLeft();
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

procedure TProgWizardForm.CaptionShiftLeftRight();
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

procedure TProgWizardForm.Timer1Timer(Sender: TObject);
begin
     //TheCaption:=self.Caption + ':  '+FModule.FirmwareDir;
  if IsRotate then
    CaptionRotateLeft
  else
    CaptionShiftLeftRight;
end;
procedure TProgWizardForm.JudgeAndAdjust();
var
   i,Formeri,Lstr:integer;
begin
  Label1.Caption:=TheCaption;
  SpaceNum:=((Width-wIcon-wButton*3-wButton)-Label1.Width) div 3;
  if SpaceNum>=0 then
    begin
      ExpandString:=Concat(StringOfChar(' ',SpaceNum),TheCaption);
      self.Caption:=ExpandString;
    end
  else
    begin
      Timer1.Enabled:=False;
      Lstr:=Length(TheCaption);
      i:=0;Formeri:=i;
      Label1.Caption:='...';
      while (Label1.Width<(Width-wIcon-wButton*3-wButton)) and (i<Lstr) do
        begin
          Formeri:=i;
          if Ord(TheCaption[Lstr-i])>127 then
              Inc(i);
          Inc(i);
          Label1.Caption:=Concat('...',Copy(TheCaption,Lstr-(i-1),i));
        end;
      self.Caption:=Concat('...',Copy(TheCaption,Lstr-(Formeri-1),Formeri));
      
    end;
end;
procedure TProgWizardForm.CautionFlashTimerTimer(Sender: TObject);

begin
     FlashCount := FlashCount mod 2; //Beta Caution Flash has THREE color, 1:Red, 2:Yellow, 3:Lime.
     case FlashCount of
     0:BetaCautionLabel.Font.Color := clRed;
     1:BetaCautionLabel.Font.Color := clBlue;
     end;
     inc(FlashCount);
     BetaCautionLabel.Refresh;
end;

procedure TProgWizardForm.ExitButtonClick(Sender: TObject);
begin
     self.close;
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
function TProgWizardForm.Creat_DOM_SN_HEX(ScriptDir,FirmwareDir:String):String;
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
    vChkSum := (256 - (vChkSum mod 256)) mod 256;
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
    vChkSum := (256 - (vChkSum mod 256)) mod 256;
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


end.