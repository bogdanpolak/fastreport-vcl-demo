unit DataModuleMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, frxDesgn, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, frxDBXComponents, Data.DBXFirebird,
  Data.SqlExpr, frxExportPDF, frxExportXLSX, frxExportBaseDialog, frxExportCSV,
  frxVariables, frxTableObject, frxCross, frxDCtrl, frxBarcode;

type
  TConnectionResult = (connOK, connInvalidUserPassword, connServerGone,
    connNoDatabaseFile, connOther);

  TDataModule1 = class(TDataModule)
    frxReport1: TfrxReport;
    frxdsCustomers: TfrxDBDataset;
    FDConnction1: TFDConnection;
    dsCustomers: TFDQuery;
    frxDesigner1: TfrxDesigner;
    dsOrders: TFDQuery;
    frxdsOrders: TfrxDBDataset;
    frxDBXComponents1: TfrxDBXComponents;
    FiredacdemoConnection: TSQLConnection;
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
    frxDBDataset1: TfrxDBDataset;
    frxCrossObject1: TfrxCrossObject;
    frxReportTableObject1: TfrxReportTableObject;
    frxDialogControls1: TfrxDialogControls;
    frxBarCodeObject1: TfrxBarCodeObject;
  private
    FEmployeeName: String;
    FEmployeePosition: String;
    { Private declarations }
  public
    procedure ShowReportDesigner;
    function ConnectDatabase: TConnectionResult;
    property EmployeeName: String read FEmployeeName write FEmployeeName;
    property EmployeePosition: String read FEmployeePosition
      write FEmployeePosition;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModule1 }

function TDataModule1.ConnectDatabase: TConnectionResult;
begin
  try
    FDConnction1.Open();
    Result := connOK;
  except
  on E: EFDDBEngineException do begin
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

end;

procedure TDataModule1.ShowReportDesigner;
begin
  frxReport1.Variables['UserName'] := QuotedStr(EmployeeName);
  frxReport1.Variables['UserPosition'] := QuotedStr (EmployeePosition);
  frxReport1.DesignReport;
end;

end.
