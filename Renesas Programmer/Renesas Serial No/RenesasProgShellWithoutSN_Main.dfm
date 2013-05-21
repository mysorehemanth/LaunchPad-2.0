object Form1: TForm1
  Left = 455
  Top = 141
  Width = 690
  Height = 300
  Caption = 'Digiflex Renesas Programmer GUI Shell:  '
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
  object Title: TLMDLabel
    Left = 24
    Top = 24
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
    Left = 16
    Top = 152
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object StartButton: TLMDButton
    Left = 520
    Top = 192
    Width = 129
    Height = 57
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = False
    OnClick = StartButtonClick
  end
  object exeProg: TLMDStarter
    StartOption = soSW_SHOWMAXIMIZED
    DefaultDir = 'c:\mtool\fousb\'
    Wait = True
    OnAfterStart = exeProgAfterStart
    OnFinished = exeProgFinished
  end
end
