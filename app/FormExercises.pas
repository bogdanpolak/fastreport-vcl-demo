unit FormExercises;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  frxClass;

type
  TFormReportExercises = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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

procedure TFormReportExercises.Button1Click(Sender: TObject);
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
  frx.DesignReport;
end;

end.
