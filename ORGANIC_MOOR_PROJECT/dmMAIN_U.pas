unit dmMAIN_U; // CONNECTING DATABASE DYNAMICALLY

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmMain = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    conDatabase: TADOConnection;
    tblUsers: TADOTable;
    tblCPUs: TADOTable;
    tblGPUs: TADOTable;
    tblRAM: TADOTable;
    tblLocations: TADOTable;
    tblStorage: TADOTable;
    tblCarbonEmissions: TADOTable;
    tblComputers: TADOTable;

    dscUsers: TDataSource;
    dscStorage: TDataSource;
    dscCarbonEmissions: TDataSource;
    dscComputers: TDataSource;
    dscRAM: TDataSource;
    dscCPUs: TDataSource;
    dscGPUs: TDataSource;
    dscLocations: TDataSource;

    Query: TADOQuery;
  end;

var
  dmMain: TdmMain;

implementation

{$R *.dfm}

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
  conDatabase := TADOConnection.Create(dmMain);
  tblUsers := TADOTable.Create(dmMain);
  tblCPUs := TADOTable.Create(dmMain);
  tblGPUs := TADOTable.Create(dmMain);
  tblRAM := TADOTable.Create(dmMain);
  tblLocations := TADOTable.Create(dmMain);
  tblStorage := TADOTable.Create(dmMain);
  tblCarbonEmissions := TADOTable.Create(dmMain);
  tblComputers := TADOTable.Create(dmMain);

  dscUsers := TDataSource.Create(dmMain);
  dscStorage := TDataSource.Create(dmMain);
  dscCarbonEmissions := TDataSource.Create(dmMain);
  dscComputers := TDataSource.Create(dmMain);
  dscRAM := TDataSource.Create(dmMain);
  dscCPUs := TDataSource.Create(dmMain);
  dscGPUs := TDataSource.Create(dmMain);
  dscLocations := TDataSource.Create(dmMain);

  Query := TADOQuery.Create(dmMain);

  conDatabase.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=dbOrganicMoor.mdb;Mode=ReadWrite;Persist Security Info=False';
  conDatabase.LoginPrompt := False;
  conDatabase.Open();

  tblUsers.Connection := conDatabase;
  tblUsers.TableName := 'tblUsers';

  tblCPUs.Connection := conDatabase;
  tblCPUs.TableName := 'tblCPUs';

  tblGPUs.Connection := conDatabase;
  tblGPUs.TableName := 'tblGPUs';

  tblRAM.Connection := conDatabase;
  tblRAM.TableName := 'tblRAM';

  tblLocations.Connection := conDatabase;
  tblLocations.TableName := 'tblLocations';

  tblStorage.Connection := conDatabase;
  tblStorage.TableName := 'tblStorage';

  tblCarbonEmissions.Connection := conDatabase;
  tblCarbonEmissions.TableName := 'tblCarbonEmissions';

  tblComputers.Connection := conDatabase;
  tblComputers.TableName := 'tblComputers';

  Query.Connection := conDatabase;

  dscUsers.DataSet := tblUsers;
  dscStorage.DataSet := tblStorage;
  dscCarbonEmissions.DataSet := tblCarbonEmissions;
  dscComputers.DataSet := tblComputers;
  dscRAM.DataSet := tblRAM;
  dscCPUs.DataSet := tblCPUs;
  dscGPUs.DataSet := tblGPUs;
  dscLocations.DataSet := tblLocations;

  tblUsers.Open;
  tblCPUs.Open;
  tblGPUs.Open;
  tblRAM.Open;
  tblLocations.Open;
  tblStorage.Open;
  tblCarbonEmissions.Open;
  tblComputers.Open;
end;

end.
