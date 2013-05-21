object Editor: TEditor
  Left = 8
  Top = 123
  Width = 930
  Height = 702
  VertScrollBar.Tracking = True
  Caption = 'LaunchPad 2.0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LMDHTMLLabel1: TLMDHTMLLabel
    Left = 424
    Top = 80
    Width = 145
    Height = 33
    Alignment = taLeftJustify
    Bevel.Mode = bmCustom
    Caption = 'Module Name:'
    Layout = tlTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LMDHTMLLabel2: TLMDHTMLLabel
    Left = 464
    Top = 136
    Width = 113
    Height = 33
    Alignment = taLeftJustify
    Bevel.Mode = bmCustom
    Caption = 'Firmware:'
    Layout = tlTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LMDHTMLLabel3: TLMDHTMLLabel
    Left = 432
    Top = 192
    Width = 145
    Height = 33
    Alignment = taLeftJustify
    Bevel.Mode = bmCustom
    Caption = 'Programmer :'
    Layout = tlTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LMDHTMLLabel5: TLMDHTMLLabel
    Left = 392
    Top = 16
    Width = 177
    Height = 33
    Alignment = taLeftJustify
    Bevel.Mode = bmCustom
    Caption = 'Module Section ID:'
    Layout = tlTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ModuleSectionIDLabel: TLMDHTMLLabel
    Left = 568
    Top = 8
    Width = 81
    Height = 41
    Alignment = taLeftJustify
    Bevel.Mode = bmCustom
    Caption = '[1101]'
    Layout = tlTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 16
    Top = 48
    Width = 385
    Height = 353
    Cursor = crHandPoint
    AutoSize = True
    Center = True
    Constraints.MaxHeight = 400
    Constraints.MaxWidth = 500
    DragCursor = crHandPoint
    DragKind = dkDock
    Proportional = True
    Stretch = True
  end
  object LMDHTMLLabel4: TLMDHTMLLabel
    Left = 424
    Top = 560
    Width = 73
    Height = 33
    Alignment = taLeftJustify
    Bevel.Mode = bmCustom
    Caption = '  Script :'
    Layout = tlTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object ProgrammerName: TLMDHTMLLabel
    Left = 576
    Top = 192
    Width = 321
    Height = 33
    Alignment = taLeftJustify
    Bevel.Mode = bmCustom
    Caption = 'Programmer Name'
    Layout = tlTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ModuleNameEdit: TLMDEdit
    Left = 576
    Top = 80
    Width = 313
    Height = 33
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    TabOrder = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    CustomButtons = <>
    PasswordChar = #0
  end
  object FirmwareDirEdit: TLMDEdit
    Left = 576
    Top = 136
    Width = 313
    Height = 33
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    DragCursor = crHandPoint
    TabOrder = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    CustomButtons = <>
    PasswordChar = #0
  end
  object ProgrammerTypeCombo: TComboBox
    Left = 40
    Top = 552
    Width = 313
    Height = 30
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 24
    ParentFont = False
    TabOrder = 2
    Visible = False
    Items.Strings = (
      ' '
      'DigifleX Flash Programmer'
      'NEC Programmer'
      'PK3 Programmer'
      'Renesas Programmer')
  end
  object ScriptDirEdit: TLMDEdit
    Left = 368
    Top = 600
    Width = 313
    Height = 33
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    TabOrder = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    CustomButtons = <>
    PasswordChar = #0
  end
  object LMDButton1: TLMDButton
    Left = 688
    Top = 8
    Width = 201
    Height = 49
    Caption = 'Program Wizard'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = LMDButton1Click
  end
  object SaveKeyValue: TLMDButton
    Left = 584
    Top = 360
    Width = 161
    Height = 41
    Caption = 'Program'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object PreviousModuleButton: TLMDButton
    Left = 536
    Top = 360
    Width = 41
    Height = 41
    Caption = '<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = PreviousModuleButtonClick
  end
  object NextModuleButton: TLMDButton
    Left = 752
    Top = 360
    Width = 41
    Height = 41
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = NextModuleButtonClick
  end
  object ReadLastModuleCfgButton: TLMDButton
    Left = 848
    Top = 360
    Width = 41
    Height = 41
    Caption = '>>]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = ReadLastModuleCfgButtonClick
  end
  object ReadFirstModuleCfgButton: TLMDButton
    Left = 440
    Top = 360
    Width = 41
    Height = 41
    Caption = '[<<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = ReadFirstModuleCfgButtonClick
  end
  object PhotoDirEdit: TLMDEdit
    Left = 40
    Top = 600
    Width = 313
    Height = 33
    BackFX.AlphaBlend.FillObject.AlphaLevel = 255
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    TabOrder = 10
    Visible = False
    OnChange = PhotoDirEditChange
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    CustomButtons = <>
    PasswordChar = #0
  end
  object NextModuleTypeButton: TLMDButton
    Left = 800
    Top = 360
    Width = 41
    Height = 41
    Caption = '>>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = NextModuleTypeButtonClick
  end
  object PreviousModuleTypeButton: TLMDButton
    Left = 488
    Top = 360
    Width = 41
    Height = 41
    Caption = '<<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = PreviousModuleTypeButtonClick
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 8
    object NewModule1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Caption = 'New ini File'
      end
      object OpeniniFile1: TMenuItem
        Caption = 'Open ini File'
        OnClick = OpeniniFile1Click
      end
      object SaveIniFile: TMenuItem
        Caption = 'Save'
      end
      object SaveAsOther: TMenuItem
        Caption = 'Save As...'
      end
      object Exit: TMenuItem
        Caption = 'Exit'
        OnClick = ExitClick
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object NewModule2: TMenuItem
        Caption = 'New Module'
      end
      object ModifyModule1: TMenuItem
        Caption = 'Modify Module'
        OnClick = ModifyModule1Click
      end
    end
    object Search1: TMenuItem
      Caption = 'Search'
      object ByName1: TMenuItem
        Caption = 'By Name'
      end
      object ByHexFile1: TMenuItem
        Caption = 'By Hex File'
      end
      object ByProgrammer1: TMenuItem
        Caption = 'By Programmer'
      end
      object ByiniSectionFile1: TMenuItem
        Caption = 'By ini Section ID'
      end
    end
    object Format1: TMenuItem
      Caption = 'Format'
      object FormatSecure1: TMenuItem
        Caption = 'Format Secure'
        OnClick = FormatSecure1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object ViewHelp1: TMenuItem
        Caption = 'View Help'
      end
      object AboutINIEditor1: TMenuItem
        Caption = 'About INI Editor'
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 120
    Top = 8
  end
  object OpenDialog: TOpenDialog
    Options = [ofNoChangeDir, ofFileMustExist, ofNoNetworkButton, ofNoDereferenceLinks, ofEnableSizing, ofForceShowHidden]
    OptionsEx = [ofExNoPlacesBar]
    Left = 56
    Top = 8
  end
  object OpenPictureDialog: TOpenPictureDialog
    Options = [ofFileMustExist, ofEnableSizing]
    Left = 88
    Top = 8
  end
end
