program RenesasProgShell;


uses
  Forms,
  SysUtils,
  RenesasProgShell_Main in 'RenesasProgShell_Main.pas' {Form1};

{$R *.res}
var
  CmdLine: PChar platform;
  s : String;

begin
  s := ParamStr(1);
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Form1.Caption := Form1.Caption + ParamStr(2);
  //Form1.ExeDirectory.Text := GetCurrentDir;
  Application.Run;
end.
