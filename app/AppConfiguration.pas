unit AppConfiguration;

interface

uses System.SysUtils, System.Classes, System.IniFiles;

type
  TAppConfiguration = class(TComponent)
  private
    FDatabaseServer: String;
    FDatabaseName: String;
    FDatabaseUser: String;
    FDatabasePassword: String;
    FAppLevel: Integer;
  public
    procedure LoadFromIniFile;
    property DatabaseServer: String read FDatabaseServer write FDatabaseServer;
    property DatabaseName: String read FDatabaseName write FDatabaseName;
    property DatabaseUser: String read FDatabaseUser write FDatabaseUser;
    property DatabasePassword: String read FDatabasePassword
      write FDatabasePassword;
    property AppLevel: Integer read FAppLevel write FAppLevel;
  end;

implementation

uses
  Vcl.Forms;

procedure TAppConfiguration.LoadFromIniFile;
var
  ExeFName: string;
  IniFName: string;
  ini: TIniFile;
begin
  ExeFName := Vcl.Forms.Application.ExeName;
  IniFName := ChangeFileExt(ExeFName, '.ini');
  if FileExists(IniFName) then
  begin
    ini := TIniFile.Create(IniFName);
    DatabaseServer := ini.ReadString('DBConnection', 'Server', '');
    DatabaseName := ini.ReadString('DBConnection', 'DBName', '');
    DatabaseUser := ini.ReadString('DBConnection', 'User', '');
    DatabasePassword := ini.ReadString('DBConnection', 'Password', '');
    AppLevel := ini.ReadInteger('Application','Level',1);
  end
  else
    AppLevel := 1;
end;

end.
