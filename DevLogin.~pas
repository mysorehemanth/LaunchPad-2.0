unit DevLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, StdCtrls, LMDCustomButton, LMDButton;

type
  TLogin = class(TForm)
    PasswordEditor: TEdit;
    LoginButton: TLMDButton;
    ClearButton: TLMDButton;
    HintButton: TLMDButton;
    CancelButton: TLMDButton;
    PasswordLabel: TLMDLabel;
    Label1: TLabel;
    procedure LoginButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure HintButtonClick(Sender: TObject);
    procedure PasswordEditorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations } 
  public
    { Public declarations }
    HashString: string;
  end;

var
  Login: TLogin;

implementation

{$R *.dfm}

procedure TLogin.LoginButtonClick(Sender: TObject);
begin
     {if HashString = MD5(PasswordEditor.Text) then Label1.Caption := 'Successful Login'
     else Label1.Caption := 'Failed Login'; }
     {if HashString = PasswordEditor.Text then
     begin
     Label1.Caption := 'Successful Login';
     end
     else begin
     Label1.Caption := 'Failed Login';
     end;
     }
     HashString := PasswordEditor.Text;
     Login.Close;
end;

procedure TLogin.ClearButtonClick(Sender: TObject);
begin
 PasswordEditor.Text := '';
end;

procedure TLogin.CancelButtonClick(Sender: TObject);
begin
HashString := 'Cancelled';
Login.Close;
end;

procedure TLogin.HintButtonClick(Sender: TObject);
var
  HintFile : TextFile;
  HintString : string;
begin
AssignFile(HintFile, 'LoginHint.txt');
Reset(HintFile);
ReadLn(HintFile, HintString);
CloseFile(HintFile);
ShowMessage(HintString);
end;

procedure TLogin.PasswordEditorKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then LoginButtonClick(Sender);

end;

end.
