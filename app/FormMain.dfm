object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FastReport Demo'
  ClientHeight = 283
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Top = 10
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    AlignWithMargins = True
    Left = 3
    Top = 117
    Width = 345
    Height = 28
    Action = actOpenReportDesigner
    Align = alTop
    TabOrder = 1
  end
  object Button2: TButton
    AlignWithMargins = True
    Left = 3
    Top = 151
    Width = 345
    Height = 28
    Action = actViewDatasets
    Align = alTop
    TabOrder = 2
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 264
    Width = 351
    Height = 19
    Panels = <
      item
        Width = 190
      end
      item
        Width = 50
      end>
    ExplicitTop = 257
    ExplicitWidth = 405
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 58
    Width = 345
    Height = 50
    Margins.Top = 6
    Margins.Bottom = 6
    Align = alTop
    Caption = 'Curent User (Employee):'
    TabOrder = 0
    ExplicitWidth = 399
    object ComboBox1: TComboBox
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 335
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
      ExplicitWidth = 389
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 13
    Width = 345
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 10
    TabOrder = 5
    ExplicitWidth = 399
    object Label2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 13
      Width = 339
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
  object Button3: TButton
    AlignWithMargins = True
    Left = 3
    Top = 185
    Width = 345
    Height = 28
    Action = actReportExercisesForm
    Align = alTop
    TabOrder = 3
  end
  object tmrReady: TTimer
    Interval = 1
    OnTimer = tmrReadyTimer
    Left = 16
    Top = 216
  end
  object ActionList1: TActionList
    Left = 80
    Top = 216
    object actOpenReportDesigner: TAction
      Caption = 'Open FastReport Designer'
      OnExecute = actOpenReportDesignerExecute
    end
    object actViewDatasets: TAction
      Caption = 'View Datasets'
      OnExecute = actViewDatasetsExecute
    end
    object actReportExercisesForm: TAction
      Caption = 'Show Report Exercises Form'
      OnExecute = actReportExercisesFormExecute
    end
  end
end
