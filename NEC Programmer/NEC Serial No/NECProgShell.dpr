program NECProgShell;


uses
  Forms,
  SysUtils,
  NECProgShell_main in 'NECProgShell_main.pas' {Form1};

{$R *.res}
var
  CmdLine: PChar platform;
  s : String;

begin
  s := ParamStr(1);
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  form1.Label1.Caption := ExtractFilePath(ParamStr(0));
  Application.Run;
  //Form1.Caption :=
end.