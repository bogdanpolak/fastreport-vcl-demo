object FormReportExercises: TFormReportExercises
  Left = 0
  Top = 0
  Caption = 'FormReportExercises'
  ClientHeight = 317
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 8
    Width = 243
    Height = 306
    Margins.Top = 8
    Align = alClient
    Caption = 'Create Report'
    TabOrder = 0
    ExplicitTop = 3
    ExplicitHeight = 311
    object Label1: TLabel
      AlignWithMargins = True
      Left = 17
      Top = 18
      Width = 219
      Height = 26
      Margins.Left = 15
      Margins.Right = 5
      Align = alTop
      Caption = 
        'Warning! All actions will clean current desing in TfrxRepor comp' +
        'onent'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      WordWrap = True
      ExplicitWidth = 213
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 50
      Width = 233
      Height = 31
      Action = actCreateReport1EmployeeList
      Align = alTop
      TabOrder = 0
      ExplicitTop = 18
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 5
      Top = 87
      Width = 233
      Height = 31
      Action = actCreateReport2CustomerSalesMD
      Align = alTop
      TabOrder = 1
      ExplicitTop = 55
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 5
      Top = 124
      Width = 233
      Height = 31
      Action = actCreateReport3CustomerSalesAgregated
      Align = alTop
      TabOrder = 2
      ExplicitTop = 92
    end
  end
  object ActionList1: TActionList
    Left = 16
    Top = 264
    object actCreateReport1EmployeeList: TAction
      Caption = '1) EmployeeList'
      OnExecute = actCreateReport1EmployeeListExecute
    end
    object actCreateReport2CustomerSalesMD: TAction
      Caption = '2) CustomerSales Master-Detail'
      OnExecute = actCreateReport2CustomerSalesMDExecute
    end
    object actCreateReport3CustomerSalesAgregated: TAction
      Caption = '3) CustomerSales Agregated'
      OnExecute = actCreateReport3CustomerSalesAgregatedExecute
    end
  end
end
