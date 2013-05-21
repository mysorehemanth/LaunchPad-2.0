program PK3ProgShell;

uses
  Forms,SysUtils,
  PK3Caller in 'PK3Caller.pas' {Form1};

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
 Form1.CMDedit.Visible := false;
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
 Form1.Label2.Visible := False;
 Form1.Edit7.Text := ParamStr(1);
 Form1.Caption := Concat(Form1.Caption,': ',ParamStr(2));
 Form1.Label11.Caption := Concat(ParamStr(2));
 Form1.Operator1.Checked := True;
 Form1.Open1.Visible := False;
 Form1.Memo1.Text := '';
 Form1.Label12.Visible := False;
 //Form1.ExeDirectory.Text := GetCurrentDir;
 {Form1.DEFAULT_HEX_FILE_NAME :=Concat(GetCurrentDir,DEFAULT_HEX_FILE_NAME);
 Form1.MID_FILE_NAME :=Concat(GetCurrentDir,MID_FILE_NAME);
 Form1.FINAL_FILE_NAME :=Concat(GetCurrentDir,FINAL_FILE_NAME); }
 Application.Run;

end.
