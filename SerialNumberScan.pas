unit SerialNumberScan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDEdit, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomSimpleLabel, LMDSimpleLabel;

type
  TsnInputForm = class(TForm)
    LMDSimpleLabel1: TLMDSimpleLabel;
    snEdit: TLMDEdit;
    procedure FormCreate(Sender: TObject);
    procedure snEditKeyPress(Sender: TObject; var Key: Char);
  private{ Private declarations }
    SNString: String;
  public
    { Public declarations }
    function checkInput(SNString:String):Boolean; 
    function readSN:String;
  end;

var
  snInputForm: TsnInputForm;
  Status: String;    //'Correct'  'Cancel'
implementation

{$R *.dfm}

procedure TsnInputForm.FormCreate(Sender: TObject);
begin
  snEdit.Text := '';
  SNString := '';
  Status := 'Cancel';
end;
function TsnInputForm.checkInput(SNString:String):Boolean;
begin
  Result:= False;
  if Length(SNString) = 6 then Result:= True;
  try
    StrToInt(SNString);
  except
    Result:= False;
    snEdit.Text := '';
  end;
end;

function TsnInputForm.readSN:String;
begin
  Result := Concat ('00',SNString);
end;
procedure TsnInputForm.snEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then if checkInput(snEdit.Text)=True then
     begin
     SNString := snEdit.Text;
     Status := 'Correct';
    close;
     end
     else
     begin
     snEdit.Text := '';
     end;
end;

end.
