program CaptureOutputFromDOS1;

uses
  Forms,
  CaptureOutput in 'CaptureOutput.pas' {Form1};

{$R *.res}

begin
 Application.Initialize;
 Application.Title := 'PK3 Programmer Shell';
 Application.CreateForm(TForm1, Form1);
 Form1.CallCMDButton.Visible := false;
 Form1.ProgramButton.Visible := false;
 Form1.ReleaseButton.Visible := false;
 Form1.VerifyButton.Visible := false;
 Form1.BlankCheckButton.Visible := false;
 Form1.EraseButton.Visible := false;
 Form1.Button7.Visible := false;
 Form1.Edit1.Visible := false;
 Form1.Edit3.Visible := false;
 Form1.Edit4.Visible := false;
 Form1.Edit5.Visible := false;
 Form1.Edit6.Visible := false;
 Form1.Label4.Visible:= false;
 Form1.Label5.Visible:= false;
 Form1.Label6.Visible:= false;
 Form1.Label3.Visible := False;
 Form1.Label2.Visible := False;
 Form1.Label1.Visible := False;
 Form1.Edit7.Text := ParamStr(1);
 Form1.Caption := Concat(Form1.Caption,': ',ParamStr(2));
 Application.Run;
end.