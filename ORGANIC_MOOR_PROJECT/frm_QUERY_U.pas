unit frm_QUERY_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, DB, ExtCtrls, MAIN_U, dmMAIN_U, pngimage,
  ComCtrls;

type
  TfrmQuery_G = class(TForm)
    pnlProgram: TPanel;
    chkFields: TCheckListBox;
    btnSearch: TButton;
    btnSort: TButton;
    pnlCustomTitleBar: TPanel;
    imgClose: TImage;
    Image1: TImage;
    procedure chkFieldsClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidateInteger(const str: string): Boolean;
    function ValidateSortDirection(const str: string): Boolean;
  end;

var
  frmQuery_G: TfrmQuery_G;

implementation

{$R *.dfm}

// SEARCHES THROUGH AND LOCATES RECORD DESIRED BY THE USER
procedure TfrmQuery_G.btnSearchClick(Sender: TObject);
var
  sInput: String;
begin
  case chkFields.ItemIndex of
    - 1:
      ShowMessage('ENTER FIELD');
    0:
      begin
        sInput := InputBox('SEARCH', 'COMPUTER', '');
        if sInput = '' then
        begin
          ShowMessage('PLEASE FILL IN FIELD TO SEARCH');
          exit;
        end;
      end;

    1:
      begin
        sInput := InputBox('SEARCH', 'RUNTIME', '');
        if sInput = '' then
        begin
          ShowMessage('PLEASE FILL IN FIELD TO SEARCH');
          exit;
        end;
      end;

    2:
      begin
        sInput := InputBox('SEARCH', 'CPU', '');
        if sInput = '' then
        begin
          ShowMessage('PLEASE FILL IN FIELD TO SEARCH');
          exit;
        end;
      end;

    3:
      begin
        sInput := InputBox('SEARCH', 'GPU', '');
        if sInput = '' then
        begin
          ShowMessage('PLEASE FILL IN FIELD TO SEARCH');
          exit;
        end;
      end;

    4:
      begin
        sInput := InputBox('SEARCH', 'RAM', '');
        if sInput = '' then
        begin
          ShowMessage('PLEASE FILL IN FIELD TO SEARCH');
          exit;
        end;
      end;

    5:
      begin
        sInput := InputBox('SEARCH', 'STORAGE', '');
        if sInput = '' then
        begin
          ShowMessage('PLEASE FILL IN FIELD TO SEARCH');
          exit;
        end;
      end;

    6:
      begin
        sInput := InputBox('SEARCH', 'LOCATION', '');
        if sInput = '' then
        begin
          ShowMessage('PLEASE FILL IN FIELD TO SEARCH');
          exit;
        end;
      end;
  end;
  dmMain.Query.First;
  if chkFields.ItemIndex = 0 then
  begin
    if ValidateInteger(sInput) then
    begin
      if dmMain.Query.Locate('COMPUTER', StrToInt(sInput), [loCaseInsensitive,
        loPartialKey]) then
      begin
        ShowMessage('RECORD FOUND!');
      end
      else
      begin
        ShowMessage('RECORD NOT FOUND!');
      end;
    end
    else
    begin
      ShowMessage('ENTER VALID INTEGER');
    end;
  end;

  if chkFields.ItemIndex = 1 then
  begin
    if ValidateInteger(sInput) then
    begin
      if dmMain.Query.Locate('RUNTIME', StrToInt(sInput), [loCaseInsensitive,
        loPartialKey]) then
      begin
        ShowMessage('RECORD FOUND!');
      end
      else
      begin
        ShowMessage('RECORD NOT FOUND!');
      end;
    end
    else
    begin
      ShowMessage('ENTER VALID INTEGER');
    end;
  end;

  if chkFields.ItemIndex = 2 then
  begin
    if dmMain.Query.Locate('CPU', sInput, [loCaseInsensitive, loPartialKey])
      then
    begin
      ShowMessage('RECORD FOUND!');
    end
    else
    begin
      ShowMessage('RECORD NOT FOUND!');
    end;
  end;

  if chkFields.ItemIndex = 3 then
  begin
    if dmMain.Query.Locate('GPU', sInput, [loCaseInsensitive, loPartialKey])
      then
    begin
      ShowMessage('RECORD FOUND!');
    end
    else
    begin
      ShowMessage('RECORD NOT FOUND!');
    end;
  end;

  if chkFields.ItemIndex = 4 then
  begin
    if dmMain.Query.Locate('RAM', sInput, [loCaseInsensitive, loPartialKey])
      then
    begin
      ShowMessage('RECORD FOUND!');
    end
    else
    begin
      ShowMessage('RECORD NOT FOUND!');
    end;
  end;

  if chkFields.ItemIndex = 5 then
  begin
    if dmMain.Query.Locate('STORAGE', sInput, [loCaseInsensitive,
      loPartialKey]) then
    begin
      ShowMessage('RECORD FOUND!');
    end
    else
    begin
      ShowMessage('RECORD NOT FOUND!');
    end;
  end;

  if chkFields.ItemIndex = 6 then
  begin
    if dmMain.Query.Locate('LOCATION', sInput, [loCaseInsensitive,
      loPartialKey]) then
    begin
      ShowMessage('RECORD FOUND!');
    end
    else
    begin
      ShowMessage('RECORD NOT FOUND!');
    end;
  end;

end;

// SORTS RECORDS BASED ON USER'S PREFERENCE
procedure TfrmQuery_G.btnSortClick(Sender: TObject);
var
  sInput: String;
begin
  sInput := InputBox('SORT', 'SORT FIELDS IN:', 'ASC/DESC');
  if ValidateSortDirection(sInput) then
  begin
    case chkFields.ItemIndex of
      - 1:
        ShowMessage('CHOOSE FIELD');
      0:
        dmMain.Query.Sort := 'COMPUTER ' + sInput;
      1:
        dmMain.Query.Sort := 'RUNTIME ' + sInput;
      2:
        dmMain.Query.Sort := 'CPU ' + sInput;
      3:
        dmMain.Query.Sort := 'GPU ' + sInput;
      4:
        dmMain.Query.Sort := 'RAM ' + sInput;
      5:
        dmMain.Query.Sort := 'STORAGE ' + sInput;
      6:
        dmMain.Query.Sort := 'LOCATION ' + sInput;
    end;
  end
  else
  begin
    ShowMessage(
      'ENTER EITHER "ASC"(ASCENDING ORDER) OR "DESC"(DESCENDING ORDER)');
  end;
end;

procedure TfrmQuery_G.chkFieldsClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to chkFields.Items.Count - 1 do
  begin
    if (i <> chkFields.ItemIndex) and chkFields.Checked[i] then
      chkFields.Checked[i] := False;
  end;
end;

procedure TfrmQuery_G.imgCloseClick(Sender: TObject);
begin
  frmQuery_G.Close;
  frmMain.pnlAdministratorManagementScreen.Show;
end;

function TfrmQuery_G.ValidateInteger(const str: string): Boolean;
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

function TfrmQuery_G.ValidateSortDirection(const str: string): Boolean;
begin
  Result := (UpperCase(str) = 'ASC') or (UpperCase(str) = 'DESC');
end;

end.
