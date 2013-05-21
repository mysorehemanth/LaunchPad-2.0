

program LaunchPad2;



uses
  Forms,
  LaunchPad_frmMain in 'LaunchPad_frmMain.pas' {frmMain},
  ProgramWizard in 'ProgramWizard.pas' {ProgWizardForm},
  ProductCheck in 'ProductCheck.pas' {ProductChecking},
  ModuleObject in 'CreatINI\ModuleObject.pas',
  Customize in 'Customize.pas' {CustomizeForm},
  DevLogin in 'DevLogin.pas' {Login},
  SerialNumberScan in 'SerialNumberScan.pas' {snInputForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TProgWizardForm, ProgWizardForm);
  Application.CreateForm(TProductChecking, ProductChecking);
  Application.CreateForm(TCustomizeForm, CustomizeForm);
  Application.CreateForm(TLogin, Login);
  Application.CreateForm(TsnInputForm, snInputForm);
  Application.Run;
end.