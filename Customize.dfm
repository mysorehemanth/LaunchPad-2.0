object CustomizeForm: TCustomizeForm
  Left = 360
  Top = 112
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Customize...'
  ClientHeight = 749
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    629
    749)
  PixelsPerInch = 96
  TextHeight = 13
  object RS485Label: TLabel
    Left = 168
    Top = 32
    Width = 78
    Height = 29
    Caption = 'RS485'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OLD_LANLabel: TLabel
    Left = 392
    Top = 32
    Width = 109
    Height = 29
    Caption = 'OLD LAN'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 368
    Top = 424
    Width = 115
    Height = 20
    Caption = 'Old Password:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 368
    Top = 480
    Width = 122
    Height = 20
    Caption = 'New Password:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ConfirmPassword: TLabel
    Left = 368
    Top = 536
    Width = 150
    Height = 20
    Caption = 'Confirm Password:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SaveButton: TLMDButton
    Left = 32
    Top = 672
    Width = 273
    Height = 57
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = SaveButtonClick
  end
  object CancelButton: TLMDButton
    Left = 336
    Top = 672
    Width = 273
    Height = 57
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object RS485CheckBox1: TLMDCheckBox
    Left = 112
    Top = 72
    Width = 185
    Height = 33
    Caption = '    Input Module'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Anchors = []
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
    Checked = True
    State = cbChecked
  end
  object RS485CheckBox2: TLMDCheckBox
    Left = 112
    Top = 112
    Width = 185
    Height = 33
    Caption = '   Output Module'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object RS485CheckBox3: TLMDCheckBox
    Left = 112
    Top = 152
    Width = 185
    Height = 33
    Caption = '   KeyPad Module'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object RS485CheckBox8: TLMDCheckBox
    Left = 112
    Top = 352
    Width = 185
    Height = 33
    Caption = '    Other Module'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object RS485CheckBox4: TLMDCheckBox
    Left = 112
    Top = 192
    Width = 185
    Height = 33
    Caption = '    PowerSupplier'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object RS485CheckBox5: TLMDCheckBox
    Left = 112
    Top = 232
    Width = 185
    Height = 33
    Caption = '    Control Panel'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object RS485CheckBox6: TLMDCheckBox
    Left = 112
    Top = 272
    Width = 185
    Height = 33
    Caption = '   Door Controller'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object RS485CheckBox7: TLMDCheckBox
    Left = 112
    Top = 312
    Width = 185
    Height = 33
    Caption = ' Expander Module'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object OLD_LANECheckBox1: TLMDCheckBox
    Left = 360
    Top = 72
    Width = 185
    Height = 33
    Caption = '    Input Module'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object OLD_LANECheckBox2: TLMDCheckBox
    Left = 360
    Top = 112
    Width = 185
    Height = 33
    Caption = '   Output Module'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object OLD_LANECheckBox3: TLMDCheckBox
    Left = 360
    Top = 152
    Width = 185
    Height = 33
    Caption = '   KeyPad Module'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object OLD_LANECheckBox4: TLMDCheckBox
    Left = 360
    Top = 192
    Width = 185
    Height = 33
    Caption = '    PowerSupplier'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object OLD_LANECheckBox5: TLMDCheckBox
    Left = 360
    Top = 232
    Width = 185
    Height = 33
    Caption = '    Control Panel'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object OLD_LANECheckBox6: TLMDCheckBox
    Left = 360
    Top = 272
    Width = 185
    Height = 33
    Caption = '   Door Controller'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object OLD_LANECheckBox7: TLMDCheckBox
    Left = 360
    Top = 312
    Width = 185
    Height = 33
    Caption = ' Expander Module'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object OLD_LANECheckBox8: TLMDCheckBox
    Left = 360
    Top = 352
    Width = 185
    Height = 41
    Caption = '    Other Module'
    Alignment.Alignment = agTopLeft
    Alignment.Spacing = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
  end
  object OldPasswordEdit: TEdit
    Left = 368
    Top = 448
    Width = 177
    Height = 29
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 18
    Text = '!@*#$^'
    OnClick = OldPasswordEditClick
  end
  object NewPasswordEdit: TEdit
    Left = 368
    Top = 504
    Width = 177
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 19
  end
  object ConfirmPasswordEdit: TEdit
    Left = 368
    Top = 560
    Width = 177
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 20
    OnClick = OldPasswordEditClick
    OnKeyPress = ConfirmPasswordEditKeyPress
  end
  object ChangePasswordButton: TLMDButton
    Left = 368
    Top = 592
    Width = 177
    Height = 33
    Caption = 'Change Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    OnClick = ChangePasswordButtonClick
  end
end
