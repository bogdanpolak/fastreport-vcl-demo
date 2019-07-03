unit FormView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormViewData = class(TForm)
    DBGrid1: TDBGrid;
    ListBox1: TListBox;
    Splitter1: TSplitter;
    DataSource1: TDataSource;
    Memo1: TMemo;
    Splitter2: TSplitter;
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormViewData: TFormViewData;

implementation

{$R *.dfm}

uses
  FireDAC.Comp.Client,
  DataModuleMain;

procedure TFormViewData.ListBox1Click(Sender: TObject);
var
  DataSetName: string;
  ds: TDataSet; //TFDQuery;
begin
  if ListBox1.ItemIndex<0 then
    ds := nil
  else begin
    DataSetName := ListBox1.Items[ListBox1.ItemIndex];
    ds := (DataModule1.FindComponent(DataSetName) as TDataSet)
  end;
  DataSource1.DataSet := ds;
  if ds<>nil then
  begin
    ds.Open();
    if ds is TFDQuery then
      Memo1.Lines.Text := (ds as TFDQuery).Text
    else
      Memo1.Lines.Text := 'Not TFDQuery dataset';
  end;
end;

end.
