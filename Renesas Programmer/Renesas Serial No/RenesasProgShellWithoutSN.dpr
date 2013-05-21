program RenesasProgShellWithoutSN;


uses
  Forms,
  SysUtils,
  RenesasProgShellWithoutSN_Main in 'RenesasProgShellWithoutSN_Main.pas' {Form1};

{$R *.res}
var
  CmdLine: PChar platform;
  s : String;

begin
  s := ParamStr(1);
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  //Form1.ExeDirectory.Text := GetCurrentDir;
  Form1.Caption := Form1.Caption + ParamStr(2);
  Application.Run;
end.
