unit DataModuleMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, frxDesgn, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.Phys.IBWrapper,
  FireDAC.Stan.StorageBin,
  frxClass, frxDBSet, frxDBXComponents,
  frxExportPDF, frxExportXLSX, frxExportBaseDialog, frxExportCSV,
  frxVariables, frxTableObject, frxCross, frxDCtrl, frxBarcode,
  Data.SqlExpr, Data.DBXFirebird, Data.DBXInterBase,
  AppConfiguration;

type
  TConnectionResult = (connOK, connInvalidUserPassword, connServerGone,
    connNoDatabaseFile, connOther);

  TDataModule1 = class(TDataModule)
    frxReport1: TfrxReport;
    frxdsCustomers: TfrxDBDataset;
    FDConnection1: TFDConnection;
    dsCustomers: TFDQuery;
    frxDesigner1: TfrxDesigner;
    dsOrders: TFDQuery;
    frxdsOrders: TfrxDBDataset;
    frxDBXComponents1: TfrxDBXComponents;
    srcCustomers: TDataSource;
    dsOrderDetails: TFDQuery;
    srcOrders: TDataSource;
    frxdsOrderDetails: TfrxDBDataset;
    srcOrderDetails: TDataSource;
    dsEmployees: TFDQuery;
    srcEmployees: TDataSource;
    frxdsEmployees: TfrxDBDataset;
    frxCSVExport1: TfrxCSVExport;
    frxXLSXExport1: TfrxXLSXExport;
    frxPDFExport1: TfrxPDFExport;
    dsCustomerOrders: TFDQuery;
    srcCustomerOrders: TDataSource;
    frxdsCustomerOrders: TfrxDBDataset;
    dsOrdersValue: TFDQuery;
    srcOrdersValue: TDataSource;
    frxdsOrdersValue: TfrxDBDataset;
    frxCrossObject1: TfrxCrossObject;
    frxReportTableObject1: TfrxReportTableObject;
    frxDialogControls1: TfrxDialogControls;
    frxBarCodeObject1: TfrxBarCodeObject;
    DBXFirebirdConnection: TSQLConnection;
    DBXInterBaseConnection: TSQLConnection;
    dsDocument: TFDMemTable;
    dsDocumentFormID: TLargeintField;
    dsDocumentDocDate: TDateField;
    dsDocumentCity: TStringField;
    dsDocumentFirstName: TStringField;
    dsDocumentLastName: TStringField;
    dsDocumentAddress: TStringField;
    dsDocumentContact: TStringField;
    PlotLocation: TStringField;
    dsDocumentPlotLocation: TStringField;
    dsDocumentObtainingGoal: TStringField;
    dsDocumentIsCollectInPerson: TBooleanField;
    srcDocument: TDataSource;
    frxdsDocument: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    FEmployeeName: String;
    FEmployeePosition: String;
    FAppConfiguration: TAppConfiguration;
    { Private declarations }
  public
    procedure ShowReportDesigner;
    function ConnectDatabase: TConnectionResult;
    property EmployeeName: String read FEmployeeName write FEmployeeName;
    property EmployeePosition: String read FEmployeePosition
      write FEmployeePosition;
    property AppConfiguration: TAppConfiguration read FAppConfiguration
      write FAppConfiguration;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModule1 }

function TDataModule1.ConnectDatabase: TConnectionResult;
begin
  if (AppConfiguration<>nil) and (AppConfiguration.DatabaseName<>'') then begin
    FDConnection1.ConnectionDefName := '';
    FDConnection1.DriverName := 'FB';
    with FDConnection1.Params as TFDPhysFBConnectionDefParams do begin
      Protocol := ipTCPIP;
      Server := AppConfiguration.DatabaseServer;
      Database := AppConfiguration.DatabaseName;
      UserName := AppConfiguration.DatabaseUser;
      Password := AppConfiguration.DatabasePassword;
      CharacterSet := csUTF8;
    end;
  end;
  try
    FDConnection1.Open();
    Result := connOK;
  except
    on E: EFDDBEngineException do
    begin
      if E.Kind = ekUserPwdInvalid then
        Result := connInvalidUserPassword
      else if E.Kind = ekServerGone then
        Result := connServerGone
      else if E.ErrorCode = 335544344 then // FireBird: Cant fide database file
        Result := connNoDatabaseFile
      else
        Result := connOther;
    end;
  end;
  if AppConfiguration.AppLevel=1 then
  begin
    FreeAndNil (frxdsCustomerOrders);
    FreeAndNil (frxdsOrdersValue);
    FreeAndNil (frxdsDocument);
  end;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  if FDConnection1.Connected then
    raise Exception.Create('Switch off the database connection: ' +
      FDConnection1.Name);
end;

procedure TDataModule1.ShowReportDesigner;
begin
  frxReport1.Variables['UserName'] := QuotedStr(EmployeeName);
  frxReport1.Variables['UserPosition'] := QuotedStr(EmployeePosition);
  frxReport1.DesignReport;
end;

end.
