unit clsORGANICMOOR_U;

interface

USES SysUtils, MATH;

TYPE
  TCARBON = class(TObject)
  private
    { private declarations }
    fCPU: String;
    fGPU: String;
    fRAM: String;
    fStorage: String;
    fLocation: String;
    fRuntime: Integer;
    fTotalEnergy: Real;
    fTotalPowerConsumption: Real;
    fCarbonFootprint: Real;
  public
    { public declarations }
    constructor Create(pCPU: String; pGPU: String; pRAM: String;
      pStorage: String; pLocation: String; pRuntime: Integer);

    Procedure SetTotalPowerConsumption(pTotalPowerConsumption: Real);

    Function CalculateTotalEnergy(): Real;
    Procedure SetTotalEnergy;
    Procedure SetCarbonFootprint(pCarbonIntensity: Real);

    function CurrentDate(): TDate;
    function ToString(): String;
    function GetEnergy: Real;
    function GetCarbonFootprint: Real;
  end;

implementation

{ TORGANICMOOR }

function TCARBON.GetEnergy: Real;
begin
  result := fTotalEnergy;
end;

function TCARBON.GetCarbonFootprint: Real;
begin
  result := fCarbonFootprint;
end;

function TCARBON.CalculateTotalEnergy: Real;
begin
  result := (fRuntime * fTotalPowerConsumption) / 1000;
end;

procedure TCARBON.SetCarbonFootprint(pCarbonIntensity: Real);
begin
  fCarbonFootprint := (fTotalEnergy * pCarbonIntensity) / 1000;
end;

procedure TCARBON.SetTotalEnergy;
begin
  fTotalEnergy := CalculateTotalEnergy;
end;

constructor TCARBON.Create(pCPU, pGPU, pRAM, pStorage, pLocation: String;
  pRuntime: Integer);
begin
  fCPU := pCPU;
  fGPU := pGPU;
  fRAM := pRAM;
  fStorage := pStorage;
  fLocation := pLocation;
  fRuntime := pRuntime;
end;

function TCARBON.CurrentDate: TDate;
begin
  result := Date;
end;

procedure TCARBON.SetTotalPowerConsumption(pTotalPowerConsumption: Real);
begin
  fTotalPowerConsumption := pTotalPowerConsumption;
end;

//DISPLAY SUMMARY OF RESULTS IN RICH EDIT
function TCARBON.ToString: String;
begin
  result := #10 + #10 + '=========SUMMARY=========' + #10 + 'RUNTIME: ' +
    IntToStr(fRuntime) + ' MINUTE/S' + #10 + 'CPU: ' + fCPU + #10 + 'GPU: ' +
    fGPU + #10 + 'RAM: ' + fRAM + #10 + 'STORAGE: ' + fStorage + #10 +
    'LOCATION: ' + fLocation + #10 + 'TOTAL POWER CONSUMPTION: ' + FloatToStrf
    (fTotalPowerConsumption, ffFixed, 8, 2) + ' (WATTS)' + #10 +
    'TOTAL ENERGY: ' + FloatToStrf(fTotalEnergy, ffFixed, 8, 2)
    + ' (kWh)' + #10 + 'CARBON FOOTPRINT: ' + FloatToStrf(fCarbonFootprint,
    ffFixed, 8, 2) + ' (kgCO2e)' + #10 + 'DATE: ' + DateToStr(CurrentDate)
    + #10 + '========================';
end;

end.
