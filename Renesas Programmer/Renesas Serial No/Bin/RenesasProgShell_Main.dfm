object Form1: TForm1
  Left = 350
  Top = 166
  Width = 673
  Height = 370
  Caption = 'Digiflex Renesas Programming GUI Shell:  '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimpleLabel1: TLMDSimpleLabel
    Left = 216
    Top = 152
    Width = 274
    Height = 34
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Caption = 'Swipe Serial Number'
    Options = []
  end
  object Title: TLMDLabel
    Left = 40
    Top = 16
    Width = 106
    Height = 39
    Bevel.Mode = bmCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = []
    ParentFont = False
    Caption = 'default'
  end
  object Label1: TLabel
    Left = 8
    Top = 304
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object LMDSimpleLabel2: TLMDSimpleLabel
    Left = 32
    Top = 256
    Width = 588
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Caption = 'The Serial number still can'#39't write into MOT File. Need location'
    Options = []
  end
  object LMDEdit1: TLMDEdit
    Left = 264
    Top = 192
    Width = 137
    Height = 57
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    TabOrder = 0
    OnTextChangedAt = LMDEdit1TextChangedAt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    CustomButtons = <>
    PasswordChar = #0
  end
  object LMDButton1: TLMDButton
    Left = 536
    Top = 280
    Width = 113
    Height = 49
    Caption = 'LMDButton1'
    TabOrder = 1
    Visible = False
    OnClick = LMDButton1Click
  end
  object exeProg: TLMDStarter
    StartOption = soSW_SHOWMAXIMIZED
    DefaultDir = 'c:\mtool\fousb\'
    Wait = True
    OnAfterStart = exeProgAfterStart
    OnFinished = exeProgFinished
    Left = 80
    Top = 176
  end
end
