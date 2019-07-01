object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 555
  Width = 544
  object frxReport1: TfrxReport
    Version = '6.4.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43642.357434907400000000
    ReportOptions.LastChange = 43642.357434907400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
    end
  end
  object frxdsCustomers: TfrxDBDataset
    UserName = 'Customers'
    CloseDataSource = False
    DataSet = dsCustomers
    BCDToCurrency = False
    Left = 424
    Top = 80
  end
  object FDConnction1: TFDConnection
    Params.Strings = (
      'ConnectionDef=FB_Demo')
    LoginPrompt = False
    Left = 152
    Top = 40
  end
  object dsCustomers: TFDQuery
    Connection = FDConnction1
    SQL.Strings = (
      'SELECT * FROM {id Customers}')
    Left = 224
    Top = 80
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 48
    Top = 56
  end
  object dsOrders: TFDQuery
    MasterSource = srcCustomers
    MasterFields = 'CUSTOMERID'
    DetailFields = 'CUSTOMERID'
    Connection = FDConnction1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT OrderID, CustomerID, o.EmployeeID, e.FirstName||'#39' '#39'||e.La' +
        'stName as EmployeeName, '
      
        'OrderDate, RequiredDate, ShippedDate, ShipVia,Freight, ShipName,' +
        ' ShipAddress, ShipCity, ShipCountry '
      'FROM {id Orders} o'
      'inner join {id Employees} e ON o.EmployeeID = e.EmployeeID'
      'where CUSTOMERID = :CUSTOMERID')
    Left = 223
    Top = 128
    ParamData = <
      item
        Name = 'CUSTOMERID'
        DataType = ftWideString
        ParamType = ptInput
        Size = 5
        Value = 'ALFKI'
      end>
  end
  object frxdsOrders: TfrxDBDataset
    UserName = 'Orders'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ORDERID=ORDERID'
      'CUSTOMERID=CUSTOMERID'
      'EMPLOYEEID=EMPLOYEEID'
      'ORDERDATE=ORDERDATE'
      'REQUIREDDATE=REQUIREDDATE'
      'SHIPPEDDATE=SHIPPEDDATE'
      'SHIPVIA=SHIPVIA'
      'FREIGHT=FREIGHT'
      'SHIPNAME=SHIPNAME'
      'SHIPADDRESS=SHIPADDRESS'
      'SHIPCITY=SHIPCITY'
      'SHIPREGION=SHIPREGION'
      'SHIPPOSTALCODE=SHIPPOSTALCODE'
      'SHIPCOUNTRY=SHIPCOUNTRY')
    DataSet = dsOrders
    BCDToCurrency = False
    Left = 424
    Top = 128
  end
  object frxDBXComponents1: TfrxDBXComponents
    Left = 48
    Top = 168
  end
  object FiredacdemoConnection: TSQLConnection
    ConnectionName = 'FireDacDemo'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver260.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver260.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=C:\data\Firebird\FD-DEMO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Left = 48
    Top = 216
  end
  object srcCustomers: TDataSource
    DataSet = dsCustomers
    Left = 320
    Top = 80
  end
  object dsOrderDetails: TFDQuery
    MasterSource = srcOrders
    MasterFields = 'ORDERID'
    DetailFields = 'ORDERID'
    Connection = FDConnction1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT OrderID, det.ProductID, prod.ProductName, prod.CategoryID' +
        ', '
      'prod.QuantityPerUnit, det.UnitPrice, Quantity, Discount '
      'FROM {id Order Details} det'
      'INNER JOIN {id Products} prod ON det.ProductID = prod.ProductID'
      'WHERE OrderID = :ORDERID')
    Left = 224
    Top = 176
    ParamData = <
      item
        Name = 'ORDERID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 10359
      end>
  end
  object srcOrders: TDataSource
    DataSet = dsOrders
    Left = 320
    Top = 128
  end
  object frxdsOrderDetails: TfrxDBDataset
    UserName = 'OrderDetails'
    CloseDataSource = False
    DataSet = dsOrderDetails
    BCDToCurrency = False
    Left = 424
    Top = 176
  end
  object srcOrderDetails: TDataSource
    DataSet = dsOrderDetails
    Left = 320
    Top = 176
  end
  object dsEmployees: TFDQuery
    Connection = FDConnction1
    SQL.Strings = (
      'select * from {id Employees}')
    Left = 224
    Top = 8
  end
  object srcEmployees: TDataSource
    DataSet = dsEmployees
    Left = 320
    Top = 8
  end
  object frxdsEmployees: TfrxDBDataset
    UserName = 'Employees'
    CloseDataSource = False
    DataSource = srcEmployees
    BCDToCurrency = False
    Left = 424
    Top = 8
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Separator = ';'
    OEMCodepage = False
    UTF8 = False
    OpenAfterExport = False
    NoSysSymbols = True
    ForcedQuotes = False
    Left = 48
    Top = 288
  end
  object frxXLSXExport1: TfrxXLSXExport
    FileName = '.xlsx'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 43640.934196527780000000
    DataOnly = False
    ChunkSize = 0
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 48
    Top = 336
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 48
    Top = 384
  end
  object dsCustomerOrders: TFDQuery
    Connection = FDConnction1
    SQL.Strings = (
      
        'SELECT cust.CustomerID, CompanyName, cust.ContactName, cust.City' +
        ', cust.Country, o.OrderID, o.EmployeeID, '
      
        '  e.FirstName||'#39' '#39'||e.LastName as EmployeeName, OrderDate, Requi' +
        'redDate, det.ProductID, '
      
        '  prod.ProductName, prod.CategoryID, prod.QuantityPerUnit, det.U' +
        'nitPrice, Quantity, Discount'
      'FROM "Customers" cust'
      'INNER JOIN "Orders" o ON cust.CUSTOMERID = o.CUSTOMERID'
      'INNER JOIN  "Employees" e ON o.EmployeeID = e.EmployeeID'
      'INNER JOIN "Order Details" det ON o.OrderID = det.ORDERID'
      'INNER JOIN "Products" prod ON det.ProductID = prod.ProductID')
    Left = 224
    Top = 264
  end
  object srcCustomerOrders: TDataSource
    DataSet = dsCustomerOrders
    Left = 320
    Top = 264
  end
  object frxdsCustomerOrders: TfrxDBDataset
    UserName = 'CustomerOrders'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CUSTOMERID=CUSTOMERID'
      'COMPANYNAME=COMPANYNAME'
      'CONTACTNAME=CONTACTNAME'
      'CITY=CITY'
      'COUNTRY=COUNTRY'
      'ORDERID=ORDERID'
      'EMPLOYEEID=EMPLOYEEID'
      'EMPLOYEENAME=EMPLOYEENAME'
      'ORDERDATE=ORDERDATE'
      'REQUIREDDATE=REQUIREDDATE'
      'PRODUCTID=PRODUCTID'
      'PRODUCTNAME=PRODUCTNAME'
      'CATEGORYID=CATEGORYID'
      'QUANTITYPERUNIT=QUANTITYPERUNIT'
      'UNITPRICE=UNITPRICE'
      'QUANTITY=QUANTITY'
      'DISCOUNT=DISCOUNT')
    DataSource = srcCustomerOrders
    BCDToCurrency = False
    Left = 424
    Top = 264
  end
  object dsOrdersValue: TFDQuery
    Connection = FDConnction1
    SQL.Strings = (
      'SELECT '
      '  cust.CustomerID, cust.Country, '
      '  e.FirstName||'#39' '#39'||e.LastName as EmployeeName, det.ProductID,'
      '  {YEAR(o.OrderDate)} as OrderYear, '
      
        '  '#39'Q'#39'||{ fn CONVERT( ({Month(o.OrderDate)}-1)/3+1, CHAR)} as Ord' +
        'erQuater,  '
      '  {Month(o.OrderDate)} as OrderMonth,'
      
        '  {round( (det.UnitPrice*det.Quantity)*(1-Discount), 2 )} As Pro' +
        'ductValue'
      'FROM "Customers" cust'
      'INNER JOIN "Orders" o ON cust.CUSTOMERID = o.CUSTOMERID'
      'INNER JOIN  "Employees" e ON o.EmployeeID = e.EmployeeID'
      'INNER JOIN "Order Details" det ON o.OrderID = det.ORDERID'
      'ORDER BY Country')
    Left = 224
    Top = 344
  end
  object srcOrdersValue: TDataSource
    DataSet = dsOrdersValue
    Left = 320
    Top = 344
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'OrdersValue'
    CloseDataSource = False
    DataSource = srcOrdersValue
    BCDToCurrency = False
    Left = 424
    Top = 344
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 48
    Top = 432
  end
  object frxReportTableObject1: TfrxReportTableObject
    Left = 48
    Top = 480
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 136
    Top = 496
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 232
    Top = 496
  end
end
