object FormViewData: TFormViewData
  Left = 0
  Top = 0
  Caption = 'FormViewData'
  ClientHeight = 402
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 161
    Top = 0
    Width = 5
    Height = 350
    ExplicitLeft = 124
    ExplicitHeight = 402
  end
  object Splitter2: TSplitter
    Left = 0
    Top = 350
    Width = 670
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 307
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 166
    Top = 3
    Width = 501
    Height = 347
    Margins.Left = 0
    Margins.Bottom = 0
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ListBox1: TListBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 158
    Height = 347
    Margins.Right = 0
    Margins.Bottom = 0
    Style = lbOwnerDrawFixed
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 24
    Items.Strings = (
      'dsEmployees'
      'dsCustomers'
      'dsOrders'
      'dsOrderDetails'
      '--'
      'dsCustomerOrders'
      'dsOrdersValue'
      'dsDocument')
    ParentFont = False
    TabOrder = 1
    OnClick = ListBox1Click
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 355
    Width = 664
    Height = 44
    Margins.Top = 0
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object DataSource1: TDataSource
    Left = 208
    Top = 64
  end
end
