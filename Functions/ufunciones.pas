unit ufunciones;

interface
uses
  Windows, Classes, System.SysUtils, StdCtrls, ComCtrls, Tlhelp32,
  Vcl.CheckLst, System.Math, FireDAC.Comp.Client, System.DateUtils,
  Winapi.ShellAPI, Winsock, Vcl.Dialogs, Winapi.Messages,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, NB30, WinInet;

type
  TOpenDir = class(TObject)
  public
    Dialog: TOpenDialog;
    procedure HideControls(Sender: TObject);
  end;

  {$REGION 'Funciones Generales'}
  function GetAppVersion: string;
  function SetCombo(cb: TComboBox; Valor: Integer): Integer; overload;
  function SetCombo(cb: TComboBoxEx; Valor: Integer): Integer; overload;
  function GetCombo(cb: TComboBox): Integer; overload;
  function GetCombo(cb: TComboBoxEx): Integer; overload;
  function GetCombo(cb: TComboBoxEx; pIndice: Integer): Integer; overload;
  function GetCombo(cb: TComboBox; pIndice: Integer): Integer; overload;
  function GetListBox(lb: TListBox): Integer;
  function GetListCheckBox(lb: TCheckListBox): Integer;
  function returnServerFormattedDate(ClientDate : TDateTime) : String;
  function ProcessExists(exeFileName: string): Boolean;
  function stringtoarray(value,delimiter : string): tstrings;
  function  GetTabs(pCadena: string): Integer;
  function SetTabs(pCadena: string; pTabs: Integer): string;
  function PonerTabsCadena(pCadenaFull: string; pCadenaSimple: string): string;
  function Redondeo (valor: Double; decimales: integer = 0): Double;
  function RoundUp(X:Real):integer;
  function ContarCaracteresString(pCaracter: string;
    pCadena: string): Integer;
  function Sumar_Hora(pHoraEntrada: string; pHoraSalida: string): string;
  function Restar_Hora(pHoraEntrada: string; pHoraSalida: string): string;
  function Sumar_Horas(pds1: TFDMemTable; pCampo: string): string;
  procedure Obtener_RangoFechas_Semana(pFecha: TDateTime;
    var pFechaInicio: TDateTime; var pFechaFin: TDateTime);
  procedure Obtener_RangoFechas_BiSemana(pFecha: TDateTime;
    var pFechaInicio: TDateTime; var pFechaFin: TDateTime);
  procedure Obtener_RangoFechas_Mes(pFecha: TDateTime;
    var pFechaInicio: TDateTime; var pFechaFin: TDateTime);
  function Obtener_DiaNombre(pCodigodia: Integer): string;
  function Obtener_Horas(pHora: string): string;
  function Obtener_Minutos(pHora: string): string;
  function GetVersionNumber(pVersion: string): Integer;
  function MinutosToHoras(pMinutos: Integer): string;
  function  IsTaskbarAutoHideOn : Boolean;
  function QuitarPuntoExtension(pExtension: string): string;
  function StringToHex(S: String): string;
  function HexToString(H: String): String;
  function LocalIP: string;
  function StreamToString(Stream: TStream): String;
  function VersionServidor(pPath: string; ftp: TIdFTP; pFTP_Host: string;
  pFTP_Username: string; pFTP_Password: string; pFTP_Port: Integer;
  pFTP_DirEjecutable: string; pFTP_Pasive: Integer): string;
  function EsVersionServidorSuperior(pVersionServidor: string;
    pVersionActual: string): Boolean;
  function GetAppVersionFinal: string;
  procedure GetCambiosHistorico(pPath: string; ftp: TIdFTP;
    var pCambios: string; var pHistorico: string; pFTP_Host: string;
  pFTP_Username: string; pFTP_Password: string; pFTP_Port: Integer;
  pFTP_DirEjecutable: string; pFTP_Pasive: Integer);
  function GetSystemDir: TFileName;
  function ExtraerSerieDiscoDuro(Unidad: string): string;
  function MesNombreToMesNumero(pMesNombre: string): Integer;
  procedure ObtenerFechasPeriodoFiscal(pMes: Integer; var pFechaInicioFiscal:
    TDateTime; var pFechaFinFiscal: TDateTime);
  procedure ObtenerFechasAyoNatural(var pFechaInicio:
    TDateTime; var pFechaFin: TDateTime);
  procedure ObtenerFechas6Meses(var pFechaInicio:
    TDateTime; var pFechaFin: TDateTime);
  procedure ObtenerFechas3Meses(var pFechaInicio:
    TDateTime; var pFechaFin: TDateTime);
  procedure ObtenerFechas1Mes(var pFechaInicio:
    TDateTime; var pFechaFin: TDateTime);
  procedure ObtenerFechas1Semana(var pFechaInicio:
    TDateTime; var pFechaFin: TDateTime);
  procedure ObtenerFechas1Dia(var pFechaInicio:
    TDateTime; var pFechaFin: TDateTime);
  function GetMACAdress: string;
  function TieneInternet: boolean;
  {$ENDREGION}

implementation

{$REGION 'function GetAppVersion(): string'}
function GetAppVersion(): string;
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
  Size := GetFileVersionInfoSize(PChar (ParamStr (0)), Size2);
  if Size > 0 then
  begin
    GetMem (Pt, Size);
    try
      GetFileVersionInfo (PChar (ParamStr (0)), 0, Size, Pt);
      VerQueryValue (Pt, '\', Pt2, Size2);
      with TVSFixedFileInfo (Pt2^) do
      begin
        Result:=  IntToStr (HiWord (dwFileVersionMS)) + '.' +
                  IntToStr (LoWord (dwFileVersionMS)) + '.' +
                  IntToStr (HiWord (dwFileVersionLS)) + '.' +
                  IntToStr (LoWord (dwFileVersionLS));
      end;
    finally
      FreeMem (Pt);
    end;
  end;
end;
{$ENDREGION}

{$REGION 'function SetCombo(cb: TComboBox; Valor: Integer): Integer'}
function SetCombo(cb: TComboBox; Valor: Integer): Integer;
var
  Aux01: Integer;
begin
  Aux01 := 0;
  try
    Aux01 := cb.Items.IndexOfObject(TObject(Valor));
  except
    Aux01 := 0;
  end;
  Result := Aux01;
end;
{$ENDREGION}

{$REGION 'function SetCombo(cb: TComboBoxEx; Valor: Integer): Integer'}
function SetCombo(cb: TComboBoxEx; Valor: Integer): Integer;
var
  Aux01: Integer;
begin
  Aux01 := 0;
  try
    Aux01 := cb.Items.IndexOfObject(TObject(Valor));
  except
    Aux01 := 0;
  end;
  Result := Aux01;
end;
{$ENDREGION}

{$REGION 'function GetCombo(cb: TComboBox): Integer'}
function GetCombo(cb: TComboBox): Integer;
var
  Aux01: Integer;
begin
  Aux01 := 0;
  try
    Aux01 := Integer(cb.Items.Objects[cb.ItemIndex]);
  except
    Aux01 := 0;
  end;
  Result := Aux01;
end;
{$ENDREGION}

{$REGION 'function GetCombo(cb: TComboBoxEx): Integer'}
function GetCombo(cb: TComboBoxEx): Integer;
var
  Aux01: Integer;
begin
  Aux01 := 0;
  try
    Aux01 := Integer(cb.Items.Objects[cb.ItemIndex]);
  except
    Aux01 := 0;
  end;
  Result := Aux01;
end;
{$ENDREGION}

{$REGION 'function GetCombo(cb: TComboBoxEx; pIndice: Integer): Integer; overload'}
function GetCombo(cb: TComboBoxEx; pIndice: Integer): Integer; overload;
var
  Aux01: Integer;
begin
  Aux01 := 0;
  try
    Aux01 := Integer(cb.Items.Objects[pIndice]);
  except
    Aux01 := 0;
  end;
  Result := Aux01;
end;
{$ENDREGION}

{$REGION 'function GetCombo(cb: TComboBox; pIndice: Integer): Integer; overload'}
function GetCombo(cb: TComboBox; pIndice: Integer): Integer; overload;
var
  Aux01: Integer;
begin
  Aux01 := 0;
  try
    Aux01 := Integer(cb.Items.Objects[pIndice]);
  except
    Aux01 := 0;
  end;
  Result := Aux01;
end;
{$ENDREGION}

{$REGION 'function GetListBox(lb: TListBox): Integer'}
function GetListBox(lb: TListBox): Integer;
var
  Aux01: Integer;
begin
  Aux01 := 0;
  try
    Aux01 := Integer(lb.Items.Objects[lb.ItemIndex]);
  except
    Aux01 := 0;
  end;
  Result := Aux01;
end;
{$ENDREGION}

{$REGION 'function GetListCheckBox(lb: TCheckListBox): Integer'}
function GetListCheckBox(lb: TCheckListBox): Integer;
var
  Aux01: Integer;
begin
  Aux01 := 0;
  try
    Aux01 := Integer(lb.Items.Objects[lb.ItemIndex]);
  except
    Aux01 := 0;
  end;
  Result := Aux01;
end;
{$ENDREGION}

{$REGION 'function returnServerFormattedDate(ClientDate : TDateTime) : String'}
function returnServerFormattedDate(ClientDate : TDateTime) : String;
var
ServerDate : String;
fsServer,fsClient : TFormatSettings;
begin
//Get the locale settings from the client computer
System.SysUtils.GetLocaleFormatSettings(0,fsClient);
//Populate the server formatsettings variable
System.SysUtils.FormatSettings.LongDateFormat := 'YYYY-MM-DD hh:mm:ss';
//fsServer.LongDateTimeFormat := 'YYYY-MM-DD hh:mm:ss';
//Convert the client date to the server format
DateTimeToString(ServerDate, System.SysUtils.FormatSettings.LongDateFormat, ClientDate {fsServer});
result := ServerDate;
end;
{$ENDREGION}

{$REGION 'function ProcessExists(exeFileName: string): Boolean'}
function ProcessExists(exeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle        := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop           := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;

  while Integer(ContinueLoop) <> 0 do
  begin

    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
    begin
      Result := True;
    end;

    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;
{$ENDREGION}

{$REGION 'function stringtoarray(value,delimiter : string):tstrings'}
function stringtoarray(value,delimiter : string):tstrings;
var
   dx : integer;
   ns : string;
   txt : string;
   sl : TStrings;
   delta : integer;
begin
   sl:=TStringList.create;
   delta := Length(delimiter) ;
   txt := value + delimiter;
   sl.BeginUpdate;
   sl.Clear;
   try
     while Length(txt) > 0 do
     begin
       dx := Pos(delimiter, txt) ;
       ns := Copy(txt,0,dx-1) ;
       sl.Add(ns) ;
       txt := Copy(txt,dx+delta,MaxInt) ;
     end;
   finally
     sl.EndUpdate;
   end;
  stringtoarray := sl;
  sl.free;
end;
{$ENDREGION}

{$REGION 'function  GetTabs(pCadena: string): Integer'}
function  GetTabs(pCadena: string): Integer;
var
  mCadena: string;
  Aux01, Resultado: Integer;
begin
  mCadena := pCadena;
  Resultado := 0;
  for Aux01 := 1 to Length(mCadena) do
   begin
     if mCadena[Aux01] = ':' then
      Inc(Resultado);
   end;

  Result := Resultado;
end;
{$ENDREGION}

{$REGION 'function SetTabs(pCadena: string; pTabs: Integer): string'}
function SetTabs(pCadena: string; pTabs: Integer): string;
var
  mCadena: string;
  Aux01: Integer;
begin
  mCadena := pCadena;
  for Aux01 := 1 to pTabs do
    mCadena := '  ' + mCadena;

  Result := mCadena;
end;
{$ENDREGION}

{$REGION 'function PonerTabsCadena(pCadenaFull: string; pCadenaSimple: string): string'}
function PonerTabsCadena(pCadenaFull: string; pCadenaSimple: string): string;
var
  nTabs: Integer;
  mCadena, Resultado: string;
begin
  mCadena := pCadenaFull;
  Resultado := pCadenaSimple;
  nTabs := GetTabs(mCadena);
  Resultado := SetTabs(pCadenaSimple, nTabs);

  Result := Resultado;
end;
{$ENDREGION}

{$REGION 'function Redondeo (valor: Double; decimales: integer = 0): Double'}
function Redondeo (valor: Double; decimales: integer = 0): Double;
var
  factor: Double;
begin
  factor := IntPower(10,decimales);
  //
  if valor > 0 then
    Result := (trunc((valor*factor)+0.5)) / factor
  else
    Result := (trunc((valor*factor)-0.5)) / factor;
end;
{$ENDREGION}

{$REGION 'function RoundUp(X:Real):integer'}
function RoundUp(X:Real):integer;
var RUAdder:integer;
begin
if Frac(X)>0 then RUAdder:=1 else RUAdder:=0;
Result:=Trunc(X)+RUAdder;
end;
{$ENDREGION}

{$REGION 'function ContarCaracteresString(pCaracter: string'}
function ContarCaracteresString(pCaracter: string;
  pCadena: string): Integer;
var
  i: Integer;
  n: Integer;
  mCadena: string;
begin
  mCadena := pCadena;
  n:=0;
  For i:=1 to Length(mCadena) do
  begin
    if mCadena[i]= pCaracter then
    n:=n+1;
  end;

  Result := n;
end;
{$ENDREGION}

{$REGION 'function Sumar_Hora(pHoraEntrada: string; pHoraSalida: string): string'}
function Sumar_Hora(pHoraEntrada: string; pHoraSalida: string): string;
var
  mResultado: string;
  mHora1S, mHora2s: string;
  mHora1, mHora2, mHora: TDateTime;
  mPos: Integer;
  mHorasS, mMinutos: string;
  mHorasN1, mMinutosN1, mHorasN2, mMinutosN2, mHorasN, mMinutosN: Integer;
  mResiduoHoras, mResiduoMinutos, mLen: Integer;
begin
  mResultado := '';

  mHora1S := pHoraEntrada;
  mHora2s := pHoraSalida;

  try
    mHora1 := StrToTime(mHora1S);
  except
    mHora1 := StrToTime('00:00:00');
  end;
  mPos := Pos(':', mHora1S);
  mHorasS := Copy(mHora1S, 1, Pos(':', mHora1S) -1);
  mMinutos := Copy(mHora1S, mPos + 1, 2);
  try
    mHorasN1 := StrToInt(mHorasS);
  except
    mHorasN1 := 0;
  end;
  try
    mMinutosN1 := StrToInt(mMinutos);
  except
    mMinutosN1 := 0;
  end;

  try
    mHora2 := StrToTime(mHora2s);
  except
    mHora2 := StrToTime('00:00:00');
  end;
  mPos := Pos(':', mHora2s);
  mHorasS := Copy(mHora2s, 1, Pos(':', mHora2s) -1);
  mMinutos := Copy(mHora2s, mPos + 1, 2);
  try
    mHorasN2 := StrToInt(mHorasS);
  except
    mHorasN2 := 0;
  end;
  try
    mMinutosN2 := StrToInt(mMinutos);
  except
    mMinutosN2 := 0;
  end;

  mMinutosN := mMinutosN1 + mMinutosN2;
  mHorasN := mHorasN1 + mHorasN2;
  mResiduoHoras := mMinutosN div 60;
  mResiduoMinutos := mMinutosN mod 60;
  mHorasN := mHorasN + mResiduoHoras;
  mMinutosN := mResiduoMinutos;
  mMinutos := IntToStr(mMinutosN);
  mLen := Length(mMinutos);
  if mLen = 0 then
    mMinutos := '00';
  if mLen = 1 then
    mMinutos := '0' + mMinutos;
  mHorasS := IntToStr(mHorasN);
  mLen := Length(mHorasS);
  if mLen = 0 then
    mHorasS := '00';
  if mLen = 1 then
    mHorasS := '0' + mHorasS;

   mResultado := mHorasS + ':' + mMinutos + ':00';
 // mHora := mHora2 + mHora1;
 // mResultado := FormatDateTime('HH:mm:ss', mHora);

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'function Restar_Hora(pHoraEntrada: string; pHoraSalida: string): string'}
function Restar_Hora(pHoraEntrada: string; pHoraSalida: string): string;
var
  mResultado: string;
  mHora1S, mHora2s: string;
  mHora1, mHora2, mHora: TDateTime;
  mPos: Integer;
  mHorasS, mMinutos: string;
  mHorasN1, mMinutosN1, mHorasN2, mMinutosN2: Integer;
  mHorasN, mMinutosN, mResiduoHoras, mResiduoMinutos, mLen: Integer;
begin
  mResultado := '';

  mHora1S := pHoraEntrada;
  mHora2s := pHoraSalida;

  try
    mHora1 := StrToTime(mHora1S);
  except
    mHora1 := StrToTime('00:00:00');
  end;
  mPos := Pos(':', mHora1S);
  mHorasS := Copy(mHora1S, 1, Pos(':', mHora1S) -1);
  mMinutos := Copy(mHora1S, mPos + 1, 2);
  try
    mHorasN1 := StrToInt(mHorasS);
  except
    mHorasN1 := 0;
  end;
  mHorasN1 := mHorasN1 * 60;
  try
    mMinutosN1 := StrToInt(mMinutos);
  except
    mMinutosN1 := 0;
  end;
  mMinutosN1 := mMinutosN1 + mHorasN1;

  try
    mHora2 := StrToTime(mHora2s);
  except
    mHora2 := StrToTime('00:00:00');
  end;
  mPos := Pos(':', mHora2s);
  mHorasS := Copy(mHora2s, 1, Pos(':', mHora2s) -1);
  mMinutos := Copy(mHora2s, mPos + 1, 2);
  try
    mHorasN2 := StrToInt(mHorasS);
  except
    mHorasN2 := 0;
  end;
  mHorasN2 := mHorasN2 * 60;
  try
    mMinutosN2 := StrToInt(mMinutos);
  except
    mMinutosN2 := 0;
  end;
  mMinutosN2 := mMinutosN2 + mHorasN2;

  mMinutosN := mMinutosN2 - mMinutosN1;
  if mMinutosN < 0 then
    mMinutosN := 0;
  mHorasN := 0;
  mResiduoHoras := mMinutosN div 60;
  mResiduoMinutos := mMinutosN mod 60;
  mHorasN := mHorasN + mResiduoHoras;
  mMinutosN := mResiduoMinutos;
  mMinutos := IntToStr(mMinutosN);
  mLen := Length(mMinutos);
  if mLen = 0 then
    mMinutos := '00';
  if mLen = 1 then
    mMinutos := '0' + mMinutos;
  mHorasS := IntToStr(mHorasN);
  mLen := Length(mHorasS);
  if mLen = 0 then
    mHorasS := '00';
  if mLen = 1 then
    mHorasS := '0' + mHorasS;

   mResultado := mHorasS + ':' + mMinutos + ':00';


  //mHora := mHora2 - mHora1;
 // mResultado := FormatDateTime('HH:mm:ss', mHora);

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'function Sumar_Horas(pds1: TFDMemTable; pCampo: string): string'}
function Sumar_Horas(pds1: TFDMemTable; pCampo: string): string;
var
  mResultado: string;
  mLinea: string;
  mHorasS: string;
  mMinutos: string;
  mPos: Integer;
  Aux01, mHorasN, mMinutosN: Integer;
  mResiduoHoras, mResiduoMinutos: Integer;
begin
  mResultado := '';

  mHorasN := 0;
  mMinutosN := 0;
  with pds1 do
  begin
    First;
    while not Eof do
    begin
      mLinea :=
        FieldByName(pCampo).AsString;
      mPos := Pos(':', mLinea);
      mHorasS := Copy(mLinea, 1, Pos(':', mLinea) -1);
      mMinutos := Copy(mLinea, mPos + 1, 2);
      try
        Aux01 := StrToInt(mHorasS);
      except
        Aux01 := 0;
      end;
      mHorasN := mHorasN + Aux01;
      try
        Aux01 := StrToInt(mMinutos);
      except
        Aux01 := 0;
      end;
      mMinutosN := mMinutosN + Aux01;
      Next;
    end;
  end;

  mResiduoHoras := mMinutosN div 60;
  mResiduoMinutos := mMinutosN mod 60;
  mHorasN := mHorasN + mResiduoHoras;
  mMinutosN := mResiduoMinutos;
  mHorasS := IntToStr(mHorasN);
  if Length(mHorasS) = 1 then
    mHorasS := '0' + mHorasS;
  if Length(mHorasS) = 0 then
    mHorasS := '00';
  mMinutos := IntToStr(mMinutosN);
  if Length(mMinutos) = 1 then
    mMinutos := '0' + mMinutos;
  if Length(mMinutos) = 0 then
    mMinutos := '00';
  mResultado := mHorasS + ':' + mMinutos + ':00';

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'procedure Obtener_RangoFechas_Semana(pFecha: TDateTime;
  var pFechaInicio: TDateTime; var pFechaFin: TDateTime)'}
procedure Obtener_RangoFechas_Semana(pFecha: TDateTime;
  var pFechaInicio: TDateTime; var pFechaFin: TDateTime);
var
  mFecha: TDateTime;
begin
  mFecha := pFecha;
  pFechaInicio :=
    System.DateUtils.StartOfTheWeek(mFecha);
  pFechaFin :=
    System.DateUtils.EndOfTheWeek(mFecha);
end;
{$ENDREGION}

{$REGION 'procedure Obtener_RangoFechas_BiSemana(pFecha: TDateTime;
  var pFechaInicio: TDateTime; var pFechaFin: TDateTime)'}
procedure Obtener_RangoFechas_BiSemana(pFecha: TDateTime;
  var pFechaInicio: TDateTime; var pFechaFin: TDateTime);
var
  mFecha: TDateTime;
begin
  mFecha := pFecha;
  pFechaInicio :=
    System.DateUtils.StartOfTheWeek(mFecha);
  pFechaFin :=
    System.DateUtils.EndOfTheWeek(mFecha);
  pFechaInicio := IncWeek(pFechaInicio, -1);
end;
{$ENDREGION}

{$REGION 'procedure Obtener_RangoFechas_Mes(pFecha: TDateTime;
  var pFechaInicio: TDateTime; var pFechaFin: TDateTime)'}
procedure Obtener_RangoFechas_Mes(pFecha: TDateTime;
  var pFechaInicio: TDateTime; var pFechaFin: TDateTime);
var
  mFecha: TDateTime;
begin
  mFecha := pFecha;
  pFechaInicio :=
    System.DateUtils.StartOfTheMonth(mFecha);
  pFechaFin :=
    System.DateUtils.EndOfTheMonth(mFecha);
end;
{$ENDREGION}

{$REGION 'function Obtener_DiaNombre(pCodigodia: Integer): string'}
function Obtener_DiaNombre(pCodigodia: Integer): string;
var
  mDia: Integer;
  mResultado: string;
begin
  mDia := pCodigodia;
  mResultado := '';
  case mDia of
    1: mResultado := 'Lunes';
    2: mResultado := 'Martes';
    3: mResultado := 'Miercoles';
    4: mResultado := 'Jueves';
    5: mResultado := 'Viernes';
    6: mResultado := 'Sabado';
    7: mResultado := 'Domingo';
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'function Obtener_Horas(pHora: string): string'}
function Obtener_Horas(pHora: string): string;
var
  mHora: string;

  mResultado: string;
begin
  mHora := pHora;
  mResultado := '';
  mResultado :=
  Copy(mHora, 1, Pos(':', mHora) - 1);

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'function Obtener_Minutos(pHora: string): string'}
function Obtener_Minutos(pHora: string): string;
var
  mHora: string;

  mResultado: string;
begin
  mHora := pHora;
  mResultado := '';
  mResultado :=
  Copy(mHora, Pos(':', mHora) + 1, 2);

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'function GetVersionNumber(pVersion: string): Integer'}
function GetVersionNumber(pVersion: string): Integer;
var
  mVersion: string;
  Aux01: string;
  mLen, mCount: Integer;
  mLineas: TStringList;
begin
  mVersion := pVersion;
  mLen := Length(mVersion);
  Aux01 := '';
  mLineas := TStringList.Create;
  ExtractStrings(['.'], ['.'], PChar(mVersion), mLineas);
  Aux01 := Aux01 + mLineas.Strings[0];
  Aux01 := Aux01 + mLineas.Strings[1];
  Aux01 := Aux01 + mLineas.Strings[2];
  mLineas.Free;

  Result := StrToInt(Aux01);
end;
{$ENDREGION}

{$REGION 'function MinutosToHoras(pMinutos: Integer): string'}
function MinutosToHoras(pMinutos: Integer): string;
var
  mMinutosN: Integer;
  mResiduoHoras, mResiduoMinutos, mHorasN: Integer;
  mHorasS, mMinutos: string;
  mResultado: string;
begin
  mMinutosN := pMinutos;

  mResiduoHoras := mMinutosN div 60;
  mResiduoMinutos := mMinutosN mod 60;
  mHorasN := mResiduoHoras;
  mMinutosN := mResiduoMinutos;
  mHorasS := IntToStr(mHorasN);
  if Length(mHorasS) = 1 then
    mHorasS := '0' + mHorasS;
  if Length(mHorasS) = 0 then
    mHorasS := '00';
  mMinutos := IntToStr(mMinutosN);
  if Length(mMinutos) = 1 then
    mMinutos := '0' + mMinutos;
  if Length(mMinutos) = 0 then
    mMinutos := '00';
  mResultado := mHorasS + ':' + mMinutos + ':00';

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'function  IsTaskbarAutoHideOn : Boolean'}
function  IsTaskbarAutoHideOn : Boolean;
Var
 ABData : TAppBarData;
begin
  ABData.cbSize := SizeOf(ABData);
  Result:= (SHAppBarMessage(ABM_GETSTATE, ABData) and ABS_AUTOHIDE)<>0;
end;
{$ENDREGION}

{$REGION 'function QuitarPuntoExtension(pExtension: string): string'}
function QuitarPuntoExtension(pExtension: string): string;
var
  mExtension: string;
  mLen: Integer;
begin
  mExtension := pExtension;
  mLen := Length(mExtension);
  if mLen > 1 then
  begin
    if mExtension[1] = '.' then
      mExtension := Copy(mExtension, 2, mLen);
  end;

  Result := mExtension;
end;
{$ENDREGION}

{$REGION 'function StringToHex(S: String): string'}
function StringToHex(S: String): string;
var
  I: Integer;
begin
  Result:= '';
  for I := 1 to length (S) do
    Result:= Result+IntToHex(ord(S[i]),2);
end;
{$ENDREGION}

{$REGION 'function HexToString(H: String): String'}
function HexToString(H: String): String;
var
  I: Integer;
begin
  Result:= '';
  for I := 1 to length (H) div 2 do
    Result:= Result+Char(StrToInt('$'+Copy(H,(I-1)*2+1,2)));
end;
{$ENDREGION}

{$REGION 'function LocalIP: string'}
function LocalIP: string;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array [0..63] of Ansichar;
  i: Integer;
  GInitData: TWSADATA;
begin
  WSAStartup($101, GInitData);
  Result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe := GetHostByName(Buffer);
  if phe = nil then
    Exit;
  pptr := PaPInAddr(phe^.h_addr_list);
  i := 0;
  while pptr^[i] <> nil do
  begin
    Result := StrPas(inet_ntoa(pptr^[i]^));
    Inc(i);
  end;
  WSACleanup;
end;
{$ENDREGION}

{$REGION 'function StreamToString(Stream: TStream): String'}
function StreamToString(Stream: TStream): String;
begin
  with TStringStream.Create('') do
  try
    CopyFrom(Stream, Stream.Size - Stream.Position);
    Result := DataString;
  finally
    Free;
  end;
end;
{$ENDREGION}

{$REGION 'function VersionServidor(pPath: string; ftp: TIdFTP; pFTP_Host: string;
  pFTP_Username: string; pFTP_Password: string; pFTP_Port: Integer;
  pFTP_DirEjecutable: string; pFTP_Pasive: Integer): string'}
function VersionServidor(pPath: string; ftp: TIdFTP; pFTP_Host: string;
  pFTP_Username: string; pFTP_Password: string; pFTP_Port: Integer;
  pFTP_DirEjecutable: string; pFTP_Pasive: Integer): string;
var
  mArchivo: TStringList;
  mResultado: string;
begin
  try
    mResultado := '';

    if FileExists(pPath + '\version.txt') = True then
      DeleteFile(pPath + '\version.txt');
    if pFTP_Pasive = 1 then
      ftp.Passive := True
    else
      ftp.Passive := False;
    ftp.Host := pFTP_Host;
    ftp.Username := pFTP_Username;
    ftp.password := pFTP_Password;
    FTP.Port := pFTP_Port;
    ftp.Connect;
    ftp.ChangeDir(pFTP_DirEjecutable);
    ftp.Get('version.txt', pPath + '\version.txt', False, False);
    Sleep(1000);
    mArchivo := TStringList.Create;
    mArchivo.LoadFromFile(pPath + '\version.txt');
    mResultado := Trim(mArchivo.Text);
    mArchivo.Free;
    if FileExists(pPath + '\version.txt') = True then
      DeleteFile(pPath + '\version.txt');
  finally
    ftp.Quit;
    ftp.Disconnect;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'function EsVersionServidorSuperior(pVersionServidor: string;
  pVersionActual: string): Boolean'}
function EsVersionServidorSuperior(pVersionServidor: string;
  pVersionActual: string): Boolean;
var
  mVersionServidor, mVersionActual: string;
  mVersionServidorN, mVersionActualN: Integer;
  mResultado: Boolean;
begin
  mResultado := False;

  mVersionServidor := pVersionServidor;
  mVersionActual := pVersionActual;

  mVersionServidorN := GetVersionNumber(mVersionServidor);
  mVersionActualN := GetVersionNumber(mVersionActual);

  if mVersionServidorN > mVersionActualN then
    mResultado := True;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'function GetAppVersionFinal: string'}
function GetAppVersionFinal: string;
var
  mVersion: string;
  mLista: TStringList;
  mResultado: string;
begin
  mResultado := '';

  mVersion := GetAppVersion;
  mLista := TStringList.Create;
  ExtractStrings(['.'], [' '], PChar(mVersion), mLista);
  mResultado := mLista.Strings[0] + '.';
  mResultado := mResultado + mLista.Strings[1] + '.';
  mResultado := mResultado + mLista.Strings[2];
  mLista.Free;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'procedure GetCambiosHistorico(pPath: string; ftp: TIdFTP;
  var pCambios: string; var pHistorico: string; pFTP_Host: string;
  pFTP_Username: string; pFTP_Password: string; pFTP_Port: Integer;
  pFTP_DirEjecutable: string; pFTP_Pasive: Integer)'}
procedure GetCambiosHistorico(pPath: string; ftp: TIdFTP;
  var pCambios: string; var pHistorico: string; pFTP_Host: string;
  pFTP_Username: string; pFTP_Password: string; pFTP_Port: Integer;
  pFTP_DirEjecutable: string; pFTP_Pasive: Integer);
var
  mArchivo: TStringList;
begin
  try
    if FileExists(pPath + '\version.txt') = True then
      DeleteFile(pPath + '\version.txt');
    if FileExists(pPath + '\cambios.txt') = True then
      DeleteFile(pPath + '\cambios.txt');
    if FileExists(pPath + '\historico.txt') = True then
      DeleteFile(pPath + '\historico.txt');

    if pFTP_Pasive = 1 then
      ftp.Passive := True
    else
      ftp.Passive := False;
    ftp.Host := pFTP_Host;
    ftp.Username := pFTP_Username;
    ftp.password := pFTP_Password;
    FTP.Port := pFTP_Port;
    ftp.Connect;
    ftp.ChangeDir(pFTP_DirEjecutable);

    ftp.Get('cambios.txt', pPath + '\cambios.txt', False, False);
    Sleep(1000);
    mArchivo := TStringList.Create;
    mArchivo.LoadFromFile(pPath + '\cambios.txt');
    pCambios := Trim(mArchivo.Text);

    ftp.Get('historico.txt', pPath + '\historico.txt', False, False);
    Sleep(1000);
    mArchivo := TStringList.Create;
    mArchivo.LoadFromFile(pPath + '\historico.txt');
    pHistorico := Trim(mArchivo.Text);

    mArchivo.Free;
    if FileExists(pPath + '\version.txt') = True then
      DeleteFile(pPath + '\version.txt');
    if FileExists(pPath + '\cambios.txt') = True then
      DeleteFile(pPath + '\cambios.txt');
    if FileExists(pPath + '\historico.txt') = True then
      DeleteFile(pPath + '\historico.txt');

  finally
    ftp.Quit;
    ftp.Disconnect;
  end;
end;
{$ENDREGION}

{$REGION 'function GetSystemDir: TFileName'}
function GetSystemDir: TFileName;
var
  SysDir: array [0..MAX_PATH-1] of char;
begin
  SetString(Result, SysDir, GetSystemDirectory(SysDir, MAX_PATH));
  if Result = '' then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;
{$ENDREGION}

{$REGION 'function ExtraerSerieDiscoDuro(Unidad: string): string'}
{
Ejemplo:
 ShowMessage('El número de serie es: ' +
      ExtraerSerieDiscoDuro(txtUnidad.Text + ':\'));
}
function ExtraerSerieDiscoDuro(Unidad: string): string;
Var
  VolumeNameBuffer : array [0..MAX_PATH] of Char;
  VolumeSerialNumber : DWord;
  MaximumComponentLength : DWord;
  FileSystemFlags : DWord;
Begin
  GetVolumeInformation( pchar(Unidad),VolumeNameBuffer,
    DWORD(sizeof(VolumeNameBuffer)),@VolumeSerialNumber,
    MaximumComponentLength,FileSystemFlags,nil,0);
  result := IntToHEX(VolumeSerialNumber,8);
End;
//ShowMessage(ExtraerSerieDiscoDuro('c:\'));
{$ENDREGION}

{$REGION 'function MesNombreToMesNumero(pMesNombre: string): Integer'}
function MesNombreToMesNumero(pMesNombre: string): Integer;
var
  mNombre: string;
  mResultado: Integer;
begin
  mNombre := Trim(pMesNombre);
  if mNombre = 'Enero' then
    mResultado := 1;
  if mNombre = 'Febrero' then
    mResultado := 2;
  if mNombre = 'Marzo' then
    mResultado := 3;
  if mNombre = 'Abril' then
    mResultado := 4;
  if mNombre = 'Mayo' then
    mResultado := 5;
  if mNombre = 'Junio' then
    mResultado := 6;
  if mNombre = 'Julio' then
    mResultado := 7;
  if mNombre = 'Agosto' then
    mResultado := 8;
  if mNombre = 'Septiembre' then
    mResultado := 9;
  if mNombre = 'Octubre' then
    mResultado := 10;
  if mNombre = 'Noviembre' then
    mResultado := 11;
  if mNombre = 'Diciembre' then
    mResultado := 12;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'procedure ObtenerFechasPeriodoFiscal(pMes: Integer; var
  pFechaInicioFiscal: TDateTime; var pFechaFinFiscal: TDateTime)'}
procedure ObtenerFechasPeriodoFiscal(pMes: Integer; var
  pFechaInicioFiscal: TDateTime; var pFechaFinFiscal: TDateTime);
var
  mDia, mMes, mAyo: Word;
  mFechaInicioFiscal, mFechaFinFiscal: TDateTime;
  mFechaTempS: string;
  mFechaActual: TDateTime;
  mFechaActualS: string;
begin
  mDia := 1;
  mMes := pMes;
  mAyo := YearOf(Date);
  mFechaInicioFiscal :=
    EncodeDate(mAyo, mMes, mDia);
  mFechaTempS := FormatDateTime('yyyy-MM-dd', mFechaInicioFiscal);
  mFechaActual := Date;
  mFechaActualS := FormatDateTime('yyyy-MM-dd', mFechaActual);
  if mFechaActualS < mFechaTempS then
    mFechaInicioFiscal := IncYear(mFechaInicioFiscal, - 1);
  mFechaFinFiscal := IncYear(mFechaInicioFiscal);
  mFechaFinFiscal := IncDay(mFechaFinFiscal, -1);
  pFechaInicioFiscal := mFechaInicioFiscal;
  pFechaFinFiscal := mFechaFinFiscal;
end;
{$ENDREGION}

{$REGION 'procedure ObtenerFechasAyoNatural(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime)'}
procedure ObtenerFechasAyoNatural(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime);
var
  mFechaActual: TDateTime;
  mAyo: Word;
begin
  mFechaActual := Date;
  mAyo := YearOf(mFechaActual);
  pFechaInicio :=
    EncodeDate(mAyo, 1, 1);
  pFechaFin :=
    EncodeDate(mAyo, 12, 31);
end;
{$ENDREGION}

{$REGION 'procedure ObtenerFechas6Meses(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime)'}
procedure ObtenerFechas6Meses(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime);
var
  mFechaActual: TDateTime;
begin
  mFechaActual := Date;
  pFechaInicio := IncMonth(mFechaActual, - 6);
  pFechaFin := mFechaActual;
end;
{$ENDREGION}

{$REGION 'procedure ObtenerFechas3Meses(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime)'}
procedure ObtenerFechas3Meses(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime);
var
  mFechaActual: TDateTime;
begin
  mFechaActual := Date;
  pFechaInicio := IncMonth(mFechaActual, - 3);
  pFechaFin := mFechaActual;
end;
{$ENDREGION}

{$REGION 'procedure ObtenerFechas1Mes(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime)'}
procedure ObtenerFechas1Mes(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime);
var
  mFechaActual: TDateTime;
begin
  mFechaActual := Date;
  pFechaInicio := IncMonth(mFechaActual, - 1);
  pFechaFin := mFechaActual;
end;
{$ENDREGION}

{$REGION 'procedure ObtenerFechas1Semana(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime)'}
procedure ObtenerFechas1Semana(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime);
var
  mFechaActual: TDateTime;
begin
  mFechaActual := Date;
  pFechaInicio := IncWeek(mFechaActual, - 1);
  pFechaFin := mFechaActual;
end;
{$ENDREGION}

{$REGION 'procedure ObtenerFechas1Dia(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime)'}
procedure ObtenerFechas1Dia(var pFechaInicio:
  TDateTime; var pFechaFin: TDateTime);
var
  mFechaActual: TDateTime;
begin
  mFechaActual := Date;
  pFechaInicio := mFechaActual;
  pFechaFin := mFechaActual;
end;
{$ENDREGION}

{$REGION 'function GetMACAdress: string'}
function GetMACAdress: string;
var
  NCB: PNCB;
  Adapter: PAdapterStatus;

  URetCode: PChar;
  RetCode: Ansichar;
  I: integer;
  Lenum: PlanaEnum;
  _SystemID: string;
  TMPSTR: string;
begin
  Result    := '';
  _SystemID := '';
  Getmem(NCB, SizeOf(TNCB));
  Fillchar(NCB^, SizeOf(TNCB), 0);

  Getmem(Lenum, SizeOf(TLanaEnum));
  Fillchar(Lenum^, SizeOf(TLanaEnum), 0);

  Getmem(Adapter, SizeOf(TAdapterStatus));
  Fillchar(Adapter^, SizeOf(TAdapterStatus), 0);

  Lenum.Length    := chr(0);
  NCB.ncb_command := chr(NCBENUM);
  NCB.ncb_buffer  := Pointer(Lenum);
  NCB.ncb_length  := SizeOf(Lenum);
  RetCode         := Netbios(NCB);

  i := 0;
  repeat
    Fillchar(NCB^, SizeOf(TNCB), 0);
    Ncb.ncb_command  := chr(NCBRESET);
    Ncb.ncb_lana_num := lenum.lana[I];
    RetCode          := Netbios(Ncb);

    Fillchar(NCB^, SizeOf(TNCB), 0);
    Ncb.ncb_command  := chr(NCBASTAT);
    Ncb.ncb_lana_num := lenum.lana[I];
    // Must be 16
    Ncb.ncb_callname := '*               ';

    Ncb.ncb_buffer := Pointer(Adapter);

    Ncb.ncb_length := SizeOf(TAdapterStatus);
    RetCode        := Netbios(Ncb);
    //---- calc _systemId from mac-address[2-5] XOR mac-address[1]...
    if (RetCode = chr(0)) or (RetCode = chr(6)) then
    begin
      _SystemId := IntToHex(Ord(Adapter.adapter_address[0]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[1]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[2]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[3]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[4]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[5]), 2);
    end;
    Inc(i);
  until (I >= Ord(Lenum.Length)) or (_SystemID <> '00-00-00-00-00-00');
  FreeMem(NCB);
  FreeMem(Adapter);
  FreeMem(Lenum);
  GetMacAdress := _SystemID;
end;
{$ENDREGION}

{$REGION 'function TieneInternet: boolean'}
function TieneInternet: boolean;
var
   origin : cardinal;
begin
   result := InternetGetConnectedState(@origin,0);

   //connections origins by origin value
   //NO INTERNET CONNECTION              = 0;
   //INTERNET_CONNECTION_MODEM           = 1;
   //INTERNET_CONNECTION_LAN             = 2;
   //INTERNET_CONNECTION_PROXY           = 4;
   //INTERNET_CONNECTION_MODEM_BUSY      = 8;
end;
{$ENDREGION}

{ TOpenDir }

procedure TOpenDir.HideControls(Sender: TObject);
const
    //CDM_HIDECONTROL and CDM_SETCONTROLTEXT values from:
    //  doc.ddart.net/msdn/header/include/commdlg.h.html
    //  CMD_HIDECONTROL = CMD_FIRST + 5 = (WM_USER + 100) + 5;
    //Usage of CDM_HIDECONTROL and CDM_SETCONTROLTEXT here:
    //  msdn.microsoft.com/en-us/library/ms646853%28VS.85%29.aspx
    //  msdn.microsoft.com/en-us/library/ms646855%28VS.85%29.aspx
    CDM_HIDECONTROL =    WM_USER + 100 + 5;
    CDM_SETCONTROLTEXT = WM_USER + 100 + 4;
    //Component IDs from:
    //  msdn.microsoft.com/en-us/library/ms646960%28VS.85%29.aspx#_win32_Open_and_Save_As_Dialog_Box_Customization
    //Translation into exadecimal in dlgs.h:
    //  www.koders.com/c/fidCD2C946367FEE401460B8A91A3DB62F7D9CE3244.aspx
    //
    //File type filter...
    cmb1: integer  = $470; //Combo box with list of file type filters
    stc2: integer  = $441; //Label of the file type
    //File name const...
    cmb13: integer = $47c; //Combo box with name of the current file
    edt1: integer  = $480; //Edit with the name of the current file
    stc3: integer  = $442; //Label of the file name combo
var H: THandle;
begin
  H:= GetParent(Dialog.Handle);
  //Hide file types combo...
  SendMessage(H, CDM_HIDECONTROL, cmb1,  0);
  SendMessage(H, CDM_HIDECONTROL, stc2,  0);
  //Hide file name label, edit and combo...
  SendMessage(H, CDM_HIDECONTROL, cmb13, 0);
  SendMessage(H, CDM_HIDECONTROL, edt1,  0);
  SendMessage(H, CDM_HIDECONTROL, stc3,  0);
  //NOTE: How to change label text (the lentgh is not auto):
  //SendMessage(H, CDM_SETCONTROLTEXT, stc3, DWORD(pChar('Hello!')));
end;

end.
