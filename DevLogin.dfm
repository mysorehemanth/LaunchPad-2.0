object Login: TLogin
  Left = 518
  Top = 512
  VertScrollBar.Tracking = True
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 128
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PasswordLabel: TLMDLabel
    Left = 16
    Top = 8
    Width = 89
    Height = 26
    Bevel.Mode = bmCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = []
    ParentFont = False
    Caption = 'Password:'
  end
  object Label1: TLabel
    Left = 48
    Top = 144
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object PasswordEditor: TEdit
    Left = 16
    Top = 32
    Width = 217
    Height = 45
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
    Text = 'sfdasdfsa'
    OnKeyPress = PasswordEditorKeyPress
  end
  object LoginButton: TLMDButton
    Left = 240
    Top = 32
    Width = 105
    Height = 33
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = LoginButtonClick
  end
  object ClearButton: TLMDButton
    Left = 16
    Top = 80
    Width = 105
    Height = 33
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ClearButtonClick
  end
  object HintButton: TLMDButton
    Left = 128
    Top = 80
    Width = 105
    Height = 33
    Caption = 'Hint'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = HintButtonClick
  end
  object CancelButton: TLMDButton
    Left = 240
    Top = 80
    Width = 105
    Height = 33
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = CancelButtonClick
  end
end