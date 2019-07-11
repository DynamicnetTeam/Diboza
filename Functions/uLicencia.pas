unit uLicencia;

interface
uses
  TypInfo, System.Classes, System.SysUtils, Vcl.Dialogs,
  System.DateUtils, Tlhelp32, System.Math, windows,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, NB30, WinInet;

type
  TLicenciaGenerador = class
    ArchivoSerial: string;  // 'sysfast.lic';
  type
    TTipoLicencia = (tlCompleta = 1, tlDemo = 2);
    TTipoDemo = (tdDias = 1, tdEjecuciones = 2, tdFechas = 3, tdMAC = 4);
  const
    Separador = ';';
  private
    FInstalado: Integer;
    FTipoLicencia: TTipoLicencia;
    FTipoDemo: TTipoDemo;
    FAplicacionNombre: string;
    FDiscoDuroSerie: string;
    FDiasVencimiento: Integer;
    FEjecuciones: Integer;
    FFechaInicio: TDateTime;
    FFechaFin: TDateTime;
    FMAC: string;
    FAyo: Integer;
    FOwn: string;
    FEjecutado: Integer;
    FActivador: string;
    FSerial: string;
    FSerialDesencriptado: string;
    FLicencia: string;
    FPathAplicacion: string;
    function GetInstalado: Integer;
    procedure SetInstalado(Value: Integer);
    function GetTipoLicencia: TTipoLicencia;
    procedure SetTipoLicencia(Value: TTipoLicencia);
    function GetTipoDemo: TTipoDemo;
    procedure SetTipoDemo(Value: TTipoDemo);
    function GetAplicacionNombre: string;
    procedure SetAplicacionNombre(Value: string);
    function GetDiscoDuroSerie: string;
    procedure SetDiscoDuroSerie(Value: string);
    function GetDiasVencimiento: Integer;
    procedure SetDiasVencimiento(Value: Integer);
    function GetEjecuciones: Integer;
    procedure SetEjecuciones(Value: Integer);
    function GetFechaInicio: TDateTime;
    procedure SetFechaInicio(Value: TDateTime);
    function GetFechaFin: TDateTime;
    procedure SetFechaFin(Value: TDateTime);
    function GetMAC: string;
    procedure SetMAC(Value: string);
    function GetAyo: Integer;
    procedure SetAyo(Value: Integer);
    function GetOwn: string;
    procedure SetOwn(Value: string);
    function GetEjecutado: Integer;
    procedure SetEjecutado(Value: Integer);
    function GetSerial: string;
    procedure SetSerial(Value: string);
    function HexToStringS(H: String): String;
    function StringToHexS(S: String): string;
    function GetCantidadDias(pFechaInicio: TDateTime; pFechaActual: TDateTime): Integer;
    function Split(const Str: string; Delimiter : Char): TStringList;
  public
    property Instalado: Integer read GetInstalado write SetInstalado;
    property TipoLicencia: TTipoLicencia read GetTipoLicencia write SetTipoLicencia;
    property TipoDemo: TTipoDemo read GetTipoDemo write SetTipoDemo;
    property AplicacionNombre: string read GetAplicacionNombre write SetAplicacionNombre;
    property DiscoDuroSerie: string read GetDiscoDuroSerie write SetDiscoDuroSerie;
    property DiasVencimiento: Integer read GetDiasVencimiento write SetDiasVencimiento;
    property Ejecuciones: Integer read GetEjecuciones write SetEjecuciones;
    property FechaInicio: TDateTime read GetFechaInicio write SetFechaInicio;
    property FechaFin: TDateTime read GetFechaFin write SetFechaFin;
    property MAC: string read GetMAC write SetMAC;
    property DYear: Integer read GetAyo write SetAyo;
    property DOwn: string read GetOwn write SetOwn;
    property Ejecutado: Integer read GetEjecutado write SetEjecutado;
    property Serial: string read GetSerial write SetSerial;
    property SerialDesencriptado: string read FSerialDesencriptado write FSerialDesencriptado;
    property Licencia: string read FLicencia write FLicencia;
    constructor Create(pPathAplicacion: string; pAplicacionNombre: string);
    function Generar_Serial: string;
    function Obtener_Serial(pSerial: string): string;
    function EsSerialValido(var pMensaje: string): Boolean;
    function EsSerialValido2(var pMensaje: string;
      pAplicacionNombre: string = ''; pDiscoDuroSerie: string = '';
      pMAC: string = ''): Boolean;
    procedure Generar_Licencia;
    procedure Inicializar_Serial(pAplicacionNombre: string;
      pDiscoDuroSerie: string; pMAC: string);
    function ExtraerSerieDiscoDuro(Unidad: string): string;
    function GetMACAdress: string;
  end;

implementation

{ TLicenciaGenerador }

function TLicenciaGenerador.GetInstalado: Integer;
begin
  Result := FInstalado;
end;

procedure TLicenciaGenerador.SetInstalado(Value: Integer);
begin
  FInstalado := Value;
end;

function TLicenciaGenerador.GetTipoLicencia: TTipoLicencia;
begin
  Result := FTipoLicencia;
end;

procedure TLicenciaGenerador.SetTipoLicencia(Value: TTipoLicencia);
begin
  FTipoLicencia := Value;
end;

function TLicenciaGenerador.GetTipoDemo: TTipoDemo;
begin
  Result := FTipoDemo;
end;

procedure TLicenciaGenerador.SetTipoDemo(Value: TTipoDemo);
begin
  FTipoDemo := Value;
end;

function TLicenciaGenerador.GetAplicacionNombre: string;
begin
  Result := FAplicacionNombre;
end;

procedure TLicenciaGenerador.SetAplicacionNombre(Value: string);
begin
  FAplicacionNombre := Value;
end;

function TLicenciaGenerador.GetDiscoDuroSerie: string;
begin
  Result := FDiscoDuroSerie;
end;

procedure TLicenciaGenerador.SetDiscoDuroSerie(Value: string);
begin
  FDiscoDuroSerie := Value;
end;

function TLicenciaGenerador.GetDiasVencimiento: Integer;
begin
  Result := FDiasVencimiento;
end;

procedure TLicenciaGenerador.SetDiasVencimiento(Value: Integer);
begin
  FDiasVencimiento := Value;
end;

function TLicenciaGenerador.GetEjecuciones: Integer;
begin
  Result := FEjecuciones;
end;

procedure TLicenciaGenerador.SetEjecuciones(Value: Integer);
begin
  FEjecuciones := Value;
end;

function TLicenciaGenerador.GetFechaInicio: TDateTime;
begin
  Result := FFechaInicio;
end;

procedure TLicenciaGenerador.SetFechaInicio(Value: TDateTime);
begin
  FFechaInicio := Value;
end;

function TLicenciaGenerador.GetFechaFin: TDateTime;
begin
  Result := FFechaFin;
end;

procedure TLicenciaGenerador.SetFechaFin(Value: TDateTime);
begin
  FFechaFin := Value;
end;

function TLicenciaGenerador.GetMAC: string;
begin
  Result := FMAC;
end;

procedure TLicenciaGenerador.SetMAC(Value: string);
begin
  FMAC := Value;
end;

function TLicenciaGenerador.GetAyo: Integer;
begin
  Result := FAyo;
end;

procedure TLicenciaGenerador.SetAyo(Value: Integer);
begin
  FAyo := Value;
end;

function TLicenciaGenerador.GetOwn: string;
begin
  Result := FOwn;
end;

procedure TLicenciaGenerador.SetOwn(Value: string);
begin
  FOwn := Value;
end;

function TLicenciaGenerador.GetEjecutado: Integer;
begin
  Result := FEjecutado;
end;

procedure TLicenciaGenerador.SetEjecutado(Value: Integer);
begin
  FEjecutado := Value;
end;

function TLicenciaGenerador.GetSerial: string;
begin
  Result := FSerial;
end;

procedure TLicenciaGenerador.SetSerial(Value: string);
begin
  FSerial := Value;
end;

constructor TLicenciaGenerador.Create(pPathAplicacion: string;
  pAplicacionNombre: string);
begin
  FPathAplicacion := pPathAplicacion;
  FAplicacionNombre := pAplicacionNombre;
  ArchivoSerial := FAplicacionNombre;
end;

function TLicenciaGenerador.HexToStringS(H: String): String;
var
  I: Integer;
begin
  Result:= '';
  for I := 1 to length (H) div 2 do
    Result:= Result+Char(StrToInt('$'+Copy(H,(I-1)*2+1,2)));
end;

function TLicenciaGenerador.StringToHexS(S: String): string;
var
  I: Integer;
begin
  Result:= '';
  for I := 1 to length (S) do
    Result:= Result+IntToHex(ord(S[i]),2);
end;

function TLicenciaGenerador.Generar_Serial: string;
var
  mResultado: string;
  mTipoLicencia, mTipoDemo, mFechaInicio, mFechaFin: string;
begin
  mResultado := '';

  case FTipoLicencia of
    tlCompleta: mTipoLicencia := '1';
    tlDemo: mTipoLicencia := '2';
  end;
  case FTipoDemo of
    tdDias: mTipoDemo := '1';
    tdEjecuciones: mTipoDemo := '2';
    tdFechas: mTipoDemo := '3';
    tdMAC: mTipoDemo := '4';
  end;
  mFechaInicio := FormatDateTime('dd/MM/yyyy', FFechaInicio);
  mFechaFin := FormatDateTime('dd/MM/yyyy', FFechaFin);

  mResultado := mResultado + IntToStr(FInstalado) + Separador;
  mResultado := mResultado + mTipoLicencia + Separador;
  mResultado := mResultado + mTipoDemo + Separador;
  mResultado := mResultado + FAplicacionNombre + Separador;
  mResultado := mResultado + FDiscoDuroSerie + Separador;
  mResultado := mResultado + IntToStr(FDiasVencimiento) + Separador;
  mResultado := mResultado + IntToStr(FEjecuciones) + Separador;
  mResultado := mResultado + mFechaInicio + Separador;
  mResultado := mResultado + mFechaFin + Separador;
  mResultado := mResultado + FMAC + Separador;
  mResultado := mResultado + IntToStr(FAyo) + Separador;
  mResultado := mResultado + FOwn + Separador;
  mResultado := mResultado + IntToStr(FEjecutado) + Separador;
  mResultado := mResultado + FLicencia;

  mResultado := StringToHexS(mResultado);
  //ShowMessage(System.Hash.THashMD5.GetHashString(mResultado));

//  System.Hash.THashBobJenkins.HashLittle()

  Result := mResultado;
end;

function TLicenciaGenerador.Obtener_Serial(pSerial: string): string;
var
  mResultado, mSeparadorTemp, mSerial: string;
  mLista1: TStringList;
  mSeparador: Char;
  mTipoLicencia, mTipoDemo, mFechaInicio, mFechaFin: string;
begin
  mSeparadorTemp := Separador;
  mSeparador := mSeparadorTemp[1];
  pSerial := Trim(pSerial);
  mSerial := HexToStringS(pSerial);
  mResultado := mSerial;
  mLista1 := TStringList.Create;
  mLista1 := Split(mSerial, mSeparador);
  try
    FInstalado := StrToInt(mLista1.Strings[0]);
    mTipoLicencia := mLista1.Strings[1];
    if mTipoLicencia = '1' then
      FTipoLicencia := tlCompleta;
    if mTipoLicencia = '2' then
      FTipoLicencia := tlDemo;
    mTipoDemo := mLista1.Strings[2];
    if mTipoDemo = '1' then
      FTipoDemo := tdDias;
    if mTipoDemo = '2' then
      FTipoDemo := tdEjecuciones;
    if mTipoDemo = '3' then
      FTipoDemo := tdFechas;
    if mTipoDemo = '4' then
      FTipoDemo := tdMAC;
    FAplicacionNombre := mLista1.Strings[3];
    FDiscoDuroSerie := mLista1.Strings[4];
    FDiasVencimiento := StrToInt(mLista1.Strings[5]);
    FEjecuciones := StrToInt(mLista1.Strings[6]);
    mFechaInicio := mLista1.Strings[7];
    FFechaInicio := StrToDate(mFechaInicio);
    mFechaFin := mLista1.Strings[8];
    FFechaFin := StrToDate(mFechaFin);
    FMAC := mLista1.Strings[9];
    FAyo := StrToInt(mLista1.Strings[10]);
    FOwn := mLista1.Strings[11];
    FEjecutado := StrToInt(mLista1.Strings[12]);
    FLicencia := mLista1.Strings[13];
  except

  end;
  mLista1.Destroy;

  Result := mResultado;
end;

function TLicenciaGenerador.EsSerialValido(var pMensaje: string): Boolean;
var
  mResultado: Boolean;
  mSeparadorTemp, mSerial: string;
  mLista1: TStringList;
  mSeparador: Char;
  mTipoLicencia, mTipoDemo, mFechaInicio, mFechaFin: string;
begin
  mResultado := True;
  pMensaje := '';

  try
    mSeparadorTemp := Separador;
    mSeparador := mSeparadorTemp[1];

    mSerial := FSerialDesencriptado;
    mLista1 := TStringList.Create;
    ExtractStrings([mSeparador], [mSeparador], PChar(mSerial), mLista1);

    mTipoLicencia := mLista1.Strings[0];
//    FTipoLicencia := TRttiEnumerationType.GetValue<TTipoLicencia>(mTipoLicencia);
    mTipoDemo := mLista1.Strings[1];
//    FTipoDemo := TRttiEnumerationType.GetValue<TTipoDemo>(mTipoDemo);
    FAplicacionNombre := mLista1.Strings[2];
    FDiscoDuroSerie := mLista1.Strings[3];
    FDiasVencimiento := StrToInt(mLista1.Strings[4]);
    FEjecuciones := StrToInt(mLista1.Strings[5]);
    mFechaInicio := mLista1.Strings[6];
    FFechaInicio := StrToDate(mFechaInicio);
    mFechaFin := mLista1.Strings[7];
    FFechaFin := StrToDate(mFechaFin);
    FMAC := mLista1.Strings[8];
    FAyo := StrToInt(mLista1.Strings[9]);
    FOwn := mLista1.Strings[10];
    mLista1.Destroy;

    if FTipoLicencia = tlDemo then
    begin

    end;
  except
    on E: Exception do
    begin
      mResultado := False;

    end;
  end;

  Result := mResultado;
end;

function TLicenciaGenerador.EsSerialValido2(var pMensaje: string;
  pAplicacionNombre: string; pDiscoDuroSerie: string;
  pMAC: string): Boolean;
var
  mNombreArchivo: string;
  mArchivo: TStringList;
  mResultado: Boolean;
  mSeparadorTemp, mSerial: string;
  mLista1: TStringList;
  mSeparador: Char;
  mTipoLicencia, mTipoDemo, mFechaInicio, mFechaFin: string;
  mFecha: TDateTime;
  mCantidadDias: Integer;
  mMAC: string;
begin
  try
    mResultado := False;

    mArchivo := TStringList.Create;
    mNombreArchivo := FPathAplicacion + '\' + ArchivoSerial;
    if FileExists(mNombreArchivo) = False then
    begin
      Inicializar_Serial(pAplicacionNombre, pDiscoDuroSerie, pMAC);
      FSerial := Generar_Serial;
      mArchivo.Add(FSerial);
      mArchivo.SaveToFile(mNombreArchivo);
    end;
    if FileExists(mNombreArchivo) = True then
      mArchivo.LoadFromFile(mNombreArchivo);
    FSerial := mArchivo.Text;
    mArchivo.Free;
    FSerialDesencriptado := Obtener_Serial(FSerial);

    mSeparadorTemp := Separador;
    mSeparador := mSeparadorTemp[1];

    mSerial := FSerialDesencriptado;
    mLista1 := TStringList.Create;
    mLista1 := Split(mSerial, mSeparador);

    try
      FInstalado := StrToInt(mLista1.Strings[0]);
      mTipoLicencia := mLista1.Strings[1];
      if mTipoLicencia = '1' then
        FTipoLicencia := tlCompleta;
      if mTipoLicencia = '2' then
        FTipoLicencia := tlDemo;
      mTipoDemo := mLista1.Strings[2];
      if mTipoDemo = '1' then
        FTipoDemo := tdDias;
      if mTipoDemo = '2' then
        FTipoDemo := tdEjecuciones;
      if mTipoDemo = '3' then
        FTipoDemo := tdFechas;
      if mTipoDemo = '4' then
        FTipoDemo := tdMAC;
      FAplicacionNombre := mLista1.Strings[3];
      FDiscoDuroSerie := mLista1.Strings[4];
      FDiasVencimiento := StrToInt(mLista1.Strings[5]);
      FEjecuciones := StrToInt(mLista1.Strings[6]);
      mFechaInicio := mLista1.Strings[7];
      FFechaInicio := StrToDate(mFechaInicio);
      mFechaFin := mLista1.Strings[8];
      FFechaFin := StrToDate(mFechaFin);
      FMAC := mLista1.Strings[9];
      FAyo := StrToInt(mLista1.Strings[10]);
      FOwn := mLista1.Strings[11];
      FEjecutado := StrToInt(mLista1.Strings[12]);
      FLicencia := mLista1.Strings[13];
    except
      pMensaje := 'Datos corruptos';
    end;
    mLista1.Destroy;

    if FTipoLicencia = tlCompleta then
    begin
      mResultado := True;
      pMensaje := 'Licencia Completa';
    end;
    if FInstalado = 0 then
    begin
      pMensaje := 'Serial Invalido';
      raise Exception.Create('');
    end;
    if FInstalado = 1 then
    begin
      FInstalado := 3;
      FAplicacionNombre := pAplicacionNombre;
      FDiscoDuroSerie := pDiscoDuroSerie;
      FMAC := pMAC;
      FechaInicio := Date;
      FAyo := YearOf(Date);
      FSerial := Generar_Serial;
      mArchivo := TStringList.Create;
      mArchivo.Add(FSerial);
      mArchivo.SaveToFile(mNombreArchivo);
      mArchivo.Free;
    end;
    if pDiscoDuroSerie <> FDiscoDuroSerie then
    begin
      pMensaje := 'Datos alterados';
      raise Exception.Create('');
    end;
    if pAplicacionNombre <> FAplicacionNombre then
    begin
      pMensaje := 'Datos alterados';
      raise Exception.Create('');
    end;
    if FTipoLicencia = tlDemo then
    begin
      if FTipoDemo = tdDias then
      begin
        mFecha := FFechaInicio;
        mCantidadDias := GetCantidadDias(mFecha, Date);
        if mCantidadDias > FDiasVencimiento then
        begin
          pMensaje := 'Límite de Días Superado';
          raise Exception.Create('');
        end
        else
          pMensaje := 'Quedan ' + IntToStr(mCantidadDias) + ' días';
      end;
      if FTipoDemo = tdEjecuciones then
      begin
        if FEjecutado > FEjecuciones then
        begin
          pMensaje := 'Límite de Ejecuciones Superado';
          raise Exception.Create('');
        end;
      end;
      if FTipoDemo = tdFechas then
      begin
        mFechaInicio := FormatDateTime('yyyy-MM-dd', Date);
        mFechaFin := FormatDateTime('yyyy-MM-dd', FFechaFin);
        if mFechaInicio > mFechaFin then
        begin
          pMensaje := 'Período de uso Superado';
          raise Exception.Create('');
        end;
      end;
      if FTipoDemo = tdMAC then
      begin
        mMAC := GetMACAdress;
        if mMAC <> FMAC then
        begin
          pMensaje := 'Dirección Invalida';
          raise Exception.Create('');
        end;
      end;
    end;

    Inc(FEjecutado);
    FSerial := Generar_Serial;
    mArchivo := TStringList.Create;
    mArchivo.Add(FSerial);
    mArchivo.SaveToFile(mNombreArchivo);
    mArchivo.Free;

    mResultado := True;
  except
    mResultado := False;
  end;

  Result := mResultado;
end;

procedure TLicenciaGenerador.Generar_Licencia;
begin
  //FLicencia := System.Hash.THashMD5.GetHashString(FSerial);
end;

procedure TLicenciaGenerador.Inicializar_Serial(pAplicacionNombre: string;
  pDiscoDuroSerie: string; pMAC: string);
begin
  FInstalado := 0;
  FTipoLicencia := tlDemo;
  FTipoDemo := tdDias;
  FAplicacionNombre := pAplicacionNombre;
  FDiscoDuroSerie := pDiscoDuroSerie;
  FDiasVencimiento := 30;
  FEjecuciones := 0;
  FFechaInicio := Date;
  FFechaFin := IncDay(FFechaInicio, 30);
  FMAC := pMAC;
  FAyo := YearOf(Date);
  FOwn := '';
  FEjecutado := 0;
  FActivador := '';
end;

function TLicenciaGenerador.ExtraerSerieDiscoDuro(Unidad: string): string;
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

function TLicenciaGenerador.GetMACAdress: string;
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

function TLicenciaGenerador.GetCantidadDias(pFechaInicio: TDateTime;
  pFechaActual: TDateTime): Integer;
var
  mResultado: Integer;
begin
  mResultado := DaysBetween(pFechaActual, pFechaInicio);

  Result := mResultado;
end;

function TLicenciaGenerador.Split(const Str: string;
  Delimiter: Char): TStringList;
begin
 Result := TStringList.Create;
 Result.LineBreak := Delimiter;
 Result.Text := Str;
end;

end.
