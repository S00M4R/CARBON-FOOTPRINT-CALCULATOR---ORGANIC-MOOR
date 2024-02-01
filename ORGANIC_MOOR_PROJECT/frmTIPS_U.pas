unit frmTIPS_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmTips = class(TForm)
    pnlTipScreen: TPanel;
    imgTipsSlideShow: TImage;
    tmrTipsSlideShow: TTimer;
    lblTips: TLabel;
    lblTip: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tmrTipsSlideShowTimer(Sender: TObject);
  private
    { Private declarations }
    procedure LoadSlide(SlideIndex: Integer);
  public
    { Public declarations }
  end;

var
  frmTips: TfrmTips;
  CurrentSlideIndex: Integer;

const
  Tips: array [0 .. 8] of string = ('UPGRADE YOUR DEVICES INSTEAD ' + #10 +
      'OF REPLACING THEM.',
    'USE RENEWABLE ENERGY SOURCES' + #10 + ' TO POWER YOUR DEVICES.',
    'USE CLOUD COMPUTING SERVICES.',
    'RECYCLE OR DONATE YOUR' + #10 + ' OLD DEVICES.',
    'TURN OFF YOUR COMPUTER AND ' + #10 + 'OTHER DEVICES WHEN NOT IN USE.',
    'USE AI AND MACHINE LEARNING ' + #10 + 'TO OPTIMIZE COMPUTING TASKS.',
    'ADJUST YOUR POWER SETTINGS.', 'LOWER YOUR MONITOR BRIGHTNESS.',
    'RAISE AWARENESS AND EDUCATE ' + #10 + 'OTHERS ABOUT THE ENVIRONMENTAL' +
      #10 + ' IMPACT OF COMPUTING.');

implementation

{$R *.dfm}

procedure TfrmTips.FormCreate(Sender: TObject);
begin
  CurrentSlideIndex := 0;
  LoadSlide(CurrentSlideIndex);
  tmrTipsSlideShow.Enabled := True;
end;

// LOADING EACH TIP IN LABEL
procedure TfrmTips.LoadSlide(SlideIndex: Integer);
begin
  if SlideIndex >= 0 then
  begin
    lblTip.Caption := Tips[SlideIndex];
  end;
end;

procedure TfrmTips.tmrTipsSlideShowTimer(Sender: TObject);
begin
  // Advance to the next slide
  Inc(CurrentSlideIndex);

  // If the last slide is reached, go back to the first slide
  if CurrentSlideIndex >= 9 then
    CurrentSlideIndex := 0;

  LoadSlide(CurrentSlideIndex);
end;

end.
