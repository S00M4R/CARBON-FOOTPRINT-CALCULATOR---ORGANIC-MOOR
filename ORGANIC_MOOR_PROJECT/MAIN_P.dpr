program MAIN_P;

uses
  Forms,
  MAIN_U in 'MAIN_U.pas' {frmMain},
  frmSPLASH_SCREEN_U in 'frmSPLASH_SCREEN_U.pas' {frmSplashScreen},
  dmMAIN_U in 'dmMAIN_U.pas' {dmMain: TDataModule},
  clsORGANICMOOR_U in 'clsORGANICMOOR_U.pas',
  frmTIPS_U in 'frmTIPS_U.pas' {frmTips},
  EASendMailObjLib_TLB in 'EASendMailObjLib_TLB.pas',
  frm_QUERY_U in 'frm_QUERY_U.pas' {frmQuery_G},
  frm_G_CRUD_U in 'frm_G_CRUD_U.pas' {frmCRUD_G},
  frm_G_SAVE_CHANGES_U in 'frm_G_SAVE_CHANGES_U.pas' {frmSaveChanges_G},
  frm_A_CRUD_U in 'frm_A_CRUD_U.pas' {frmCRUD_A};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSplashScreen, frmSplashScreen);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmTips, frmTips);
  Application.CreateForm(TfrmQuery_G, frmQuery_G);
  Application.CreateForm(TfrmCRUD_G, frmCRUD_G);
  Application.CreateForm(TfrmSaveChanges_G, frmSaveChanges_G);
  Application.CreateForm(TfrmCRUD_A, frmCRUD_A);
  Application.Run;
end.
