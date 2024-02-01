unit frmSPLASH_SCREEN_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, pngimage;

type
  TfrmSplashScreen = class(TForm)
    pnlSplashScreen: TPanel;
    tmrSplashScreen: TTimer;
    pgbSplashScreen: TProgressBar;
    imgLogo: TImage;
    lblProgramName: TLabel;
    lblVersion: TLabel;
    lblProgress: TLabel;
    pnlCopyright: TPanel;
    lblDeveloper: TLabel;
    procedure tmrSplashScreenTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplashScreen: TfrmSplashScreen;

implementation

{$R *.dfm}

procedure TfrmSplashScreen.FormCreate(Sender: TObject);
begin
lblDeveloper.Caption:='DEVELOPER:'+#10+'MUHAMMED SOOMAR';
end;

procedure TfrmSplashScreen.tmrSplashScreenTimer(Sender: TObject);
begin
  if (pgbSplashScreen.Position = 100) then
  begin
    tmrSplashScreen.Enabled := False;
    Self.Close;
  end
  else
  begin
    pgbSplashScreen.Position := pgbSplashScreen.Position + 10;
    lblProgress.Caption := 'LOADING ' + IntToStr(pgbSplashScreen.Position)
      + '%';
    Self.Show;
  end;
end;

end.
