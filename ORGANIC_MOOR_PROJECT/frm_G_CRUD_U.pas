unit frm_G_CRUD_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, CheckLst, dmMAIN_U;

type
  TfrmCRUD_G = class(TForm)
    pnlProgram: TPanel;
    chkFields: TCheckListBox;
    btnEdit: TButton;
    pnlCustomTitleBar: TPanel;
    imgClose: TImage;
    lblEdit: TLabel;
    procedure imgCloseClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure chkFieldsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sRecord: String;
    function ValidateInteger(const str: string): boolean;

  end;

var
  frmCRUD_G: TfrmCRUD_G;

implementation

uses MAIN_U, frm_G_SAVE_CHANGES_U; //LINKING THESE FORMS TO BE USED
{$R *.dfm}


procedure TfrmCRUD_G.btnEditClick(Sender: TObject);
begin
  sRecord := inputbox('UPDATING RECORDS', 'ENTER COMPUTER TO UPDATE', '');
  if ValidateInteger(sRecord) then
  begin
    if dmMain.tblComputers.Locate('ComputerID', sRecord, []) = True then
    begin
      case chkFields.ItemIndex of
        - 1:
          ShowMessage('CHOOSE FIELD!');
        0:
          begin
            frmSaveChanges_G.Show;
            frmSaveChanges_G.pnlRuntime.Show;
          end;

        1:
          begin
            frmSaveChanges_G.Show;
            frmSaveChanges_G.pnlCPU.Show;
          end;
        2:
          begin
            frmSaveChanges_G.Show;
            frmSaveChanges_G.pnlGPU.Show;
          end;
        3:
          begin
            frmSaveChanges_G.Show;
            frmSaveChanges_G.pnlRAM.Show;
          end;
        4:
          begin
            frmSaveChanges_G.Show;
            frmSaveChanges_G.pnlStorageType.Show;
          end;
        5:
          begin
            frmSaveChanges_G.Show;
            frmSaveChanges_G.pnlLocation.Show;
          end;
      end;
    end
    else
    begin
      ShowMessage('RECORD NOT FOUND');
    end;
  end
  else
  begin

  end;

end;

// Uncheck all checkboxes except the one that was just checked==================
procedure TfrmCRUD_G.chkFieldsClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to chkFields.Items.Count - 1 do
  begin
    if (i <> chkFields.ItemIndex) and chkFields.Checked[i] then
      chkFields.Checked[i] := False;
  end;
end;
// =============================================================================

procedure TfrmCRUD_G.imgCloseClick(Sender: TObject);
var
  sUser: String;
  iUserID: Integer;
begin
  frmCRUD_G.Close;
  frmMain.pnlGeneralUserQueryScreen.Show;
  sUser := frmMain.pnlCurrentUser.Caption;
  Delete(sUser, 1, 6);
  dmMain.tblUsers.First;
  while NOT dmMain.tblUsers.Eof do
  begin
    if dmMain.tblUsers['Username'] = sUser then
    begin
      iUserID := dmMain.tblUsers['UserID'];
    end;
    dmMain.tblUsers.Next;
  end;
  dmMain.dscComputers.DataSet := dmMain.Query;
  with dmMain do
  begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(
      'SELECT tblComputers.ComputerID AS COMPUTER,tblComputers.Runtime AS RUNTIME,tblCPUs.CPUModel AS CPU,tblGPUs.GPUModel AS GPU,tblRAM.RAMCapacityAndType AS RAM,tblStorage.CapacityRange AS STORAGE, tblLocations.LocationName AS LOCATION '
        +
        'FROM tblStorage INNER JOIN (tblRAM INNER JOIN (tblLocations INNER JOIN (tblGPUs INNER JOIN (tblCPUs INNER JOIN tblComputers ON tblCPUs.[CPUID] = tblComputers.[CPUID]) ON tblGPUs.[GPUID] = tblComputers.[GPUID]) ON ' + 'tblLocations.[LocationID] = tblComputers.[LocationID]) ON tblRAM.[RAMID] = tblComputers.[RAMID]) ON tblStorage.[StorageID] = tblComputers.[StorageID] WHERE tblComputers.UserID = ' + Inttostr(iUserID) + '');
    Query.Open;
  end;
  frmMain.SetGridColumnWidths(frmMain.GeneralUserQueryGrid);
end;

function TfrmCRUD_G.ValidateInteger(const str: string): boolean;
var
  intValue: Integer;
begin
  if (str = '') or (str = ' ') then
  begin
    ShowMessage('ENTER VALID INPUT');
  end
  else
  begin
    Result := TryStrToInt(str, intValue);
  end;
end;

end.
