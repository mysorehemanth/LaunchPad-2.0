object Form1: TForm1
  Left = 1788
  Top = 111
  Width = 737
  Height = 789
  AutoSize = True
  Caption = 'ICD3 Programmer GUI Shell'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 115
    Top = 40
    Width = 84
    Height = 40
    Caption = 'PASS'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -40
    Font.Name = 'MS Gothic'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 115
    Top = 40
    Width = 84
    Height = 40
    Caption = 'FAIL'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -40
    Font.Name = 'MS Gothic'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 8
    Top = 592
    Width = 156
    Height = 16
    Caption = 'SN Line before Writing'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 672
    Width = 100
    Height = 16
    Caption = 'Serial Number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 632
    Width = 121
    Height = 13
    Caption = 'SN Line After Writing'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 395
    Top = 40
    Width = 294
    Height = 40
    Caption = 'Programming...'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -40
    Font.Name = 'MS Gothic'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label8: TLabel
    Left = 16
    Top = 144
    Width = 136
    Height = 20
    Caption = 'Producting Date:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 160
    Top = 144
    Width = 6
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 0
    Top = 272
    Width = 7
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 11
    Top = 0
    Width = 340
    Height = 33
    BiDiMode = bdLeftToRight
    Caption = 'Title of Moudle Name'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -32
    Font.Name = 'MS Gothic'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
  end
  object Label12: TLabel
    Left = 16
    Top = 240
    Width = 82
    Height = 24
    Caption = 'HEX File:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 16
    Top = 96
    Width = 36
    Height = 24
    Caption = 'S/N:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 344
    Top = 528
    Width = 98
    Height = 24
    Caption = 'MCU Code:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object VersionNumber: TLabel
    Left = 184
    Top = 184
    Width = 124
    Height = 29
    Caption = 'VersionNo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 16
    Top = 184
    Width = 144
    Height = 24
    Caption = 'Version Number:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 344
    Top = 96
    Width = 377
    Height = 361
    BevelOuter = bvRaised
    BiDiMode = bdLeftToRight
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object CallCMDButton: TButton
    Left = 168
    Top = 408
    Width = 153
    Height = 49
    Caption = 'Custom CMD'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = CallCMDButtonClick
  end
  object CMDedit: TEdit
    Left = 8
    Top = 472
    Width = 313
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '<directory>\ICD3CMD -<MCU Code> -<Parameter>'
    OnChange = CMDeditChange
  end
  object CleanButton: TButton
    Left = 344
    Top = 456
    Width = 377
    Height = 33
    Caption = 'Clean'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = CleanButtonClick
  end
  object ReleaseButton: TButton
    Left = 168
    Top = 280
    Width = 153
    Height = 49
    Caption = 'Release'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = ReleaseButtonClick
  end
  object VerifyButton: TButton
    Left = 8
    Top = 344
    Width = 153
    Height = 49
    Caption = 'Verify'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = VerifyButtonClick
  end
  object BlankCheckButton: TButton
    Left = 168
    Top = 344
    Width = 153
    Height = 49
    Caption = 'Blank Check'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = BlankCheckButtonClick
  end
  object ProgramButton: TButton
    Left = 8
    Top = 280
    Width = 153
    Height = 49
    Caption = 'Program (No SN)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = ProgramButtonClick
  end
  object EraseButton: TButton
    Left = 8
    Top = 408
    Width = 153
    Height = 49
    Caption = 'Erase'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = EraseButtonClick
  end
  object Edit2: TEdit
    Left = 64
    Top = 96
    Width = 137
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Text = 'Serial Number'
    OnKeyPress = Edit2KeyPress
    OnKeyUp = Edit2KeyUp
    OnMouseDown = Edit2MouseDown
  end
  object Edit3: TEdit
    Left = 272
    Top = 512
    Width = 41
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object Button7: TButton
    Left = 8
    Top = 512
    Width = 257
    Height = 33
    Caption = 'Find Line Number of serial number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = Button7Click
  end
  object Edit4: TEdit
    Left = 8
    Top = 608
    Width = 713
    Height = 21
    TabOrder = 12
  end
  object Edit5: TEdit
    Left = 8
    Top = 688
    Width = 713
    Height = 21
    TabOrder = 13
  end
  object Edit6: TEdit
    Left = 8
    Top = 648
    Width = 713
    Height = 21
    TabOrder = 14
  end
  object Edit7: TEdit
    Left = 104
    Top = 240
    Width = 193
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    Visible = False
    OnChange = Edit7Change
  end
  object Edit8: TEdit
    Left = 272
    Top = 552
    Width = 41
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    Visible = False
  end
  object FindPDLineButton: TButton
    Left = 8
    Top = 552
    Width = 257
    Height = 33
    Caption = 'Find Line Number of Product Date'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    Visible = False
    OnClick = FindPDLineButtonClick
  end
  object ExeDirectory: TEdit
    Left = 8
    Top = 712
    Width = 713
    Height = 21
    TabOrder = 18
    Text = 'ExeDirectory'
    Visible = False
  end
  object ProgramWithSNButton: TButton
    Left = 200
    Top = 96
    Width = 89
    Height = 33
    Caption = 'Program '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = ProgramWithSNButtonClick
  end
  object MCUCodeCombo: TComboBox
    Left = 344
    Top = 552
    Width = 377
    Height = 30
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 24
    ParentFont = False
    TabOrder = 19
    Visible = False
    OnChange = MCUCodeComboChange
    Items.Strings = (
      '-P24FJ64GA004'
      '-P24FJ128GA106'
      '-P24FJ64GA104'
      '-P32MX695F512H')
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 42
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open...'
        OnClick = LMDDockButton1Click
      end
      object Exit1: TMenuItem
        Caption = 'Close'
        OnClick = Exit1Click
      end
    end
    object Model1: TMenuItem
      Caption = 'Mode'
      object Operator1: TMenuItem
        AutoCheck = True
        Caption = 'Operator'
        OnClick = Operator1Click
      end
      object Developer1: TMenuItem
        AutoCheck = True
        Caption = 'Developer'
        OnClick = Developer1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 56
    Top = 42
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 400
    OnTimer = Timer1Timer
    Left = 520
  end
end
