object Form1: TForm1
  Left = 310
  Top = 203
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
  object Title: TLMDLabel
    Left = 256
    Top = 16
    Width = 60
    Height = 34
    Bevel.Mode = bmCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = []
    ParentFont = False
    Caption = 'Title'
  end
  object LMDSimpleLabel1: TLMDSimpleLabel
    Left = 160
    Top = 80
    Width = 260
    Height = 39
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Caption = 'LMDSimpleLabel1'
    Options = []
  end
  object LMDEdit1: TLMDEdit
    Left = 216
    Top = 144
    Width = 201
    Height = 57
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    TabOrder = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    CustomButtons = <>
    PasswordChar = #0
  end
  object exeProg: TLMDStarter
    Left = 56
    Top = 32
  end
end
