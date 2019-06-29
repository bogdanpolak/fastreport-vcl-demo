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
    Top = 3
    Width = 243
    Height = 311
    Align = alClient
    Caption = 'GroupBox1'
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -2
    object Button1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 233
      Height = 39
      Action = actCreateReport1EmployeeList
      Align = alTop
      TabOrder = 0
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 5
      Top = 63
      Width = 233
      Height = 39
      Action = actCreateReport2CustomerSalesMD
      Align = alTop
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 16
    Top = 264
    object actCreateReport1EmployeeList: TAction
      Caption = 'Create Report: EmployeeList'
      OnExecute = actCreateReport1EmployeeListExecute
    end
    object actCreateReport2CustomerSalesMD: TAction
      Caption = 'CreateReport: CustomerSales M/D'
      OnExecute = actCreateReport2CustomerSalesMDExecute
    end
  end
end
