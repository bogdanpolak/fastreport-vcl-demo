unit FormExercises;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  frxClass, System.Actions, Vcl.ActnList;

type
  TFormReportExercises = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    ActionList1: TActionList;
    actCreateReport1EmployeeList: TAction;
    actCreateReport2CustomerSalesMD: TAction;
    Button2: TButton;
    procedure actCreateReport1EmployeeListExecute(Sender: TObject);
    procedure actCreateReport2CustomerSalesMDExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReportExercises: TFormReportExercises;

implementation

{$R *.dfm}

uses DataModuleMain;

procedure TFormReportExercises.actCreateReport1EmployeeListExecute(
  Sender: TObject);
var
  frx: TfrxReport;
  Page: TfrxReportPage;
  TitleBand: TfrxReportTitle;
  DataBand: TfrxMasterData;
  frxds: TfrxDataset;
  TitleMemo: TfrxMemoView;
begin
  frx := DataModule1.frxReport1;
  frxds := DataModule1.frxdsEmployees;
  with frx do begin
    Clear;
    DataSets.Add(frxds);
  end;
  Page := TfrxReportPage.Create(frx);
  with Page do begin
    CreateUniqueName;
    SetDefaults;
    // Orientation := TPrinterOrientation.poLandscape;
  end;
  TitleBand := TfrxReportTitle.Create(Page);
  with TitleBand do begin
    CreateUniqueName;
    Top := 0;
    Height := 50;
  end;
  TitleMemo := TfrxMemoView.Create(TitleBand);
  with TitleMemo do begin
    Name := 'TitleMemo';
    Text := 'FastReport Demo - Employee Report';
    Height := 19;
    Align := baWidth;
  end;
  DataBand := TfrxMasterData.Create(Page);
  with DataBand do begin
    CreateUniqueName;
    Top := 70;
    Height := 26.5;
    DataSet := frxds;
  end;
  DataModule1.ShowReportDesigner;
end;

procedure TFormReportExercises.actCreateReport2CustomerSalesMDExecute(
  Sender: TObject);
var
  frx: TfrxReport;
  frxds1: TfrxDataset;
  frxds2: TfrxDataset;
  frxds3: TfrxDataset;
  Page: TfrxReportPage;
  DataBand1: TfrxMasterData;
  DataBand2: TfrxDetailData;
  DataBand3: TfrxSubdetailData;
begin
  frx := DataModule1.frxReport1;
  frxds1 := DataModule1.frxdsCustomers;
  frxds2 := DataModule1.frxdsOrders;
  frxds3 := DataModule1.frxdsOrderDetails;
  with frx do begin
    Clear;
    DataSets.Add(frxds1);
    DataSets.Add(frxds2);
    DataSets.Add(frxds3);
  end;
  Page := TfrxReportPage.Create(frx);
  with Page do begin
    CreateUniqueName;
    SetDefaults;
    // Orientation := TPrinterOrientation.poLandscape;
  end;
  DataBand1 := TfrxMasterData.Create(Page);
  with DataBand1 do begin
    Name := 'CustomerBand';
    Top := 20;
    Height := 26.5;
    DataSet := frxds1;
  end;
  DataBand2 := TfrxDetailData.Create(Page);
  with DataBand2 do begin
    Name := 'OrderBand';
    Top := 60;
    Height := 26.5;
    DataSet := frxds2;
  end;
  DataBand3 := TfrxSubdetailData.Create(Page);
  with DataBand3 do begin
    Name := 'OrderDetailBand';
    Top := 100;
    Height := 26.5;
    DataSet := frxds3;
  end;
  DataModule1.ShowReportDesigner;
end;

end.
