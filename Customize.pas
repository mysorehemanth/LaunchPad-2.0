unit Customize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomButton, LMDButton, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDButtonControl, LMDRadioButton,
  LMDCustomCheckBox, LMDCheckBox,inifiles;

type
  TCustomizeForm = class(TForm)
    SaveButton: TLMDButton;
    CancelButton: TLMDButton;
    RS485CheckBox1: TLMDCheckBox;
    RS485CheckBox2: TLMDCheckBox;
    RS485CheckBox3: TLMDCheckBox;
    RS485CheckBox8: TLMDCheckBox;
    RS485CheckBox4: TLMDCheckBox;
    RS485CheckBox5: TLMDCheckBox;
    RS485CheckBox6: TLMDCheckBox;
    RS485CheckBox7: TLMDCheckBox;
    OLD_LANECheckBox1: TLMDCheckBox;
    OLD_LANECheckBox2: TLMDCheckBox;
    OLD_LANECheckBox3: TLMDCheckBox;
    OLD_LANECheckBox4: TLMDCheckBox;
    OLD_LANECheckBox5: TLMDCheckBox;
    OLD_LANECheckBox6: TLMDCheckBox;
    OLD_LANECheckBox7: TLMDCheckBox;
    OLD_LANECheckBox8: TLMDCheckBox;
    RS485Label: TLabel;
    OLD_LANLabel: TLabel;
    OldPasswordEdit: TEdit;
    Label1: TLabel;
    NewPasswordEdit: TEdit;
    Label2: TLabel;
    ConfirmPasswordEdit: TEdit;
    ConfirmPassword: TLabel;
    ChangePasswordButton: TLMDButton;
    procedure FormCreate(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OldPasswordEditClick(Sender: TObject);
    procedure ChangePasswordButtonClick(Sender: TObject);
    procedure ConfirmPasswordEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomizeForm: TCustomizeForm;
  IniFile: TIniFile;
  iniFileName,HashString: String;
  HashFile: TextFile;
implementation

{$R *.dfm}

procedure TCustomizeForm.FormCreate(Sender: TObject);
begin
   iniFileName := ExtractFilePath(ParamStr(0))+ExtractFileName(ParamStr(0)) ;
   Delete(iniFileName,length(iniFileName)-3,4);
   iniFileName := iniFileName +'.ini';
   IniFile := TIniFile.Create(IniFileName);

   if (IniFile.ReadInteger('CustomizeButtoms','RS485_INPUT',1)=0)
   then begin
        RS485CheckBox1.Checked := false;
   end
   else begin
        RS485CheckBox1.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','RS485_OUTPUT',1)=0)
   then begin
        RS485CheckBox2.Checked := false;
   end
   else begin
        RS485CheckBox2.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','RS485_KEYPAD',1)=0) 
   then begin
        RS485CheckBox3.Checked := false;
   end
   else begin
        RS485CheckBox3.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','RS485_POWERSUPPLIER',1)=0)
   then begin
        RS485CheckBox4.Checked := false;
   end
   else begin
        RS485CheckBox4.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','RS485_CONTROL_PANEL',1)=0)
   then begin
        RS485CheckBox5.Checked := false;
   end
   else begin
        RS485CheckBox5.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','RS485_DOOR_CONTROLER',1)=0)  
   then begin
        RS485CheckBox6.Checked := false;
   end
   else begin
        RS485CheckBox6.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','RS485_EXPANDER',1)=0)  
   then begin
        RS485CheckBox7.Checked := false;
   end
   else begin
        RS485CheckBox7.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','RS485_OTHER',1)=0)  
   then begin
        RS485CheckBox8.Checked := false;
   end
   else begin
        RS485CheckBox8.Checked := true;
   end;


   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_INPUT',1)=0)
   then begin
        OLD_LANECheckBox1.Checked := false;
   end
   else begin
        OLD_LANECheckBox1.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_OUTPUT',1)=0) 
   then begin
        OLD_LANECheckBox2.Checked := false;
   end
   else begin
        OLD_LANECheckBox2.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_KEYPAD',1)=0) 
   then begin
        OLD_LANECheckBox3.Checked := false;
   end
   else begin
        OLD_LANECheckBox3.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_POWERSUPPLIER',1)=0)
   then begin
        OLD_LANECheckBox4.Checked := false;
   end
   else begin
        OLD_LANECheckBox4.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_CONTROL_PANEL',1)=0) 
   then begin
        OLD_LANECheckBox5.Checked := false;
   end
   else begin
        OLD_LANECheckBox5.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_DOOR_CONTROLER',1)=0)
   then begin
        OLD_LANECheckBox6.Checked := false;
   end
   else begin
        OLD_LANECheckBox6.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_EXPANDER',1)=0)
   then begin
        OLD_LANECheckBox7.Checked := false;
   end
   else begin
        OLD_LANECheckBox7.Checked := true;
   end;

   if (IniFile.ReadInteger('CustomizeButtoms','OLD_LAN_OTHER',1)=0) 
   then begin
        OLD_LANECheckBox8.Checked := false;
   end
   else begin
        OLD_LANECheckBox8.Checked := true;
   end;


end;

procedure TCustomizeForm.SaveButtonClick(Sender: TObject);
begin
   if RS485CheckBox1.Checked = true
   then begin
       IniFile.WriteInteger('CustomizeButtoms','RS485_INPUT', 1) ;
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_INPUT', 0) ;
   end;

   if RS485CheckBox2.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_OUTPUT', 1) ;
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_OUTPUT', 0) ;
   end;

   if RS485CheckBox3.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_KEYPAD',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_KEYPAD',0);
   end;

   if RS485CheckBox4.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_POWERSUPPLIER',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_POWERSUPPLIER',0);
   end;

   if RS485CheckBox5.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_CONTROL_PANEL',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_CONTROL_PANEL',0);
   end;

   if RS485CheckBox6.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_DOOR_CONTROLER',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_DOOR_CONTROLER',0);
   end;

   if RS485CheckBox7.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_EXPANDER',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_EXPANDER',0);
   end;

   if RS485CheckBox8.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_OTHER',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','RS485_OTHER',0);
   end;


   if OLD_LANECheckBox1.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_INPUT',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_INPUT',0);
   end;

   if OLD_LANECheckBox2.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_OUTPUT',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_OUTPUT',0);
   end;

   if OLD_LANECheckBox3.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_KEYPAD',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_KEYPAD',0);
   end;

   if OLD_LANECheckBox4.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_POWERSUPPLIER',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_POWERSUPPLIER',0);
   end;

   if OLD_LANECheckBox5.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_CONTROL_PANEL',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_CONTROL_PANEL',0);
   end;

   if OLD_LANECheckBox6.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_DOOR_CONTROLER',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_DOOR_CONTROLER',0);
   end;

   if OLD_LANECheckBox7.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_EXPANDER',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_EXPANDER',0);
   end;

   if OLD_LANECheckBox8.Checked = true
   then begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_OTHER',1);
   end
   else begin
        IniFile.WriteInteger('CustomizeButtoms','OLD_LAN_OTHER',0);
   end;
   CustomizeForm.Close;
   CustomizeForm.Release;
end;

procedure TCustomizeForm.CancelButtonClick(Sender: TObject);
begin
     CustomizeForm.Close;
     CustomizeForm.Release;
end;

procedure TCustomizeForm.OldPasswordEditClick(Sender: TObject);
begin
OldPasswordEdit.Text:='';
end;

procedure TCustomizeForm.ChangePasswordButtonClick(Sender: TObject);
begin
     AssignFile(HashFile, 'MD5Hash');
     Reset(HashFile);
     ReadLn(HashFile, HashString);

     If (ConfirmPasswordEdit.Text = NewPasswordEdit.Text)and (OldPasswordEdit.Text = HashString) then
     begin
     ReWrite(HashFile);
     //WriteLn(HashFile, MD5(ConfirmPasswordEdit.Text));
     WriteLn(HashFile, ConfirmPasswordEdit.Text);

     ShowMessage('New Password is Setted!!!');
     end
     else
     begin
     ShowMessage('Confirm New Password Failed!!!');
     end;




     //ReadLn(HashFile, HashString);

     CloseFile(HashFile);
end;

procedure TCustomizeForm.ConfirmPasswordEditKeyPress(Sender: TObject;
  var Key: Char);
begin

if Key = #13 then ChangePasswordButtonClick(Sender);

end;

end.
