unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    Button2: TButton;
    ComboBox1: TComboBox;
    StatusBar1: TStatusBar;
    tmrReady: TTimer;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    btnShowExercises: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure tmrReadyTimer(Sender: TObject);
    procedure btnShowExercisesClick(Sender: TObject);
  private
    procedure FillEmployeeComboBox (EmployeeCB: TComboBox);
    procedure SetCurrentUser(id: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses DataModuleMain, FormView, FormExercises;

procedure TForm1.btnShowExercisesClick(Sender: TObject);
begin
  FormReportExercises.Show;
  FormReportExercises.Left := Left + Width;
  FormReportExercises.Top := Top;
  FormReportExercises.Height := Height;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  DataModule1.ShowReportDesigner;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FormViewData.Show;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  s: string;
  i: Integer;
  j: Integer;
  sid: string;
  id: Integer;
begin
  if ComboBox1.ItemIndex>=0 then begin
    s := ComboBox1.Items[ComboBox1.ItemIndex];
    i := pos('[id:',s);
    if i>0 then
    begin
      i := i +4; j:=i;
      while (s[j]>='0') and (s[j]<='9') do
        inc(j);
      sid := s.Substring(i-1,j-i);
      id := StrToInt(sid);
      SetCurrentUser(id);
    end;
  end;
end;

type
  TEmployee = record id: integer; fullname: string; position:string; end;
const
  EmployeeArray: array [0..8] of TEmployee = (
    (id:1; fullname:'Nancy Davolio'; position:'Sales Representative'),
    (id:2; fullname:'Andrew Fuller'; position:'Vice President, Sales'),
    (id:3; fullname:'Janet Leverling'; position:'Sales Representative'),
    (id:4; fullname:'Margaret Peacock'; position:'Sales Representative'),
    (id:5; fullname:'Steven Buchanan'; position:'Sales Manager'),
    (id:6; fullname:'Michael Suyama'; position:'Sales Representative'),
    (id:7; fullname:'Robert King'; position:'Sales Representative'),
    (id:8; fullname:'Laura Callahan'; position:'Inside Sales Coordinator'),
    (id:9; fullname:'Anne Dodsworth'; position:'Sales Representative')
  );

procedure TForm1.SetCurrentUser (id: integer);
var
  emp: TEmployee;
  i: Integer;
begin
  for i := 0 to High(EmployeeArray) do
    if EmployeeArray[i].id = id then
    begin
      emp := EmployeeArray[i];
      DataModule1.EmployeeName := emp.fullname;
      DataModule1.EmployeePosition := emp.position;
      StatusBar1.Panels[0].Text := 'User: '+DataModule1.EmployeeName;
      StatusBar1.Panels[1].Text := 'Position: '+DataModule1.EmployeePosition;
      exit;
    end;
end;

procedure TForm1.tmrReadyTimer(Sender: TObject);
var
  res: TConnectionResult;
begin
  tmrReady.Enabled := false;
  SetCurrentUser(EmployeeArray[0].id);
  res := DataModule1.ConnectDatabase;
  case res of
    connOK: ;
    connInvalidUserPassword: ShowMessage('Niepoprawne has³o lub u¿ytkownik');
    connServerGone: ShowMessage('Nie mo¿na po³¹czyæ siê z serwerem SQL');
    connNoDatabaseFile: ShowMessage('[FB/IB] Server nie mo¿e odnaleŸæ pliku z baz¹ danych');
    connOther: ShowMessage('B³¹d po³¹czenia. Nie mo¿na rozpoznaæ przyczyny b³êdu.');
  end;
end;

procedure TForm1.FillEmployeeComboBox (EmployeeCB: TComboBox);
var
  i: Integer;
  emp: TEmployee;
begin
  EmployeeCB.Enabled := False;
  EmployeeCB.Items.Clear;
  for i := 0 to High(EmployeeArray) do
  begin
    emp := EmployeeArray[i];
    EmployeeCB.Items.Add ( emp.fullname+' ('+emp.position+') [id:'+
      emp.id.ToString+']' )
  end;
  EmployeeCB.ItemIndex := 0;
  EmployeeCB.Enabled := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FillEmployeeComboBox (ComboBox1);
end;

end.
