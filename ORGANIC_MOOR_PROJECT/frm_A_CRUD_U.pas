unit frm_A_CRUD_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, dmMAIN_U, CheckLst;

type
  TfrmCRUD_A = class(TForm)
    pnlProgram: TPanel;
    pnlCustomTitleBar: TPanel;
    imgClose: TImage;
    pnlCRUD_A: TPanel;
    btnDelete_A: TButton;
    btnEdit_A: TButton;
    btnInsert_A: TButton;
    pnlManageTable: TPanel;
    lblManageTable: TLabel;
    cmbManageTable: TComboBox;
    chkLocationFields: TCheckListBox;
    chkCarbonEmissionFields: TCheckListBox;
    chkComputerFields: TCheckListBox;
    chkUserFields: TCheckListBox;
    chkCPUFields: TCheckListBox;
    chkGPUFields: TCheckListBox;
    chkRAMFields: TCheckListBox;
    chkStorageFields: TCheckListBox;
    btnSaveChanges: TButton;
    pnlCheckLists: TPanel;
    procedure btnDelete_AClick(Sender: TObject);
    procedure btnEdit_AClick(Sender: TObject);
    procedure btnInsert_AClick(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure chkGPUFieldsClick(Sender: TObject);
    procedure chkCarbonEmissionFieldsClick(Sender: TObject);
    procedure chkRAMFieldsClick(Sender: TObject);
    procedure chkLocationFieldsClick(Sender: TObject);
    procedure chkStorageFieldsClick(Sender: TObject);
    procedure chkComputerFieldsClick(Sender: TObject);
    procedure chkCPUFieldsClick(Sender: TObject);
    procedure chkUserFieldsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidateInteger(const str: string): boolean;
    function ValidateRealValue(const Value: string): boolean;
    function ValidateDate(const DateStr: string): boolean;
  end;

var
  frmCRUD_A: TfrmCRUD_A;

implementation

{$R *.dfm}

function TfrmCRUD_A.ValidateDate(const DateStr: string): boolean;
var
  TempDate: TDateTime;
begin
  Result := TryStrToDate(DateStr, TempDate)
end;

function TfrmCRUD_A.ValidateInteger(const str: string): boolean;
var
  intValue: Integer;
begin
  Result := TryStrToInt(str, intValue);
end;

function TfrmCRUD_A.ValidateRealValue(const Value: string): boolean;
var
  RealValue: Extended;
begin
  Result := TryStrToFloat(Value, RealValue);
end;

procedure TfrmCRUD_A.btnSaveClick(Sender: TObject);
var
  sRecord: String;
  sCPUPowerConsumption, sGPUPowerConsumption, sRAMPowerConsumption,
    sStoragePowerConsumption, sCarbonIntensity, sDate, sComputerID,
    sTotalEnergy, sCarbonEmissions, sRuntime, sCompID,
    sTotalPowerConsumption: String;
  sCPUID, sGPUID, sRAMID, sStorageID, sLocationID, sUserID: String;
begin
  case cmbManageTable.ItemIndex of
    0:
      begin
        case chkUserFields.ItemIndex of
          - 1:
            begin
              ShowMessage('SELECT FIELD TO EDIT');
            end;
          0:
            begin
              sRecord := InputBox('EDIT', 'ENTER USER ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblUsers.Locate('UserID', sRecord, []) = True then
                begin
                  dmMain.tblUsers.Edit;
                  dmMain.tblUsers['Username'] := InputBox('EDIT',
                    'ENTER USERNAME', '');
                  dmMain.tblUsers.Post;
                  ShowMessage('CHANGES SAVED!');
                end
                else
                begin
                  ShowMessage('USER NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
        end;
      end;
    1:
      begin
        case chkComputerFields.ItemIndex of
          - 1:
            begin
              ShowMessage('SELECT FIELD TO EDIT');
            end;
          0:
            begin
              sRecord := InputBox('EDIT', 'ENTER COMPUTER ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblComputers.Locate('ComputerID', sRecord, [])
                  = True then
                begin
                  sRuntime := InputBox('EDIT', 'ENTER RUNTIME', '');
                  if ValidateInteger(sRuntime) OR NOT(sRuntime = '') then
                  begin
                    dmMain.tblComputers.Edit;
                    dmMain.tblComputers['Runtime'] := sRuntime;
                    dmMain.tblComputers.Post;
                    ShowMessage('CHANGES SAVED!');
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID INTEGER!');
                  end;
                end
                else
                begin
                  ShowMessage('COMPUTER NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          1:
            begin
              sRecord := InputBox('EDIT', 'ENTER COMPUTER ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblComputers.Locate('ComputerID', sRecord, [])
                  = True then
                begin
                  sTotalPowerConsumption := InputBox('EDIT',
                    'ENTER TOTAL POWER CONSUMPTION', '');
                  if ValidateRealValue(sTotalPowerConsumption) OR NOT
                    (sTotalPowerConsumption = '') then
                  begin
                    dmMain.tblComputers.Edit;
                    dmMain.tblComputers['TotalPowerConsumption'] :=
                      sTotalPowerConsumption;
                    dmMain.tblComputers.Post;
                    ShowMessage('CHANGES SAVED!');
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID FLOAT VALUE');
                  end;
                end
                else
                begin
                  ShowMessage('COMPUTER NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          2:
            begin
              sRecord := InputBox('EDIT', 'ENTER COMPUTER ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblComputers.Locate('ComputerID', sRecord, [])
                  = True then
                begin
                  // CPUID
                  sCPUID := InputBox('EDIT', 'ENTER CPU ID', '');
                  if ValidateInteger(sCPUID) OR NOT(sCPUID = '') then
                  begin
                    if dmMain.tblCPUs.Locate('CPUID', sCPUID, []) = True then
                    begin
                      dmMain.tblComputers.Edit;
                      dmMain.tblComputers['CPUID'] := sCPUID;
                      dmMain.tblComputers.Post;
                      ShowMessage('CHANGES SAVED!');
                    end
                    else
                    begin
                      ShowMessage('THIS CPU DOES NOT EXIST');
                    end;
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID INTEGER!');
                  end;
                end
                else
                begin
                  ShowMessage('COMPUTER NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          3:
            begin
              sRecord := InputBox('EDIT', 'ENTER COMPUTER ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblComputers.Locate('ComputerID', sRecord, [])
                  = True then
                begin
                  // GPUID
                  sGPUID := InputBox('EDIT', 'ENTER GPU ID', '');
                  if ValidateInteger(sGPUID) OR NOT(sGPUID = '') then
                  begin
                    if dmMain.tblGPUs.Locate('GPUID', sGPUID, []) = True then
                    begin
                      dmMain.tblComputers.Edit;
                      dmMain.tblComputers['GPUID'] := sGPUID;
                      dmMain.tblComputers.Post;
                      ShowMessage('CHANGES SAVED!');
                    end
                    else
                    begin
                      ShowMessage('THIS GPU DOES NOT EXIST');
                    end;
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID INTEGER!');
                  end;
                end
                else
                begin
                  ShowMessage('COMPUTER NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          4:
            begin
              sRecord := InputBox('EDIT', 'ENTER COMPUTER ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblComputers.Locate('ComputerID', sRecord, [])
                  = True then
                begin
                  // RAMID
                  sRAMID := InputBox('EDIT', 'ENTER RAM ID', '');
                  if ValidateInteger(sRAMID) OR NOT(sRAMID = '') then
                  begin
                    if dmMain.tblRAM.Locate('RAMID', sRAMID, []) = True then
                    begin
                      dmMain.tblComputers.Edit;
                      dmMain.tblComputers['RAMID'] := sRAMID;
                      dmMain.tblComputers.Post;
                      ShowMessage('CHANGES SAVED!');
                    end
                    else
                    begin
                      ShowMessage('THIS RAM DOES NOT EXIST');
                    end;
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID INTEGER!');
                  end;
                end
                else
                begin
                  ShowMessage('COMPUTER NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          5:
            begin
              sRecord := InputBox('EDIT', 'ENTER COMPUTER ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblComputers.Locate('ComputerID', sRecord, [])
                  = True then
                begin
                  // StorageID
                  sStorageID := InputBox('EDIT', 'ENTER STORAGE ID', '');
                  if ValidateInteger(sStorageID) OR NOT(sStorageID = '') then
                  begin
                    if dmMain.tblStorage.Locate('StorageID', sStorageID, [])
                      = True then
                    begin
                      dmMain.tblComputers.Edit;
                      dmMain.tblComputers['StorageID'] := sStorageID;
                      dmMain.tblComputers.Post;
                      ShowMessage('CHANGES SAVED!');
                    end
                    else
                    begin
                      ShowMessage('THIS STORAGE DOES NOT EXIST');
                    end;
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID INTEGER!');
                  end;
                end
                else
                begin
                  ShowMessage('COMPUTER NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          6:
            begin
              sRecord := InputBox('EDIT', 'ENTER COMPUTER ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblComputers.Locate('ComputerID', sRecord, [])
                  = True then
                begin
                  // LocationID
                  sLocationID := InputBox('EDIT', 'ENTER LOCATION ID', '');
                  if ValidateInteger(sLocationID) OR NOT(sLocationID = '') then
                  begin
                    if dmMain.tblLocations.Locate('LocationID', sLocationID,
                      []) = True then
                    begin
                      dmMain.tblComputers.Edit;
                      dmMain.tblComputers['LocationID'] := sLocationID;
                      dmMain.tblComputers.Post;
                      ShowMessage('CHANGES SAVED!');
                    end
                    else
                    begin
                      ShowMessage('THIS LOCATION DOES NOT EXIST');
                    end;
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID INTEGER!');
                  end;
                end
                else
                begin
                  ShowMessage('COMPUTER NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          7:
            begin
              sRecord := InputBox('EDIT', 'ENTER COMPUTER ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblComputers.Locate('ComputerID', sRecord, [])
                  = True then
                begin
                  // UserID
                  sUserID := InputBox('EDIT', 'ENTER USER ID', '');
                  if ValidateInteger(sUserID) OR NOT(sUserID = '') then
                  begin
                    if dmMain.tblUsers.Locate('UserID', sUserID, []) = True then
                    begin
                      dmMain.tblComputers.Edit;
                      dmMain.tblComputers['UserID'] := sUserID;
                      dmMain.tblComputers.Post;
                      ShowMessage('CHANGES SAVED!');
                    end
                    else
                    begin
                      ShowMessage('THIS USER DOES NOT EXIST');
                    end;
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID INTEGER!');
                  end;
                end
                else
                begin
                  ShowMessage('COMPUTER NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
        end;
      end;
    2:
      begin
        case chkCPUFields.ItemIndex of
          - 1:
            begin
              ShowMessage('SELECT FIELD TO EDIT');
            end;
          0:
            begin
              sRecord := InputBox('EDIT', 'ENTER CPU ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblCPUs.Locate('CPUID', sRecord, []) = True then
                begin
                  dmMain.tblCPUs.Edit;
                  dmMain.tblCPUs['CPUManufacturer'] := InputBox('EDIT',
                    'ENTER CPU MANUFACTURER', '');
                  dmMain.tblCPUs.Post;
                  ShowMessage('CHANGES SAVED!');
                end
                else
                begin
                  ShowMessage('CPU NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          1:
            begin
              sRecord := InputBox('EDIT', 'ENTER CPU ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblCPUs.Locate('CPUID', sRecord, []) = True then
                begin
                  dmMain.tblCPUs.Edit;
                  dmMain.tblCPUs['CPUModel'] := InputBox('EDIT',
                    'ENTER CPU MODEL', '');
                  dmMain.tblCPUs.Post;
                  ShowMessage('CHANGES SAVED!');
                end
                else
                begin
                  ShowMessage('CPU NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          2:
            begin
              sRecord := InputBox('EDIT', 'ENTER CPU ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblCPUs.Locate('CPUID', sRecord, []) = True then
                begin
                  sCPUPowerConsumption := InputBox('EDIT',
                    'ENTER POWER CONSUMPTION', '');
                  if ValidateRealValue(sCPUPowerConsumption) then
                  begin
                    dmMain.tblCPUs.Edit;
                    dmMain.tblCPUs['CPUPowerConsumption'] :=
                      sCPUPowerConsumption;
                    dmMain.tblCPUs.Post;
                    ShowMessage('CHANGES SAVED!');
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID FLOAT VALUE');
                  end;
                end
                else
                begin
                  ShowMessage('CPU NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
        end;
      end;

    3:
      begin
        case chkGPUFields.ItemIndex of
          - 1:
            begin
              ShowMessage('SELECT FIELD TO EDIT');
            end;
          0:
            begin
              sRecord := InputBox('EDIT', 'ENTER GPU ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblGPUs.Locate('GPUID', sRecord, []) = True then
                begin
                  dmMain.tblGPUs.Edit;
                  dmMain.tblGPUs['GPUManufacturer'] := InputBox('EDIT',
                    'ENTER GPU MANUFACTURER', '');
                  dmMain.tblGPUs.Post;
                  ShowMessage('CHANGES SAVED!');
                end
                else
                begin
                  ShowMessage('GPU NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          1:
            begin
              sRecord := InputBox('EDIT', 'ENTER GPU ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblGPUs.Locate('GPUID', sRecord, []) = True then
                begin
                  dmMain.tblGPUs.Edit;
                  dmMain.tblGPUs['GPUModel'] := InputBox('EDIT',
                    'ENTER GPU MODEL', '');
                  dmMain.tblGPUs.Post;
                  ShowMessage('CHANGES SAVED!');
                end
                else
                begin
                  ShowMessage('GPU NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          2:
            begin
              sRecord := InputBox('EDIT', 'ENTER GPU ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblGPUs.Locate('GPUID', sRecord, []) = True then
                begin
                  sGPUPowerConsumption := InputBox('EDIT',
                    'ENTER POWER CONSUMPTION', ''); ;
                  if ValidateRealValue(sGPUPowerConsumption) then
                  begin
                    dmMain.tblGPUs.Edit;
                    dmMain.tblGPUs['GPUPowerConsumption'] :=
                      sGPUPowerConsumption;
                    dmMain.tblGPUs.Post;
                    ShowMessage('CHANGES SAVED!');
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID FLOAT VALUE');
                  end;
                end
                else
                begin
                  ShowMessage('GPU NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
        end;
      end;
    4:
      begin
        case chkRAMFields.ItemIndex of
          - 1:
            begin
              ShowMessage('SELECT FIELD TO EDIT');
            end;
          0:
            begin
              sRecord := InputBox('EDIT', 'ENTER RAM ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblRAM.Locate('RAMID', sRecord, []) = True then
                begin
                  dmMain.tblRAM.Edit;
                  dmMain.tblRAM['RAMCapacityAndType'] := InputBox('EDIT',
                    'ENTER RAM CAPACITY AND TYPE', '');
                  dmMain.tblRAM.Post;
                  ShowMessage('CHANGES SAVED!');
                end
                else
                begin
                  ShowMessage('RAM NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          1:
            begin
              sRecord := InputBox('EDIT', 'ENTER RAM ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblRAM.Locate('RAMID', sRecord, []) = True then
                begin
                  sRAMPowerConsumption := InputBox('EDIT',
                    'ENTER POWER CONSUMPTION', ''); ;
                  if ValidateRealValue(sRAMPowerConsumption) then
                  begin
                    dmMain.tblRAM.Edit;
                    dmMain.tblRAM['RAMPowerConsumption'] :=
                      sRAMPowerConsumption;
                    dmMain.tblRAM.Post;
                    ShowMessage('CHANGES SAVED!');
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID FLOAT VALUE');
                  end;
                end
                else
                begin
                  ShowMessage('RAM NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
        end;
      end;
    5:
      begin
        case chkStorageFields.ItemIndex of
          - 1:
            begin
              ShowMessage('SELECT FIELD TO EDIT');
            end;
          0:
            begin
              sRecord := InputBox('EDIT', 'ENTER STORAGE ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblStorage.Locate('STORAGEID', sRecord, [])
                  = True then
                begin
                  dmMain.tblStorage.Edit;
                  dmMain.tblStorage['StorageType'] := InputBox('EDIT',
                    'ENTER TYPE OF STORAGE', '');
                  dmMain.tblStorage.Post;
                  ShowMessage('CHANGES SAVED!');
                end
                else
                begin
                  ShowMessage('STORAGE NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          1:
            begin
              sRecord := InputBox('EDIT', 'ENTER STORAGE ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblStorage.Locate('STORAGEID', sRecord, [])
                  = True then
                begin
                  dmMain.tblStorage.Edit;
                  dmMain.tblStorage['CapacityRange'] := InputBox('EDIT',
                    'ENTER CAPACITY', '');
                  dmMain.tblStorage.Post;
                  ShowMessage('CHANGES SAVED!');
                end
                else
                begin
                  ShowMessage('STORAGE NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          2:
            begin
              sRecord := InputBox('EDIT', 'ENTER STORAGE ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblStorage.Locate('STORAGEID', sRecord, [])
                  = True then
                begin
                  sStoragePowerConsumption := InputBox('EDIT',
                    'ENTER POWER CONSUMPTION', ''); ;
                  if ValidateRealValue(sStoragePowerConsumption) then
                  begin
                    dmMain.tblStorage.Edit;
                    dmMain.tblStorage['StoragePowerConsumption'] :=
                      sStoragePowerConsumption;
                    dmMain.tblStorage.Post;
                    ShowMessage('CHANGES SAVED!');
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID FLOAT VALUE');
                  end;
                end
                else
                begin
                  ShowMessage('STORAGE NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
        end;
      end;
    6:
      begin
        case chkLocationFields.ItemIndex of
          - 1:
            begin
              ShowMessage('SELECT FIELD TO EDIT');
            end;
          0:
            begin
              sRecord := InputBox('EDIT', 'ENTER LOCATION ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblLocations.Locate('LocationID', sRecord, [])
                  = True then
                begin
                  dmMain.tblLocations.Edit;
                  dmMain.tblLocations['LocationName'] := InputBox('EDIT',
                    'ENTER NAME OF LOCATION', '');
                  dmMain.tblLocations.Post;
                  ShowMessage('CHANGES SAVED!');
                end
                else
                begin
                  ShowMessage('LOCATION NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          1:
            begin
              sRecord := InputBox('EDIT', 'ENTER LOCATION ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblLocations.Locate('LOCATIONID', sRecord, [])
                  = True then
                begin
                  sCarbonIntensity := InputBox('EDIT',
                    'ENTER CARBON INTENSITY', ''); ;
                  if ValidateRealValue(sCarbonIntensity) then
                  begin
                    dmMain.tblLocations.Edit;
                    dmMain.tblLocations['CarbonIntensity'] := sCarbonIntensity;
                    dmMain.tblLocations.Post;
                    ShowMessage('CHANGES SAVED!');
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID FLOAT VALUE');
                  end;
                end
                else
                begin
                  ShowMessage('LOCATION NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
        end;
      end;
    7:
      begin
        case chkCarbonEmissionFields.ItemIndex of
          - 1:
            begin
              ShowMessage('SELECT FIELD TO EDIT');
            end;
          0:
            begin
              sRecord := InputBox('EDIT', 'ENTER EMISSION ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblCarbonEmissions.Locate('EmissionID', sRecord, [])
                  = True then
                begin
                  sTotalEnergy := InputBox('EDIT', 'ENTER ENERGY CONSUMED', '');
                  if ValidateRealValue(sTotalEnergy) then
                  begin
                    dmMain.tblCarbonEmissions.Edit;
                    dmMain.tblCarbonEmissions['EnergyConsumed'] := sTotalEnergy;
                    dmMain.tblCarbonEmissions.Post;
                    ShowMessage('CHANGES SAVED!');
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID FLOAT VALUE');
                  end;
                end
                else
                begin
                  ShowMessage('EMISSION NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          1:
            begin
              sRecord := InputBox('EDIT', 'ENTER EMISSION ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblCarbonEmissions.Locate('EmissionID', sRecord, [])
                  = True then
                begin
                  sCarbonEmissions := InputBox('EDIT',
                    'ENTER CARBON EMISSIONS', '');
                  if ValidateRealValue(sCarbonEmissions) then
                  begin
                    dmMain.tblCarbonEmissions.Edit;
                    dmMain.tblCarbonEmissions['CarbonEmissions'] :=
                      sCarbonEmissions;
                    dmMain.tblCarbonEmissions.Post;
                    ShowMessage('CHANGES SAVED!');
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID FLOAT VALUE');
                  end;
                end
                else
                begin
                  ShowMessage('EMISSION NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          2:
            begin
              sRecord := InputBox('EDIT', 'ENTER EMISSION ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblCarbonEmissions.Locate('EmissionID', sRecord, [])
                  = True then
                begin
                  sDate := InputBox('EDIT', 'ENTER DATE', 'dd/mm/yyyy');
                  if ValidateDate(sDate) = True then
                  begin
                    dmMain.tblCarbonEmissions.Edit;
                    dmMain.tblCarbonEmissions['DateRecorded'] := sDate;
                    dmMain.tblCarbonEmissions.Post;
                    ShowMessage('CHANGES SAVED!');
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID DATE');
                  end;
                end
                else
                begin
                  ShowMessage('EMISSION NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
          3:
            begin
              sRecord := InputBox('EDIT', 'ENTER EMISSION ID', '');
              if ValidateInteger(sRecord) then
              begin
                if dmMain.tblCarbonEmissions.Locate('EmissionID', sRecord, [])
                  = True then
                begin
                  sCompID := InputBox('EDIT', 'ENTER COMPUTER ID', '');
                  if ValidateInteger(sCompID) then
                  begin
                    if dmMain.tblComputers.Locate('ComputerID', sCompID, [])
                      = True then
                    begin
                      dmMain.tblCarbonEmissions.Edit;
                      dmMain.tblCarbonEmissions['ComputerID'] := sCompID;
                      dmMain.tblCarbonEmissions.Post;
                      ShowMessage('CHANGES SAVED!');
                    end
                    else
                    begin
                      ShowMessage('COMPUTER NOT FOUND!');
                    end;
                  end
                  else
                  begin
                    ShowMessage('ENTER VALID INTEGER!');
                  end;
                end
                else
                begin
                  ShowMessage('EMISSION NOT FOUND!');
                end;
              end
              else
              begin
                ShowMessage('ENTER VALID INTEGER!');
              end;
            end;
        end;
      end;

  end;
  lblManageTable.Show;
  cmbManageTable.Show;
  btnSaveChanges.Hide;
  pnlCRUD_A.Show;
  pnlCheckLists.Hide;
  chkUserFields.Hide;
  chkCPUFields.Hide;
  chkGPUFields.Hide;
  chkLocationFields.Hide;
  chkCarbonEmissionFields.Hide;
  chkComputerFields.Hide;
  chkRAMFields.Hide;
  chkStorageFields.Hide;
end;

procedure TfrmCRUD_A.btnDelete_AClick(Sender: TObject);
var
  sInput: String;
begin
  case cmbManageTable.ItemIndex of
    - 1:
      ShowMessage('CHOOSE A TABLE');
    0:
      begin
        sInput := InputBox('DELETE', 'ENTER USER ID DELETE', '');
        with dmMain do
        begin
          if ValidateInteger(sInput) then
          begin
            if tblUsers.Locate('UserID', sInput, []) = True then
            begin
              if tblComputers.Locate('UserID', sInput, []) = True then
              begin
                if tblCarbonEmissions.Locate('ComputerID',
                  tblComputers['ComputerID'], []) = True then
                begin
                  tblCarbonEmissions.Delete;
                  tblComputers.Delete;
                  tblUsers.Delete;
                  ShowMessage('RECORD DELETED');
                end;
              end;
            end
            else
            begin
              ShowMessage('RECORD NOT FOUND!');
            end;
          end
          else
          begin
            ShowMessage('ENTER VALID INTEGER!');
          end;
        end;
      end;
    1:
      begin
        sInput := InputBox('DELETE', 'ENTER COMPUTER ID TO DELETE', '');
        with dmMain do
        begin
          if ValidateInteger(sInput) then
          begin
            if tblComputers.Locate('ComputerID', sInput, []) = True then
            begin
              if tblCarbonEmissions.Locate('ComputerID', sInput, []) = True then
              begin
                tblCarbonEmissions.Delete;
                tblComputers.Delete;
                ShowMessage('RECORD DELETED');
              end;
            end
            else
            begin
              ShowMessage('RECORD NOT FOUND!');
            end;
          end
          else
          begin
            ShowMessage('ENTER VALID INTEGER!');
          end;
        end;
      end;
    2:
      begin
        sInput := InputBox('DELETE', 'ENTER CPU TO DELETE', '');
        with dmMain do
        begin
          if ValidateInteger(sInput) then
          begin
            if tblCPUs.Locate('CPUID', sInput, []) = True then
            begin
              if tblComputers.Locate('CPUID', sInput, []) = True then
              begin
                if tblCarbonEmissions.Locate('ComputerID',
                  tblComputers['ComputerID'], []) = True then
                begin
                  tblCarbonEmissions.Delete;
                  tblComputers.Delete;
                  tblCPUs.Delete;
                  ShowMessage('RECORD DELETED');
                end;
              end;
            end
            else
            begin
              ShowMessage('RECORD NOT FOUND!');
            end;
          end
          else
          begin
            ShowMessage('ENTER VALID INTEGER!');
          end;
        end;
      end;
    3:
      begin
        sInput := InputBox('DELETE', 'ENTER GPU TO DELETE', '');
        with dmMain do
        begin
          if ValidateInteger(sInput) then
          begin
            if tblGPUs.Locate('GPUID', sInput, []) = True then
            begin
              if tblComputers.Locate('GPUID', sInput, []) = True then
              begin
                if tblCarbonEmissions.Locate('ComputerID',
                  tblComputers['ComputerID'], []) = True then
                begin
                  tblCarbonEmissions.Delete;
                  tblComputers.Delete;
                  tblGPUs.Delete;
                  ShowMessage('RECORD DELETED');
                end;
              end;
            end
            else
            begin
              ShowMessage('RECORD NOT FOUND!');
            end;
          end
          else
          begin
            ShowMessage('ENTER VALID INTEGER!');
          end;
        end;
      end;
    4:
      begin
        sInput := InputBox('DELETE', 'ENTER RAM TO DELETE', '');
        with dmMain do
        begin
          if ValidateInteger(sInput) then
          begin
            if tblRAM.Locate('RAMID', sInput, []) = True then
            begin
              if tblComputers.Locate('RAMID', sInput, []) = True then
              begin
                if tblCarbonEmissions.Locate('ComputerID',
                  tblComputers['ComputerID'], []) = True then
                begin
                  tblCarbonEmissions.Delete;
                  tblComputers.Delete;
                  tblRAM.Delete;
                  ShowMessage('RECORD DELETED');
                end;
              end;
            end
            else
            begin
              ShowMessage('RECORD NOT FOUND!');
            end;
          end
          else
          begin
            ShowMessage('ENTER VALID INTEGER!');
          end;
        end;
      end;
    5:
      begin
        sInput := InputBox('DELETE', 'ENTER STORAGE TO DELETE', '');
        with dmMain do
        begin
          if ValidateInteger(sInput) then
          begin
            if tblStorage.Locate('StorageID', sInput, []) = True then
            begin
              if tblComputers.Locate('StorageID', sInput, []) = True then
              begin
                if tblCarbonEmissions.Locate('ComputerID',
                  tblComputers['ComputerID'], []) = True then
                begin
                  tblCarbonEmissions.Delete;
                  tblComputers.Delete;
                  tblStorage.Delete;
                  ShowMessage('RECORD DELETED');
                end;
              end;
            end
            else
            begin
              ShowMessage('RECORD NOT FOUND!');
            end;
          end
          else
          begin
            ShowMessage('ENTER VALID INTEGER!');
          end;
        end;
      end;
    6:
      begin
        sInput := InputBox('DELETE', 'ENTER LOCATION TO DELETE', '');
        with dmMain do
        begin
          if ValidateInteger(sInput) then
          begin
            if tblLocations.Locate('LocationID', sInput, []) = True then
            begin
              if tblComputers.Locate('LocationID', sInput, []) = True then
              begin
                if tblCarbonEmissions.Locate('ComputerID',
                  tblComputers['ComputerID'], []) = True then
                begin
                  tblCarbonEmissions.Delete;
                  tblComputers.Delete;
                  tblLocations.Delete;
                  ShowMessage('RECORD DELETED');
                end;
              end;
            end
            else
            begin
              ShowMessage('RECORD NOT FOUND!');
            end;
          end
          else
          begin
            ShowMessage('ENTER VALID INTEGER!');
          end;
        end;
      end;
    7:
      begin
        sInput := InputBox('DELETE', 'ENTER CARBON EMISSION TO DELETE', '');
        with dmMain do
        begin
          if ValidateInteger(sInput) then
          begin
            if tblCarbonEmissions.Locate('EmissionID', sInput, []) = True then
            begin
              if tblComputers.Locate('ComputerID',
                tblCarbonEmissions['ComputerID'], []) = True then
              begin
                tblCarbonEmissions.Delete;
                tblComputers.Delete;
                ShowMessage('RECORD DELETED');
              end;
            end
            else
            begin
              ShowMessage('RECORD NOT FOUND!');
            end;
          end
          else
          begin
            ShowMessage('ENTER VALID INTEGER!');
          end;
        end;
      end;

  end;
end;

procedure TfrmCRUD_A.btnEdit_AClick(Sender: TObject);
{ USERs
  COMPUTERs
  CPUs
  GPUs
  RAM
  STORAGE
  LOCATIONs
  CARBON_EMISSIONs }
begin
  case cmbManageTable.ItemIndex of
    - 1:
      ShowMessage('CHOOSE A TABLE');
    0:
      begin
        pnlCRUD_A.Hide;
        chkUserFields.Show;
        btnSaveChanges.Show;
        pnlCheckLists.Show;
        lblManageTable.Hide;
        cmbManageTable.Hide;
      end;
    1:
      begin
        pnlCRUD_A.Hide;
        chkComputerFields.Show;
        btnSaveChanges.Show;
        pnlCheckLists.Show;
        lblManageTable.Hide;
        cmbManageTable.Hide;
      end;
    2:
      begin
        pnlCRUD_A.Hide;
        chkUserFields.Hide;
        chkCPUFields.Show;
        btnSaveChanges.Show;
        pnlCheckLists.Show;
        lblManageTable.Hide;
        cmbManageTable.Hide;
      end;

    3:
      begin
        pnlCRUD_A.Hide;
        chkGPUFields.Show;
        btnSaveChanges.Show;
        pnlCheckLists.Show;
        lblManageTable.Hide;
        cmbManageTable.Hide;
      end;
    4:
      begin
        pnlCRUD_A.Hide;
        chkRAMFields.Show;
        btnSaveChanges.Show;
        pnlCheckLists.Show;
        lblManageTable.Hide;
        cmbManageTable.Hide;
      end;
    5:
      begin
        pnlCRUD_A.Hide;
        chkStorageFields.Show;
        btnSaveChanges.Show;
        pnlCheckLists.Show;
        lblManageTable.Hide;
        cmbManageTable.Hide;

      end;
    6:
      begin
        pnlCRUD_A.Hide;
        chkLocationFields.Show;
        btnSaveChanges.Show;
        pnlCheckLists.Show;
        lblManageTable.Hide;
        cmbManageTable.Hide;

      end;
    7:
      begin
        pnlCRUD_A.Hide;
        chkCarbonEmissionFields.Show;
        btnSaveChanges.Show;
        pnlCheckLists.Show;
        lblManageTable.Hide;
        cmbManageTable.Hide;
      end;

  end;
end;

procedure TfrmCRUD_A.btnInsert_AClick(Sender: TObject);
var
  sCPUPowerConsumption, sGPUPowerConsumption, sRAMPowerConsumption,
    sStoragePowerConsumption, sCarbonIntensity, sComputerID, sEnergy,
    sCarbonEmissions, sRuntime, sTotalPowerConsumption: String;
  sCPUID, sGPUID, sRAMID, sStorageID, sLocationID, sUserID: String;
begin
  case cmbManageTable.ItemIndex of
    - 1:
      ShowMessage('CHOOSE A TABLE');
    0:
      begin
        dmMain.tblUsers.Insert;
        dmMain.tblUsers['Username'] := InputBox('INSERT', 'ENTER A USERNAME',
          '');
        dmMain.tblUsers.Post;
        ShowMessage('RECORD SUCCESFULLY ADDED');
      end;
    1:
      begin
        sRuntime := InputBox('INSERT', 'ENTER RUNTIME', '');
        if ValidateInteger(sRuntime) then
        begin
          sTotalPowerConsumption := InputBox('INSERT',
            'ENTER TOTAL POWER CONSUMPTION', '');
          if ValidateRealValue(sTotalPowerConsumption) then
          begin
            sCPUID := InputBox('INSERT', 'ENTER CPU ID', '');
            if ValidateInteger(sCPUID) then
            begin
              if dmMain.tblCPUs.Locate('CPUID', sCPUID, []) = True then
              begin
                sGPUID := InputBox('INSERT', 'ENTER GPU ID', '');
                if ValidateInteger(sGPUID) then
                begin
                  if dmMain.tblGPUs.Locate('GPUID', sGPUID, []) = True then
                  begin
                    sRAMID := InputBox('INSERT', 'ENTER RAM ID', '');
                    if ValidateInteger(sRAMID) then
                    begin
                      if dmMain.tblRAM.Locate('RAMID', sRAMID, []) = True then
                      begin
                        sStorageID := InputBox('INSERT', 'ENTER STORAGE ID',
                          '');
                        if ValidateInteger(sStorageID) then
                        begin
                          if dmMain.tblStorage.Locate('StorageID', sStorageID,
                            []) = True then
                          begin
                            sLocationID := InputBox('INSERT',
                              'ENTER LOCATION ID', '');
                            if ValidateInteger(sLocationID) then
                            begin
                              if dmMain.tblLocations.Locate('LocationID',
                                sLocationID, []) = True then
                              begin
                                sUserID := InputBox('INSERT', 'ENTER USER ID',
                                  '');
                                if ValidateInteger(sUserID) then
                                begin
                                  if dmMain.tblUsers.Locate('UserID', sUserID,
                                    []) = True then
                                  begin
                                    dmMain.tblComputers.Insert;
                                    dmMain.tblComputers['Runtime'] := sRuntime;
                                    dmMain.tblComputers
                                      ['TotalPowerConsumption'] :=
                                      sTotalPowerConsumption;
                                    dmMain.tblComputers['RAMID'] := sRAMID;
                                    dmMain.tblComputers['CPUID'] := sCPUID;
                                    dmMain.tblComputers['GPUID'] := sGPUID;
                                    dmMain.tblComputers['StorageID'] :=
                                      sStorageID;
                                    dmMain.tblComputers['LocationID'] :=
                                      sLocationID;
                                    dmMain.tblComputers['UserID'] := sUserID;
                                    dmMain.tblComputers.Post;
                                    ShowMessage('RECORD ADDED');
                                  end
                                  else
                                  begin
                                    ShowMessage('USER NOT FOUND!');
                                  end;
                                end
                                else
                                begin
                                  ShowMessage('ENTER VALID INTEGER');
                                end;
                              end
                              else
                              begin
                                ShowMessage('LOCATION NOT FOUND!');
                              end;
                            end
                            else
                            begin
                              ShowMessage('ENTER VALID INTEGER');
                            end;
                          end
                          else
                          begin
                            ShowMessage('STORAGE NOT FOUND!');
                          end;
                        end
                        else
                        begin
                          ShowMessage('ENTER VALID INTEGER');
                        end;
                      end
                      else
                      begin
                        ShowMessage('RAM NOT FOUND!');
                      end;
                    end
                    else
                    begin
                      ShowMessage('ENTER VALID INTEGER');
                    end;
                  end
                  else
                  begin
                    ShowMessage('GPU NOT FOUND!');
                  end;
                end
                else
                begin
                  ShowMessage('ENTER VALID INTEGER');
                end;
              end
              else
              begin
                ShowMessage('CPU NOT FOUND!');
              end;
            end
            else
            begin
              ShowMessage('ENTER VALID INTEGER');
            end;
          end
          else
          begin
            ShowMessage('ENTER VALID FLOAT VALUE');
          end;
        end
        else
        begin
          ShowMessage('ENTER VALID INTEGER');
        end;
      end;
    2:
      begin
        sCPUPowerConsumption := InputBox('INSERT',
          'ENTER THE POWER CONSUMPTION', '');
        if ValidateRealValue(sCPUPowerConsumption) then
        begin
          dmMain.tblCPUs.Insert;
          dmMain.tblCPUs['CPUManufacturer'] := InputBox('INSERT',
            'ENTER A CPU MANUFACTURER', '');
          dmMain.tblCPUs['CPUModel'] := InputBox('INSERT', 'ENTER A CPU MODEL',
            '');
          dmMain.tblCPUs['CPUPowerConsumption'] := sCPUPowerConsumption;
          dmMain.tblCPUs.Post;
          ShowMessage('RECORD SUCCESFULLY ADDED');
        end
        else
        begin
          ShowMessage('ENTER VALID FLOAT VALUE');
        end;
      end;
    3:
      begin
        sGPUPowerConsumption := InputBox('INSERT',
          'ENTER THE POWER CONSUMPTION', '');
        if ValidateRealValue(sGPUPowerConsumption) then
        begin
          dmMain.tblGPUs.Insert;
          dmMain.tblGPUs['GPUManufacturer'] := InputBox('INSERT',
            'ENTER A GPU MANUFACTURER', '');
          dmMain.tblGPUs['GPUModel'] := InputBox('INSERT', 'ENTER A GPU MODEL',
            '');
          dmMain.tblGPUs['GPUPowerConsumption'] := sGPUPowerConsumption;
          dmMain.tblGPUs.Post;
          ShowMessage('RECORD SUCCESFULLY ADDED');
        end
        else
        begin
          ShowMessage('ENTER VALID FLOAT VALUE');
        end;
      end;
    4:
      begin
        sRAMPowerConsumption := InputBox('INSERT',
          'ENTER THE POWER CONSUMPTION', '');
        if ValidateRealValue(sRAMPowerConsumption) then
        begin
          dmMain.tblRAM.Insert;
          dmMain.tblRAM['RAMCapacityAndType'] := InputBox('INSERT',
            'ENTER THE RAM CAPACITY AND TYPE', '');
          dmMain.tblRAM['RAMPowerConsumption'] := sRAMPowerConsumption;
          dmMain.tblRAM.Post;
          ShowMessage('RECORD SUCCESFULLY ADDED');
        end
        else
        begin
          ShowMessage('ENTER VALID FLOAT VALUE');
        end;
      end;
    5:
      begin
        sStoragePowerConsumption := InputBox('INSERT',
          'ENTER THE POWER CONSUMPTION', '');
        if ValidateRealValue(sStoragePowerConsumption) then
        begin
          dmMain.tblStorage.Insert;
          dmMain.tblStorage['StorageType'] := InputBox('INSERT',
            'ENTER STORAGE TYPE', '');
          dmMain.tblStorage['CapacityRange'] := InputBox('INSERT',
            'ENTER THE CAPACITY RANGE', '');
          dmMain.tblStorage['StoragePowerConsumption'] :=
            sStoragePowerConsumption;
          dmMain.tblStorage.Post;
          ShowMessage('RECORD SUCCESFULLY ADDED');
        end
        else
        begin
          ShowMessage('ENTER VALID FLOAT VALUE');
        end;
      end;
    6:
      begin
        sCarbonIntensity := InputBox('INSERT', 'ENTER THE CARBON INTENSITY',
          '');
        if ValidateRealValue(sCarbonIntensity) then
        begin
          dmMain.tblLocations.Insert;
          dmMain.tblLocations['LocationName'] := InputBox('INSERT',
            'ENTER LOCATION NAME', '');
          dmMain.tblLocations['CarbonIntensity'] := sCarbonIntensity;
          dmMain.tblLocations.Post;
          ShowMessage('RECORD SUCCESFULLY ADDED');
        end
        else
        begin
          ShowMessage('ENTER VALID FLOAT VALUE');
        end;
      end;
    7:
      begin
        sComputerID := InputBox('INSERT', 'ENTER COMPUTER ID', '');
        if ValidateInteger(sComputerID) then
        begin
          if dmMain.tblComputers.Locate('ComputerID', sComputerID, [])
            = True then
          begin
            sEnergy := InputBox('INSERT', 'ENTER TOTAL ENERGY', '');
            if ValidateRealValue(sEnergy) then
            begin
              sCarbonEmissions := InputBox('INSERT', 'ENTER CARBON EMISSION',
                '');
              if ValidateRealValue(sCarbonEmissions) then
              begin
                dmMain.tblCarbonEmissions.Insert;
                dmMain.tblCarbonEmissions['EnergyConsumed'] := sEnergy;
                dmMain.tblCarbonEmissions['CarbonEmissions'] :=
                  sCarbonEmissions;
                dmMain.tblCarbonEmissions['DateRecorded'] := Date;
                dmMain.tblCarbonEmissions['ComputerID'] := sComputerID;
                dmMain.tblCarbonEmissions.Post;
                ShowMessage('RECORD SUCCESFULLY ADDED');
              end
              else
              begin
                ShowMessage('ENTER VALID FLOAT VALUE');
              end;
            end
            else
            begin
              ShowMessage('ENTER VALID FLOAT VALUE');
            end;

          end
          else
          begin
            ShowMessage('COMPUTER NOT FOUND!');
          end;
        end
        else
        begin
          ShowMessage('ENTER VALID INTEGER');
        end;
      end;

  end;
end;

procedure TfrmCRUD_A.chkCarbonEmissionFieldsClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to chkCarbonEmissionFields.Items.Count - 1 do
  begin
    if (i <> chkCarbonEmissionFields.ItemIndex)
      and chkCarbonEmissionFields.Checked[i] then
      chkCarbonEmissionFields.Checked[i] := False;
  end;
end;

procedure TfrmCRUD_A.chkComputerFieldsClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to chkComputerFields.Items.Count - 1 do
  begin
    if (i <> chkComputerFields.ItemIndex) and chkComputerFields.Checked[i] then
      chkComputerFields.Checked[i] := False;
  end;
end;

procedure TfrmCRUD_A.chkCPUFieldsClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to chkCPUFields.Items.Count - 1 do
  begin
    if (i <> chkCPUFields.ItemIndex) and chkCPUFields.Checked[i] then
      chkCPUFields.Checked[i] := False;
  end;
end;

procedure TfrmCRUD_A.chkGPUFieldsClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to chkGPUFields.Items.Count - 1 do
  begin
    if (i <> chkGPUFields.ItemIndex) and chkGPUFields.Checked[i] then
      chkGPUFields.Checked[i] := False;
  end;
end;

procedure TfrmCRUD_A.chkLocationFieldsClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to chkLocationFields.Items.Count - 1 do
  begin
    if (i <> chkLocationFields.ItemIndex) and chkLocationFields.Checked[i] then
      chkLocationFields.Checked[i] := False;
  end;
end;

procedure TfrmCRUD_A.chkRAMFieldsClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to chkRAMFields.Items.Count - 1 do
  begin
    if (i <> chkRAMFields.ItemIndex) and chkRAMFields.Checked[i] then
      chkRAMFields.Checked[i] := False;
  end;
end;

procedure TfrmCRUD_A.chkStorageFieldsClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to chkStorageFields.Items.Count - 1 do
  begin
    if (i <> chkStorageFields.ItemIndex) and chkStorageFields.Checked[i] then
      chkStorageFields.Checked[i] := False;
  end;
end;

procedure TfrmCRUD_A.chkUserFieldsClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to chkUserFields.Items.Count - 1 do
  begin
    if (i <> chkUserFields.ItemIndex) and chkUserFields.Checked[i] then
      chkUserFields.Checked[i] := False;
  end;
end;

procedure TfrmCRUD_A.FormCreate(Sender: TObject);
begin
  btnSaveChanges.Hide;
  btnSaveChanges.Top := 183;
  btnSaveChanges.Left := 43;

  frmCRUD_A.Height := 205;
  frmCRUD_A.Width := 135;

  pnlCRUD_A.Top := 98;
  pnlCRUD_A.Left := 33;

  chkLocationFields.Hide;
  chkLocationFields.Top := 39;
  chkLocationFields.Left := 19;

  chkRAMFields.Hide;
  chkRAMFields.Top := 39;
  chkRAMFields.Left := 8;

  chkStorageFields.Hide;
  chkStorageFields.Top := 33;
  chkStorageFields.Left := 21;

  chkGPUFields.Hide;
  chkGPUFields.Top := 31;
  chkGPUFields.Left := 6;

  chkUserFields.Hide;
  chkUserFields.Top := 44;
  chkUserFields.Left := 20;

  chkCPUFields.Hide;
  chkCPUFields.Top := 31;
  chkCPUFields.Left := 6;

  chkCarbonEmissionFields.Hide;
  chkCarbonEmissionFields.Top := 28;
  chkCarbonEmissionFields.Left := 9;

  chkComputerFields.Hide;
  chkComputerFields.Top := 6;
  chkComputerFields.Left := 9;

  pnlCheckLists.Hide;
  pnlCheckLists.Top := 75;
  pnlCheckLists.Left := 7;
  pnlCheckLists.Height := 106;
  pnlCheckLists.Width := 116;
end;

procedure TfrmCRUD_A.imgCloseClick(Sender: TObject);
begin
  frmCRUD_A.Close;
end;

end.
