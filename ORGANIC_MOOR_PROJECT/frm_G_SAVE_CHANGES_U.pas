unit frm_G_SAVE_CHANGES_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, CheckLst, pngimage, ExtCtrls, dmMAIN_U, DB, ADODB,
  frm_G_CRUD_U, clsORGANICMOOR_U, MAIN_U;

type
  TfrmSaveChanges_G = class(TForm)
    pnlProgram: TPanel;
    btnSaveChanges: TButton;
    pnlCustomTitleBar: TPanel;
    lblEdit: TLabel;
    pnlCPU: TPanel;
    imgCPU: TImage;
    lblCPU: TLabel;
    chkCPU: TCheckListBox;
    cmbCPUmodel: TComboBox;
    pnlGPU: TPanel;
    imgGPU: TImage;
    lblGPU: TLabel;
    chkGPU: TCheckListBox;
    cmbGPUmodel: TComboBox;
    pnlLocation: TPanel;
    imgLocation: TImage;
    lblLocation: TLabel;
    cmbLocationName: TComboBox;
    pnlRAM: TPanel;
    imgRAM: TImage;
    lblRAM: TLabel;
    cmbRAMcapacityntype: TComboBox;
    pnlRuntime: TPanel;
    imgRuntime: TImage;
    lblRuntime: TLabel;
    spedRuntime: TSpinEdit;
    pnlStorageType: TPanel;
    imgStorage: TImage;
    lblStorage: TLabel;
    chkStorageType: TCheckListBox;
    cmbStorageCapacitynRange: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSaveChangesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkCPUClick(Sender: TObject);
    procedure chkGPUClick(Sender: TObject);
    procedure chkStorageTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSaveChanges_G: TfrmSaveChanges_G;

implementation

{$R *.dfm}

procedure TfrmSaveChanges_G.btnSaveChangesClick(Sender: TObject);
var
  sCPU, sGPU, sRAM, sStorage, sLocation: String;
  iCPUID, iGPUID, iRAMID, iStorageID, iLocationID, iUserID: Integer;
  iRuntime: Integer;
  rTotalPowerConsumption: Real;
  rCarbonIntensity: Real;
  objTemp: TCARBON;
begin
  rCarbonIntensity := 0.00;
  iUserID := 0;
  iCPUID := 0;
  iGPUID := 0;
  iRAMID := 0;
  iStorageID := 0;
  iLocationID := 0;
  sCPU := cmbCPUmodel.Items[cmbCPUmodel.ItemIndex];
  sGPU := cmbGPUmodel.Items[cmbGPUmodel.ItemIndex];
  sRAM := cmbRAMcapacityntype.Items[cmbRAMcapacityntype.ItemIndex];
  sStorage := cmbStorageCapacitynRange.Items
    [cmbStorageCapacitynRange.ItemIndex];
  sLocation := cmbLocationName.Items[cmbLocationName.ItemIndex];
  iRuntime := spedRuntime.Value;
  case frmCRUD_G.chkFields.ItemIndex of
    0:
      begin
        if spedRuntime.Value = 0 then
        begin
          EXIT;
        end;
        dmMain.Query.Close;
        dmMain.Query.SQL.Clear;
        dmMain.Query.SQL.Add('UPDATE tblComputers SET Runtime = ' + InttoStr
            (iRuntime) + '');
        dmMain.Query.SQL.Add('WHERE ComputerID = ' + frmCRUD_G.sRecord + '');
        dmMain.Query.ExecSQL;

        if dmMain.tblCarbonEmissions.Locate('ComputerID', frmCRUD_G.sRecord,
          []) = True then
        begin
          if dmMain.tblComputers.Locate('ComputerID', frmCRUD_G.sRecord, [])
            = True then
          begin
            sCPU := dmMain.tblCPUs['CPUModel'];
            sGPU := dmMain.tblGPUs['GPUModel'];
            sRAM := dmMain.tblRAM['RAMCapacityAndType'];
            sStorage := dmMain.tblStorage['CapacityRange'];
            sLocation := dmMain.tblLocations['LocationName'];
            rTotalPowerConsumption := 0;
            WITH dmMain DO
            BEGIN
              tblCPUs.First;
              while NOT tblCPUs.Eof do
              begin
                if tblCPUs['CPUModel'] = sCPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblCPUs
                    ['CPUPowerConsumption'];
                end;
                tblCPUs.Next;
              end;

              tblGPUs.First;
              while NOT tblGPUs.Eof do
              begin
                if tblGPUs['GPUModel'] = sGPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblGPUs
                    ['GPUPowerConsumption'];
                end;
                tblGPUs.Next;
              end;

              tblRAM.First;
              while NOT tblRAM.Eof do
              begin
                if tblRAM['RAMCapacityAndType'] = sRAM then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblRAM
                    ['RAMPowerConsumption'];
                end;
                tblRAM.Next;
              end;

              tblStorage.First;
              while NOT tblStorage.Eof do
              begin
                if tblStorage['CapacityRange'] = sStorage then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblStorage
                    ['StoragePowerConsumption'];
                end;
                tblStorage.Next;
              end;

              tblLocations.First;
              while NOT tblLocations.Eof do
              begin
                if tblLocations['LocationName'] = sLocation then
                begin
                  rCarbonIntensity := tblLocations['CarbonIntensity'];
                end;
                tblLocations.Next;
              end;
              objTemp := TCARBON.Create(sCPU, sGPU, sRAM, sStorage, sLocation,
                iRuntime);
              objTemp.SetTotalPowerConsumption(rTotalPowerConsumption);
              objTemp.SetTotalEnergy;
              objTemp.SetCarbonFootprint(rCarbonIntensity);

              dmMain.tblCarbonEmissions.Edit;
              dmMain.tblCarbonEmissions['EnergyConsumed'] := objTemp.GetEnergy
                ();
              dmMain.tblCarbonEmissions['CarbonEmissions'] :=
                objTemp.GetCarbonFootprint();
              dmMain.tblCarbonEmissions.Post;

            end;

          end;
        end;
      end;

    1:
      begin
        if (cmbCPUmodel.Text = '<SELECT>') OR (chkCPU.ItemIndex = -1) then
        begin
          EXIT;
        end;
        dmMain.Query.Close;
        dmMain.Query.SQL.Clear;
        dmMain.Query.SQL.Add(
          'UPDATE tblCPUs INNER JOIN tblComputers ON tblCPUs.[CPUID] = tblComputers.[CPUID] SET CPUModel =' + QuotedStr(sCPU) + '');
        dmMain.Query.SQL.Add('WHERE ComputerID = ' + frmCRUD_G.sRecord + '');
        dmMain.Query.ExecSQL;

        if dmMain.tblCarbonEmissions.Locate('ComputerID', frmCRUD_G.sRecord,
          []) = True then
        begin
          if dmMain.tblComputers.Locate('ComputerID', frmCRUD_G.sRecord, [])
            = True then
          begin
            iRuntime := dmMain.tblComputers['Runtime'];
            sGPU := dmMain.tblGPUs['GPUModel'];
            sRAM := dmMain.tblRAM['RAMCapacityAndType'];
            sStorage := dmMain.tblStorage['CapacityRange'];
            sLocation := dmMain.tblLocations['LocationName'];
            rTotalPowerConsumption := 0;
            WITH dmMain DO
            BEGIN
              tblCPUs.First;
              while NOT tblCPUs.Eof do
              begin
                if tblCPUs['CPUModel'] = sCPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblCPUs
                    ['CPUPowerConsumption'];
                  iCPUID := tblCPUs['CPUID'];
                end;
                tblCPUs.Next;
              end;

              tblGPUs.First;
              while NOT tblGPUs.Eof do
              begin
                if tblGPUs['GPUModel'] = sGPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblGPUs
                    ['GPUPowerConsumption'];
                end;
                tblGPUs.Next;
              end;

              tblRAM.First;
              while NOT tblRAM.Eof do
              begin
                if tblRAM['RAMCapacityAndType'] = sRAM then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblRAM
                    ['RAMPowerConsumption'];
                end;
                tblRAM.Next;
              end;

              tblStorage.First;
              while NOT tblStorage.Eof do
              begin
                if tblStorage['CapacityRange'] = sStorage then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblStorage
                    ['StoragePowerConsumption'];
                end;
                tblStorage.Next;
              end;

              tblLocations.First;
              while NOT tblLocations.Eof do
              begin
                if tblLocations['LocationName'] = sLocation then
                begin
                  rCarbonIntensity := tblLocations['CarbonIntensity'];
                end;
                tblLocations.Next;
              end;
              objTemp := TCARBON.Create(sCPU, sGPU, sRAM, sStorage, sLocation,
                iRuntime);
              objTemp.SetTotalPowerConsumption(rTotalPowerConsumption);
              objTemp.SetTotalEnergy;
              objTemp.SetCarbonFootprint(rCarbonIntensity);

              tblComputers.Edit;
              tblComputers['TotalPowerConsumption'] := rTotalPowerConsumption;
              tblComputers['CPUID'] := iCPUID;
              tblComputers.Post;
              dmMain.tblCarbonEmissions.Edit;
              dmMain.tblCarbonEmissions['EnergyConsumed'] := objTemp.GetEnergy
                ();
              dmMain.tblCarbonEmissions['CarbonEmissions'] :=
                objTemp.GetCarbonFootprint();
              dmMain.tblCarbonEmissions.Post;

            end;

          end;
        end;

      end;
    2:
      begin
        if (cmbGPUmodel.Text = '<SELECT>') OR (chkGPU.ItemIndex = -1) then
        begin
          EXIT;
        end;
        dmMain.Query.Close;
        dmMain.Query.SQL.Clear;
        dmMain.Query.SQL.Add(
          'UPDATE tblGPUs INNER JOIN tblComputers ON tblGPUs.[GPUID] = tblComputers.[GPUID] SET GPUModel =' + QuotedStr(sGPU) + '');
        dmMain.Query.SQL.Add('WHERE ComputerID = ' + frmCRUD_G.sRecord + '');
        dmMain.Query.ExecSQL;

        if dmMain.tblCarbonEmissions.Locate('ComputerID', frmCRUD_G.sRecord,
          []) = True then
        begin
          if dmMain.tblComputers.Locate('ComputerID', frmCRUD_G.sRecord, [])
            = True then
          begin
            iRuntime := dmMain.tblComputers['Runtime'];
            sCPU := dmMain.tblCPUs['CPUModel'];
            sRAM := dmMain.tblRAM['RAMCapacityAndType'];
            sStorage := dmMain.tblStorage['CapacityRange'];
            sLocation := dmMain.tblLocations['LocationName'];
            rTotalPowerConsumption := 0;
            WITH dmMain DO
            BEGIN
              tblCPUs.First;
              while NOT tblCPUs.Eof do
              begin
                if tblCPUs['CPUModel'] = sCPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblCPUs
                    ['CPUPowerConsumption'];
                end;
                tblCPUs.Next;
              end;

              tblGPUs.First;
              while NOT tblGPUs.Eof do
              begin
                if tblGPUs['GPUModel'] = sGPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblGPUs
                    ['GPUPowerConsumption'];
                  iGPUID := tblGPUs['GPUID'];
                end;
                tblGPUs.Next;
              end;

              tblRAM.First;
              while NOT tblRAM.Eof do
              begin
                if tblRAM['RAMCapacityAndType'] = sRAM then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblRAM
                    ['RAMPowerConsumption'];
                end;
                tblRAM.Next;
              end;

              tblStorage.First;
              while NOT tblStorage.Eof do
              begin
                if tblStorage['CapacityRange'] = sStorage then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblStorage
                    ['StoragePowerConsumption'];
                end;
                tblStorage.Next;
              end;

              tblLocations.First;
              while NOT tblLocations.Eof do
              begin
                if tblLocations['LocationName'] = sLocation then
                begin
                  rCarbonIntensity := tblLocations['CarbonIntensity'];
                end;
                tblLocations.Next;
              end;
              objTemp := TCARBON.Create(sCPU, sGPU, sRAM, sStorage, sLocation,
                iRuntime);
              objTemp.SetTotalPowerConsumption(rTotalPowerConsumption);
              objTemp.SetTotalEnergy;
              objTemp.SetCarbonFootprint(rCarbonIntensity);

              tblComputers.Edit;
              tblComputers['TotalPowerConsumption'] := rTotalPowerConsumption;
              tblComputers['GPUID'] := iGPUID;
              tblComputers.Post;
              dmMain.tblCarbonEmissions.Edit;
              dmMain.tblCarbonEmissions['EnergyConsumed'] := objTemp.GetEnergy
                ();
              dmMain.tblCarbonEmissions['CarbonEmissions'] :=
                objTemp.GetCarbonFootprint();
              dmMain.tblCarbonEmissions.Post;

            end;

          end;
        end;
      end;
    3:
      begin
        if cmbRAMcapacityntype.Text = '<SELECT>' then
        begin
          EXIT;
        end;
        dmMain.Query.Close;
        dmMain.Query.SQL.Clear;
        dmMain.Query.SQL.Add(
          'UPDATE tblRAM INNER JOIN tblComputers ON tblRAM.[RAMID] = tblComputers.[RAMID] SET RAMCapacityAndType =' + QuotedStr(sRAM) + '');
        dmMain.Query.SQL.Add('WHERE ComputerID = ' + frmCRUD_G.sRecord + '');
        dmMain.Query.ExecSQL;

        if dmMain.tblCarbonEmissions.Locate('ComputerID', frmCRUD_G.sRecord,
          []) = True then
        begin
          if dmMain.tblComputers.Locate('ComputerID', frmCRUD_G.sRecord, [])
            = True then
          begin
            iRuntime := dmMain.tblComputers['Runtime'];
            sCPU := dmMain.tblCPUs['CPUModel'];
            sGPU := dmMain.tblGPUs['GPUModel'];
            sStorage := dmMain.tblStorage['CapacityRange'];
            sLocation := dmMain.tblLocations['LocationName'];
            rTotalPowerConsumption := 0;
            WITH dmMain DO
            BEGIN
              tblCPUs.First;
              while NOT tblCPUs.Eof do
              begin
                if tblCPUs['CPUModel'] = sCPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblCPUs
                    ['CPUPowerConsumption'];
                end;
                tblCPUs.Next;
              end;

              tblGPUs.First;
              while NOT tblGPUs.Eof do
              begin
                if tblGPUs['GPUModel'] = sGPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblGPUs
                    ['GPUPowerConsumption'];
                end;
                tblGPUs.Next;
              end;

              tblRAM.First;
              while NOT tblRAM.Eof do
              begin
                if tblRAM['RAMCapacityAndType'] = sRAM then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblRAM
                    ['RAMPowerConsumption'];
                  iRAMID := tblRAM['RAMID'];
                end;
                tblRAM.Next;
              end;

              tblStorage.First;
              while NOT tblStorage.Eof do
              begin
                if tblStorage['CapacityRange'] = sStorage then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblStorage
                    ['StoragePowerConsumption'];
                end;
                tblStorage.Next;
              end;

              tblLocations.First;
              while NOT tblLocations.Eof do
              begin
                if tblLocations['LocationName'] = sLocation then
                begin
                  rCarbonIntensity := tblLocations['CarbonIntensity'];
                end;
                tblLocations.Next;
              end;
              objTemp := TCARBON.Create(sCPU, sGPU, sRAM, sStorage, sLocation,
                iRuntime);
              objTemp.SetTotalPowerConsumption(rTotalPowerConsumption);
              objTemp.SetTotalEnergy;
              objTemp.SetCarbonFootprint(rCarbonIntensity);

              tblComputers.Edit;
              tblComputers['TotalPowerConsumption'] := rTotalPowerConsumption;
              tblComputers['RAMID'] := iRAMID;
              tblComputers.Post;
              dmMain.tblCarbonEmissions.Edit;
              dmMain.tblCarbonEmissions['EnergyConsumed'] := objTemp.GetEnergy
                ();
              dmMain.tblCarbonEmissions['CarbonEmissions'] :=
                objTemp.GetCarbonFootprint();
              dmMain.tblCarbonEmissions.Post;

            end;
          end;
        end;
      end;
    4:
      begin
        if (cmbStorageCapacitynRange.Text = '<SELECT>') OR
          (chkStorageType.ItemIndex = -1) then
        begin
          EXIT;
        end;
        dmMain.Query.Close;
        dmMain.Query.SQL.Clear;
        dmMain.Query.SQL.Add(
          'UPDATE tblStorage INNER JOIN tblComputers ON tblStorage.[StorageID] = tblComputers.[StorageID] SET CapacityRange =' + QuotedStr(sStorage) + '');
        dmMain.Query.SQL.Add('WHERE ComputerID = ' + frmCRUD_G.sRecord + '');
        dmMain.Query.ExecSQL;

        if dmMain.tblCarbonEmissions.Locate('ComputerID', frmCRUD_G.sRecord,
          []) = True then
        begin
          if dmMain.tblComputers.Locate('ComputerID', frmCRUD_G.sRecord, [])
            = True then
          begin
            iRuntime := dmMain.tblComputers['Runtime'];
            sCPU := dmMain.tblCPUs['CPUModel'];
            sGPU := dmMain.tblGPUs['GPUModel'];
            sRAM := dmMain.tblRAM['RAMCapacityAndType'];
            sLocation := dmMain.tblLocations['LocationName'];
            rTotalPowerConsumption := 0;
            WITH dmMain DO
            BEGIN
              tblCPUs.First;
              while NOT tblCPUs.Eof do
              begin
                if tblCPUs['CPUModel'] = sCPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblCPUs
                    ['CPUPowerConsumption'];
                end;
                tblCPUs.Next;
              end;

              tblGPUs.First;
              while NOT tblGPUs.Eof do
              begin
                if tblGPUs['GPUModel'] = sGPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblGPUs
                    ['GPUPowerConsumption'];
                end;
                tblGPUs.Next;
              end;

              tblRAM.First;
              while NOT tblRAM.Eof do
              begin
                if tblRAM['RAMCapacityAndType'] = sRAM then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblRAM
                    ['RAMPowerConsumption'];
                end;
                tblRAM.Next;
              end;

              tblStorage.First;
              while NOT tblStorage.Eof do
              begin
                if tblStorage['CapacityRange'] = sStorage then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblStorage
                    ['StoragePowerConsumption'];
                  iStorageID := tblStorage['StorageID'];
                end;
                tblStorage.Next;
              end;

              tblLocations.First;
              while NOT tblLocations.Eof do
              begin
                if tblLocations['LocationName'] = sLocation then
                begin
                  rCarbonIntensity := tblLocations['CarbonIntensity'];
                end;
                tblLocations.Next;
              end;
              objTemp := TCARBON.Create(sCPU, sGPU, sRAM, sStorage, sLocation,
                iRuntime);
              objTemp.SetTotalPowerConsumption(rTotalPowerConsumption);
              objTemp.SetTotalEnergy;
              objTemp.SetCarbonFootprint(rCarbonIntensity);

              tblComputers.Edit;
              tblComputers['TotalPowerConsumption'] := rTotalPowerConsumption;
              tblComputers['StorageID'] := iStorageID;
              tblComputers.Post;
              dmMain.tblCarbonEmissions.Edit;
              dmMain.tblCarbonEmissions['EnergyConsumed'] := objTemp.GetEnergy
                ();
              dmMain.tblCarbonEmissions['CarbonEmissions'] :=
                objTemp.GetCarbonFootprint();
              dmMain.tblCarbonEmissions.Post;

            end;

          end;
        end;
      end;
    5:
      begin
        if cmbLocationName.Text = '<SELECT>' then
        begin
          EXIT;
        end;
        dmMain.Query.Close;
        dmMain.Query.SQL.Clear;
        dmMain.Query.SQL.Add(
          'UPDATE tblLocations INNER JOIN tblComputers ON tblLocations.[LocationID] = tblComputers.[LocationID] SET LocationName =' + QuotedStr(sLocation) + '');
        dmMain.Query.SQL.Add('WHERE ComputerID = ' + frmCRUD_G.sRecord + '');
        dmMain.Query.ExecSQL;

        if dmMain.tblCarbonEmissions.Locate('ComputerID', frmCRUD_G.sRecord,
          []) = True then
        begin
          if dmMain.tblComputers.Locate('ComputerID', frmCRUD_G.sRecord, [])
            = True then
          begin
            iRuntime := dmMain.tblComputers['Runtime'];
            sCPU := dmMain.tblCPUs['CPUModel'];
            sGPU := dmMain.tblGPUs['GPUModel'];
            sRAM := dmMain.tblRAM['RAMCapacityAndType'];
            sStorage := dmMain.tblStorage['CapacityRange'];
            rTotalPowerConsumption := 0;
            WITH dmMain DO
            BEGIN
              tblCPUs.First;
              while NOT tblCPUs.Eof do
              begin
                if tblCPUs['CPUModel'] = sCPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblCPUs
                    ['CPUPowerConsumption'];
                end;
                tblCPUs.Next;
              end;

              tblGPUs.First;
              while NOT tblGPUs.Eof do
              begin
                if tblGPUs['GPUModel'] = sGPU then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblGPUs
                    ['GPUPowerConsumption'];
                end;
                tblGPUs.Next;
              end;

              tblRAM.First;
              while NOT tblRAM.Eof do
              begin
                if tblRAM['RAMCapacityAndType'] = sRAM then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblRAM
                    ['RAMPowerConsumption'];
                end;
                tblRAM.Next;
              end;

              tblStorage.First;
              while NOT tblStorage.Eof do
              begin
                if tblStorage['CapacityRange'] = sStorage then
                begin
                  rTotalPowerConsumption := rTotalPowerConsumption + tblStorage
                    ['StoragePowerConsumption'];
                end;
                tblStorage.Next;
              end;

              tblLocations.First;
              while NOT tblLocations.Eof do
              begin
                if tblLocations['LocationName'] = sLocation then
                begin
                  iLocationID := tblLocations['LocationID'];
                  rCarbonIntensity := tblLocations['CarbonIntensity'];
                end;
                tblLocations.Next;
              end;
              objTemp := TCARBON.Create(sCPU, sGPU, sRAM, sStorage, sLocation,
                iRuntime);
              objTemp.SetTotalPowerConsumption(rTotalPowerConsumption);
              objTemp.SetTotalEnergy;
              objTemp.SetCarbonFootprint(rCarbonIntensity);

              tblComputers.Edit;
              tblComputers['TotalPowerConsumption'] := rTotalPowerConsumption;
              tblComputers['LocationID'] := iLocationID;
              tblComputers.Post;
              dmMain.tblCarbonEmissions.Edit;
              dmMain.tblCarbonEmissions['EnergyConsumed'] := objTemp.GetEnergy
                ();
              dmMain.tblCarbonEmissions['CarbonEmissions'] :=
                objTemp.GetCarbonFootprint();
              dmMain.tblCarbonEmissions.Post;
            end;
          end;
        end;
      end;
  end;

  frmSaveChanges_G.Close;
end;

procedure TfrmSaveChanges_G.chkCPUClick(Sender: TObject);
var
  i: Integer;
  Query: TADOQuery;
begin
  // Uncheck all checkboxes except the one that was just checked
  for i := 0 to chkCPU.Items.Count - 1 do
  begin
    if (i <> chkCPU.ItemIndex) and chkCPU.Checked[i] then
      chkCPU.Checked[i] := False;
  end;

  Query := TADOQuery.Create(Self);
  Query.Connection := dmMain.conDatabase;
  cmbCPUmodel.Items.Clear;

  WITH dmMain DO
  BEGIN
    if chkCPU.Checked[0] then
    begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add
        ('SELECT CPUModel FROM tblCPUs WHERE CPUManufacturer = "AMD"');
      Query.Open;
      while not Query.Eof do
      begin
        cmbCPUmodel.Items.Add(Query.FieldByName('CPUModel').AsString);
        Query.Next;
      end;
    end
    else if chkCPU.Checked[1] then
    begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add(
        'SELECT CPUModel FROM tblCPUs WHERE CPUManufacturer = "INTEL"');
      Query.Open;
      while not Query.Eof do
      begin
        cmbCPUmodel.Items.Add(Query.FieldByName('CPUModel').AsString);
        Query.Next;
      end;
    end;
  END;
  Query.Free;

end;

procedure TfrmSaveChanges_G.chkGPUClick(Sender: TObject);
var
  i: Integer;
  Query: TADOQuery;
begin
  // Uncheck all checkboxes except the one that was just checked
  for i := 0 to chkGPU.Items.Count - 1 do
  begin
    if (i <> chkGPU.ItemIndex) and chkGPU.Checked[i] then
      chkGPU.Checked[i] := False;
  end;

  Query := TADOQuery.Create(Self);
  Query.Connection := dmMain.conDatabase;
  cmbGPUmodel.Items.Clear;

  WITH dmMain DO
  BEGIN
    if chkGPU.Checked[0] then
    begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add
        ('SELECT GPUModel FROM tblGPUs WHERE GPUManufacturer = "AMD"');
      Query.Open;
      while not Query.Eof do
      begin
        cmbGPUmodel.Items.Add(Query.FieldByName('GPUModel').AsString);
        Query.Next;
      end;
    end
    else if chkGPU.Checked[1] then
    begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add(
        'SELECT GPUModel FROM tblGPUs WHERE GPUManufacturer = "NVIDIA"');
      Query.Open;
      while not Query.Eof do
      begin
        cmbGPUmodel.Items.Add(Query.FieldByName('GPUModel').AsString);
        Query.Next;
      end;
    end;
  END;
  Query.Free;

end;

procedure TfrmSaveChanges_G.chkStorageTypeClick(Sender: TObject);
var
  i: Integer;
  Query: TADOQuery;
begin
  // Uncheck all checkboxes except the one that was just checked
  for i := 0 to chkStorageType.Items.Count - 1 do
  begin
    if (i <> chkStorageType.ItemIndex) and chkStorageType.Checked[i] then
      chkStorageType.Checked[i] := False;

    Query := TADOQuery.Create(Self);
    Query.Connection := dmMain.conDatabase;
    cmbStorageCapacitynRange.Items.Clear;

    WITH dmMain DO
    BEGIN
      if chkStorageType.Checked[0] then
      begin
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add(
          'SELECT CapacityRange FROM tblStorage WHERE StorageType = "HDD"');
        Query.Open;
        while not Query.Eof do
        begin
          cmbStorageCapacitynRange.Items.Add
            (Query.FieldByName('CapacityRange').AsString);
          Query.Next;
        end;
      end
      else if chkStorageType.Checked[1] then
      begin
        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add(
          'SELECT CapacityRange FROM tblStorage WHERE StorageType = "SSD"');
        Query.Open;
        while not Query.Eof do
        begin
          cmbStorageCapacitynRange.Items.Add
            (Query.FieldByName('CapacityRange').AsString);
          Query.Next;
        end;
      end;
    END;
    Query.Free;
  end;
end;

procedure TfrmSaveChanges_G.FormActivate(Sender: TObject);
begin
  frmSaveChanges_G.pnlCPU.Hide;
  frmSaveChanges_G.pnlGPU.Hide;
  frmSaveChanges_G.pnlRuntime.Hide;
  frmSaveChanges_G.pnlRAM.Hide;
  frmSaveChanges_G.pnlLocation.Hide;
  frmSaveChanges_G.pnlStorageType.Hide;
end;

procedure TfrmSaveChanges_G.FormCreate(Sender: TObject);
begin
  frmSaveChanges_G.Width := 115;
  frmSaveChanges_G.Height := 142;

  pnlCPU.Left := 3;
  pnlCPU.Top := 28;

  pnlGPU.Left := 3;
  pnlGPU.Top := 28;

  pnlRuntime.Left := 3;
  pnlRuntime.Top := 28;

  pnlRAM.Left := 3;
  pnlRAM.Top := 28;

  pnlLocation.Left := 3;
  pnlLocation.Top := 28;

  pnlStorageType.Left := 3;
  pnlStorageType.Top := 28;
end;

procedure TfrmSaveChanges_G.FormShow(Sender: TObject);
begin
  with dmMain do
  begin
    cmbRAMcapacityntype.Clear;
    tblRAM.First;
    while NOT tblRAM.Eof do
    begin
      cmbRAMcapacityntype.Text := '<SELECT>';
      cmbRAMcapacityntype.Items.Add(tblRAM['RAMCapacityAndType']);
      tblRAM.Next;
    end;

    cmbLocationName.Clear;
    tblLocations.First;
    while NOT tblLocations.Eof do
    begin
      cmbLocationName.Text := '<SELECT>';
      cmbLocationName.Items.Add(tblLocations['LocationName']);
      tblLocations.Next;
    end;
  end;
end;

end.
