object Form1: TForm1
  Left = 491
  Top = 218
  Width = 673
  Height = 369
  Caption = 'DigifleX NEC Programmer GUI Shell:'
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
    Left = 96
    Top = 24
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
    Left = 216
    Top = 88
    Width = 311
    Height = 39
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Caption = 'Swipe Serial Number:'
    Options = []
  end
  object Label1: TLabel
    Left = 256
    Top = 265
    Width = 193
    Height = 31
    Caption = 'Label1'
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
    OnTextChangedAt = LMDEdit1TextChangedAt
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
    Left = 8
    Top = 8
  end
end
