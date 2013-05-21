unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDBaseEdit, LMDCustomEdit, LMDDBEdit, LMDEdit, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, strutils,
  LMDCustomSimpleLabel, LMDSimpleLabel, LMDCustomComponent, LMDStarter,
  LMDCustomLabel, LMDLabel, LMDShBase, StdCtrls;


type
  TForm1 = class(TForm)
    LMDEdit1: TLMDEdit;
    LMDSimpleLabel1: TLMDSimpleLabel;
    exeProg: TLMDStarter;
    Title: TLMDLabel;
    Edit1: TEdit;
    procedure LMDEdit1TextChangedAt(sender: TObject; At: Integer);
    function Validateln( mystr : String ) : Boolean;
    function fnAscii2i( mychar : Char ) : Integer;
    function Checksumln( mystr : String ) : Integer;
    function Serialln( mystr : String ) : String;
    function fni2Ascii( myint : Integer ) : String;
    procedure FormShow(Sender: TObject);
    procedure exeProgFinished(Sender: TObject);
    procedure exeProgAfterStart(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.LMDEdit1TextChangedAt(sender: TObject; At: Integer);
var
  F1, F2: TextFile;
  fAbort : Boolean;
  my_line : string;
begin

  if length( LMDEdit1.Text ) = 6  then begin
    AssignFile(F1, ParamStr(1) );
    {$I-}
    Reset(F1);
    {$I+}
    if IOResult = 0 then begin
      AssignFile(F2, Concat(ExeDirectory.Text, ExtractFileName( ParamStr(1) )) );
      Rewrite(F2);
      fAbort := FALSE;

      while not Eof(F1) do
      begin
       Readln(F1, my_line);
       if Validateln( my_line ) = TRUE then begin
          if ( ( my_line[ 2] = '0' ) AND ( my_line[ 3] = '0' )  ) then Writeln( F2, Serialln( LMDEdit1.Text ) );
          Writeln(F2, my_line);
       end;
      end;
      CloseFile(F2);
      CloseFile(F1);
      if length( ParamStr(2)) <> 0 then begin
        Title.Caption := ParamStr(2) + '....Programming Serial Number ' + LMDEdit1.Text;
      end;

      Application.Minimize;
      exeProg.Command := Concat(ExeDirectory.Text,ParamStr(3));
      exeProg.Parameters  := ParamStr(4);
      exeProg.Execute;

      if length( ParamStr(2)) <> 0 then begin
        Title.Caption := ParamStr(2);
      end;
      Form1.Enabled := TRUE;
    end else begin
      ShowMessage('Error. File Not Found. Call Engineering For Assistence' );
    end;
    LMDEdit1.Text := '';
  end;
end;


function TForm1.fnAscii2i( mychar : Char ) : Integer;
var
  return : Integer;

begin
     case ( mychar ) of
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9':
        return := ord(mychar) - ord('0');

      'A',
      'B',
      'C',
      'D',
      'E',
      'F':
        return := ( ord(mychar) - ord('A') + 10 );
      end;
      result := return;
end;


function TForm1.Validateln( mystr : String ) : Boolean;
var
  i : Integer;
  ie: Integer;
begin

  result := TRUE;
  if mystr[ 1 ] <> ':' then result := FALSE;
  // check length
  i := ( fnAscii2i( mystr[ 2 ] ) * 16 ) + fnAscii2i( mystr[ 3 ] );
  if length( mystr ) <> ( ( i * 2 ) + 11) then result := FALSE;

  // check checksum

  i := Checksumln( mystr );

  if i <> 00 then result := FALSE;

end;





function TForm1.Checksumln( mystr : String ) : Integer;
var
  i : Integer;
  ie: Integer;
  x : Integer;
  checksum : Integer;
begin
  ie := ( fnAscii2i( mystr[ 2 ] ) * 16 ) + fnAscii2i( mystr[ 3 ] );
  checksum := ie;
  ie := ( ie  * 2 ) + 11;
  for  i:= 4 to ie do begin
     if ( i AND 1 ) = 0 then begin
       x := fnAscii2i( mystr[ i ] );
     end else begin
       x := ( x * 16 ) + fnAscii2i( mystr[ i ] );
       checksum := checksum + x;
     end;
  end;
//checksum := NOT ( checksum );
  result := checksum AND 255;
end;


function TForm1.Serialln( mystr : String ) : String;
var
  s : String;
  i : Integer;
  s1 : String;

begin

  s1:= MidStr(mystr, 5, 2);
  s1:= s1 + MidStr(mystr, 3, 2);
  s1:= s1 + MidStr(mystr, 1, 2);
  s1:= s1 + '00';
  mystr := s1;
  s := ':03008500' + mystr;
  i := Checksumln( s );
  inc ( i );
  i := i AND 255;
  i := 256 - i;
  s := s + fni2Ascii( i SHR 4 );
  s := s + fni2Ascii( i AND 15 );
  s[3] := '4';
  result := s;
end;

function TForm1.fni2Ascii( myint : Integer ) : String;
var
  return : String;

begin
     case ( myint ) of
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9:
        return := chr( myint + ord('0') );

      10,
      11,
      12,
      13,
      14,
      15:
        return := chr( ( myint - 10 ) + ord('A') );
      end;
      result := return;
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  if length( ParamStr(2)) <> 0 then begin
    Title.Caption := ParamStr(2);
  end;

end;

procedure TForm1.exeProgFinished(Sender: TObject);
begin
  Application.Restore;
//  Form1.Enabled := TRUE;
end;

procedure TForm1.exeProgAfterStart(Sender: TObject);
begin
//  Form1.Enabled := FALSE;
end;

end.

