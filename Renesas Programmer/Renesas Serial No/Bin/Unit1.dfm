object Form1: TForm1
  Left = 117
  Top = 378
  Width = 673
  Height = 369
  Caption = 'Digiflex Serial Number'
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
    Left = 256
    Top = 120
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
    Left = 48
    Top = 32
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
  object Edit1: TEdit
    Left = 496
    Top = 296
    Width = 113
    Height = 21
    TabOrder = 1
    Text = 'ExeDirectory'
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
