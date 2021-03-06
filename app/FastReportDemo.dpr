program FastReportDemo;

uses
  Vcl.Forms,
  FormMain in 'FormMain.pas' {Form1},
  DataModuleMain in 'DataModuleMain.pas' {DataModule1: TDataModule},
  FormView in 'FormView.pas' {FormViewData},
  FormExercises in 'FormExercises.pas' {FormReportExercises},
  AppConfiguration in 'AppConfiguration.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormViewData, FormViewData);
  Application.CreateForm(TFormReportExercises, FormReportExercises);
  Application.Run;
end.
