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
    procedure snEditAfterEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private{ Private declarations }
    SNString: String;
  public
    { Public declarations }
    function readSN(ScriptDir:String):String;
    function checkInput(SNString:String):Boolean;
  end;

var
  snInputForm: TsnInputForm;
  Status: String;
implementation

{$R *.dfm}

procedure TsnInputForm.snEditAfterEnter(Sender: TObject);
begin
     if checkInput(snEdit.Text)=True then
     begin
     SNString := snEdit.Text;
     snEdit.Text := '';
     end
     else
     begin
     snEdit.Text := '';
     end;
end;

procedure TsnInputForm.FormCreate(Sender: TObject);
begin
  snEdit.Text := '';
  SNString := '';
end;
function TsnInputForm.checkInput(SNString:String):Boolean;
begin
  snEdit.Text := '';
  snString := '';
end;

end.
