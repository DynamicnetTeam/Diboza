unit uHacienda;

interface
uses
  System.SysUtils, System.DateUtils, FireDAC.Comp.Client, Classes,
  Xml.VerySimple, Data.DB, Winapi.ShellAPI, Winapi.Windows, WinInet,
  IdBaseComponent, IdComponent, IdMessage,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdHTTP, IdServerIOHandler, IdSSL, IdSSLOpenSSL,
  IdAttachment, IdAttachmentFile, Vcl.Dialogs;

  {$REGION 'Metodos'}
  function Hacienda_GetConsecutivo(pSucursal: string; pTerminal: string; pTipo: string; pNumeracion: Integer): string;
  function Hacienda_GetClave(pFecha: TDateTime; pConsecutivo: string; pSituacion: string; pIdentificacion: string; pCodigoSeguridad: string): string;
  procedure DB_DEInsertar_Encabezado(ds1: TFDMemTable; FDQuery1: TFDQuery;
    pTabla: string;
    var pResultado: Integer; var pError: string);
  procedure DB_DEInsertar_Detalle(ds1: TFDMemTable; FDQuery1: TFDQuery;
    pTabla: string;
    var pResultado: Integer; var pError: string);
  procedure DB_DEInsertar_Impuestos(ds1: TFDMemTable; FDQuery1: TFDQuery;
    pTabla: string;
    var pResultado: Integer; var pError: string);
  procedure DB_DEInsertar_Descuentos(ds1: TFDMemTable; FDQuery1: TFDQuery;
    pTabla: string;
    var pResultado: Integer; var pError: string);
  procedure DB_DEInsertar_OtrosCargos(ds1: TFDMemTable; FDQuery1: TFDQuery;
    pTabla: string;
    var pResultado: Integer; var pError: string);
  procedure Leer_OpcionesHacieda(pArchivoConfig: string;
    var pModoProduccion: Integer; var pClaveDocumento: string;
    var pTokenUsuario: string; var pTokenClave: string;
    var pCertificadoArchivo: string; var pCertificadoClave: string;
    var pAccion: Integer; var pArchivoNombre: string;
    var pArchivoXMLFirmado: string; var pArchivoXMLFirmar: string;
    var pResultado: Integer; var pError: string);
  function Leer_OpcionesHacieda_Respuesta(pArchivoConfig: string;
    var pResultado: Integer; var pError: string): string;
  function Leer_OpcionesHacieda_Detalle(pArchivoConfig: string;
    var pResultado: Integer; var pError: string): string;
  function HaciendaHexToStringS(H: String): String;
  function HaciendaStringToHexS(S: String): string;
  procedure Escribir_OpcionesHacieda_ModoProduccion(pArchivoConfig: string;
    pModoProduccion: Integer;
    var pResultado: Integer; var pError: string);
  procedure Escribir_OpcionesHacieda_ClaveDocumento(pArchivoConfig: string;
    pClaveDocumento: string;
    var pResultado: Integer; var pError: string);
  procedure Escribir_OpcionesHacieda_Accion(pArchivoConfig: string;
    pAccion: Integer;
    var pResultado: Integer; var pError: string);
  procedure Escribir_OpcionesHacieda_ArchivoNombre(pArchivoConfig: string;
    pArchivoNombre: string;
    var pResultado: Integer; var pError: string);
  procedure Escribir_OpcionesHacieda_ArchivoXMLFirmado(pArchivoConfig: string;
    pArchivoXMLFirmado: string;
    var pResultado: Integer; var pError: string);
  procedure Escribir_OpcionesHacieda_ArchivoXMLFirmar(pArchivoConfig: string;
    pArchivoXMLFirmar: string;
    var pResultado: Integer; var pError: string);
  procedure Escribir_OpcionesHacieda_DatosGenerales(pArchivoConfig: string;
    pTokenUsuario: string; pTokenClave: string;
    pCertificadoArchivo: string; pCertificadoClave: string;
    var pResultado: Integer; var pError: string);
  function Get_XML(dsEncabezado: TFDMemTable;
    dsDetalle: TFDMemTable; dsDescuentos: TFDMemTable;
    dsImpuestos: TFDMemTable; dsOtrosCargos: TFDMemTable;
    pPath: string; pArchivoNombre: string): string;
  procedure Hacienda_Firmar(pArchivoConfig: string;
    pArchivoFirmar: string; pArchivoNombre: string; pArchivoHacienda: string;
    pResultado: Integer; pErrorM: string);
  procedure Hacienda_Enviar(pArchivoConfig: string;
    pClave: string; pArchivoFirmado: string;
    pArchivoHacienda: string; var pRespuesta: string;
    pResultado: Integer; pErrorM: string);
  function Validar_Identificacion(pIdentificacion: string; pTipo: string): Boolean;
  function Validar_Ubicacion(pProvincia: string; pCanton: string;
    pDistrito: string; pBarrio: string): Boolean;
  function Validar_TelefonoFax(pNumero: string): Boolean;
  function Validar_Email(pEmail: string): Boolean;
  function Validar_Otros(pOtros1: string; pOtros2: string): Boolean;
  procedure Llenar_Totales();
  function Hacienda_TieneInternet: boolean;
  procedure EnviarEmail(pcopias: string; pServidor: string;
    puerto: Integer; pEmail: string);
  {$ENDREGION}

implementation

{$REGION 'function Hacienda_GetConsecutivo'}
function Hacienda_GetConsecutivo(pSucursal: string; pTerminal: string; pTipo: string;
 pNumeracion: Integer): string;
var
  mSucursal: string;
  mTerminal: string;
  mTipo: string;
  mNumeracion: Integer;
  mNumeracionS: string;
  Resultado: string;
  mLen: Integer;
begin
  Resultado := '';

  mSucursal := pSucursal;
  if Length(mSucursal) = 0  then
    mSucursal := '001';
  if Length(mSucursal) = 1  then
    mSucursal := '00' + mSucursal;
  if Length(mSucursal) = 2  then
    mSucursal := '0' + mSucursal;

  mTerminal := pTerminal;
  if Length(mTerminal) = 0  then
    mTerminal := '00001';
  if Length(mTerminal) = 1  then
    mTerminal := '0000' + mTerminal;
  if Length(mTerminal) = 2  then
    mTerminal := '000' + mTerminal;
  if Length(mTerminal) = 3  then
    mTerminal := '00' + mTerminal;
  if Length(mTerminal) = 4  then
    mTerminal := '0' + mTerminal;

  mTipo := pTipo;
  if Length(mTipo) = 1  then
    mTipo := '0' + mTipo;

  mNumeracion := pNumeracion;
  try
    mNumeracionS := IntToStr(mNumeracion);
  except
    mNumeracionS := '';
  end;
  mNumeracionS := Copy(mNumeracionS, 1 , 10);
  mLen := Length(mNumeracionS);
  mLen := 10 - mLen;
  mNumeracionS := StringOfChar('0', mLen) + mNumeracionS;

  Resultado := mSucursal + mTerminal + mTipo + mNumeracionS;

  Result := Resultado;
end;
{$ENDREGION}

{$REGION 'function Hacienda_GetClave'}
function Hacienda_GetClave(pFecha: TDateTime; pConsecutivo: string; pSituacion: string; pIdentificacion: string; pCodigoSeguridad: string): string;
var
  Resultado: string;
  mFecha: TDateTime;
  mConsecutivo: string;
  mSituacion: string;
  mIdentificacion: string;
  mCodigoSeguridad: string;
  mYear, mMonth, mDay, mHour, mMinute, mSecond, mMilliSecond: Word;
  mYearS, mMonthS, mDayS, mHourS, mMinuteS, mSecondS: string;
  mLen: Integer;
begin
  Resultado := '';

  mFecha := pFecha;
  mConsecutivo := pConsecutivo;
  mSituacion := pSituacion;
  mIdentificacion := pIdentificacion;
  mCodigoSeguridad := pCodigoSeguridad;
  DecodeDateTime(mFecha, mYear, mMonth, mDay, mHour, mMinute, mSecond, mMilliSecond);
  try
    mYearS := IntToStr(mYear);
    mYearS := copy(mYearS, 3, 2);
  except
    mYearS := '00';
  end;
  try
    mMonthS := IntToStr(mMonth);
  except
    mMonthS := '01';
  end;
  try
    mDayS := IntToStr(mDay);
  except
    mDayS := '01';
  end;
  try
    mHourS := IntToStr(mHour);
  except
    mHourS := '01';
  end;
  try
    mMinuteS := IntToStr(mMinute);
  except
    mMinuteS := '01';
  end;
  try
    mSecondS := IntToStr(mSecond);
  except
    mSecondS := '01';
  end;
  if Length(mMonthS)  = 1 then
    mMonthS := '0' + mMonthS;
  if Length(mDayS)  = 1 then
    mDayS := '0' + mDayS;
  if Length(mHourS)  = 1 then
    mHourS := '0' + mHourS;
  if Length(mMinuteS)  = 1 then
    mMinuteS := '0' + mMinuteS;
  if Length(mSecondS)  = 1 then
    mSecondS := '0' + mSecondS;
  mIdentificacion := Copy(mIdentificacion, 1, 12);
  mLen := Length(mIdentificacion);
  mLen := 12 - mLen;
  mIdentificacion := StringOfChar('0', mLen) + mIdentificacion;

  Resultado := '506' + mDayS + mMonthS + mYearS + mIdentificacion + mConsecutivo + mSituacion + mCodigoSeguridad;

  Result := Resultado;
end;
{$ENDREGION}

{$REGION 'Documentos'}
{$REGION 'DB_DEInsertar_Encabezado'}
procedure DB_DEInsertar_Encabezado(ds1: TFDMemTable; FDQuery1: TFDQuery;
  pTabla: string;
  var pResultado: Integer; var pError: string);
var
  mArchivo: TMemoryStream;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('Insert Into ' + pTabla);
        FDQuery1.SQL.Add('(');
        FDQuery1.SQL.Add('TipoDoc,');
        FDQuery1.SQL.Add('Clave,');
        FDQuery1.SQL.Add('NumeroConsecutivo,');
        FDQuery1.SQL.Add('FechaEmision,');
        FDQuery1.SQL.Add('EmisorTipo,');
        FDQuery1.SQL.Add('EmisorNumero,');
        FDQuery1.SQL.Add('EmisorNombre,');
        FDQuery1.SQL.Add('EmisorNombreComercial,');
        FDQuery1.SQL.Add('EmisorProvincia,');
        FDQuery1.SQL.Add('EmisorCanton,');
        FDQuery1.SQL.Add('EmisorDistrito,');
        FDQuery1.SQL.Add('EmisorBarrio,');
        FDQuery1.SQL.Add('EmisorOtrasSenas,');
        FDQuery1.SQL.Add('EmisorCodigoPaisTel,');
        FDQuery1.SQL.Add('EmisorNumTelefonoTel,');
        FDQuery1.SQL.Add('EmisorCodigoPaisFax,');
        FDQuery1.SQL.Add('EmisorNumTelefonoFax,');
        FDQuery1.SQL.Add('EmisorCorreoElectronico,');
        FDQuery1.SQL.Add('ReceptorNombre,');
        FDQuery1.SQL.Add('ReceptorTipo,');
        FDQuery1.SQL.Add('ReceptorNumero,');
        FDQuery1.SQL.Add('ReceptorExtranjero,');
        FDQuery1.SQL.Add('ReceptorNombreComercial,');
        FDQuery1.SQL.Add('ReceptorProvincia,');
        FDQuery1.SQL.Add('ReceptorCanton,');
        FDQuery1.SQL.Add('ReceptorDistrito,');
        FDQuery1.SQL.Add('ReceptorBarrio,');
        FDQuery1.SQL.Add('ReceptorOtrasSenas,');
        FDQuery1.SQL.Add('ReceptorCodigoPaisTel,');
        FDQuery1.SQL.Add('ReceptorNumTelefonoTel,');
        FDQuery1.SQL.Add('ReceptorCodigoPaisFax,');
        FDQuery1.SQL.Add('ReceptorNumTelefonoFax,');
        FDQuery1.SQL.Add('ReceptorCorreoElectronico,');
        FDQuery1.SQL.Add('CondicionVenta,');
        FDQuery1.SQL.Add('PlazoCredito,');
        FDQuery1.SQL.Add('MedioPago,');
        FDQuery1.SQL.Add('CodigoMoneda,');
        FDQuery1.SQL.Add('TipoCambio,');
        FDQuery1.SQL.Add('TotalServGravados,');
        FDQuery1.SQL.Add('TotalServExentos,');
        FDQuery1.SQL.Add('TotalMercanciasGravadas,');
        FDQuery1.SQL.Add('TotalMercanciasExentas,');
        FDQuery1.SQL.Add('TotalGravado,');
        FDQuery1.SQL.Add('TotalExento,');
        FDQuery1.SQL.Add('TotalVenta,');
        FDQuery1.SQL.Add('TotalDescuentos,');
        FDQuery1.SQL.Add('TotalVentaNeta,');
        FDQuery1.SQL.Add('TotalImpuesto,');
        FDQuery1.SQL.Add('TotalComprobante,');
        FDQuery1.SQL.Add('ReferenciaNumero,');
        FDQuery1.SQL.Add('ReferenciaFechaEmision,');
        FDQuery1.SQL.Add('ReferenciaCodigo,');
        FDQuery1.SQL.Add('ReferenciaRazon,');
        FDQuery1.SQL.Add('NumeroResolucion,');
        FDQuery1.SQL.Add('FechaResolucion,');
        FDQuery1.SQL.Add('OtroTexto,');
        FDQuery1.SQL.Add('OtroContenido,');
        FDQuery1.SQL.Add('Signature,');
        FDQuery1.SQL.Add('IdSucursal,');
        FDQuery1.SQL.Add('IdTerminal,');
        FDQuery1.SQL.Add('Numero,');
        FDQuery1.SQL.Add('IdEstadoHacienda,');
        FDQuery1.SQL.Add('FechaEmisionD,');
        FDQuery1.SQL.Add('HoraEmision,');
        FDQuery1.SQL.Add('ReferenciaFechaEmisionD,');
        FDQuery1.SQL.Add('ReferenciaHoraEmision,');
        FDQuery1.SQL.Add('XMLSinFirma,');
        FDQuery1.SQL.Add('XMLConFirma,');
        FDQuery1.SQL.Add('Mensaje,');
        FDQuery1.SQL.Add('CodigoActividad,');
        FDQuery1.SQL.Add('TotalServExonerado,');
        FDQuery1.SQL.Add('TotalMercExonerada,');
        FDQuery1.SQL.Add('TotalExonerado,');
        FDQuery1.SQL.Add('TotalIVADevuelto,');
        FDQuery1.SQL.Add('TotalOtrosCargos,');
        FDQuery1.SQL.Add('ReceptorOtrasSenasExtranjero,');
        FDQuery1.SQL.Add('NumeroCuenta,');
        FDQuery1.SQL.Add('DocReferencia,');
        FDQuery1.SQL.Add('ReceptorCorreos,');
        FDQuery1.SQL.Add('IdSituacion,');
        FDQuery1.SQL.Add('Adjuntos,');
        FDQuery1.SQL.Add('ExtensionAdjuntos');
        FDQuery1.SQL.Add(')');
        FDQuery1.SQL.Add('Values(');
        FDQuery1.SQL.Add(':Param0,');
        FDQuery1.SQL.Add(':Param1,');
        FDQuery1.SQL.Add(':Param2,');
        FDQuery1.SQL.Add(':Param3,');
        FDQuery1.SQL.Add(':Param4,');
        FDQuery1.SQL.Add(':Param5,');
        FDQuery1.SQL.Add(':Param6,');
        FDQuery1.SQL.Add(':Param7,');
        FDQuery1.SQL.Add(':Param8,');
        FDQuery1.SQL.Add(':Param9,');
        FDQuery1.SQL.Add(':Param10,');
        FDQuery1.SQL.Add(':Param11,');
        FDQuery1.SQL.Add(':Param12,');
        FDQuery1.SQL.Add(':Param13,');
        FDQuery1.SQL.Add(':Param14,');
        FDQuery1.SQL.Add(':Param15,');
        FDQuery1.SQL.Add(':Param16,');
        FDQuery1.SQL.Add(':Param17,');
        FDQuery1.SQL.Add(':Param18,');
        FDQuery1.SQL.Add(':Param19,');
        FDQuery1.SQL.Add(':Param20,');
        FDQuery1.SQL.Add(':Param21,');
        FDQuery1.SQL.Add(':Param22,');
        FDQuery1.SQL.Add(':Param23,');
        FDQuery1.SQL.Add(':Param24,');
        FDQuery1.SQL.Add(':Param25,');
        FDQuery1.SQL.Add(':Param26,');
        FDQuery1.SQL.Add(':Param27,');
        FDQuery1.SQL.Add(':Param28,');
        FDQuery1.SQL.Add(':Param29,');
        FDQuery1.SQL.Add(':Param30,');
        FDQuery1.SQL.Add(':Param31,');
        FDQuery1.SQL.Add(':Param32,');
        FDQuery1.SQL.Add(':Param33,');
        FDQuery1.SQL.Add(':Param34,');
        FDQuery1.SQL.Add(':Param35,');
        FDQuery1.SQL.Add(':Param36,');
        FDQuery1.SQL.Add(':Param37,');
        FDQuery1.SQL.Add(':Param38,');
        FDQuery1.SQL.Add(':Param39,');
        FDQuery1.SQL.Add(':Param40,');
        FDQuery1.SQL.Add(':Param41,');
        FDQuery1.SQL.Add(':Param42,');
        FDQuery1.SQL.Add(':Param43,');
        FDQuery1.SQL.Add(':Param44,');
        FDQuery1.SQL.Add(':Param45,');
        FDQuery1.SQL.Add(':Param46,');
        FDQuery1.SQL.Add(':Param47,');
        FDQuery1.SQL.Add(':Param48,');
        FDQuery1.SQL.Add(':Param49,');
        FDQuery1.SQL.Add(':Param50,');
        FDQuery1.SQL.Add(':Param51,');
        FDQuery1.SQL.Add(':Param52,');
        FDQuery1.SQL.Add(':Param53,');
        FDQuery1.SQL.Add(':Param54,');
        FDQuery1.SQL.Add(':Param55,');
        FDQuery1.SQL.Add(':Param56,');
        FDQuery1.SQL.Add(':Param57,');
        FDQuery1.SQL.Add(':Param58,');
        FDQuery1.SQL.Add(':Param59,');
        FDQuery1.SQL.Add(':Param60,');
        FDQuery1.SQL.Add(':Param61,');
        FDQuery1.SQL.Add(':Param62,');
        FDQuery1.SQL.Add(':Param63,');
        FDQuery1.SQL.Add(':Param64,');
        FDQuery1.SQL.Add(':Param65,');
        FDQuery1.SQL.Add(':Param66,');
        FDQuery1.SQL.Add(':Param67,');
        FDQuery1.SQL.Add(':Param68,');
        FDQuery1.SQL.Add(':Param69,');
        FDQuery1.SQL.Add(':Param70,');
        FDQuery1.SQL.Add(':Param71,');
        FDQuery1.SQL.Add(':Param72,');
        FDQuery1.SQL.Add(':Param73,');
        FDQuery1.SQL.Add(':Param74,');
        FDQuery1.SQL.Add(':Param75,');
        FDQuery1.SQL.Add(':Param76,');
        FDQuery1.SQL.Add(':Param77,');
        FDQuery1.SQL.Add(':Param78,');
        FDQuery1.SQL.Add(':Param79,');
        FDQuery1.SQL.Add(':Param80,');
        FDQuery1.SQL.Add(':Param81,');
        FDQuery1.SQL.Add(':Param82');
        FDQuery1.SQL.Add(')');
        FDQuery1.Params.Items[0].AsString :=
          FieldByName('TipoDoc').AsString;
        FDQuery1.Params.Items[1].AsString :=
          FieldByName('Clave').AsString;
        FDQuery1.Params.Items[2].AsString :=
          FieldByName('NumeroConsecutivo').AsString;
        FDQuery1.Params.Items[3].AsString :=
          FieldByName('FechaEmision').AsString;
        FDQuery1.Params.Items[4].AsString :=
          FieldByName('EmisorTipo').AsString;
        FDQuery1.Params.Items[5].AsString :=
          FieldByName('EmisorNumero').AsString;
        FDQuery1.Params.Items[6].AsString :=
          FieldByName('EmisorNombre').AsString;
        FDQuery1.Params.Items[7].AsString :=
          FieldByName('EmisorNombreComercial').AsString;
        FDQuery1.Params.Items[8].AsString :=
          FieldByName('EmisorProvincia').AsString;
        FDQuery1.Params.Items[9].AsString :=
          FieldByName('EmisorCanton').AsString;
        FDQuery1.Params.Items[10].AsString :=
          FieldByName('EmisorDistrito').AsString;
        FDQuery1.Params.Items[11].AsString :=
          FieldByName('EmisorBarrio').AsString;
        FDQuery1.Params.Items[12].AsString :=
          FieldByName('EmisorOtrasSenas').AsString;
        FDQuery1.Params.Items[13].AsInteger :=
          FieldByName('EmisorCodigoPaisTel').AsInteger;
        FDQuery1.Params.Items[14].AsInteger :=
          FieldByName('EmisorNumTelefonoTel').AsInteger;
        FDQuery1.Params.Items[15].AsInteger :=
          FieldByName('EmisorCodigoPaisFax').AsInteger;
        FDQuery1.Params.Items[16].AsInteger :=
          FieldByName('EmisorNumTelefonoFax').AsInteger;
        FDQuery1.Params.Items[17].AsString :=
          FieldByName('EmisorCorreoElectronico').AsString;
        FDQuery1.Params.Items[18].AsString :=
          FieldByName('ReceptorNombre').AsString;
        FDQuery1.Params.Items[19].AsString :=
          FieldByName('ReceptorTipo').AsString;
        FDQuery1.Params.Items[20].AsString :=
          FieldByName('ReceptorNumero').AsString;
        FDQuery1.Params.Items[21].AsString :=
          FieldByName('ReceptorExtranjero').AsString;
        FDQuery1.Params.Items[22].AsString :=
          FieldByName('ReceptorNombreComercial').AsString;
        FDQuery1.Params.Items[23].AsString :=
          FieldByName('ReceptorProvincia').AsString;
        FDQuery1.Params.Items[24].AsString :=
          FieldByName('ReceptorCanton').AsString;
        FDQuery1.Params.Items[25].AsString :=
          FieldByName('ReceptorDistrito').AsString;
        FDQuery1.Params.Items[26].AsString :=
          FieldByName('ReceptorBarrio').AsString;
        FDQuery1.Params.Items[27].AsString :=
          FieldByName('ReceptorOtrasSenas').AsString;
        FDQuery1.Params.Items[28].AsInteger :=
          FieldByName('ReceptorCodigoPaisTel').AsInteger;
        FDQuery1.Params.Items[29].AsInteger :=
          FieldByName('ReceptorNumTelefonoTel').AsInteger;
        FDQuery1.Params.Items[30].AsInteger :=
          FieldByName('ReceptorCodigoPaisFax').AsInteger;
        FDQuery1.Params.Items[31].AsInteger :=
          FieldByName('ReceptorNumTelefonoFax').AsInteger;
        FDQuery1.Params.Items[32].AsString :=
          FieldByName('ReceptorCorreoElectronico').AsString;
        FDQuery1.Params.Items[33].AsString :=
          FieldByName('CondicionVenta').AsString;
        FDQuery1.Params.Items[34].AsString :=
          FieldByName('PlazoCredito').AsString;
        FDQuery1.Params.Items[35].AsString :=
          FieldByName('MedioPago').AsString;
        FDQuery1.Params.Items[36].AsString :=
          FieldByName('CodigoMoneda').AsString;
        FDQuery1.Params.Items[37].AsFloat :=
          FieldByName('TipoCambio').AsFloat;
        FDQuery1.Params.Items[38].AsFloat :=
          FieldByName('TotalServGravados').AsFloat;
        FDQuery1.Params.Items[39].AsFloat :=
          FieldByName('TotalServExentos').AsFloat;
        FDQuery1.Params.Items[40].AsFloat :=
          FieldByName('TotalMercanciasGravadas').AsFloat;
        FDQuery1.Params.Items[41].AsFloat :=
          FieldByName('TotalMercanciasExentas').AsFloat;
        FDQuery1.Params.Items[42].AsFloat :=
          FieldByName('TotalGravado').AsFloat;
        FDQuery1.Params.Items[43].AsFloat :=
          FieldByName('TotalExento').AsFloat;
        FDQuery1.Params.Items[44].AsFloat :=
          FieldByName('TotalVenta').AsFloat;
        FDQuery1.Params.Items[45].AsFloat :=
          FieldByName('TotalDescuentos').AsFloat;
        FDQuery1.Params.Items[46].AsFloat :=
          FieldByName('TotalVentaNeta').AsFloat;
        FDQuery1.Params.Items[47].AsFloat :=
          FieldByName('TotalImpuesto').AsFloat;
        FDQuery1.Params.Items[48].AsFloat :=
          FieldByName('TotalComprobante').AsFloat;
        FDQuery1.Params.Items[49].AsString :=
          FieldByName('ReferenciaNumero').AsString;
        FDQuery1.Params.Items[50].AsString :=
          FieldByName('ReferenciaFechaEmision').AsString;
        FDQuery1.Params.Items[51].AsString :=
          FieldByName('ReferenciaCodigo').AsString;
        FDQuery1.Params.Items[52].AsString :=
          FieldByName('ReferenciaRazon').AsString;
        FDQuery1.Params.Items[53].AsString :=
          FieldByName('NumeroResolucion').AsString;
        FDQuery1.Params.Items[54].AsString :=
          FieldByName('FechaResolucion').AsString;
        FDQuery1.Params.Items[55].AsString :=
          FieldByName('OtroTexto').AsString;
        FDQuery1.Params.Items[56].AsString :=
          FieldByName('OtroContenido').AsString;
        FDQuery1.Params.Items[57].AsString :=
          FieldByName('Signature').AsString;
        FDQuery1.Params.Items[58].AsInteger :=
          FieldByName('IdSucursal').AsInteger;
        FDQuery1.Params.Items[59].AsInteger :=
          FieldByName('IdTerminal').AsInteger;
        FDQuery1.Params.Items[60].AsInteger :=
          FieldByName('Numero').AsInteger;
        FDQuery1.Params.Items[61].AsInteger :=
          FieldByName('IdEstadoHacienda').AsInteger;
        FDQuery1.Params.Items[62].AsString :=
          FormatDateTime('yyyy-MM-dd',
          FieldByName('FechaEmisionD').AsDateTime);
        FDQuery1.Params.Items[63].AsString :=
          FieldByName('HoraEmision').AsString;
        FDQuery1.Params.Items[64].AsString :=
          FormatDateTime('yyyy-MM-dd',
          FieldByName('ReferenciaFechaEmisionD').AsDateTime);
        FDQuery1.Params.Items[65].AsString :=
          FieldByName('ReferenciaHoraEmision').AsString;
        FDQuery1.Params.Items[66].AsString :=
          FieldByName('XMLSinFirma').AsString;
        FDQuery1.Params.Items[67].AsString :=
          FieldByName('XMLConFirma').AsString;
        FDQuery1.Params.Items[68].AsString :=
          FieldByName('Mensaje').AsString;
        FDQuery1.Params.Items[69].AsString :=
          FieldByName('CodigoActividad').AsString;
        FDQuery1.Params.Items[70].AsFloat :=
          FieldByName('TotalServExonerado').AsFloat;
        FDQuery1.Params.Items[71].AsFloat :=
          FieldByName('TotalMercExonerada').AsFloat;
        FDQuery1.Params.Items[72].AsFloat :=
          FieldByName('TotalExonerado').AsFloat;
        FDQuery1.Params.Items[73].AsFloat :=
          FieldByName('TotalIVADevuelto').AsFloat;
        FDQuery1.Params.Items[74].AsFloat :=
          FieldByName('TotalOtrosCargos').AsFloat;
        FDQuery1.Params.Items[75].AsString :=
          FieldByName('ReceptorOtrasSenasExtranjero').AsString;
        FDQuery1.Params.Items[76].AsString :=
          FieldByName('NumeroCuenta').AsString;
        FDQuery1.Params.Items[77].AsString :=
          FieldByName('DocReferencia').AsString;
        FDQuery1.Params.Items[78].AsString :=
          FieldByName('ReceptorCorreos').AsString;
        FDQuery1.Params.Items[79].AsInteger :=
          FieldByName('IdSituacion').AsInteger;
        FDQuery1.Params.Items[80].AsInteger :=
          FieldByName('IdPlantilla').AsInteger;
        if Trim(FieldByName('ExtensionAdjuntos').AsString) <> '' then
        begin
          try
            mArchivo := TMemoryStream.Create;
            (FieldByName('Adjuntos') as TBlobField).SaveToStream(mArchivo);
            mArchivo.Position := 0;
            FDQuery1.Params.Items[81].LoadFromStream(mArchivo, ftBlob);
          except

          end;
        end
        else
          FDQuery1.Params.Items[81].Value := 0;
        FDQuery1.Params.Items[82].AsString :=
          FieldByName('ExtensionAdjuntos').AsString;
        FDQuery1.ExecSQL;
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_DEInsertar_Detalle'}
procedure DB_DEInsertar_Detalle(ds1: TFDMemTable; FDQuery1: TFDQuery;
  pTabla: string;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('Insert Into ' + pTabla);
        FDQuery1.SQL.Add('(');
        FDQuery1.SQL.Add('IdEncabezado,');
        FDQuery1.SQL.Add('NumeroLinea,');
        FDQuery1.SQL.Add('Tipo,');
        FDQuery1.SQL.Add('Codigo,');
        FDQuery1.SQL.Add('Cantidad,');
        FDQuery1.SQL.Add('UnidadMedida,');
        FDQuery1.SQL.Add('UnidadMedidaComercial,');
        FDQuery1.SQL.Add('Detalle,');
        FDQuery1.SQL.Add('PrecioUnitario,');
        FDQuery1.SQL.Add('MontoTotal,');
        FDQuery1.SQL.Add('MontoDescuento,');
        FDQuery1.SQL.Add('NaturalezaDescuento,');
        FDQuery1.SQL.Add('SubTotal,');
        FDQuery1.SQL.Add('ImpuestoCodigo,');
        FDQuery1.SQL.Add('ImpuestoTarifa,');
        FDQuery1.SQL.Add('ImpuestoMonto,');
        FDQuery1.SQL.Add('TipoDocumento,');
        FDQuery1.SQL.Add('NumeroDocumento,');
        FDQuery1.SQL.Add('NombreInstitucion,');
        FDQuery1.SQL.Add('FechaEmision,');
        FDQuery1.SQL.Add('MontoImpuesto,');
        FDQuery1.SQL.Add('PorcentajeCompra,');
        FDQuery1.SQL.Add('MontoTotalLinea,');
        FDQuery1.SQL.Add('FechaEmisionD,');
        FDQuery1.SQL.Add('HoraEmision,');
        FDQuery1.SQL.Add('CodigoComercial,');
        FDQuery1.SQL.Add('BaseImponible,');
        FDQuery1.SQL.Add('ImpuestoNeto,');
        FDQuery1.SQL.Add('PartidaArancelaria,');
        FDQuery1.SQL.Add('CodigoComercialCodigo,');
        FDQuery1.SQL.Add('CodigoTarifa,');
        FDQuery1.SQL.Add('FactorIVA,');
        FDQuery1.SQL.Add('MontoExportacion,');
        FDQuery1.SQL.Add('PorcentajeExoneracion,');
        FDQuery1.SQL.Add('MontoExoneracion,');
        FDQuery1.SQL.Add('IdProducto');
        FDQuery1.SQL.Add(')');
        FDQuery1.SQL.Add('Values(');
        FDQuery1.SQL.Add(':Param0,');
        FDQuery1.SQL.Add(':Param1,');
        FDQuery1.SQL.Add(':Param2,');
        FDQuery1.SQL.Add(':Param3,');
        FDQuery1.SQL.Add(':Param4,');
        FDQuery1.SQL.Add(':Param5,');
        FDQuery1.SQL.Add(':Param6,');
        FDQuery1.SQL.Add(':Param7,');
        FDQuery1.SQL.Add(':Param8,');
        FDQuery1.SQL.Add(':Param9,');
        FDQuery1.SQL.Add(':Param10,');
        FDQuery1.SQL.Add(':Param11,');
        FDQuery1.SQL.Add(':Param12,');
        FDQuery1.SQL.Add(':Param13,');
        FDQuery1.SQL.Add(':Param14,');
        FDQuery1.SQL.Add(':Param15,');
        FDQuery1.SQL.Add(':Param16,');
        FDQuery1.SQL.Add(':Param17,');
        FDQuery1.SQL.Add(':Param18,');
        FDQuery1.SQL.Add(':Param19,');
        FDQuery1.SQL.Add(':Param20,');
        FDQuery1.SQL.Add(':Param21,');
        FDQuery1.SQL.Add(':Param22,');
        FDQuery1.SQL.Add(':Param23,');
        FDQuery1.SQL.Add(':Param24,');
        FDQuery1.SQL.Add(':Param25,');
        FDQuery1.SQL.Add(':Param26,');
        FDQuery1.SQL.Add(':Param27,');
        FDQuery1.SQL.Add(':Param28,');
        FDQuery1.SQL.Add(':Param29,');
        FDQuery1.SQL.Add(':Param30,');
        FDQuery1.SQL.Add(':Param31,');
        FDQuery1.SQL.Add(':Param32,');
        FDQuery1.SQL.Add(':Param33,');
        FDQuery1.SQL.Add(':Param34,');
        FDQuery1.SQL.Add(':Param35');
        FDQuery1.SQL.Add(')');
        FDQuery1.Params.Items[0].AsInteger :=
          FieldByName('IdEncabezado').AsInteger;
        FDQuery1.Params.Items[1].AsInteger :=
          FieldByName('NumeroLinea').AsInteger;
        FDQuery1.Params.Items[2].AsString :=
          FieldByName('Tipo').AsString;
        FDQuery1.Params.Items[3].AsString :=
          FieldByName('Codigo').AsString;
        FDQuery1.Params.Items[4].AsFloat :=
          FieldByName('Cantidad').AsFloat;
        FDQuery1.Params.Items[5].AsString :=
          FieldByName('UnidadMedida').AsString;
        FDQuery1.Params.Items[6].AsString :=
          FieldByName('UnidadMedidaComercial').AsString;
        FDQuery1.Params.Items[7].AsString :=
          FieldByName('Detalle').AsString;
        FDQuery1.Params.Items[8].AsFloat :=
          FieldByName('PrecioUnitario').AsFloat;
        FDQuery1.Params.Items[9].AsFloat :=
          FieldByName('MontoTotal').AsFloat;
        FDQuery1.Params.Items[10].AsFloat :=
          FieldByName('MontoDescuento').AsFloat;
        FDQuery1.Params.Items[11].AsString :=
          FieldByName('NaturalezaDescuento').AsString;
        FDQuery1.Params.Items[12].AsFloat :=
          FieldByName('SubTotal').AsFloat;
        FDQuery1.Params.Items[13].AsString :=
          FieldByName('ImpuestoCodigo').AsString;
        FDQuery1.Params.Items[14].AsFloat :=
          FieldByName('ImpuestoTarifa').AsFloat;
        FDQuery1.Params.Items[15].AsFloat :=
          FieldByName('ImpuestoMonto').AsFloat;
        FDQuery1.Params.Items[16].AsString :=
          FieldByName('TipoDocumento').AsString;
        FDQuery1.Params.Items[17].AsString :=
          FieldByName('NumeroDocumento').AsString;
        FDQuery1.Params.Items[18].AsString :=
          FieldByName('NombreInstitucion').AsString;
        FDQuery1.Params.Items[19].AsString :=
          FieldByName('FechaEmision').AsString;
        FDQuery1.Params.Items[20].AsFloat :=
          FieldByName('MontoImpuesto').AsFloat;
        FDQuery1.Params.Items[21].AsInteger :=
          FieldByName('PorcentajeCompra').AsInteger;
        FDQuery1.Params.Items[22].AsFloat :=
          FieldByName('MontoTotalLinea').AsFloat;
        FDQuery1.Params.Items[23].AsString :=
          FormatDateTime('yyyy-MM-dd',
          FieldByName('FechaEmisionD').AsDateTime);
        FDQuery1.Params.Items[24].AsString :=
          FieldByName('HoraEmision').AsString;
        FDQuery1.Params.Items[25].AsString :=
          FieldByName('CodigoComercial').AsString;
        FDQuery1.Params.Items[26].AsFloat :=
          FieldByName('BaseImponible').AsFloat;
        FDQuery1.Params.Items[27].AsFloat :=
          FieldByName('ImpuestoNeto').AsFloat;
        FDQuery1.Params.Items[28].AsString :=
          FieldByName('PartidaArancelaria').AsString;
        FDQuery1.Params.Items[29].AsString :=
          FieldByName('CodigoComercialCodigo').AsString;
        FDQuery1.Params.Items[30].AsString :=
          FieldByName('CodigoTarifa').AsString;
        FDQuery1.Params.Items[31].AsFloat :=
          FieldByName('FactorIVA').AsFloat;
        FDQuery1.Params.Items[32].AsFloat :=
          FieldByName('MontoExportacion').AsFloat;
        FDQuery1.Params.Items[33].AsFloat :=
          FieldByName('PorcentajeExoneracion').AsFloat;
        FDQuery1.Params.Items[34].AsFloat :=
          FieldByName('MontoExoneracion').AsFloat;
        FDQuery1.Params.Items[35].AsInteger :=
          FieldByName('IdProducto').AsInteger;
        FDQuery1.ExecSQL;
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_DEInsertar_Impuestos'}
procedure DB_DEInsertar_Impuestos(ds1: TFDMemTable; FDQuery1: TFDQuery;
  pTabla: string;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('Insert Into ' + pTabla);
        FDQuery1.SQL.Add('(');
        FDQuery1.SQL.Add('IdEncabezado,');
        FDQuery1.SQL.Add('NumeroLinea,');
        FDQuery1.SQL.Add('ImpuestoCodigo,');
        FDQuery1.SQL.Add('ImpuestoTarifa,');
        FDQuery1.SQL.Add('ImpuestoMonto,');
        FDQuery1.SQL.Add('CodigoTarifa,');
        FDQuery1.SQL.Add('FactorIVA,');
        FDQuery1.SQL.Add('PorcentajeExoneracion,');
        FDQuery1.SQL.Add('MontoExoneracion,');
        FDQuery1.SQL.Add('IdProducto,');
        FDQuery1.SQL.Add('IdImpuesto');
        FDQuery1.SQL.Add(')');
        FDQuery1.SQL.Add('Values(');
        FDQuery1.SQL.Add(':Param0,');
        FDQuery1.SQL.Add(':Param1,');
        FDQuery1.SQL.Add(':Param2,');
        FDQuery1.SQL.Add(':Param3,');
        FDQuery1.SQL.Add(':Param4,');
        FDQuery1.SQL.Add(':Param5,');
        FDQuery1.SQL.Add(':Param6,');
        FDQuery1.SQL.Add(':Param7,');
        FDQuery1.SQL.Add(':Param8,');
        FDQuery1.SQL.Add(':Param9,');
        FDQuery1.SQL.Add(':Param10');
        FDQuery1.SQL.Add(')');
        FDQuery1.Params.Items[0].AsInteger :=
          FieldByName('IdEncabezado').AsInteger;
        FDQuery1.Params.Items[1].AsInteger :=
          FieldByName('NumeroLinea').AsInteger;
        FDQuery1.Params.Items[2].AsString :=
          FieldByName('ImpuestoCodigo').AsString;
        FDQuery1.Params.Items[3].AsFloat :=
          FieldByName('ImpuestoTarifa').AsFloat;
        FDQuery1.Params.Items[4].AsFloat :=
          FieldByName('ImpuestoMonto').AsFloat;
        FDQuery1.Params.Items[5].AsString :=
          FieldByName('CodigoTarifa').AsString;
        FDQuery1.Params.Items[6].AsFloat :=
          FieldByName('FactorIVA').AsFloat;
        FDQuery1.Params.Items[7].AsFloat :=
          FieldByName('PorcentajeExoneracion').AsFloat;
        FDQuery1.Params.Items[8].AsFloat :=
          FieldByName('MontoExoneracion').AsFloat;
        FDQuery1.Params.Items[9].AsInteger :=
          FieldByName('IdProducto').AsInteger;
        FDQuery1.Params.Items[10].AsInteger :=
          FieldByName('IdImpuesto').AsInteger;
        FDQuery1.ExecSQL;
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_DEInsertar_Descuentos'}
procedure DB_DEInsertar_Descuentos(ds1: TFDMemTable; FDQuery1: TFDQuery;
  pTabla: string;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('Insert Into ' + pTabla);
        FDQuery1.SQL.Add('(');
        FDQuery1.SQL.Add('IdEncabezado,');
        FDQuery1.SQL.Add('MontoDescuento,');
        FDQuery1.SQL.Add('NaturalezaDescuento');
        FDQuery1.SQL.Add(')');
        FDQuery1.SQL.Add('Values(');
        FDQuery1.SQL.Add(':Param0,');
        FDQuery1.SQL.Add(':Param1,');
        FDQuery1.SQL.Add(':Param2');
        FDQuery1.SQL.Add(')');
        FDQuery1.Params.Items[0].AsInteger :=
          FieldByName('IdEncabezado').AsInteger;
        FDQuery1.Params.Items[1].AsFloat :=
          FieldByName('MontoDescuento').AsFloat;
        FDQuery1.Params.Items[2].AsString :=
          FieldByName('NaturalezaDescuento').AsString;
        FDQuery1.ExecSQL;
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_DEInsertar_OtrosCargos'}
procedure DB_DEInsertar_OtrosCargos(ds1: TFDMemTable; FDQuery1: TFDQuery;
  pTabla: string;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('Insert Into ' + pTabla);
        FDQuery1.SQL.Add('(');
        FDQuery1.SQL.Add('IdEncabezado,');
        FDQuery1.SQL.Add('TipoDocumento,');
        FDQuery1.SQL.Add('NumeroIdentidadTercero,');
        FDQuery1.SQL.Add('NombreTercero,');
        FDQuery1.SQL.Add('Detalle,');
        FDQuery1.SQL.Add('Porcentaje,');
        FDQuery1.SQL.Add('MontoCargo');
        FDQuery1.SQL.Add(')');
        FDQuery1.SQL.Add('Values(');
        FDQuery1.SQL.Add(':Param0,');
        FDQuery1.SQL.Add(':Param1,');
        FDQuery1.SQL.Add(':Param2,');
        FDQuery1.SQL.Add(':Param3,');
        FDQuery1.SQL.Add(':Param4,');
        FDQuery1.SQL.Add(':Param5,');
        FDQuery1.SQL.Add(':Param6');
        FDQuery1.SQL.Add(')');
        FDQuery1.Params.Items[0].AsInteger :=
          FieldByName('IdEncabezado').AsInteger;
        FDQuery1.Params.Items[1].AsInteger :=
          FieldByName('TipoDocumento').AsInteger;
        FDQuery1.Params.Items[2].AsString :=
          FieldByName('NumeroIdentidadTercero').AsString;
        FDQuery1.Params.Items[3].AsString :=
          FieldByName('NombreTercero').AsString;
        FDQuery1.Params.Items[4].AsString :=
          FieldByName('Detalle').AsString;
        FDQuery1.Params.Items[5].AsFloat :=
          FieldByName('Porcentaje').AsFloat;
        FDQuery1.Params.Items[6].AsFloat :=
          FieldByName('MontoCargo').AsFloat;
        FDQuery1.ExecSQL;
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}
{$ENDREGION}

{$REGION 'Leer_OpcionesHacieda'}
procedure Leer_OpcionesHacieda(pArchivoConfig: string;
  var pModoProduccion: Integer; var pClaveDocumento: string;
  var pTokenUsuario: string; var pTokenClave: string;
  var pCertificadoArchivo: string; var pCertificadoClave: string;
  var pAccion: Integer; var pArchivoNombre: string;
  var pArchivoXMLFirmado: string; var pArchivoXMLFirmar: string;
  var pResultado: Integer; var pError: string);
var
  mArchivo: string;
  Aux01: string;
  I, I2,  mFila: Integer;
  mLista: TStringList;
begin
  try
    pResultado := 1;

    mArchivo := pArchivoConfig;
    if FileExists(mArchivo) = False then
      FileCreate(mArchivo);

    mLista := TStringList.Create;
    mLista.LoadFromFile(mArchivo);
    for mFila := 0 to mLista.Count - 1 do
    begin
      Aux01 := Trim(mLista.Strings[mFila]);

      I := Pos('<ModoProduccion>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</ModoProduccion>', Aux01);
        Aux01 := Trim(Copy(Aux01, I + 16, I2 - 17));
        pModoProduccion := StrToInt(Aux01);
      end;

      I := Pos('<ClaveDocumento>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</ClaveDocumento>', Aux01);
        pClaveDocumento := Trim(Copy(Aux01, I + 16, I2-17));
      end;

      I := Pos('<TokenUsuario>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</TokenUsuario>', Aux01);
        pTokenUsuario := Trim(Copy(Aux01, I + 14, I2 - 15));
        pTokenUsuario := HaciendaHexToStringS(pTokenUsuario);
      end;

      I := Pos('<TokenClave>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</TokenClave>', Aux01);
        pTokenClave := Trim(Copy(Aux01, I + 12, I2 - 13));
        pTokenClave := HaciendaHexToStringS(pTokenClave);
      end;

      I := Pos('<CertificadoArchivo>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</CertificadoArchivo>', Aux01);
        pCertificadoArchivo := Trim(Copy(Aux01, I + 20, I2 - 21));
        pCertificadoArchivo := HaciendaHexToStringS(pCertificadoArchivo);
      end;

      I := Pos('<CertificadoClave>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</CertificadoClave>', Aux01);
        pCertificadoClave := Trim(Copy(Aux01, I + 18, I2 - 19));
        pCertificadoClave := HaciendaHexToStringS(pCertificadoClave);
      end;

      I := Pos('<Accion>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</Accion>', Aux01);
        Aux01 := Trim(Copy(Aux01, I + 8, I2 - 9));
        pAccion := StrToInt(Aux01);
      end;

      I := Pos('<ArchivoNombre>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</ArchivoNombre>', Aux01);
        pArchivoNombre := Trim(Copy(Aux01, I + 15, I2 - 16));
      end;

      I := Pos('<ArchivoXMLFirmado>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</ArchivoXMLFirmado>', Aux01);
        pArchivoXMLFirmado := Trim(Copy(Aux01, I + 19, I2 - 20));
      end;

      I := Pos('<ArchivoXMLFirmar>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</ArchivoXMLFirmar>', Aux01);
        pArchivoXMLFirmar := Trim(Copy(Aux01, I + 18, I2 - 19));
      end;
    end;
    mLista.SaveToFile(mArchivo);
    mLista.Free;

    pResultado := 1;
  except
    pResultado := -1;
  end;
end;
{$ENDREGION}

{$REGION 'Leer_OpcionesHacieda_Respuesta'}
function Leer_OpcionesHacieda_Respuesta(pArchivoConfig: string;
  var pResultado: Integer; var pError: string): string;
var
  mArchivo: string;
  mResultado, Aux01: string;
  mLista: TStringList;
  mFila, I, I2: Integer;
begin
  try
    pResultado := 1;

    mResultado := '';
    mArchivo := pArchivoConfig;

    mLista := TStringList.Create;
    mLista.LoadFromFile(mArchivo);
    for mFila := 0 to mLista.Count - 1 do
    begin
      Aux01 := Trim(mLista.Strings[mFila]);

      I := Pos('<Respuesta>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</Respuesta>', Aux01);
        Aux01 := Trim(Copy(Aux01, I + 11, I2 - 12));
        Aux01 := HaciendaHexToStringS(Aux01);
        mResultado := Aux01;
      end;
    end;
    mLista.Free;

    pResultado := 1;
  except
    pResultado := -1;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'Leer_OpcionesHacieda_Detalle'}
function Leer_OpcionesHacieda_Detalle(pArchivoConfig: string;
  var pResultado: Integer; var pError: string): string;
var
  mArchivo: string;
  mResultado, Aux01: string;
  mLista: TStringList;
  mFila, I, I2: Integer;
begin
  try
    pResultado := 1;

    mResultado := '';
    mArchivo := pArchivoConfig;

    mLista := TStringList.Create;
    mLista.LoadFromFile(mArchivo);
    for mFila := 0 to mLista.Count - 1 do
    begin
      Aux01 := Trim(mLista.Strings[mFila]);

      I := Pos('<Detalle>', Aux01);
      if I > 0 then
      begin
        I2 := Pos('</Detalle>', Aux01);
        Aux01 := Trim(Copy(Aux01, I + 9, I2 - 10));
        Aux01 := HaciendaHexToStringS(Aux01);
        mResultado := Aux01;
      end;
    end;
    mLista.Free;

    pResultado := 1;
  except
    pResultado := -1;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'HaciendaHexToStringS'}
function HaciendaHexToStringS(H: String): String;
var
  I: Integer;
begin
  Result:= '';
  for I := 1 to length (H) div 2 do
    Result:= Result+Char(StrToInt('$'+Copy(H,(I-1)*2+1,2)));
end;
{$ENDREGION}

{$REGION 'HaciendaStringToHexS'}
function HaciendaStringToHexS(S: String): string;
var
  I: Integer;
begin
  Result:= '';
  for I := 1 to length (S) do
    Result:= Result+IntToHex(ord(S[i]),2);
end;
{$ENDREGION}

{$REGION 'Escribir_OpcionesHacieda_ModoProduccion'}
procedure Escribir_OpcionesHacieda_ModoProduccion(pArchivoConfig: string;
  pModoProduccion: Integer;
  var pResultado: Integer; var pError: string);
var
  mArchivo: string;
  I, mFila: Integer;
  mLista: TStringList;
  Aux01: string;
begin
  try
    pResultado := 1;

    mArchivo := pArchivoConfig;

    mLista := TStringList.Create;
    mLista.LoadFromFile(mArchivo);
    for mFila := 0 to mLista.Count - 1 do
    begin
      Aux01 := mLista.Strings[mFila];
      I := Pos('<ModoProduccion>', Aux01);
      if I > 0 then
      begin
        mLista.Strings[mFila] := '<ModoProduccion>' + IntToStr(pModoProduccion) + '</ModoProduccion>';
        Break;
      end;
    end;
    mLista.SaveToFile(mArchivo);
    mLista.Free;

    pResultado := 1;
  except
    pResultado := -1;
  end;
end;
{$ENDREGION}

{$REGION 'Escribir_OpcionesHacieda_ClaveDocumento'}
procedure Escribir_OpcionesHacieda_ClaveDocumento(pArchivoConfig: string;
  pClaveDocumento: string;
  var pResultado: Integer; var pError: string);
var
  mArchivo: string;
  I, mFila: Integer;
  mLista: TStringList;
  Aux01: string;
begin
  try
    pResultado := 1;

    mArchivo := pArchivoConfig;

    mLista := TStringList.Create;
    mLista.LoadFromFile(mArchivo);
    for mFila := 0 to mLista.Count - 1 do
    begin
      Aux01 := mLista.Strings[mFila];
      I := Pos('<ClaveDocumento>', Aux01);
      if I > 0 then
      begin
        mLista.Strings[mFila] := '<ClaveDocumento>' + pClaveDocumento + '</ClaveDocumento>';
        Break;
      end;
    end;
    mLista.SaveToFile(mArchivo);
    mLista.Free;

    pResultado := 1;
  except
    pResultado := -1;
  end;
end;
{$ENDREGION}

{$REGION 'Escribir_OpcionesHacieda_Accion'}
procedure Escribir_OpcionesHacieda_Accion(pArchivoConfig: string;
  pAccion: Integer;
  var pResultado: Integer; var pError: string);
var
  mArchivo: string;
  I, mFila: Integer;
  mLista: TStringList;
  Aux01: string;
begin
  try
    pResultado := 1;

    mArchivo := pArchivoConfig;

    mLista := TStringList.Create;
    mLista.LoadFromFile(mArchivo);
    for mFila := 0 to mLista.Count - 1 do
    begin
      Aux01 := mLista.Strings[mFila];
      I := Pos('<Accion>', Aux01);
      if I > 0 then
      begin
        mLista.Strings[mFila] := '<Accion>' + IntToStr(pAccion) + '</Accion>';
        Break;
      end;
    end;
    mLista.SaveToFile(mArchivo);
    mLista.Free;

    pResultado := 1;
  except
    pResultado := -1;
  end;
end;
{$ENDREGION}

{$REGION 'Escribir_OpcionesHacieda_ArchivoNombre'}
procedure Escribir_OpcionesHacieda_ArchivoNombre(pArchivoConfig: string;
  pArchivoNombre: string;
  var pResultado: Integer; var pError: string);
var
  mArchivo: string;
  I, mFila: Integer;
  mLista: TStringList;
  Aux01: string;
begin
  try
    pResultado := 1;

    mArchivo := pArchivoConfig;

    mLista := TStringList.Create;
    mLista.LoadFromFile(mArchivo);
    for mFila := 0 to mLista.Count - 1 do
    begin
      Aux01 := mLista.Strings[mFila];
      I := Pos('<ArchivoNombre>', Aux01);
      if I > 0 then
      begin
        mLista.Strings[mFila] := '<ArchivoNombre>' + pArchivoNombre + '</ArchivoNombre>';
        Break;
      end;

    end;
    mLista.SaveToFile(mArchivo);
    mLista.Free;

    pResultado := 1;
  except
    pResultado := -1;
  end;
end;
{$ENDREGION}

{$REGION 'Escribir_OpcionesHacieda_ArchivoXMLFirmado'}
procedure Escribir_OpcionesHacieda_ArchivoXMLFirmado(pArchivoConfig: string;
  pArchivoXMLFirmado: string;
  var pResultado: Integer; var pError: string);
var
  mArchivo: string;
  I, mFila: Integer;
  mLista: TStringList;
  Aux01: string;
begin
  try
    pResultado := 1;

    mArchivo := pArchivoConfig;

    mLista := TStringList.Create;
    mLista.LoadFromFile(mArchivo);
    for mFila := 0 to mLista.Count - 1 do
    begin
      Aux01 := mLista.Strings[mFila];
      I := Pos('<ArchivoXMLFirmado>', Aux01);
      if I > 0 then
      begin
        mLista.Strings[mFila] := '<ArchivoXMLFirmado>' + pArchivoXMLFirmado + '</ArchivoXMLFirmado>';
        Break;
      end;
    end;
    mLista.SaveToFile(mArchivo);
    mLista.Free;

    pResultado := 1;
  except
    pResultado := -1;
  end;
end;
{$ENDREGION}

{$REGION 'Escribir_OpcionesHacieda_ArchivoXMLFirmar'}
procedure Escribir_OpcionesHacieda_ArchivoXMLFirmar(pArchivoConfig: string;
  pArchivoXMLFirmar: string;
  var pResultado: Integer; var pError: string);
var
  mArchivo: string;
  I, mFila: Integer;
  mLista: TStringList;
  Aux01: string;
begin
  try
    pResultado := 1;

    mArchivo := pArchivoConfig;

    mLista := TStringList.Create;
    mLista.LoadFromFile(mArchivo);
    for mFila := 0 to mLista.Count - 1 do
    begin
      Aux01 := mLista.Strings[mFila];
      I := Pos('<ArchivoXMLFirmar>', Aux01);
      if I > 0 then
      begin
        mLista.Strings[mFila] := '<ArchivoXMLFirmar>' + pArchivoXMLFirmar + '</ArchivoXMLFirmar>';
        Break;
      end;
    end;
    mLista.SaveToFile(mArchivo);
    mLista.Free;

    pResultado := 1;
  except
    pResultado := -1;
  end;
end;
{$ENDREGION}

{$REGION 'Escribir_OpcionesHacieda_DatosGenerales'}
procedure Escribir_OpcionesHacieda_DatosGenerales(pArchivoConfig: string;
  pTokenUsuario: string; pTokenClave: string;
  pCertificadoArchivo: string; pCertificadoClave: string;
  var pResultado: Integer; var pError: string);
var
  mArchivo: string;
  I, mFila: Integer;
  mLista: TStringList;
  Aux01: string;
begin
  try
    pResultado := 1;

    mArchivo := pArchivoConfig;

    mLista := TStringList.Create;
    mLista.LoadFromFile(mArchivo);
    for mFila := 0 to mLista.Count - 1 do
    begin
      Aux01 := mLista.Strings[mFila];

      if Trim(pTokenUsuario) <> '' then
      begin
        I := Pos('<TokenUsuario>', Aux01);
        if I > 0 then
          mLista.Strings[mFila] := '<TokenUsuario>' + HaciendaStringToHexS(pTokenUsuario) + '</TokenUsuario>';
      end;

      if Trim(pTokenClave) <> '' then
      begin
        I := Pos('<TokenClave>', Aux01);
        if I > 0 then
          mLista.Strings[mFila] := '<TokenClave>' + HaciendaStringToHexS(pTokenClave) + '</TokenClave>';
      end;

      if Trim(pCertificadoArchivo) <> '' then
      begin
        I := Pos('<CertificadoArchivo>', Aux01);
        if I > 0 then
          mLista.Strings[mFila] := '<CertificadoArchivo>' + HaciendaStringToHexS(pCertificadoArchivo) + '</CertificadoArchivo>';
      end;

      if Trim(pCertificadoClave) <> '' then
      begin
        I := Pos('<CertificadoClave>', Aux01);
        if I > 0 then
          mLista.Strings[mFila] := '<CertificadoClave>' + HaciendaStringToHexS(pCertificadoClave) + '</CertificadoClave>';
      end;
    end;
    mLista.SaveToFile(mArchivo);
    mLista.Free;

    pResultado := 1;
  except
    pResultado := -1;
  end;
end;
{$ENDREGION}

{$REGION 'Get_XML'}
function Get_XML(dsEncabezado: TFDMemTable;
  dsDetalle: TFDMemTable; dsDescuentos: TFDMemTable;
  dsImpuestos: TFDMemTable; dsOtrosCargos: TFDMemTable;
  pPath: string; pArchivoNombre: string): string;
var
  mResultado: string;
  mArchivo: string;
  _xmlDoc: TXmlVerySimple;
  nEncabezado, nEmisor, nReceptor, nAux, nAux2, nReferencia, nNormativa,
    nOtros, nDetalle, nLineaDetalle, nNumeroLinea,
    nCodigoComercial, nDescuento, nImpuesto, nExoneracion,
    nOtrosCargos, nResumenFactura: Xml.VerySimple.TXmlNode;
  nodes: Xml.VerySimple.TXmlNodeList;
  NumeroLinea: Integer;
begin
  try
    mResultado := '';
    if DirectoryExists(pPath) = False then
      CreateDir(pPath);
    mArchivo := pPath + '\' + pArchivoNombre + '.xml';
    _xmlDoc := TXmlVerySimple.Create;
    nodes := _xmlDoc.ChildNodes;
    _xmlDoc.AddChild('FacturaElectronica');
    nEncabezado := nodes.Find('FacturaElectronica');
    if assigned(nEncabezado) then
    begin
      nEncabezado.Attributes['xmlns:ds'] := 'http://www.w3.org/2000/09/xmldsig#';
      nEncabezado.Attributes['xmlns:xsi'] := 'http://www.w3.org/2001/XMLSchema-instance';
      nEncabezado.Attributes['xmlns'] := 'https://tribunet.hacienda.go.cr/docs/esquemas/2017/v4.2/facturaElectronica';
      nEncabezado.Attributes['xsi:schemaLocation'] := 'http://www.w3.org/2001/XMLSchema-instance';

       {
      nEncabezado.Attributes['xsi'] := 'http://www.w3.org/2001/XMLSchema-instance';
      nEncabezado.Attributes['xsd'] := 'https://cdn.comprobanteselectronicos.go.cr/xml-schemas/v4.3/facturaElectronica';
      nEncabezado.Attributes['xs'] := 'http://www.w3.org/2001/XMLSchema';
      nEncabezado.Attributes['vc'] := 'http://www.w3.org/2007/XMLSchema-versioning';
      nEncabezado.Attributes['ds'] := 'http://www.w3.org/2000/09/xmldsig#';
      }
    end;
    nEncabezado.AddChild('Clave').Text :=
      dsEncabezado.FieldByName('Clave').AsString;
    nEncabezado.AddChild('CodigoActividad').Text :=
      dsEncabezado.FieldByName('CodigoActividad').AsString;
    nEncabezado.AddChild('NumeroConsecutivo').Text :=
      dsEncabezado.FieldByName('NumeroConsecutivo').AsString;
    nEncabezado.AddChild('FechaEmision').Text :=
      dsEncabezado.FieldByName('FechaEmision').AsString;
    nEncabezado.AddChild('Emisor');
    nEmisor := nEncabezado.Find('Emisor');
    nEmisor.AddChild('Nombre').Text :=
      dsEncabezado.FieldByName('EmisorNombre').AsString;
    if Validar_Identificacion(dsEncabezado.FieldByName('EmisorNumero').AsString,
      dsEncabezado.FieldByName('EmisorTipo').AsString) = True then
    begin
      nEmisor.AddChild('Identificacion');
      nAux := nEmisor.Find('Identificacion');
      nAux.AddChild('Numero').Text :=
        dsEncabezado.FieldByName('EmisorNumero').AsString;
      nAux.AddChild('Tipo').Text :=
        dsEncabezado.FieldByName('EmisorTipo').AsString;
    end;
    if Validar_Ubicacion(dsEncabezado.FieldByName('EmisorProvincia').AsString,
      dsEncabezado.FieldByName('EmisorCanton').AsString,
      dsEncabezado.FieldByName('EmisorDistrito').AsString,
      dsEncabezado.FieldByName('EmisorBarrio').AsString) = True then
    begin
      nEmisor.AddChild('Ubicacion');
      nAux := nEmisor.Find('Ubicacion');
      nAux.AddChild('Provincia').Text :=
        dsEncabezado.FieldByName('EmisorProvincia').AsString;
      nAux.AddChild('Canton').Text :=
        dsEncabezado.FieldByName('EmisorCanton').AsString;
      nAux.AddChild('Distrito').Text :=
        dsEncabezado.FieldByName('EmisorDistrito').AsString;
      nAux.AddChild('Barrio').Text :=
        dsEncabezado.FieldByName('EmisorBarrio').AsString;
      nAux.AddChild('OtrasSenas').Text :=
        dsEncabezado.FieldByName('EmisorOtrasSenas').AsString;
    end;
    if Validar_TelefonoFax(dsEncabezado.FieldByName('EmisorNumTelefonoTel').AsString) = True then
    begin
      nEmisor.AddChild('Telefono');
      nAux := nEmisor.Find('Telefono');
      nAux.AddChild('CodigoPais').Text := '506';
      nAux.AddChild('NumTelefono').Text :=
        dsEncabezado.FieldByName('EmisorNumTelefonoTel').AsString;
    end;
    if Validar_TelefonoFax(dsEncabezado.FieldByName('EmisorNumTelefonoFax').AsString) = True then
    begin
      nEmisor.AddChild('Fax');
      nAux := nEmisor.Find('Fax');
      nAux.AddChild('CodigoPais').Text := '506';
      nAux.AddChild('NumTelefono').Text :=
        dsEncabezado.FieldByName('EmisorNumTelefonoFax').AsString;
    end;
    if Validar_Email(dsEncabezado.FieldByName('EmisorCorreoElectronico').AsString) = True then
      nEmisor.AddChild('CorreoElectronico').Text :=
        dsEncabezado.FieldByName('EmisorCorreoElectronico').AsString;
    nEncabezado.AddChild('Receptor');
    nReceptor := nEncabezado.Find('Receptor');
    if Trim(dsEncabezado.FieldByName('ReceptorNombre').AsString) <> '' then
    nReceptor.AddChild('Nombre').Text :=
      dsEncabezado.FieldByName('ReceptorNombre').AsString
    else
      nReceptor.AddChild('Nombre').Text := 'Receptor';
    if Validar_Identificacion(dsEncabezado.FieldByName('ReceptorNumero').AsString,
      dsEncabezado.FieldByName('ReceptorTipo').AsString) = True then
    begin
      nReceptor.AddChild('Identificacion');
      nAux := nReceptor.Find('Identificacion');
      nAux.AddChild('Tipo').Text :=
        dsEncabezado.FieldByName('ReceptorTipo').AsString;
      nAux.AddChild('Numero').Text :=
        dsEncabezado.FieldByName('ReceptorNumero').AsString;
    end;
    if Validar_Ubicacion(dsEncabezado.FieldByName('ReceptorProvincia').AsString,
      dsEncabezado.FieldByName('ReceptorCanton').AsString,
      dsEncabezado.FieldByName('ReceptorDistrito').AsString,
      dsEncabezado.FieldByName('ReceptorBarrio').AsString) = True then
    begin
      nReceptor.AddChild('Ubicacion');
      nAux := nReceptor.Find('Ubicacion');
      nAux.AddChild('Provincia').Text :=
        dsEncabezado.FieldByName('ReceptorProvincia').AsString;
      nAux.AddChild('Canton').Text :=
        dsEncabezado.FieldByName('ReceptorCanton').AsString;
      nAux.AddChild('Distrito').Text :=
        dsEncabezado.FieldByName('ReceptorDistrito').AsString;
      nAux.AddChild('Barrio').Text :=
        dsEncabezado.FieldByName('ReceptorBarrio').AsString;
      nAux.AddChild('OtrasSenas').Text :=
        dsEncabezado.FieldByName('ReceptorOtrasSenas').AsString;
    end;
    if Validar_TelefonoFax(dsEncabezado.FieldByName('ReceptorNumTelefonoTel').AsString) = True then
    begin
      nReceptor.AddChild('Telefono');
      nAux := nReceptor.Find('Telefono');
      nAux.AddChild('CodigoPais').Text := '506';
      nAux.AddChild('NumTelefono').Text :=
        dsEncabezado.FieldByName('ReceptorNumTelefonoTel').AsString;
    end;
    if Validar_TelefonoFax(dsEncabezado.FieldByName('ReceptorNumTelefonoFax').AsString) = True then
    begin
      nReceptor.AddChild('Fax');
      nAux := nReceptor.Find('Fax');
      nAux.AddChild('CodigoPais').Text := '506';
      nAux.AddChild('NumTelefono').Text :=
        dsEncabezado.FieldByName('ReceptorNumTelefonoFax').AsString;
    end;
    if Validar_Email(dsEncabezado.FieldByName('ReceptorCorreoElectronico').AsString) = True then
      nReceptor.AddChild('CorreoElectronico').Text :=
        dsEncabezado.FieldByName('ReceptorCorreoElectronico').AsString;
    nEncabezado.AddChild('CondicionVenta').Text :=
      dsEncabezado.FieldByName('CondicionVenta').AsString;
    nEncabezado.AddChild('PlazoCredito').Text :=
      dsEncabezado.FieldByName('PlazoCredito').AsString;
    nEncabezado.AddChild('MedioPago').Text :=
      dsEncabezado.FieldByName('MedioPago').AsString;
    nEncabezado.AddChild('DetalleServicio');
    nDetalle := nEncabezado.Find('DetalleServicio');
    with dsDetalle do
    begin
      First;
      NumeroLinea := 1;
      while not Eof do
      begin
        nDetalle.AddChild('LineaDetalle');
        nLineaDetalle := nDetalle.Find('LineaDetalle');
        nLineaDetalle.AddChild('NumeroLinea').Text :=
          IntToStr(NumeroLinea);
       // nLineaDetalle.AddChild('PartidaArancelaria').Text :=
       //   dsDetalle.FieldByName('PartidaArancelaria').AsString;
        nLineaDetalle.AddChild('Codigo').Text := '01';
//          dsDetalle.FieldByName('Codigo').AsString;
        nLineaDetalle.AddChild('CodigoComercial');
        nCodigoComercial := nLineaDetalle.Find('CodigoComercial');
        nCodigoComercial.AddChild('Tipo').Text := '01';
//          dsDetalle.FieldByName('Tipo').AsString;
        nCodigoComercial.AddChild('Codigo').Text := '01';
//          dsDetalle.FieldByName('Codigo').AsString;
        nLineaDetalle.AddChild('Cantidad').Text :=
          dsDetalle.FieldByName('Cantidad').AsString;
        nLineaDetalle.AddChild('UnidadMedida').Text :=
          dsDetalle.FieldByName('UnidadMedida').AsString;
        nLineaDetalle.AddChild('Detalle').Text :=
          dsDetalle.FieldByName('Detalle').AsString;
        nLineaDetalle.AddChild('PrecioUnitario').Text :=
          dsDetalle.FieldByName('PrecioUnitario').AsString;
        nLineaDetalle.AddChild('MontoTotal').Text :=
          dsDetalle.FieldByName('MontoTotal').AsString;
        nLineaDetalle.AddChild('Descuento');
        nDescuento := nLineaDetalle.Find('Descuento');
        dsDescuentos.First;
        while not dsDescuentos.Eof do
        begin
          nDescuento.AddChild('MontoDescuento').Text :=
            dsDescuentos.FieldByName('MontoDescuento').AsString;
          nDescuento.AddChild('NaturalezaDescuento').Text :=
            dsDescuentos.FieldByName('NaturalezaDescuento').AsString;

          dsDescuentos.Next;
        end;
        nLineaDetalle.AddChild('SubTotal').Text :=
          dsDetalle.FieldByName('SubTotal').AsString;
        nLineaDetalle.AddChild('BaseImponible').Text :=
          dsDetalle.FieldByName('BaseImponible').AsString;
        nLineaDetalle.AddChild('Impuesto');
        nImpuesto := nLineaDetalle.Find('Impuesto');
        dsImpuestos.First;
        while not dsImpuestos.Eof do
        begin
          nImpuesto.AddChild('Codigo').Text :=
            dsImpuestos.FieldByName('ImpuestoCodigo').AsString;
          nImpuesto.AddChild('CodigoTarifa').Text :=
            dsImpuestos.FieldByName('CodigoTarifa').AsString;
          nImpuesto.AddChild('Tarifa').Text :=
            dsImpuestos.FieldByName('ImpuestoTarifa').AsString;
          nImpuesto.AddChild('Monto').Text :=
            dsImpuestos.FieldByName('ImpuestoMonto').AsString;
          nImpuesto.AddChild('FactorIVA').Text :=
            dsImpuestos.FieldByName('FactorIVA').AsString;
          nImpuesto.AddChild('MontoExportacion').Text :=
            dsImpuestos.FieldByName('MontoExportacion').AsString;
          nImpuesto.AddChild('Exoneración');
          {
          nExoneracion := nImpuesto.Find('Impuesto');
          nExoneracion.AddChild('TipoDocumento').Text :=
            dsImpuestos.FieldByName('TipoDocumento').AsString;
          nExoneracion.AddChild('NumeroDocumento').Text :=
            dsImpuestos.FieldByName('NumeroDocumento').AsString;
          nExoneracion.AddChild('NombreInstitucion').Text :=
            dsImpuestos.FieldByName('NombreInstitucion').AsString;
          nExoneracion.AddChild('FechaEmision').Text :=
            dsImpuestos.FieldByName('FechaEmision').AsString;
          nExoneracion.AddChild('PorcentajeExoneracion').Text :=
            dsImpuestos.FieldByName('PorcentajeExoneracion').AsString;
          nExoneracion.AddChild('MontoExoneracion').Text :=
            dsImpuestos.FieldByName('MontoExoneracion').AsString;
                 }
          dsImpuestos.Next;
        end;
        nLineaDetalle.AddChild('ImpuestoNeto').Text :=
          dsDetalle.FieldByName('ImpuestoNeto').AsString;
        nLineaDetalle.AddChild('MontoTotalLinea').Text :=
          dsDetalle.FieldByName('MontoTotalLinea').AsString;

        Inc(NumeroLinea);
        Next;
      end;
    end;
    if dsOtrosCargos.IsEmpty = False then
    begin
      nEncabezado.AddChild('OtrosCargos');
      nOtrosCargos := nEncabezado.Find('OtrosCargos');
      with dsOtrosCargos do
      begin
        First;
        while not Eof do
        begin
          nOtrosCargos.AddChild('TipoDocumento').Text :=
            dsOtrosCargos.FieldByName('TipoDocumento').AsString;
          nOtrosCargos.AddChild('NumeroIdentidadTercero').Text :=
            dsOtrosCargos.FieldByName('NumeroIdentidadTercero').AsString;
          nOtrosCargos.AddChild('NombreTercero').Text :=
            dsOtrosCargos.FieldByName('NombreTercero').AsString;
          nOtrosCargos.AddChild('Detalle').Text :=
            dsOtrosCargos.FieldByName('Detalle').AsString;
          nOtrosCargos.AddChild('Porcentaje').Text :=
            dsOtrosCargos.FieldByName('Porcentaje').AsString;
          nOtrosCargos.AddChild('MontoCargo').Text :=
            dsOtrosCargos.FieldByName('MontoCargo').AsString;

          Next;
        end;
      end;
    end;
    nEncabezado.AddChild('ResumenFactura');
    nResumenFactura := nEncabezado.Find('ResumenFactura');
    nResumenFactura.AddChild('CodigoTipoMoneda');
    nAux := nResumenFactura.Find('CodigoTipoMoneda');
    nAux.AddChild('CodigoMoneda').Text :=
      dsEncabezado.FieldByName('CodigoMoneda').AsString;
    nAux.AddChild('TipoCambio').Text :=
      dsEncabezado.FieldByName('TipoCambio').AsString;
    nResumenFactura.AddChild('TotalServGravados').Text :=
      dsEncabezado.FieldByName('TotalServGravados').AsString;
    nResumenFactura.AddChild('TotalServExentos').Text :=
      dsEncabezado.FieldByName('TotalServExentos').AsString;
    nResumenFactura.AddChild('TotalServExonerado').Text :=
      dsEncabezado.FieldByName('TotalServExonerado').AsString;
    nResumenFactura.AddChild('TotalMercanciasGravadas').Text :=
      dsEncabezado.FieldByName('TotalMercanciasGravadas').AsString;
    nResumenFactura.AddChild('TotalMercanciasExentas').Text :=
      dsEncabezado.FieldByName('TotalMercanciasExentas').AsString;
    nResumenFactura.AddChild('TotalMercExonerada').Text :=
      dsEncabezado.FieldByName('TotalMercExonerada').AsString;
    nResumenFactura.AddChild('TotalGravado').Text :=
      dsEncabezado.FieldByName('TotalGravado').AsString;
    nResumenFactura.AddChild('TotalExento').Text :=
      dsEncabezado.FieldByName('TotalExento').AsString;
    nResumenFactura.AddChild('TotalExonerado').Text :=
      dsEncabezado.FieldByName('TotalExonerado').AsString;
    nResumenFactura.AddChild('TotalVenta').Text :=
      dsEncabezado.FieldByName('TotalVenta').AsString;
    nResumenFactura.AddChild('TotalDescuentos').Text :=
      dsEncabezado.FieldByName('TotalDescuentos').AsString;
    nResumenFactura.AddChild('TotalVentaNeta').Text :=
      dsEncabezado.FieldByName('TotalVentaNeta').AsString;
    nResumenFactura.AddChild('TotalImpuesto').Text :=
      dsEncabezado.FieldByName('TotalImpuesto').AsString;
    nResumenFactura.AddChild('TotalIVADevuelto').Text :=
      dsEncabezado.FieldByName('TotalIVADevuelto').AsString;
    nResumenFactura.AddChild('TotalOtrosCargos').Text :=
      dsEncabezado.FieldByName('TotalOtrosCargos').AsString;
    nResumenFactura.AddChild('TotalComprobante').Text :=
      dsEncabezado.FieldByName('TotalComprobante').AsString;
    if Trim(dsEncabezado.FieldByName('ReferenciaNumero').AsString) <> '' then
    begin
      nEncabezado.AddChild('InformacionReferencia');
      nReferencia := nEncabezado.Find('InformacionReferencia');
      nReferencia.AddChild('TipoDoc').Text :=
        dsEncabezado.FieldByName('ReferenciaCodigo').AsString;
      nReferencia.AddChild('Numero').Text :=
        dsEncabezado.FieldByName('ReferenciaNumero').AsString;
      nReferencia.AddChild('FechaEmision').Text :=
        dsEncabezado.FieldByName('ReferenciaFechaEmision').AsString;
      nReferencia.AddChild('Codigo').Text :=
        dsEncabezado.FieldByName('ReferenciaCodigo').AsString;
      nReferencia.AddChild('Razon').Text :=
        dsEncabezado.FieldByName('ReferenciaRazon').AsString;
    end;
    nEncabezado.AddChild('Normativa');
    nNormativa := nEncabezado.Find('Normativa');
    nNormativa.AddChild('NumeroResolucion').Text :=
      'DGT-R-48-2016';
      //dsEncabezado.FieldByName('NumeroResolucion').AsString;
    nNormativa.AddChild('FechaResolucion').Text :=
       '07-10-2016 08:00:00';
      //dsEncabezado.FieldByName('FechaResolucion').AsString;
    if Validar_Otros(dsEncabezado.FieldByName('OtroTexto').AsString,
      dsEncabezado.FieldByName('OtroContenido').AsString) = True then
    begin
      nEncabezado.AddChild('Otros');
      nOtros := nEncabezado.Find('Otros');
      nOtros.AddChild('OtroTexto').Text :=
        dsEncabezado.FieldByName('OtroTexto').AsString;
      nOtros.AddChild('OtroContenido').Text :=
        dsEncabezado.FieldByName('OtroContenido').AsString;
    end;

    mResultado := _xmlDoc.Text;
    _xmlDoc.SaveToFile(mArchivo);
    _xmlDoc.Free;
  except
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'Hacienda_Firmar'}
procedure Hacienda_Firmar(pArchivoConfig: string;
  pArchivoFirmar: string; pArchivoNombre: string; pArchivoHacienda: string;
  pResultado: Integer; pErrorM: string);
begin
  try
    pResultado := 1;

    Escribir_OpcionesHacieda_Accion(pArchivoConfig,
      1, pResultado, pErrorM);

    Escribir_OpcionesHacieda_ArchivoNombre(pArchivoConfig,
      pArchivoNombre, pResultado, pErrorM);

    Escribir_OpcionesHacieda_ArchivoXMLFirmar(pArchivoConfig,
      pArchivoFirmar, pResultado, pErrorM);

    ShellExecute(0, 'Open', PChar(pArchivoHacienda),
      PChar(''), nil, SW_SHOWNORMAL);
    Sleep(3000);

    pResultado := 1;
  except
    pResultado := -1;
  end;
end;
{$ENDREGION}

{$REGION 'Hacienda_Enviar'}
procedure Hacienda_Enviar(pArchivoConfig: string;
  pClave: string;
  pArchivoFirmado: string; pArchivoHacienda: string;
  var pRespuesta: string;
  pResultado: Integer; pErrorM: string);
begin
  try
    pResultado := 1;

    Escribir_OpcionesHacieda_Accion(pArchivoConfig,
      2, pResultado, pErrorM);

    Escribir_OpcionesHacieda_ClaveDocumento(pArchivoConfig,
      pClave, pResultado, pErrorM);

    Escribir_OpcionesHacieda_ArchivoXMLFirmado(pArchivoConfig,
      pArchivoFirmado, pResultado, pErrorM);

    ShellExecute(0, 'Open', PChar(pArchivoHacienda),
      PChar(''), nil, SW_SHOWNORMAL);

    pRespuesta :=
      Leer_OpcionesHacieda_Respuesta(pArchivoConfig,
        pResultado, pErrorM);

    pResultado := 1;
  except
    pResultado := -1;
  end;
end;
{$ENDREGION}

{$REGION 'Validar_Identificacion'}
function Validar_Identificacion(pIdentificacion: string; pTipo: string): Boolean;
var
  mResultado: Boolean;
  mPasa: Boolean;
  mIdentificacion: string;
  mNumero: Integer;
  mTipo: string;
  mLen, mCount: Integer;
begin
  try
    mResultado := True;

    mIdentificacion := Trim(pIdentificacion);
    mTipo := Trim(pTipo);
    mPasa := False;

    if Length(mTipo) = 1 then
      mTipo := '0' + mTipo;

    mLen := Length(mIdentificacion);
    mCount := 12 - mLen;
    mIdentificacion := StringOfChar('0', mCount) + mIdentificacion;

    // Cedula Fisica
    if pTipo = '01' then
    begin
      mPasa := True;
      if Length(mIdentificacion) <> 12 then
        raise Exception.Create('');
      try
        mNumero := StrToInt(mIdentificacion);
      except
        mPasa := False;
      end;
      if mPasa = False then
        raise Exception.Create('');
    end;
    // Cedula Juridica
    if pTipo = '02' then
    begin
      mPasa := True;
      if Length(mIdentificacion) <> 12 then
        raise Exception.Create('');
      try
        mNumero := StrToInt(mIdentificacion);
      except
        mPasa := False;
      end;
      if mPasa = False then
        raise Exception.Create('');
    end;
    // DIMEX
    if pTipo = '03' then
    begin
      mPasa := True;
      if Length(mIdentificacion) <> 12 then
        raise Exception.Create('');
      try
        mNumero := StrToInt(mIdentificacion);
      except
        mPasa := False;
      end;
      if mPasa = False then
        raise Exception.Create('');
    end;
    // NITE
    if pTipo = '04' then
    begin
      mPasa := True;
      if Length(mIdentificacion) <> 12 then
        raise Exception.Create('');
      try
        mNumero := StrToInt(mIdentificacion);
      except
        mPasa := False;
      end;
      if mPasa = False then
        raise Exception.Create('');
    end;

    if mPasa = False then
      raise Exception.Create('');
  except
    mResultado := False;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'Validar_Ubicacion'}
function Validar_Ubicacion(pProvincia: string; pCanton: string;
  pDistrito: string; pBarrio: string): Boolean;
var
  mResultado: Boolean;
  mPasa: Boolean;
begin
  try
    mResultado := True;

    if Trim(pProvincia) = '' then
       mResultado := False;
    if Trim(pCanton) = '' then
       mResultado := False;
    if Trim(pDistrito) = '' then
       mResultado := False;
  except
    mResultado := False;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'Validar_TelefonoFax'}
function Validar_TelefonoFax(pNumero: string): Boolean;
var
  mResultado: Boolean;
  mPasa: Boolean;
begin
  try
    mResultado := True;

    if Trim(pNumero) = '' then
       mResultado := False;
    if Trim(pNumero) = '0' then
       mResultado := False;
  except
    mResultado := False;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'Validar_Email'}
function Validar_Email(pEmail: string): Boolean;
var
  mResultado: Boolean;
  mPasa: Boolean;
begin
  try
    mResultado := True;

    if Trim(pEmail) = '' then
       mResultado := False;
  except
    mResultado := False;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'Validar_Otros'}
function Validar_Otros(pOtros1: string; pOtros2: string): Boolean;
var
  mResultado: Boolean;
  mPasa: Boolean;
begin
  try
    mResultado := True;

    if (Trim(pOtros1) = '') and
     (Trim(pOtros2) = '') then
       mResultado := False;
  except
    mResultado := False;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'Llenar_Totales'}
procedure Llenar_Totales();
var
  mResultado: Boolean;
begin
  try
    mResultado := True;


    mResultado := True;
  except
    mResultado := False;
  end;
end;
{$ENDREGION}

{$REGION 'Hacienda_TieneInternet'}
function Hacienda_TieneInternet: boolean;
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

{$REGION 'EnviarEmail'}
procedure EnviarEmail(pcopias: string; pServidor: string;
  puerto: Integer; pEmail: string);
var
  IdSMTP1: TIdSMTP;
  IdMessage1: TIdMessage;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  Att: TIdAttachmentFile;
begin
  IdSMTP1 := TIdSMTP.Create(nil);
  IdMessage1 := TIdMessage.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  SSL.SSLOptions.Method := sslvTLSv1;
  SSL.SSLOptions.Mode := sslmClient;
  SSL.SSLOptions.VerifyMode := [];
  SSL.SSLOptions.VerifyDepth := 0;
  //SSL.UseTLS := utUseExplicitTLS;

  IdSMTP1.Host := pServidor; //'smtp.mail.yahoo.com';
  IdSMTP1.Port := puerto;
  IdSMTP1.UseTLS := utUseExplicitTLS;

  //setup mail message
  IdMessage1.From.Address := pEmail; //'my email address is here';
  IdMessage1.Recipients.EMailAddresses := pcopias;
  IdMessage1.Subject   := 'Factura electronica:';
  IdMessage1.Body.Text := 'Estimado(a): Adjunto a este correo encontrará un Comprobante Electrónico en formato XML y su correspondiente representación en formato PDF.' +
    ' Lo anterior con base en las especificaciones del Ministerio de Hacienda.';
  //TIdAttachment.Create(IdMessage1.MessageParts, PChar('C:\Users\Public\Proyects\Sisfac\Win32\Debug\Temp\FE50620061900010880082600100001010000000001199999999_Firmado.xml')) ;
 // TIdAttachmentFile.Create(IdMessage1.MessageParts, 'C:\Users\Public\Proyects\Sisfac\Win32\Debug\Temp\FE50620061900010880082600100001010000000001199999999_Firmado.xml');

  IdSMTP1.IOHandler := SSL;
  IdSMTP1.UseTLS := utUseExplicitTLS;
  IdSMTP1.Username := 'fernandosolis5@gmail.com';
  IdSMTP1.Password := 'heroeleyenda111';
  try
    try
      try
        IdSMTP1.Connect;
        IdSMTP1.Send(IdMessage1);
      except
        on E:Exception do
          ShowMessage('Non posso spedire E-Mail: ' + E.Message);
      end;
    finally
      if IdSMTP1.Connected then IdSMTP1.Disconnect;
    end;
  except
    on E : Exception do
      ShowMessage('Errore durante la spedizione del file: ' + E.Message);
  end;
  //send mail try

  IdSMTP1.Disconnect;
  IdSMTP1.Free;
  IdMessage1.Free;
  SSL.Free;
end;
{$ENDREGION}

end.
