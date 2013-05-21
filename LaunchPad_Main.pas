{*=============================================================================
 |        Project:  DigifleX Production Programmer Launch Pad
 |
 |         Author:  Robert Yi JIANG
 |       Language:  Delphi 7
 |     To Compile:  In Delphi 7 develop environment with LMD Tools
 |     Creat Date:  16 DEC 2010
 |  Last modified:  16 DEC 2010  <<============After modifing, update this date.
 |
 |        Version:  2.0.1
 |
 +-----------------------------------------------------------------------------
 |
 |  Description:  A launch pad for different module programming application.This
 |                launch pad can helps operator to find out correct programming
 |                application. Then, this application can inserts serial number
 |                into Hex file or Mot file. After programming, it will loops back
 |                to be ready to program another same module or abort by user.
 |
 |        Input:  User selection on GUI
 |                Serial Number on bar-code sticker
 |                Configuration ini file for initialization
 |
 |       Output:  Modified Hex or MOT file with Serial Number
 |                External executable file calling (Programmers)
 |
 |     Features:  Before programming, operator have to go through a takeoff
 |                configuration checklist to make sure the Programmer, Firmware
 |                and PCB are perfect match. Operator should follow the process
 |                procedure as following.
 |
 |                Step 1: Select product type.
 |                        (Panel, Input, Output, Keypad, Power Supply, Others)
 |                Step 2: Select LAN type.
 |                        (OLD LAN or RS485)
 |                Step 3: Tick the drop down list or scroll list to pick product
 |                        Number.
 |                Step 4: Compare the PCB in hand with the Picture on the form.
 |                Step 5: Connect necessary connection on module, then, scan
 |                        bar-code to start programming.
 |                Step 6: disconnect module, then, repeat Step 5 until finish job.
 |
 |
 |
 |Features Not Included: 1.This application does not stop wrong firmware programing
 |                         into wrong module with same MCU.
 |                       2.This application does not connect any Database to store
 |                         product's programming results.
 |                       3.This application does not
 |
 |
 |   Known Bugs:  There are no known bugs remaining in this program.
 |
 *============================================================================}

unit LaunchPad_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDControl, LMDBaseControl, LMDBaseGraphicButton,IniFiles,
  LMDCustomMMButton, Menus, LMDCustomComponent, LMDShBase, LMDStarter,
  ImgList, LMDCustomImageList, LMDBitmapList, StdCtrls, LMDCustomButton,
  LMDTextButton, LMDBaseGraphicControl, LMDGraphicControl, LMDBaseImage,
  LMDCustomLImage, LMDLImage, LMDMMButton, lmdcont,
  LMDCustomGraphicLabel,
  LMDGraphicLabel, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDStaticText, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, ExtCtrls, LMDBaseController,
  LMDCustomContainer,
  LMDBackPanel, LMDSimplePanel, LMDCustomSheetControl,
  LMDPageControl;

type
  TfrmLaunch = class(TForm)
    LMDBitmapList1: TLMDBitmapList;
    exeOne: TLMDStarter;
    LMDMediaPlayer: TLMDStarter;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    CBT1: TMenuItem;
    About1: TMenuItem;
    ExitHelp1: TMenuItem;
    N1: TMenuItem;
    Preview_LMDLImage: TLMDLImage;
    Pg0_Item7: TLMDTextButton;
    Pg0_Item1: TLMDTextButton;
    Pg0_Item2: TLMDTextButton;
    Pg0_Item6: TLMDTextButton;
    Pg0_Item5: TLMDTextButton;
    Pg0_Item4: TLMDTextButton;
    Pg0_Item3: TLMDTextButton;
    LMDTextButton1: TLMDTextButton;
    LMDTextButton2: TLMDTextButton;
    LMDTextButton3: TLMDTextButton;
    LMDTextButton4: TLMDTextButton;
    LMDTextButton5: TLMDTextButton;
    LMDTextButton6: TLMDTextButton;
    LMDTextButton7: TLMDTextButton;
    LMDTextButton8: TLMDTextButton;
    LMDTextButton9: TLMDTextButton;
    LMDTextButton10: TLMDTextButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure LMDMMButtonMouseExit(Sender: TObject);
    procedure LMDMMButtonMouseEnter(Sender: TObject);


    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBT1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ExitHelp1Click(Sender: TObject);
    procedure Pg0_ItemMouseEnter(Sender: TObject);
    procedure Pg0_ItemMouseExit(Sender: TObject);
    procedure Pg0_Item1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Preview_LMDLImageMouseEnter(Sender: TObject);
    //procedure Preview_LMDLImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    m_WhatsThisHelp : Boolean;

  public
    { Public declarations }
  end;

var
  frmLaunch: TfrmLaunch;
   myini : TMeminiFile;

implementation

{$R *.dfm}




procedure TfrmLaunch.LMDMMButtonMouseExit(Sender: TObject);
begin
       With Sender as TLMDMMButton Do
                Cursor := crDefault;
end;

procedure TfrmLaunch.LMDMMButtonMouseEnter(Sender: TObject);
begin
        if frmLaunch.m_WhatsThisHelp = FALSE then
                With Sender as TLMDMMButton Do
                Cursor := crHandPoint;
end;





procedure TfrmLaunch.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  myprog : String;
  myparm : String;

begin
        case Key of
          Ord('p'),
          Ord('q'),
          Ord('r'),
          Ord('s'),
          Ord('t'),
          Ord('u'),
          Ord('v'),
          Ord('w'),
          Ord('x'),
          Ord('y'),
          Ord('z'),
          Ord('{'):
          begin

            myprog := IntToStr(Ord(Key) - Ord('p') + 1);
            myparm := myprog + 'P';
            myprog := myini.ReadString('Form', myprog, '' );
            myparm := myini.ReadString('Form', myparm, '' );

            frmLaunch.Enabled := FALSE;
            exeOne.Command := myprog;
            exeOne.Parameters := myparm;
            exeOne.Execute;
            frmLaunch.Enabled := TRUE;

          end
        end;

end;

procedure TfrmLaunch.CBT1Click(Sender: TObject);
begin
        frmLaunch.m_WhatsThisHelp := TRUE;
        frmLaunch.Cursor := crHelp;
        CBT1.Enabled := FALSE;
        ExitHelp1.Enabled := TRUE;


end;

procedure TfrmLaunch.About1Click(Sender: TObject);
begin
        ShowMessage('Digiflex Programmer Launch Pad (Rapid Verion DEC 2010) ');
end;

procedure TfrmLaunch.ExitHelp1Click(Sender: TObject);
begin
        frmLaunch.m_WhatsThisHelp := FALSE;
        frmLaunch.Cursor := crDefault;
        CBT1.Enabled := TRUE;
        ExitHelp1.Enabled := FALSE;
end;

procedure TfrmLaunch.Pg0_ItemMouseEnter(Sender: TObject);
begin
  With Sender as TLMDTextButton Do
    begin
      Preview_LMDLImage.Visible := true;
      Preview_LMDLImage.ListIndex := Tag;
    end;

end;

procedure TfrmLaunch.Pg0_ItemMouseExit(Sender: TObject);
begin
    //Preview_LMDLImage.ListIndex := 0;
    Preview_LMDLImage.Visible :=false;
end;

procedure TfrmLaunch.Pg0_Item1Click(Sender: TObject);
var
  myprog : String;
  myparm : String;
begin
  With Sender as TLMDTextButton Do
    myprog := IntToStr( Tag );
    myparm := myprog + 'P';
    myprog := myini.ReadString('Form', myprog, '' );
    myparm := myini.ReadString('Form', myparm, '' );

    frmLaunch.Enabled := FALSE;
    exeOne.Command := myprog;
    exeOne.Parameters := myparm;
    exeOne.Execute;
    frmLaunch.Enabled := TRUE;
end;

procedure TfrmLaunch.FormCreate(Sender: TObject);
var
  ininame : String;
begin
  ininame := ChangeFileExt( Application.ExeName, '.ini' );
  myini := TMeminiFile.Create( ChangeFileExt( Application.ExeName, '.ini' ));
end;

procedure TfrmLaunch.Preview_LMDLImageMouseEnter(Sender: TObject);
begin
      Preview_LMDLImage.Visible := true;
      Preview_LMDLImage.ListIndex := 0;
end;



end.
