object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FastReport Demo'
  ClientHeight = 276
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Top = 10
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    AlignWithMargins = True
    Left = 3
    Top = 117
    Width = 399
    Height = 42
    Align = alTop
    Caption = 'Open FastReport Designer'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    AlignWithMargins = True
    Left = 3
    Top = 165
    Width = 399
    Height = 36
    Align = alTop
    Caption = 'Connect and View Data'
    TabOrder = 1
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 257
    Width = 405
    Height = 19
    Panels = <
      item
        Width = 190
      end
      item
        Width = 50
      end>
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 58
    Width = 399
    Height = 50
    Margins.Top = 6
    Margins.Bottom = 6
    Align = alTop
    Caption = 'Curent User (Employee):'
    TabOrder = 3
    object ComboBox1: TComboBox
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 389
      Height = 24
      Margins.Bottom = 13
      Align = alTop
      Style = csDropDownList
      DropDownCount = 12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = ComboBox1Change
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 13
    Width = 399
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 10
    TabOrder = 4
    object Label2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 13
      Width = 393
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Szkolenie FastReport (c) Akademia BSC Polska'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      ExplicitWidth = 267
    end
  end
  object btnShowExercises: TButton
    AlignWithMargins = True
    Left = 3
    Top = 207
    Width = 399
    Height = 34
    Align = alTop
    Caption = 'Show Report Exercises'
    TabOrder = 5
    OnClick = btnShowExercisesClick
  end
  object tmrReady: TTimer
    Interval = 1
    OnTimer = tmrReadyTimer
    Left = 208
    Top = 208
  end
end
