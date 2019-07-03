object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 568
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
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=FB_Demo')
    LoginPrompt = False
    Left = 152
    Top = 40
  end
  object dsCustomers: TFDQuery
    Connection = FDConnection1
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
    Connection = FDConnection1
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
      'EMPLOYEENAME=EMPLOYEENAME'
      'ORDERDATE=ORDERDATE'
      'REQUIREDDATE=REQUIREDDATE'
      'SHIPPEDDATE=SHIPPEDDATE'
      'SHIPVIA=SHIPVIA'
      'FREIGHT=FREIGHT'
      'SHIPNAME=SHIPNAME'
      'SHIPADDRESS=SHIPADDRESS'
      'SHIPCITY=SHIPCITY'
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
  object srcCustomers: TDataSource
    DataSet = dsCustomers
    Left = 320
    Top = 80
  end
  object dsOrderDetails: TFDQuery
    MasterSource = srcOrders
    MasterFields = 'ORDERID'
    DetailFields = 'ORDERID'
    Connection = FDConnection1
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
    Connection = FDConnection1
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
    Top = 312
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
    Top = 360
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
    Top = 408
  end
  object dsCustomerOrders: TFDQuery
    Connection = FDConnection1
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
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '  cust.CustomerID, cust.Country, '
      '  e.FirstName||'#39' '#39'||e.LastName as EmployeeName, det.ProductID,'
      '  {YEAR(o.OrderDate)} as OrderYear, '
      
        '  '#39'Q'#39'||{ fn CONVERT( ({Month(o.OrderDate)}-1)/3+1, CHAR)} as Ord' +
        'erQuater,  '
      '  {Month(o.OrderDate)} as OrderMonth,'
      
        '  {floor((det.UnitPrice*det.Quantity)*(1-Discount)*100+0.5 )}/10' +
        '0 As ProductValue'
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
  object frxdsOrdersValue: TfrxDBDataset
    UserName = 'OrdersValue'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CUSTOMERID=CUSTOMERID'
      'COUNTRY=COUNTRY'
      'EMPLOYEENAME=EMPLOYEENAME'
      'PRODUCTID=PRODUCTID'
      'ORDERYEAR=ORDERYEAR'
      'ORDERQUATER=ORDERQUATER'
      'ORDERMONTH=ORDERMONTH'
      'PRODUCTVALUE=PRODUCTVALUE')
    DataSource = srcOrdersValue
    BCDToCurrency = False
    Left = 424
    Top = 344
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 48
    Top = 456
  end
  object frxReportTableObject1: TfrxReportTableObject
    Left = 48
    Top = 504
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 176
    Top = 504
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 272
    Top = 504
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
  object IbfiredacdemoConnection: TSQLConnection
    ConnectionName = 'IBFireDacDemo'
    DriverName = 'Interbase'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'DriverUnit=Data.DBXInterBase'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver260.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXInterbaseMetaDataCommandFactory,DbxInt' +
        'erBaseDriver260.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXInterbaseMetaDataCommand' +
        'Factory,Borland.Data.DbxInterBaseDriver,Version=24.0.0.0,Culture' +
        '=neutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxint.dll'
      'LibraryNameOsx=libsqlib.dylib'
      'VendorLib=GDS32.DLL'
      'VendorLibWin64=ibclient64.dll'
      'VendorLibOsx=libgds.dylib'
      'Database=C:\Data\Interbase\FIREDAC-DEMO.IB'
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
      'DisplayDriverName=InterBase Server'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False'
      'SEP=')
    Left = 50
    Top = 266
  end
  object dsDocument: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'FormID'
        DataType = ftLargeint
      end
      item
        Name = 'DocDate'
        DataType = ftDate
      end
      item
        Name = 'City'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'FirstName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LastName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Address'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Contact'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PlotRegistrationNo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PlotLocation'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ObtainingGoal'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'IsCollectInPerson'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 224
    Top = 424
    Content = {
      414442530F001D2F3F070000FF00010001FF02FF030400140000006400730044
      006F00630075006D0065006E00740005000A0000005400610062006C00650006
      0000000000070000080032000000090000FF0AFF0B04000C00000046006F0072
      006D004900440005000C00000046006F0072006D00490044000C00010000000E
      000D000F000110000111000112000113000114000115000C00000046006F0072
      006D0049004400FEFF0B04000E00000044006F00630044006100740065000500
      0E00000044006F00630044006100740065000C00020000000E0016000F000110
      000111000112000113000114000115000E00000044006F006300440061007400
      6500FEFF0B040008000000430069007400790005000800000043006900740079
      000C00030000000E0017001800500000000F0001100001110001120001130001
      1400011500080000004300690074007900190050000000FEFF0B040012000000
      460069007200730074004E0061006D0065000500120000004600690072007300
      74004E0061006D0065000C00040000000E0017001800320000000F0001100001
      110001120001130001140001150012000000460069007200730074004E006100
      6D006500190032000000FEFF0B0400100000004C006100730074004E0061006D
      0065000500100000004C006100730074004E0061006D0065000C00050000000E
      0017001800320000000F00011000011100011200011300011400011500100000
      004C006100730074004E0061006D006500190032000000FEFF0B04000E000000
      410064006400720065007300730005000E000000410064006400720065007300
      73000C00060000000E0017001800640000000F00011000011100011200011300
      0114000115000E0000004100640064007200650073007300190064000000FEFF
      0B04000E00000043006F006E00740061006300740005000E00000043006F006E
      0074006100630074000C00070000000E0017001800640000000F000110000111
      000112000113000114000115000E00000043006F006E00740061006300740019
      0064000000FEFF0B04002400000050006C006F00740052006500670069007300
      740072006100740069006F006E004E006F0005002400000050006C006F007400
      52006500670069007300740072006100740069006F006E004E006F000C000800
      00000E0017001800320000000F00011000011100011200011300011400011500
      2400000050006C006F0074005200650067006900730074007200610074006900
      6F006E004E006F00190032000000FEFF0B04001800000050006C006F0074004C
      006F0063006100740069006F006E0005001800000050006C006F0074004C006F
      0063006100740069006F006E000C00090000000E0017001800320000000F0001
      10000111000112000113000114000115001800000050006C006F0074004C006F
      0063006100740069006F006E00190032000000FEFF0B04001A0000004F006200
      7400610069006E0069006E00670047006F0061006C0005001A0000004F006200
      7400610069006E0069006E00670047006F0061006C000C000A0000000E001700
      1800D00700000F00011000011A000111000112000113000114000115001A0000
      004F0062007400610069006E0069006E00670047006F0061006C001900D00700
      00FEFF0B0400220000004900730043006F006C006C0065006300740049006E00
      50006500720073006F006E000500220000004900730043006F006C006C006500
      6300740049006E0050006500720073006F006E000C000B0000000E001B000F00
      011000011100011200011300011400011500220000004900730043006F006C00
      6C0065006300740049006E0050006500720073006F006E00FEFEFF1CFEFF1DFE
      FF1EFF1F200000000000FF21000003E5F9DBE80000000100C63F0B0002000700
      0000A3EA637A796365030006000000426F6764616E040005000000506F6C616B
      050022000000576172737A6177612030312D3832322C20756C2E20536368726F
      656765726120333206003400000074656C2E206B6F6D2E3A203630312D363031
      2D3630312C20656D61696C3A20626F6764616E2E706F6C616B40676D61696C2E
      706C0700110000003130323030365F322E303032302E39363708000D00000053
      6F6B6F6C6E696B692D4C61730900F40000004C6F72656D20697073756D20646F
      6C6F722073697420616D65742C20636F6E736563746574757220616469706973
      63696E6720656C69742C2073656420646F20656975736D6F642074656D706F72
      20696E6369646964756E74207574206C61626F726520657420646F6C6F726520
      6D61676E6120616C697175612E20436F6E677565206E69736920766974616520
      73757363697069742074656C6C7573206D617572697320612E204D616C657375
      6164612066616D6573206163207475727069732065676573746173206D616563
      656E617320706861726574726120636F6E76616C6C697320706F737565726520
      6D6F7262692E0A000100FEFEFEFEFEFF22FEFF23240001000000FF25FEFEFE0E
      004D0061006E0061006700650072001E00550070006400610074006500730052
      00650067006900730074007200790012005400610062006C0065004C00690073
      0074000A005400610062006C00650008004E0061006D006500140053006F0075
      007200630065004E0061006D0065000A0054006100620049004400240045006E
      0066006F0072006300650043006F006E00730074007200610069006E00740073
      001E004D0069006E0069006D0075006D00430061007000610063006900740079
      00180043006800650063006B004E006F0074004E0075006C006C00140043006F
      006C0075006D006E004C006900730074000C0043006F006C0075006D006E0010
      0053006F007500720063006500490044000E006400740049006E007400360034
      0010004400610074006100540079007000650014005300650061007200630068
      00610062006C006500120041006C006C006F0077004E0075006C006C00080042
      0061007300650014004F0041006C006C006F0077004E0075006C006C0012004F
      0049006E0055007000640061007400650010004F0049006E0057006800650072
      0065001A004F0072006900670069006E0043006F006C004E0061006D0065000C
      0064007400440061007400650018006400740041006E00730069005300740072
      0069006E0067000800530069007A006500140053006F00750072006300650053
      0069007A006500100042006C006F006200440061007400610012006400740042
      006F006F006C00650061006E001C0043006F006E00730074007200610069006E
      0074004C00690073007400100056006900650077004C006900730074000E0052
      006F0077004C00690073007400060052006F0077000A0052006F007700490044
      0010004F0072006900670069006E0061006C001800520065006C006100740069
      006F006E004C006900730074001C0055007000640061007400650073004A006F
      00750072006E0061006C001200530061007600650050006F0069006E0074000E
      004300680061006E00670065007300}
    object dsDocumentFormID: TLargeintField
      FieldName = 'FormID'
    end
    object dsDocumentDocDate: TDateField
      FieldName = 'DocDate'
    end
    object dsDocumentCity: TStringField
      FieldName = 'City'
      Size = 80
    end
    object dsDocumentFirstName: TStringField
      FieldName = 'FirstName'
      Size = 50
    end
    object dsDocumentLastName: TStringField
      FieldName = 'LastName'
      Size = 50
    end
    object dsDocumentAddress: TStringField
      FieldName = 'Address'
      Size = 100
    end
    object dsDocumentContact: TStringField
      FieldName = 'Contact'
      Size = 100
    end
    object PlotLocation: TStringField
      FieldName = 'PlotRegistrationNo'
      Size = 50
    end
    object dsDocumentPlotLocation: TStringField
      FieldName = 'PlotLocation'
      Size = 50
    end
    object dsDocumentObtainingGoal: TStringField
      FieldName = 'ObtainingGoal'
      Size = 2000
    end
    object dsDocumentIsCollectInPerson: TBooleanField
      FieldName = 'IsCollectInPerson'
    end
  end
  object srcDocument: TDataSource
    DataSet = dsDocument
    Left = 320
    Top = 424
  end
  object frxdsDocument: TfrxDBDataset
    UserName = 'Document'
    CloseDataSource = False
    DataSource = srcDocument
    BCDToCurrency = False
    Left = 424
    Top = 424
  end
end
