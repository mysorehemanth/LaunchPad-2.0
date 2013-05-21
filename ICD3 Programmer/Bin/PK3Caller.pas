unit ICD3Caller;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, Menus, LMDCustomButton, LMDDockButton;

type
  TForm1 = class(TForm)
    CallCMDButton: TButton;
    CMDedit: TEdit;
    CleanButton: TButton;
    ReleaseButton: TButton;
    VerifyButton: TButton;
    BlankCheckButton: TButton;
    ProgramButton: TButton;
    EraseButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Button7: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    MainMenu1: TMainMenu;
    Model1: TMenuItem;
    Operator1: TMenuItem;
    Developer1: TMenuItem;
    Label3: TLabel;
    Label7: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    FindPDLineButton: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LMDDockButton1: TLMDDockButton;
    OpenDialog1: TOpenDialog;
    Label11: TLabel;
    File1: TMenuItem;
    Open1: TMenuItem;
    Exit1: TMenuItem;
    Memo1: TMemo;
    ExeDirectory: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    procedure CallCMDButtonClick(Sender: TObject);
    procedure CMDeditChange(Sender: TObject);
    procedure CleanButtonClick(Sender: TObject);
    procedure BlankCheckButtonClick(Sender: TObject);
    procedure VerifyButtonClick(Sender: TObject);
    procedure ReleaseButtonClick(Sender: TObject);
    procedure ProgramButtonClick(Sender: TObject);
    procedure EraseButtonClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Developer1Click(Sender: TObject);
    procedure Operator1Click(Sender: TObject);
    procedure Edit2MouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure FindPDLineButtonClick(Sender: TObject);
    procedure LMDDockButton1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    //procedure Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
   
    private

    procedure InsertHexNumber(SourceFileName,TargetFileName:String;HNLocation:integer;HN:String;DefaultEmptyHexNo:String);
    function  RunDosInMemo(DosApp:String;AMemo:TMemo;PassKeyWords,FailKeyWords:String): integer;
    function  FindLineLocation(FileName:String;KeyWords:String): integer;
    procedure IndicatorController(Flag: integer);
    procedure EntireProgammingProcess();
    procedure InsertDATEnSN();

    public

    { Public declarations }
  end;
const
  DEFAULT_EMPTY_SN = '7856000034120000';
  DEFAULT_EMPTY_PD = '01010000da070000';
  MID_FILE_NAME = '\Middle_Hex.hex';
  FINAL_FILE_NAME = '\Final_Hex.hex';
  DEFAULT_HEX_FILE_NAME = '\NO_ACC_df150.hex';
var
  //= 'Not_Final.hex';
  Form1: TForm1;
  ExeFileName: String;
  HexFileName: String;
  Result: String;
  //SerialNumberLine: String;
  SerialNumber : String;
  ExeDirctory: String;
implementation

{$R *.dfm}


function TForm1.RunDosInMemo(DosApp:String;AMemo:TMemo;PassKeyWords,FailKeyWords:String): integer;
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
   {if edit7.Text <> 'HEX File Name' then HexFileName := edit7.Text
   else HexFileName := 'Not_Final.hex';
   }
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
        AMemo.Text := AMemo.text + String(Buffer) ;

        //Temp
        if (0 < pos(PassKeyWords,String(Buffer))) then PassCMD := 1 else PassCMD := -1;
        if (0 < pos(FailKeyWords,String(Buffer))) then FailCMD := -1 else FailCMD := 0;
        Result := PassCMD;
        {if (0 < pos(PassKeyWords,String(Buffer))) then PassCMD := 1 else PassCMD := 0;
        if (0 < pos(FailKeyWords,String(Buffer))) then FailCMD := -1 else FailCMD := 0;
        Result := PassCMD + FailCMD;  }
        //WriteLn(Result);
      until (BytesRead < ReadBuffer) ;
   end;
   FreeMem(Buffer) ;
   CloseHandle(ProcessInfo.hProcess) ;
   CloseHandle(ProcessInfo.hThread) ;
   CloseHandle(ReadPipe) ;
   CloseHandle(WritePipe) ;
   end;
  end;

procedure TForm1.CallCMDButtonClick(Sender: TObject);
  begin {button 1 code}
    RunDosInMemo(ExeFileName,Memo1,' ',' ') ;              {'chkdsk.exe c:\'}
  end;

procedure TForm1.CMDeditChange(Sender: TObject);
begin
ExeFileName := CMDedit.Text;
end;

procedure TForm1.CleanButtonClick(Sender: TObject);
begin
Memo1.Text := '';
end;

procedure TForm1.BlankCheckButtonClick(Sender: TObject);
begin
       //GUI display
       CMDedit.Text := Concat(ExtractFileDir(ParamStr(0)),'\ICD3_Pack\ICD3CMD -P24FJ64GA004 -C');
       Label2.Visible := False;
       Label1.Visible := False;
       Label3.Caption := 'BlankChecking...';
       //execute
       ShowMessage('ICD3CMD or MicroChip has Bugs of Blank Checking.');
       //IndicatorController( RunDosInMemo(CMDedit.Text,Memo1,'Device is blank', 'Failed to perform Blank Check'));
end;

procedure TForm1.VerifyButtonClick(Sender: TObject);

begin
       //Decide Hex File Name
       if edit7.Text <> '' then HexFileName := edit7.Text
       else HexFileName := DEFAULT_HEX_FILE_NAME;

       //GUI display
       CMDedit.Text := Concat(ExtractFileDir(ParamStr(0)),'\ICD3_Pack\ICD3CMD -P24FJ64GA004 -F"',HexFileName,'" -Y');
       Label2.Visible :=False;
       Label1.Visible := False;
       Label3.Caption := 'Verifing...';
       
       //execute
       IndicatorController(RunDosInMemo(CMDedit.Text,Memo1,'Verify complete','Failed to perform Verify'));
end;

procedure TForm1.ReleaseButtonClick(Sender: TObject);
begin
       //GUI display
       CMDedit.Text := Concat(ExtractFileDir(ParamStr(0)),'\ICD3_Pack\ICD3CMD -P24FJ64GA004 -L');
       Label2.Visible := False;
       Label1.Visible := False;
       Label3.Caption := 'Releasing...';

       //execute
       IndicatorController(RunDosInMemo(CMDedit.Text,Memo1,'Device ID Revision','RobertFilled'));
end;

procedure TForm1.ProgramButtonClick(Sender: TObject);
var
RestLen:integer;
begin
       //Decide Hex File Name
       if edit7.Text <> '' then HexFileName := edit7.Text
       else HexFileName := Concat(ExtractFileDir(ParamStr(0)),DEFAULT_HEX_FILE_NAME);

       //GUI display
       CMDedit.Text := Concat(ExtractFileDir(ParamStr(0)),'\ICD3_Pack\ICD3CMD -P24FJ64GA004 -F"',HexFileName,'" -M');
       Label2.Visible := False;
       Label1.Visible := False;
       Label3.Caption := 'Programming...';
       //execute
       IndicatorController( RunDosInMemo(CMDedit.Text,Memo1,'Programming/Verify complete','Failed to' ));
end;

procedure TForm1.EraseButtonClick(Sender: TObject);
begin
       //GUI display
       CMDedit.Text := Concat(ExtractFileDir(ParamStr(0)),'\ICD3_Pack\ICD3CMD -P24FJ64GA004 -E');
       Label2.Visible := False;
       Label1.Visible := False;
       Label3.Caption := 'Erasing...';

       //execute
       IndicatorController(RunDosInMemo(CMDedit.Text,Memo1,'Erase device complete','RobertFilled') );
end;



function TForm1.FindLineLocation(FileName:String;KeyWords:String): integer;
   var
    Line:String;
    FileText:textFile;
    CountNo:Integer;
    CountTimes: Integer;
  begin
    CountTimes := 0;
    AssignFile(FileText,FileName);
    Reset(FileText);
    CountNo := 0;
    Result := -1;
    while not eof(FileText) do
    begin
      inc(CountNo);
      Readln(FileText,Line);
      if (0 < pos(KeyWords,Line))then
      begin
        Result := CountNo;
        inc(CountTimes);
        //break;
      end;
    end;
    if (CountTimes > 2) then  Label10.Caption := 'The SN Line not Unique';
  CloseFile(FileText);
end;



procedure TForm1.Button7Click(Sender: TObject);
begin
  if edit7.Text <> '' then
    begin
       HexFileName := edit7.Text ;

    end
  else HexFileName := Concat(ExtractFileDir(ParamStr(0)),DEFAULT_HEX_FILE_NAME);
  Edit3.Text := IntToStr(FindLineLocation( HexFileName,DEFAULT_EMPTY_SN)) ;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);  //waiting "Enter" pressed
var
   RestLen:integer;
   //SNLineNo,PDLineNo:integer;    //SN: Serial Number  ;  PD: Producting Date
begin
     Label1.Visible := False;
     Label2.Visible := False;

     if Key = #13 then   //when press ENTER
        if Edit2.GetTextLen<6 then     //When Serial Number shorter than 6
        else begin
             if Edit2.GetTextLen>8 then Edit2.Text := ''    //if Serial Number
             else begin
                  RestLen := 8 - Edit2.GetTextLen;
                  if RestLen>=0 then
                    begin
                    InsertDATEnSN();
                    EntireProgammingProcess();
                    
                    end
                end
             end
     else begin
          if not(Key in ['0'..'9'])and not(Key = #8) then
             begin
             Edit4.Text := 'non-numeric';
             //Edit2.  .Text := '';  //remove last Non-numeric char
             end
          else begin
               if Edit2.GetTextLen>=8 then Edit2.Text := ''
               else
          end
     end;
end;

Procedure TForm1.InsertDATEnSN();
var
   RestLen:integer;
   //CurrentDate:TDateTime;
   SNLineNo,PDLineNo:integer;    //SN: Serial Number  ;  PD: Producting Date
   ProductDate:String;
begin
   Label3.Visible := True;
   SerialNumber := edit2.Text;
   RestLen := 8 - Edit2.GetTextLen;
   SerialNumber := StringOfChar('0',RestLen)+SerialNumber;  //pad '0' to Edit2.text to make it equai 8 bits
   Edit2.text := '';
   Edit5.text := SerialNumber;
   if edit7.Text <> '' then HexFileName := edit7.Text
   else HexFileName := Concat(ExtractFileDir(ParamStr(0)),DEFAULT_HEX_FILE_NAME);

   
   //Modify Producting date
   ProductDate := DateToStr(Date);
   if pos('/',ProductDate)=2 then ProductDate := StuffString(ProductDate,0,0,'0');
   ProductDate := StringReplace(ProductDate,'/','',[]);
   if pos('/',ProductDate)=4 then ProductDate := StuffString(ProductDate,3,0,'0');
   ProductDate := StringReplace(ProductDate,'/','',[]);
   Label9.Caption := ProductDate;
   PDLineNo := FindLineLocation(HexFileName,DEFAULT_EMPTY_PD);
   InsertHexNumber(HexFileName,Concat(ExtractFileDir(ParamStr(0)),MID_FILE_NAME),PDLineNo,ProductDate,DEFAULT_EMPTY_PD);
   //Modify Serial Number
   SNLineNo := FindLineLocation(HexFileName,DEFAULT_EMPTY_SN);
   InsertHexNumber(Concat(ExtractFileDir(ParamStr(0)),MID_FILE_NAME),Concat(ExtractFileDir(ParamStr(0)),FINAL_FILE_NAME),SNLineNo,SerialNumber,DEFAULT_EMPTY_SN);

   //EntireProgammingProcess();
end;
{}
Procedure TForm1.InsertHexNumber(SourceFileName,TargetFileName:String;HNLocation:Integer;HN:String;DefaultEmptyHexNo:String);
var
  HexLine:String;
  FileText,FileText2:textFile;
  CountNo :Integer;
  HNinHex:String;
  ADDR, count: integer;
  CHKSUM,SUMLINE,RECLEN,RECTYPE,DATA:BYTE;
  t:shortstring;
begin
    AssignFile(FileText,SourceFileName);
    Reset(FileText);
    CountNo := 0;
    while not (CountNo = HNLocation) do
    begin
      if eof(FileText) then break;
      inc(CountNo);
      Readln(FileText,HexLine);
    end;
    Form1.Edit4.Text := HexLine;
    //Insert Hex Number into HexLine as correct sequence.
    HNinHex := Concat(Copy(HN,7,2),Copy(HN,5,2),'0000',Copy(HN,3,2),Copy(HN,1,2),'0000');
    HNinHex := StringReplace(HexLine,DefaultEmptyHexNo,HNinHex,[]);  //default empty serial number is 12345678

    //Correct CheckSum Value;
    t := '$' + copy(HNinHex,2,2); // get length
    RECLEN := strtoint(t);
    CHKSUM := 0;
    CHKSUM := CHKSUM + RECLEN;
    t := '$' +copy(HexLine,4,4); // get address
    ADDR := strtoint(t);
    CHKSUM := CHKSUM +lo(ADDR)+hi(ADDR);
    t := '$' +copy(HNinHex,8,2);
    RECTYPE := strtoint (t);
    CHKSUM := CHKSUM+RECTYPE;
    count := 0;
    while (count < RECLEN) do begin
    t := '$' + copy(HNinHex, 10+2*count,2);
    DATA := strtoint(t);
    CHKSUM := CHKSUM +DATA;
    inc(count);
    end;

    //make checksum
    SUMLINE:= 0-CHKSUM;
    HNinHex := StuffString(HNinHex,(10+2*count),2,IntToHex(SUMLINE,2));
    Form1.Edit6.Text := HNinHex;

    //save the modified Hex line into a final Hex file
    AssignFile(FileText2,TargetFileName);
    ReWrite(FileText2);
    Reset(FileText);
    CountNo := 0;
    while not(eof(FileText)) do
      begin
      inc(CountNo);
      if (CountNo = HNLocation) then begin
                                     Writeln(FileText2, HNinHex);
                                     Readln (FileText, HexLine)
                                     end
      else begin
           Readln(FileText, HexLine);
           Writeln(FileText2, HexLine);
           end
      end;
    CloseFile(FileText2);
    CloseFile(FileText);
Label3.Visible := False;
end;




procedure TForm1.Developer1Click(Sender: TObject);
begin
 CallCMDButton.Visible := True;
 ProgramButton.Visible := True;
 ReleaseButton.Visible := True;
 VerifyButton.Visible := True;
 BlankCheckButton.Visible := True;
 EraseButton.Visible := True;
 Button7.Visible := True;
 CMDedit.Visible   := True;
 Edit3.Visible   := True;
 Edit4.Visible   := True;
 Edit5.Visible   := True;
 Edit6.Visible   := True;
 Label4.Visible  := True;
 Label5.Visible  := True;
 Label6.Visible  := True;
 Edit7.Visible   := True;
 Edit8.Visible   := True;
 FindPDLineButton.Visible:= True;
 LMDDockButton1.Visible := True;
 Operator1.Checked := False;
 Open1.Visible := True;
 Label12.Visible := True;
end;

procedure TForm1.Operator1Click(Sender: TObject);
begin
 CallCMDButton.Visible := false;
 ProgramButton.Visible := false;
 ReleaseButton.Visible := false;
 VerifyButton.Visible := false;
 BlankCheckButton.Visible := false;
 EraseButton.Visible := false;
 Button7.Visible := false;
 CMDedit.Visible   := false;
 Edit3.Visible   := false;
 Edit4.Visible   := false;
 Edit5.Visible   := false;
 Edit6.Visible   := false;
 Label4.Visible  := false;
 Label5.Visible  := false;
 Label6.Visible  := false;
 Edit7.Visible   := false;
 Edit8.Visible   := false;
 FindPDLineButton.Visible:= false;
 LMDDockButton1.Visible := false;
 Developer1.Checked :=false;
 Open1.Visible := False;
 Label12.Visible := False;
end;

procedure TForm1.Edit2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Edit2.Text := '';
Label1.Visible := False;
Label2.Visible := False;
end;

procedure TForm1.IndicatorController(Flag: integer);
begin
Form1.label3.Caption := '';
Case Flag of
       0: begin
          Form1.Label2.Visible := False;
          Form1.Label1.Visible := False;
          end;
       1: begin
          Form1.Label2.Visible := False;
          Form1.Label1.Visible := True;
          end;
       -1:begin
          Form1.Label2.Visible := True;
          Form1.Label1.Visible := False;
          end;
          else Form1.Memo1.Text := 'Problem is here';
        end;
end;

procedure TForm1.EntireProgammingProcess();
var
count,IndicatorFlag: integer;
begin
Memo1.Text := '';
{count := 0;
while count <=4 do
  begin
  inc(count);
  Form1.Label3.Visible := True;
  Case count of
    1: begin
         CMDedit.Text := Concat(ExtractFileDir(ParamStr(0)),'\ICD3_Pack\ICD3CMD -P24FJ64GA004 -E');
         Form1.label3.Caption := 'Erasing...';
         Form1.Memo1.Text := Concat(Form1.Memo1.Text, #13#10,'==============Erasing...================');
         IndicatorFlag := (Form1.RunDosInMemo(CMDedit.Text,Form1.Memo1,'Erase device complete','RobertFilled') );
         //Form1.IndecatorController(IndecatorFlag);
         if IndicatorFlag<>1 then break
         else
           begin
                Label2.Visible :=False;
                Label1.Visible := False;
           end;
       end;
    2: begin
       CMDedit.Text := Concat(ExtractFileDir(ParamStr(0)),'\ICD3_Pack\ICD3CMD -P24FJ64GA004 -C');
       Form1.label3.Caption := 'BlankCHKing...';
       Form1.Memo1.Text := Concat(Form1.Memo1.Text, #13#10,'===========Blank Checking...============');
       IndicatorFlag := (Form1.RunDosInMemo(CMDedit.Text,Form1.Memo1,'Device is blank', 'Failed to perform Blank Check'));

       //Form1.IndecatorController(IndecatorFlag);
       if IndicatorFlag<>1 then break
         else
           begin
                Label2.Visible :=False;
                Label1.Visible := False;
           end;
       end;
    3: begin }
       CMDedit.Text := Concat(ExtractFileDir(ParamStr(0)),'\ICD3_Pack\ICD3CMD -P24FJ64GA004 -F"',Concat(ExtractFileDir(ParamStr(0)),FINAL_FILE_NAME),'" -M');
       Form1.label3.Caption := 'Programming...';
       Form1.Memo1.Text := Concat(Form1.Memo1.Text, #13#10,'=============Programming...==============');
       IndicatorFlag := (Form1.RunDosInMemo(CMDedit.Text,Form1.Memo1,'Programming/Verify complete','Failed to' ));
       //Form1.IndecatorController(IndecatorFlag);
       {if IndicatorFlag<>1 then //break
           begin
                Label2.Visible :=True;
                Label1.Visible := False;
           end;
         else
           begin
                Label2.Visible :=False;
                Label1.Visible := True;
           end;
       end;
    4: begin
       CMDedit.Text := Concat(ExtractFileDir(ParamStr(0)),'\ICD3_Pack\ICD3CMD -P24FJ64GA004 -L');
       Form1.label3.Caption := 'Releasing...';
       Form1.Memo1.Text := Concat(Form1.Memo1.Text, #13#10,'==============Releasing...===============');
       IndicatorFlag := (Form1.RunDosInMemo(CMDedit.Text,Form1.Memo1,'Device ID Revision','RobertFilled'));
       Form1.IndicatorController(IndicatorFlag);
       //if IndecatorFlag<>1 then break;
       end;
  end;     }
  Form1.IndicatorController(IndicatorFlag);
//end;
end;



procedure TForm1.FindPDLineButtonClick(Sender: TObject);
begin
  if edit7.Text <> '' then HexFileName := edit7.Text
  else HexFileName := Concat(ExtractFileDir(ParamStr(0)),DEFAULT_HEX_FILE_NAME);
  Edit8.Text := IntToStr(FindLineLocation(HexFileName,DEFAULT_EMPTY_PD)) ;
end;

procedure TForm1.LMDDockButton1Click(Sender: TObject);
begin
OpenDialog1.Filter := 'HEX File(*.hex)|*.hex';
if OpenDialog1.Execute = true then Edit7.Text := OpenDialog1.FileName;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
Form1.Close;
end;

end.


















