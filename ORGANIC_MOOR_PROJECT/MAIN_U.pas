unit MAIN_U;

interface

uses
  Windows, Forms, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, ExtCtrls, pngimage, StdCtrls, frmSPLASH_SCREEN_U, clsORGANICMOOR_U,
  frm_A_CRUD_U,
  frm_G_CRUD_U, frmTIPS_U, COMOBJ, MATH, DB, EASendMailObjLib_TLB, DBCTRLS,
  OleCtrls, SHDocVw, CheckLst, Spin, dmMAIN_U, DBGRIDS, Grids, Mask, ADODB,
  ComCtrls, DBClient, Buttons, ShellAPI;

type
  TfrmMain = class(TForm)
    pnlProgram: TPanel;
    pnlCustomTitleBar: TPanel;
    imgClose: TImage;
    imgMinimize: TImage;
    imgLightDarkMode: TImage;
    pnlUserTypeScreen: TPanel;
    imgUserTypeAdministrator: TImage;
    imgUserTypeGeneralUser: TImage;
    lblUserTypeAdministrator: TLabel;
    lblUserTypeGeneralUser: TLabel;
    lblUserType: TLabel;
    pnlGeneralUserLoginScreen: TPanel;
    lblGeneralUserLogin: TLabel;
    lblGeneralUserUsername: TLabel;
    edtGeneralUserUsername: TEdit;
    lblGeneralUserPassword: TLabel;
    edtGeneralUserPassword: TEdit;
    imgGeneralUserShowHide: TImage;
    btnGeneralUserLogin: TButton;
    btnCreateAccount: TButton;
    lblForgotPassword: TLabel;
    imgProgramLogo: TImage;
    lblProgramName: TLabel;
    pnlAdministratorLoginScreen: TPanel;
    lblAdministratorLogin: TLabel;
    lblAdministratorUsername: TLabel;
    lblAdministratorPassword: TLabel;
    imgAdministratorShowHide: TImage;
    edtAdministratorUsername: TEdit;
    edtAdministratorPassword: TEdit;
    btnAdministratorLogin: TButton;
    pnlRegisterAccountScreen: TPanel;
    lblRegisterAccount: TLabel;
    lblRegisterAccountUsername: TLabel;
    lblRegisterAccountPassword: TLabel;
    imgRegisterAccountShowHide: TImage;
    edtRegisterAccountUsername: TEdit;
    edtRegisterAccountPassword: TEdit;
    btnRegisterAccount: TButton;
    lblRegisterAccountEmailAddress: TLabel;
    edtRegisterAccountEmailAddress: TEdit;
    btnRegisterAccountScreenReturn: TButton;
    btnGeneralUserLoginScreenReturn: TButton;
    btnAdministratorLoginScreenReturn: TButton;
    pnlWebBrowserScreen: TPanel;
    btnBack: TButton;
    btnForward: TButton;
    edtURL: TEdit;
    btnSearch: TButton;
    WebBrowser: TWebBrowser;
    pnlWidgetBar: TPanel;
    btnNext: TPanel;
    btnPrevious: TPanel;
    lblDateTime: TPanel;
    pnlCurrentUser: TPanel;
    pnlCarbonFootprintScreen: TPanel;
    pnlGeneralUserQueryScreen: TPanel;
    pnlAdministratorManagementScreen: TPanel;
    tmrDateTime: TTimer;
    pnlCPU: TPanel;
    imgCPU: TImage;
    lblCPU: TLabel;
    chkCPU: TCheckListBox;
    pnlGPU: TPanel;
    imgGPU: TImage;
    lblGPU: TLabel;
    chkGPU: TCheckListBox;
    pnlRAM: TPanel;
    imgRAM: TImage;
    lblRAM: TLabel;
    pnlStorageType: TPanel;
    imgStorage: TImage;
    lblStorage: TLabel;
    chkStorageType: TCheckListBox;
    pnlLocation: TPanel;
    imgLocation: TImage;
    lblLocation: TLabel;
    pnlRuntime: TPanel;
    imgRuntime: TImage;
    lblRuntime: TLabel;
    spedRuntime: TSpinEdit;
    cmbLocationName: TComboBox;
    cmbRAMcapacityntype: TComboBox;
    cmbStorageCapacitynRange: TComboBox;
    cmbCPUmodel: TComboBox;
    cmbGPUmodel: TComboBox;
    btnCalculate: TButton;
    redOutput: TRichEdit;
    pnlStatistics: TPanel;
    pnlEquivalentDistanceByCar: TPanel;
    imgCar: TImage;
    lblEquivalentDistance: TLabel;
    lblDistanceAmount: TLabel;
    pnlCarbonEmissions: TPanel;
    imgCarbonEmissions: TImage;
    lblCarbonEmissions: TLabel;
    lblCarbonEmissionAmount: TLabel;
    pnlCarbonEmissionIntensity: TPanel;
    pnlCarbonSequestration: TPanel;
    imgCarbonSequestration: TImage;
    lblCarbonSequestration: TLabel;
    lblCarbonSequestrationAmount: TLabel;
    pnlEnergy: TPanel;
    imgEnergy: TImage;
    lblEnergy: TLabel;
    lblEnergyAmount: TLabel;
    lblStatistics: TLabel;
    lblGeneralUserQuery: TLabel;
    GeneralUserQueryGrid: TDBGrid;
    btnQuery_G: TButton;
    btnDelete_G: TButton;
    btnEdit_G: TButton;
    pnlQuery_G: TPanel;
    pnlCRUD_G: TPanel;
    redHelp_G: TRichEdit;
    AdministratorQueryGrid: TDBGrid;
    lblAdministratorQuery: TLabel;
    pnlQuery_A: TPanel;
    btnQuery_A: TButton;
    cmbViewTable: TComboBox;
    pnlViewTable: TPanel;
    lblViewTable: TLabel;
    pnlManage: TPanel;
    btnManage: TButton;
    pnlFeedback: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure imgCloseClick(Sender: TObject);
    procedure imgMinimizeClick(Sender: TObject);
    procedure imgLightDarkModeClick(Sender: TObject);
    procedure imgGeneralUserShowHideMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgGeneralUserShowHideMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgCloseMouseEnter(Sender: TObject);
    procedure imgMinimizeMouseEnter(Sender: TObject);
    procedure imgLightDarkModeMouseEnter(Sender: TObject);
    procedure imgUserTypeAdministratorMouseEnter(Sender: TObject);
    procedure imgUserTypeGeneralUserMouseEnter(Sender: TObject);
    procedure imgAdministratorShowHideMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgAdministratorShowHideMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgRegisterAccountShowHideMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgRegisterAccountShowHideMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imgUserTypeAdministratorClick(Sender: TObject);
    procedure imgUserTypeGeneralUserClick(Sender: TObject);
    procedure btnGeneralUserLoginClick(Sender: TObject);
    procedure btnAdministratorLoginClick(Sender: TObject);
    procedure btnCreateAccountClick(Sender: TObject);
    procedure btnRegisterAccountScreenReturnClick(Sender: TObject);
    procedure btnAdministratorLoginScreenReturnClick(Sender: TObject);
    procedure btnGeneralUserLoginScreenReturnClick(Sender: TObject);
    procedure lblForgotPasswordClick(Sender: TObject);
    procedure btnRegisterAccountClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure tmrDateTimeTimer(Sender: TObject);
    procedure chkCPUClick(Sender: TObject);
    procedure chkGPUClick(Sender: TObject);
    procedure chkStorageTypeClick(Sender: TObject);
    procedure btnCalculateClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDelete_GClick(Sender: TObject);
    procedure btnEdit_GClick(Sender: TObject);
    procedure cmbViewTableChange(Sender: TObject);
    procedure btnDelete_AClick(Sender: TObject);
    procedure btnManageClick(Sender: TObject);
    procedure btnQuery_GClick(Sender: TObject);
    procedure btnQuery_AClick(Sender: TObject);
    procedure pnlFeedbackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetGridColumnWidths(Grid: TDBGrid);
    procedure LightDarkMode();
    procedure TextToSpeech(sText: String);
    procedure SendEmail();
    function ValidateEmail(email: string): boolean;
    function ValidateInteger(const str: string): boolean;
  end;

CONST
  ConnectNormal = 0;
  ConnectSSLAuto = 1;
  ConnectSTARTTLS = 2;
  ConnectDirectSSL = 3;
  ConnectTryTLS = 4;

  arrReferenceValueName: array [0 .. 1] of String = ('TREE-DAYS', 'METERS');
  arrReferenceValue: array [0 .. 1] of Real = (0.0301163586584531, 0.00175);

var
  frmMain: TfrmMain;

  ClickCounter: Integer; // USED TO KEEP A RECORD OF WHICH THEME OF THE PRGRAM TO USE

  CurrentPanelIndex: Integer; // IDENTIFY WHICH PANEL IS CURRENTLY BEING DISPLAYED

implementation

uses frm_QUERY_U; // LINK QUERY FORM TO USE
{$R *.dfm}

// ===========================ON ACTIVATE EVENT===============================//
procedure TfrmMain.FormActivate(Sender: TObject);
begin
  pnlGeneralUserLoginScreen.Hide;
  pnlAdministratorLoginScreen.Hide;
  pnlRegisterAccountScreen.Hide;
  pnlWebBrowserScreen.Hide;
  pnlCarbonFootprintScreen.Hide;
  pnlGeneralUserQueryScreen.Hide;
  pnlAdministratorManagementScreen.Hide;
end;
// ===========================================================================//

// ===========================ON CREATE EVENT=================================//
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // frmMain.Width := 400;
  // frmMain.Height := 400;
  frmMain.Position := poScreenCenter;

  WebBrowser.Navigate('www.google.com'); // DEFAULT WEBPAGE
  redOutput.Font.Name := 'Tahoma';

  pnlWidgetBar.Hide;
  pnlWidgetBar.Left := -2;
  pnlWidgetBar.Top := 372;

  pnlUserTypeScreen.Top := 23;
  pnlUserTypeScreen.Left := -2;

  pnlAdministratorLoginScreen.Top := 23;
  pnlAdministratorLoginScreen.Left := -2;

  pnlAdministratorManagementScreen.Top := 23;
  pnlAdministratorManagementScreen.Left := -2;

  pnlGeneralUserLoginScreen.Top := 23;
  pnlGeneralUserLoginScreen.Left := -2;

  pnlRegisterAccountScreen.Top := 23;
  pnlRegisterAccountScreen.Left := -2;

  pnlWebBrowserScreen.Top := 23;
  pnlWebBrowserScreen.Left := -2;

  pnlCarbonFootprintScreen.Top := 23;
  pnlCarbonFootprintScreen.Left := -2;

  pnlGeneralUserQueryScreen.Top := 23;
  pnlGeneralUserQueryScreen.Left := -2;

  lblForgotPassword.Hide;
  lblCarbonSequestration.Caption := 'CARBON' + #10 + 'SEQUESTRATION';
  lblEquivalentDistance.Caption := 'EQUIVALENT' + #10 + 'DISTANCE BY CAR';
end;
// ===========================================================================//

// ===========================ON SHOW EVENT===================================//
procedure TfrmMain.FormShow(Sender: TObject);
begin
  frmSplashScreen.ShowModal;
  GeneralUserQueryGrid.DataSource := dmMain.dscComputers;
  if CurrentPanelIndex = 0 then
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
  SetGridColumnWidths(GeneralUserQueryGrid);
end;
// ===========================================================================//

// =============================CUSTOM TITLE BAR==============================//
procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
{$IF NOT DEFINED(CLR)}
  if CallTerminateProcs then
{$IFEND}
    PostQuitMessage(0);
end;

procedure TfrmMain.imgMinimizeClick(Sender: TObject);
begin
  Application.Minimize();
end;

procedure TfrmMain.imgLightDarkModeClick(Sender: TObject);
begin
  LightDarkMode();
end;
// ===========================================================================//

// ==========================TEXT TO SPEECH===================================//
procedure TfrmMain.imgCloseMouseEnter(Sender: TObject);
begin
  TextToSpeech('CLOSE PROGRAM');
end;

procedure TfrmMain.imgMinimizeMouseEnter(Sender: TObject);
begin
  TextToSpeech('MINIMIZE PROGRAM');
end;

procedure TfrmMain.imgLightDarkModeMouseEnter(Sender: TObject);
begin
  TextToSpeech('CHANGE THEME OF PROGRAM');
end;

procedure TfrmMain.imgUserTypeGeneralUserMouseEnter(Sender: TObject);
begin
  TextToSpeech('CLICK IMAGE TO CHOOSE USER');
end;

procedure TfrmMain.imgUserTypeAdministratorMouseEnter(Sender: TObject);
begin
  TextToSpeech('CLICK IMAGE TO CHOOSE USER');
end;

// ===========================================================================//

// ==============================CHOOSING USER================================//
procedure TfrmMain.imgUserTypeAdministratorClick(Sender: TObject);
begin
  pnlUserTypeScreen.Hide;
  pnlAdministratorLoginScreen.Show;
end;

procedure TfrmMain.imgUserTypeGeneralUserClick(Sender: TObject);
begin
  pnlUserTypeScreen.Hide;
  pnlGeneralUserLoginScreen.Show;
end;
// ===========================================================================//

// ==========================SHOW/HIDE PASSWORD===============================//
procedure TfrmMain.imgAdministratorShowHideMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtAdministratorPassword.PasswordChar := #0;
  imgAdministratorShowHide.Picture.LoadFromFile('IMAGES/HIDE.png');
end;

procedure TfrmMain.imgAdministratorShowHideMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtAdministratorPassword.PasswordChar := '*';
  imgAdministratorShowHide.Picture.LoadFromFile('IMAGES/SHOW.png');
end;

procedure TfrmMain.imgGeneralUserShowHideMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtGeneralUserPassword.PasswordChar := #0;
  imgGeneralUserShowHide.Picture.LoadFromFile('IMAGES/HIDE.png');
end;

procedure TfrmMain.imgGeneralUserShowHideMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtGeneralUserPassword.PasswordChar := '*';
  imgGeneralUserShowHide.Picture.LoadFromFile('IMAGES/SHOW.png');
end;

procedure TfrmMain.imgRegisterAccountShowHideMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtRegisterAccountPassword.PasswordChar := #0;
  imgRegisterAccountShowHide.Picture.LoadFromFile('IMAGES/HIDE.png');
end;

procedure TfrmMain.imgRegisterAccountShowHideMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtRegisterAccountPassword.PasswordChar := '*';
  imgRegisterAccountShowHide.Picture.LoadFromFile('IMAGES/SHOW.png');
end;
// ===========================================================================//

// =============================CLOCK=========================================//
procedure TfrmMain.tmrDateTimeTimer(Sender: TObject);
begin
  lblDateTime.Caption := DateTimeToStr(Now);
end;
// ===========================================================================//

// ==========================TEXT TO SPEECH METHOD============================//
procedure TfrmMain.TextToSpeech(sText: String);
// ---------CREATE THE OLEVARIANT VARIABLE---------//
var
  ovRead: oleVariant;
begin
  // ---------------INSTANTIATE OBJECT---------------//
  ovRead := CreateOleObject('SAPI.SPVoice');
  // ---------------USE SPEAK METHOD-----------------//
  ovRead.Speak(sText);
end;
// ===========================================================================//

// =========================FORGOT PASSWORD EVENT=============================//
procedure TfrmMain.lblForgotPasswordClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'easendmail.exe', nil, nil, SW_SHOWNORMAL);
  SendEmail();
end;
// ===========================================================================//

// ========================VALIDATE EMAIL FUNCTION============================//
function TfrmMain.ValidateEmail(email: string): boolean;
begin
  if Pos('@gmail.com', email) = 0 then
  begin
    ShowMessage('INVALID EMAIL ADDRESS.MUST CONTAIN "@gmail.com"');
    Result := False;
  end
  else
  begin
    Result := True;
  end;
end;
// ===========================================================================//

// ========================VALIDATE INTEGER FUNCTION==========================//
function TfrmMain.ValidateInteger(const str: string): boolean;
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
// ===========================================================================//

// ==========================LIGHT/DARK THEME METHOD==========================//
procedure TfrmMain.LightDarkMode;
var
  i: Integer;
begin
  INC(ClickCounter);
  if ClickCounter = 1 then
  begin
    imgLightDarkMode.Picture.LoadFromFile('IMAGES/LIGHT_MODE.png');
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TPanel then
        TPanel(Components[i]).Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TPanel then
        TPanel(Components[i]).Font.Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TLabel then
        TLabel(Components[i]).Font.Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TEdit then
        TEdit(Components[i]).Font.Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TCheckListBox then
        TCheckListBox(Components[i]).Font.Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TCheckListBox then
        TCheckListBox(Components[i]).Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TSpinEdit then
        TSpinEdit(Components[i]).Font.Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TSpinEdit then
        TSpinEdit(Components[i]).Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TComboBox then
        TComboBox(Components[i]).Font.Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TComboBox then
        TComboBox(Components[i]).Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TRichEdit then
        TRichEdit(Components[i]).Font.Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TRichEdit then
        TRichEdit(Components[i]).Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TDBGrid then
        TDBGrid(Components[i]).Font.Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TDBGrid then
        TDBGrid(Components[i]).Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TDBGrid then
        TDBGrid(Components[i]).FixedColor := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TDBGrid then
        TDBGrid(Components[i]).TitleFont.Color := clWhite;

  end
  else if ClickCounter = 2 then
  begin
    imgLightDarkMode.Picture.LoadFromFile('IMAGES/DARK_MODE.png');
    ClickCounter := 0;
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TPanel then
        TPanel(Components[i]).Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TPanel then
        TPanel(Components[i]).Font.Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TLabel then
        TLabel(Components[i]).Font.Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TEdit then
        TEdit(Components[i]).Font.Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TButton then
        TEdit(Components[i]).Font.Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TCheckListBox then
        TCheckListBox(Components[i]).Font.Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TCheckListBox then
        TCheckListBox(Components[i]).Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TSpinEdit then
        TSpinEdit(Components[i]).Font.Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TSpinEdit then
        TSpinEdit(Components[i]).Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TComboBox then
        TComboBox(Components[i]).Font.Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TComboBox then
        TComboBox(Components[i]).Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TRichEdit then
        TRichEdit(Components[i]).Font.Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TRichEdit then
        TRichEdit(Components[i]).Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TDBGrid then
        TDBGrid(Components[i]).Font.Color := clBlack;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TDBGrid then
        TDBGrid(Components[i]).Color := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TDBGrid then
        TDBGrid(Components[i]).FixedColor := clWhite;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TDBGrid then
        TDBGrid(Components[i]).TitleFont.Color := clBlack;
  end;
end;

procedure TfrmMain.pnlFeedbackClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open',
    'https://sites.google.com/view/organic-moor?usp=sharing', nil, nil,
    SW_SHOWNORMAL);
end;

// ============================SEND EMAIL METHOD==============================//
procedure TfrmMain.SendEmail();
var
  UserEmail, sEmail, sUsername, sPassword, sLine: String;
  oSmtp: TMail;
  FoundUser: boolean;
  TF: TextFile;
  iLength, iCount: Integer;
begin
  UserEmail := '';
  sEmail := '';
  sUsername := '';
  sPassword := '';
  UserEmail := InputBox('EMAIL ADDRESS', 'ENTER', 'example@gmail.com');
  if ValidateEmail(UserEmail) = False then
  begin
    ShowMessage('ENTER VALID EMAIL');
    Exit;
  end;
  FoundUser := False;
  AssignFile(TF, 'TEXT_FILES/GENERAL_USERS.txt');
  Reset(TF);
  while NOT Eof(TF) do
  begin
    Readln(TF, sLine);
    sUsername := Copy(sLine, 1, Pos('$', sLine) - 1);
    Delete(sLine, 1, Pos('$', sLine));
    sPassword := Copy(sLine, 1, Pos('$', sLine) - 1);
    Delete(sLine, 1, Pos('$', sLine));
    sEmail := Copy(sLine, 1, Length(sLine));
    // -------------------DECRYPTION OF PASSWORD----------------//
    iLength := Length(sPassword);
    for iCount := 1 to iLength do
    begin
      sPassword[iCount] := chr(ord(sPassword[iCount]) + 2);
    end;
    // --------------------------------------------------------//

    if (sUsername = edtGeneralUserUsername.Text) and (sEmail = UserEmail) AND
      (ValidateEmail(UserEmail)) then
    begin
      FoundUser := True;
      oSmtp := TMail.Create(Application);
      oSmtp.LicenseCode := 'TryIt';
      // Set your sender email address
      oSmtp.FromAddr := 'organicmoor@gmail.com';
      // Add recipient email address
      oSmtp.AddRecipientEx(sEmail, 0);
      // Set email subject
      oSmtp.Subject := 'ACCOUNT DETAILS';
      // Set email body
      oSmtp.BodyText := 'EMAIL: ' + sEmail + ' USERNAME: ' + sUsername +
        ' PASSWORD: ' + sPassword;
      oSmtp.ServerAddr := 'smtp.gmail.com';
      oSmtp.UserName := 'organicmoor@gmail.com';
      oSmtp.Password := 'vppnmsjhwtiepghs';
      oSmtp.ConnectType := ConnectTryTLS;
      oSmtp.ServerPort := 587;
      ShowMessage('START TO SEND EMAIL...');
      if oSmtp.SendMail() = 0 then
        ShowMessage('EMAIL WAS SENT SUCCESSFULLY WITH YOUR ACCOUNT DETAILS!')
      else
        ShowMessage('FAILED TO SEND EMAIL' + oSmtp.GetLastErrDescription());
      Break;
    end;
  end;
  CloseFile(TF);
  if FoundUser = False then
  begin
    ShowMessage('ENTER VALID EMAIL THAT CORRESPONDS TO THE USERNAME');
  end;
end;
// ===========================================================================//

// =======================SETTTING GRID COLUMNS NEATLY========================//
procedure TfrmMain.SetGridColumnWidths(Grid: TDBGrid);
CONST
  DEFBORDER = 10;
var
  temp, n: Integer;
  lmax: array [0 .. 30] of Integer;
begin
  with Grid do
  begin
    Canvas.Font := Font;
    for n := 0 to Columns.Count - 1 do
      lmax[n] := Canvas.TextWidth(Fields[n].FieldName) + DEFBORDER;
    Grid.DataSource.DataSet.First;
    while not Grid.DataSource.DataSet.Eof do
    begin
      for n := 0 to Columns.Count - 1 do
      begin
        temp := Canvas.TextWidth(Trim(Columns[n].Field.DisplayText))
          + DEFBORDER;
        if temp > lmax[n] then
          lmax[n] := temp;
      end;
      Grid.DataSource.DataSet.Next;
    end;
    Grid.DataSource.DataSet.First;
    for n := 0 to Columns.Count - 1 do
      if lmax[n] > 0 then
        Columns[n].Width := lmax[n];
  end;
end;
// ===========================================================================//

// ================================LOGGING IN=================================//
procedure TfrmMain.btnAdministratorLoginClick(Sender: TObject);
var
  UserName_A, Password_A, sLine: String;
  iLength, iCount: Integer;
  TF: TextFile;
  FoundUser: boolean;
begin
  FoundUser := False;
  AssignFile(TF, 'TEXT_FILES/ADMINISTRATOR.txt');
  Reset(TF);

  while NOT Eof(TF) do
  begin
    Readln(TF, sLine);
    UserName_A := Copy(sLine, 1, Pos('$', sLine) - 1);
    Delete(sLine, 1, Pos('$', sLine));
    Password_A := Copy(sLine, 1, Pos('$', sLine) - 1);
    // -------------------DECRYPTION OF PASSWORD----------------//
    iLength := Length(Password_A);
    for iCount := 1 to iLength do
    begin
      Password_A[iCount] := chr(ord(Password_A[iCount]) + 2);
    end;
    // --------------------------------------------------------//
    if (UserName_A = edtAdministratorUsername.Text) and
      (Password_A = edtAdministratorPassword.Text) then
    begin
      FoundUser := True;
      Break;
    end;
  end;
  CloseFile(TF);
  if FoundUser then
  begin
    MessageDlg('LOGIN SUCCESSFUL!', mtCustom, [mbOK], 0);
    MessageDlg('WELCOME ' + UserName_A + '!', mtCustom, [mbOK], 0);
    pnlAdministratorLoginScreen.Hide;
    pnlWidgetBar.Show;
    btnNext.Hide;
    btnPrevious.Hide;
    pnlAdministratorManagementScreen.Show;
    frmQuery_G.imgClose.Hide;
  end
  else
  begin
    MessageDlg('INVALID USERNAME OR PASSWORD', mtWarning, [mbOK], 0);
  end;
  pnlCurrentUser.Caption := 'USER: ' + UserName_A;
end;

procedure TfrmMain.btnGeneralUserLoginClick(Sender: TObject);
var
  UserName_G, Password_G, Email_G, sLine: String;
  iLength, iCount: Integer;
  TF: TextFile;
  FoundUser: boolean;
begin
  lblForgotPassword.Show;
  FoundUser := False;
  AssignFile(TF, 'TEXT_FILES/GENERAL_USERS.txt');
  Reset(TF);

  while NOT Eof(TF) do
  begin
    Readln(TF, sLine);
    UserName_G := Copy(sLine, 1, Pos('$', sLine) - 1);
    Delete(sLine, 1, Pos('$', sLine));
    Password_G := Copy(sLine, 1, Pos('$', sLine) - 1);
    Delete(sLine, 1, Pos('$', sLine));
    Email_G := Copy(sLine, 1, Length(sLine));
    // -------------------DECRYPTION OF PASSWORD----------------//
    iLength := Length(Password_G);
    for iCount := 1 to iLength do
    begin
      Password_G[iCount] := chr(ord(Password_G[iCount]) + 2);
    end;
    // --------------------------------------------------------//
    if (UserName_G = edtGeneralUserUsername.Text) and
      (Password_G = edtGeneralUserPassword.Text) then
    begin
      FoundUser := True;
      Break;
    end;
  end;
  CloseFile(TF);
  if FoundUser then
  begin
    MessageDlg('LOGIN SUCCESSFUL!', mtCustom, [mbOK], 0);
    MessageDlg('WELCOME ' + UserName_G + '!', mtCustom, [mbOK], 0);
    pnlGeneralUserLoginScreen.Hide;
    pnlWidgetBar.Show;
    pnlCarbonFootprintScreen.Show;
  end
  else
  begin
    MessageDlg('INVALID USERNAME OR PASSWORD', mtWarning, [mbOK], 0);
  end;
  pnlCurrentUser.Caption := 'USER: ' + UserName_G;
end;

procedure TfrmMain.btnRegisterAccountClick(Sender: TObject);
var
  TF: TextFile;
  sLine, sPassword, sEmail: string;
  iLength, iCount: Integer;
begin
  if (edtRegisterAccountUsername.Text = '') OR
    (edtRegisterAccountPassword.Text = '') OR
    (edtRegisterAccountEmailAddress.Text = '') then
  begin
    MessageDlg('PLEASE FILL REQUIRED FIELDS', mtWarning, [mbOK], 0);
  end;
  AssignFile(TF, 'TEXT_FILES/GENERAL_USERS.txt');
  sEmail := edtRegisterAccountEmailAddress.Text;
  sPassword := edtRegisterAccountPassword.Text;
  if FileExists('TEXT_FILES/GENERAL_USERS.txt') = True then
  begin
    Append(TF);
  end
  else
  begin
    Rewrite(TF);
  End;
  iLength := Length(edtRegisterAccountPassword.Text);
  for iCount := 1 to iLength do
  begin
    sPassword[iCount] := chr(ord(sPassword[iCount]) - 2);
  end;
  if (ValidateEmail(sEmail) = False) then
  begin
    edtRegisterAccountEmailAddress.Color := clRed;
    edtRegisterAccountUsername.Clear;
    edtRegisterAccountPassword.Clear;
    edtRegisterAccountEmailAddress.Clear;
    CloseFile(TF);
  end
  else
  begin
    edtRegisterAccountEmailAddress.Color := clWindow;
    sLine := edtRegisterAccountUsername.Text + '$' + sPassword + '$' +
      edtRegisterAccountEmailAddress.Text;
    writeln(TF, sLine);
    ShowMessage('ACCOUNT REGISTERED SUCCESSFULLY!');
    CloseFile(TF);
    dmMain.tblUsers.Insert;
    dmMain.tblUsers['Username'] := edtRegisterAccountUsername.Text;
    dmMain.tblUsers.Post;
    edtRegisterAccountUsername.Clear;
    edtRegisterAccountPassword.Clear;
    edtRegisterAccountEmailAddress.Clear;
    pnlRegisterAccountScreen.Hide;
    pnlGeneralUserLoginScreen.Show;
  end;
end;
// ===========================================================================//

// =============================RETURN BUTTONS================================//
procedure TfrmMain.btnRegisterAccountScreenReturnClick(Sender: TObject);
begin
  pnlRegisterAccountScreen.Hide;
  pnlGeneralUserLoginScreen.Show;
end;

procedure TfrmMain.btnGeneralUserLoginScreenReturnClick(Sender: TObject);
begin
  pnlGeneralUserLoginScreen.Hide;
  pnlUserTypeScreen.Show;
end;

procedure TfrmMain.btnAdministratorLoginScreenReturnClick(Sender: TObject);
begin
  pnlAdministratorLoginScreen.Hide;
  pnlUserTypeScreen.Show;
end;

// ===============BRINGS UP THE ADMIN FORM TO MANAGE TABLES===================//
procedure TfrmMain.btnManageClick(Sender: TObject);
begin
  frmCRUD_A.ShowModal;
end;
// ===========================================================================//

// ==============BRINGS UP THE ADMIN FORM TO QUERY DATA=======================//
procedure TfrmMain.btnQuery_AClick(Sender: TObject);
begin
  AdministratorQueryGrid.DataSource := dmMain.dscComputers;
  dmMain.dscComputers.DataSet := dmMain.Query;
  with dmMain do
  begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(
      'SELECT tblComputers.ComputerID AS COMPUTER,tblComputers.Runtime AS RUNTIME,tblCPUs.CPUModel AS CPU,tblGPUs.GPUModel AS GPU,tblRAM.RAMCapacityAndType AS RAM,tblStorage.CapacityRange AS STORAGE, tblLocations.LocationName AS LOCATION '
        +
        'FROM tblStorage INNER JOIN (tblRAM INNER JOIN (tblLocations INNER JOIN (tblGPUs INNER JOIN (tblCPUs INNER JOIN tblComputers ON tblCPUs.[CPUID] = tblComputers.[CPUID]) ON tblGPUs.[GPUID] = tblComputers.[GPUID]) ON ' + 'tblLocations.[LocationID] = tblComputers.[LocationID]) ON tblRAM.[RAMID] = tblComputers.[RAMID]) ON tblStorage.[StorageID] = tblComputers.[StorageID]');
    Query.Open;
  end;
  SetGridColumnWidths(AdministratorQueryGrid);
  frmQuery_G.ShowModal;
end;
// ===========================================================================//

// =================BRINGS UP THE G_USER FORM TO QUERY DATA===================//
procedure TfrmMain.btnQuery_GClick(Sender: TObject);
begin
  frmQuery_G.ShowModal;
end;
// ===========================================================================//

// =============BRINGS UP THE G_USER FORM TO MANAGE DATA======================//
procedure TfrmMain.btnEdit_GClick(Sender: TObject);
begin
  frmCRUD_G.ShowModal;
end;
// ===========================================================================//

// ===========================NAVIGATION TOOLS================================//
procedure TfrmMain.btnNextClick(Sender: TObject);
var
  iUserID: Integer;
  sUser: String;
begin
  iUserID := 0;
  pnlAdministratorManagementScreen.SendToBack;
  // Panels[0] := pnlCarbonFootprintScreen;
  // Panels[1] := pnlGeneralUserQueryScreen;
  // Panels[2] := pnlWebBrowserScreen;

  sUser := pnlCurrentUser.Caption;
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

  case CurrentPanelIndex of
    0:
      begin
        cmbCPUmodel.Text := '<SELECT>';
        cmbGPUmodel.Text := '<SELECT>';
        cmbRAMcapacityntype.Text := '<SELECT>';
        cmbStorageCapacitynRange.Text := '<SELECT>';
        cmbLocationName.Text := '<SELECT>';
        pnlCarbonFootprintScreen.Show;
        pnlGeneralUserQueryScreen.Hide;
        pnlWebBrowserScreen.Hide;
      end;
    1:
      begin
        frmTips.Close;
        pnlWebBrowserScreen.Hide;
        pnlCarbonFootprintScreen.Hide;
        pnlGeneralUserQueryScreen.Show;
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
        SetGridColumnWidths(GeneralUserQueryGrid);

      end;
    2:
      begin
        frmTips.Close;
        pnlCarbonFootprintScreen.Hide;
        pnlGeneralUserQueryScreen.Hide;
        pnlWebBrowserScreen.Show;
      end;
  end;

  if CurrentPanelIndex > 2 then
  begin
    CurrentPanelIndex := 0
  end
  else
  begin
    INC(CurrentPanelIndex);
  end;
end;

procedure TfrmMain.btnPreviousClick(Sender: TObject);
var
  iUserID: Integer;
  sUser: STRING;
begin
  iUserID := 0;
  pnlAdministratorManagementScreen.SendToBack;
  // Panels[0] := pnlCarbonFootprintScreen;
  // Panels[1] := pnlGeneralUserQueryScreen;
  // Panels[2] := pnlWebBrowserScreen;
  sUser := pnlCurrentUser.Caption;
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

  case CurrentPanelIndex of
    0:
      begin
        pnlCarbonFootprintScreen.Show;
        cmbCPUmodel.Text := '<SELECT>';
        cmbGPUmodel.Text := '<SELECT>';
        cmbRAMcapacityntype.Text := '<SELECT>';
        cmbStorageCapacitynRange.Text := '<SELECT>';
        cmbLocationName.Text := '<SELECT>';
        pnlGeneralUserQueryScreen.Hide;
        pnlWebBrowserScreen.Hide;
      end;
    1:
      begin
        frmTips.Close;
        pnlWebBrowserScreen.Hide;
        pnlCarbonFootprintScreen.Hide;
        pnlGeneralUserQueryScreen.Show;
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
        SetGridColumnWidths(GeneralUserQueryGrid);
      end;
    2:
      begin
        pnlCarbonFootprintScreen.Hide;
        pnlGeneralUserQueryScreen.Hide;
        pnlWebBrowserScreen.Show;
        frmTips.Close;
      end;
  end;

  if CurrentPanelIndex < 0 then
  begin
    CurrentPanelIndex := 2
  end
  else
  begin
    DEC(CurrentPanelIndex);
  end;
end;
// ===========================================================================//

// =================CALCULATING AND INSERTING TO DATABASE=====================//
procedure TfrmMain.btnCalculateClick(Sender: TObject);
var
  sCPU: String;
  sUsername: String;
  iCPUID, iGPUID, iRAMID, iStorageID, iLocationID, iUserID: Integer;
  sGPU: String;
  sRAM: String;
  sStorage: String;
  sLocation: String;
  iRuntime: Integer;
  rTotalPowerConsumption: Real;
  rCarbonIntensity: Real;
  ButtonSelected: Integer;
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
  if (spedRuntime.Value = 0) OR (cmbCPUmodel.Text = '<SELECT>') OR
    (cmbGPUmodel.Text = '<SELECT>') OR
    (cmbStorageCapacitynRange.Text = '<SELECT>') OR
    (cmbLocationName.Text = '<SELECT>') then
  begin
    ShowMessage('PLEASE FILL IN ALL FIELDS');
    Exit;
  end
  else
  begin
    objTemp := TCARBON.Create(sCPU, sGPU, sRAM, sStorage, sLocation, iRuntime);
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
          iStorageID := tblStorage['StorageID'];
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
      sUsername := pnlCurrentUser.Caption;
      Delete(sUsername, 1, 6);
      tblUsers.First;
      while NOT tblUsers.Eof do
      begin
        if tblUsers['Username'] = sUsername then
        begin
          iUserID := tblUsers['UserID'];
        end;
        tblUsers.Next;
      end;

      objTemp.SetTotalPowerConsumption(rTotalPowerConsumption);
      objTemp.SetTotalEnergy;
      objTemp.SetCarbonFootprint(rCarbonIntensity);

      ButtonSelected := MessageDlg
        ('WOULD YOU LIKE TO SAVE THIS TO THE DATABASE', mtConfirmation, mbYesNo, 0);
      if (ButtonSelected = mrYes) then
      begin
        tblComputers.Insert;
        tblComputers['Runtime'] := iRuntime;
        tblComputers['TotalPowerConsumption'] := rTotalPowerConsumption;
        tblComputers['RAMID'] := iRAMID;
        tblComputers['CPUID'] := iCPUID;
        tblComputers['GPUID'] := iGPUID;
        tblComputers['StorageID'] := iStorageID;
        tblComputers['LocationID'] := iLocationID;
        tblComputers['UserID'] := iUserID;
        tblComputers.Post;
        tblCarbonEmissions.Insert;
        tblCarbonEmissions['ComputerID'] := tblComputers['ComputerID'];
        tblCarbonEmissions['EnergyConsumed'] := objTemp.GetEnergy();
        tblCarbonEmissions['CarbonEmissions'] := objTemp.GetCarbonFootprint();
        tblCarbonEmissions['DateRecorded'] := objTemp.CurrentDate();
        tblCarbonEmissions.Post;
      end;
    END;
    redOutput.Lines.Clear;
    redOutput.Lines.Add(objTemp.ToString);
    lblCarbonEmissionAmount.Caption := FloatToStrF
      (objTemp.GetCarbonFootprint(), ffFixed, 8, 2) + ' kgCO2e';
    lblEnergyAmount.Caption := FloatToStrF(objTemp.GetEnergy(), ffFixed, 8, 2)
      + ' kWh';

    // ARRAYS OF REFERENCE VALUES USED TO CALCULATE THE CO2e EQUIVALENTS
    lblCarbonSequestrationAmount.Caption := FloatToStrF
      ((objTemp.GetCarbonFootprint() / arrReferenceValue[0]), ffFixed, 8, 2)
      + #10 + arrReferenceValueName[0];
    lblDistanceAmount.Caption := FloatToStrF
      ((objTemp.GetCarbonFootprint() / arrReferenceValue[1]), ffFixed, 8, 2)
      + #10 + arrReferenceValueName[1];
  end;

  if (objTemp.GetCarbonFootprint() <= 5.00) then
  begin
    pnlCarbonEmissionIntensity.Color := clYellow;
  end;

  if (objTemp.GetCarbonFootprint() > 5.00) then
  begin
    pnlCarbonEmissionIntensity.Color := clRed;
  end;
  frmTips.Show;
end;
// ===========================================================================//

procedure TfrmMain.btnCreateAccountClick(Sender: TObject);
begin
  pnlGeneralUserLoginScreen.Hide;
  pnlRegisterAccountScreen.Show;
end;

// ===========================DELETE RECORD===================================//
procedure TfrmMain.btnDelete_AClick(Sender: TObject);
var
  sInput: String;
begin
  sInput := InputBox('DELETE', 'ENTER ID', '');
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
          SetGridColumnWidths(GeneralUserQueryGrid);
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

procedure TfrmMain.btnDelete_GClick(Sender: TObject);
var
  sInput, sUser: String;
  iUserID: Integer;
begin
  sUser := pnlCurrentUser.Caption;
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
  sInput := InputBox('DELETE', 'ENTER COMPUTER TO DELETE', '');
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
          dmMain.dscComputers.DataSet := dmMain.Query;
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add(
            'SELECT tblComputers.ComputerID AS COMPUTER,tblComputers.Runtime AS RUNTIME,tblCPUs.CPUModel AS CPU,tblGPUs.GPUModel AS GPU,tblRAM.RAMCapacityAndType AS RAM,tblStorage.CapacityRange AS STORAGE, tblLocations.LocationName AS LOCATION '
              +
              'FROM tblStorage INNER JOIN (tblRAM INNER JOIN (tblLocations INNER JOIN (tblGPUs INNER JOIN (tblCPUs INNER JOIN tblComputers ON tblCPUs.[CPUID] = tblComputers.[CPUID]) ON tblGPUs.[GPUID] = tblComputers.[GPUID]) ON ' + 'tblLocations.[LocationID] = tblComputers.[LocationID]) ON tblRAM.[RAMID] = tblComputers.[RAMID]) ON tblStorage.[StorageID] = tblComputers.[StorageID] WHERE tblComputers.UserID = ' + Inttostr(iUserID) + '');
          Query.Open;
          SetGridColumnWidths(GeneralUserQueryGrid);
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
// ===========================================================================//

// ===========================WEBBROWSER TOOLS================================//
procedure TfrmMain.btnBackClick(Sender: TObject);
begin
  WebBrowser.GoBack;
end;

procedure TfrmMain.btnForwardClick(Sender: TObject);
begin
  WebBrowser.GoForward;
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
begin
  WebBrowser.Navigate(edtURL.Text);
end;
// ===========================================================================//

// DYNAMIC QUERY THAT IS USED TO DISPLAY CERTAIN COMPONENTS RELATED TO WHAT HAS BEEN CHECKED IN THE LIST CHECKBOX
procedure TfrmMain.chkCPUClick(Sender: TObject);
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
      Query.Free;
    end;
  end;
end;
// ===========================================================================//

// DYNAMIC QUERY THAT IS USED TO DISPLAY CERTAIN COMPONENTS RELATED TO WHAT HAS BEEN CHECKED IN THE LIST CHECKBOX
procedure TfrmMain.chkGPUClick(Sender: TObject);
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
  end;
  Query.Free;
end;
// ===========================================================================//

// DYNAMIC QUERY THAT IS USED TO DISPLAY CERTAIN COMPONENTS RELATED TO WHAT HAS BEEN CHECKED IN THE LIST CHECKBOX
procedure TfrmMain.chkStorageTypeClick(Sender: TObject);
var
  i: Integer;
  Query: TADOQuery;
begin
  // UNCHECK ALL CHECKBOXES EXCEPT THE ONE THAT WAS CHECKED
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
// ===========================================================================//

// ====================VIEWING OF TABLES======================================//
procedure TfrmMain.cmbViewTableChange(Sender: TObject);
begin
  case cmbViewTable.ItemIndex of
    0:
      begin
        AdministratorQueryGrid.DataSource := dmMain.dscUsers;
        SetGridColumnWidths(AdministratorQueryGrid);
      end;

    1:
      begin
        AdministratorQueryGrid.DataSource := dmMain.dscComputers;
        SetGridColumnWidths(AdministratorQueryGrid);
      end;

    2:
      begin
        AdministratorQueryGrid.DataSource := dmMain.dscCPUs;
        SetGridColumnWidths(AdministratorQueryGrid);
      end;

    3:
      begin
        AdministratorQueryGrid.DataSource := dmMain.dscGPUs;
        SetGridColumnWidths(AdministratorQueryGrid);
      end;

    4:
      begin
        AdministratorQueryGrid.DataSource := dmMain.dscRAM;
        SetGridColumnWidths(AdministratorQueryGrid);
      end;

    5:
      begin
        AdministratorQueryGrid.DataSource := dmMain.dscStorage;
        SetGridColumnWidths(AdministratorQueryGrid);
      end;

    6:
      begin
        AdministratorQueryGrid.DataSource := dmMain.dscLocations;
        SetGridColumnWidths(AdministratorQueryGrid);
      end;

    7:
      begin
        AdministratorQueryGrid.DataSource := dmMain.dscCarbonEmissions;
        SetGridColumnWidths(AdministratorQueryGrid);
      end;
  end;
end;
// ===========================================================================//

end.
