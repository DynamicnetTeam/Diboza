unit uDL_tb_docunentosencabezado;

interface
uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  System.Classes;

type
  TDL_tb_docunentosencabezado = class
    Dataset: TFDMemTable;
  private
    {$REGION 'Propiedades'}
    FTabla: string;
    FClaseNombre: string;
    F_IdNombre: string;
    {$ENDREGION}
  public
    {$REGION 'Propiedades'}
    property Tabla: string read FTabla write FTabla;
    property ClaseNombre: string read FClaseNombre write FClaseNombre;
    property _IdNombre: string read F_IdNombre write F_IdNombre;
    {$ENDREGION}

    {$REGION 'Metodos'}
    constructor Create;
    destructor Destroy;
    {$ENDREGION}
  end;

implementation

{ TDL_tb_docunentosencabezado }

{$REGION 'Metodos'}
constructor TDL_tb_docunentosencabezado.Create;
begin
  Tabla := 'tb_docunentosencabezado';
  ClaseNombre := 'TDL_tb_docunentosencabezado';
  _IdNombre := 'Id';

  Dataset := TFDMemTable.Create(nil);
  with Dataset do
  begin
    FileName := 'tb_docunentosencabezado';
    FieldDefs.Clear;
    FieldDefs.Add('Id', ftInteger, 0);
    FieldDefs.Add('TipoDoc', ftString, 1);
    FieldDefs.Add('Clave', ftString, 50);
    FieldDefs.Add('NumeroConsecutivo', ftString, 20);
    FieldDefs.Add('FechaEmision', ftString, 50);
    FieldDefs.Add('EmisorTipo', ftString, 2);
    FieldDefs.Add('EmisorNumero', ftString, 12);
    FieldDefs.Add('EmisorNombre', ftString, 100);
    FieldDefs.Add('EmisorNombreComercial', ftString, 80);
    FieldDefs.Add('EmisorProvincia', ftString, 1);
    FieldDefs.Add('EmisorCanton', ftString, 2);
    FieldDefs.Add('EmisorDistrito', ftString, 2);
    FieldDefs.Add('EmisorBarrio', ftString, 2);
    FieldDefs.Add('EmisorOtrasSenas', ftString, 250);
    FieldDefs.Add('EmisorCodigoPaisTel', ftInteger, 0);
    FieldDefs.Add('EmisorNumTelefonoTel', ftInteger, 0);
    FieldDefs.Add('EmisorCodigoPaisFax', ftInteger, 0);
    FieldDefs.Add('EmisorNumTelefonoFax', ftInteger, 0);
    FieldDefs.Add('EmisorCorreoElectronico', ftString, 160);
    FieldDefs.Add('ReceptorNombre', ftString, 100);
    FieldDefs.Add('ReceptorTipo', ftString, 2);
    FieldDefs.Add('ReceptorNumero', ftString, 12);
    FieldDefs.Add('ReceptorExtranjero', ftString, 20);
    FieldDefs.Add('ReceptorNombreComercial', ftString, 80);
    FieldDefs.Add('ReceptorProvincia', ftString, 1);
    FieldDefs.Add('ReceptorCanton', ftString, 2);
    FieldDefs.Add('ReceptorDistrito', ftString, 2);
    FieldDefs.Add('ReceptorBarrio', ftString, 2);
    FieldDefs.Add('ReceptorOtrasSenas', ftString, 160);
    FieldDefs.Add('ReceptorCodigoPaisTel', ftInteger, 0);
    FieldDefs.Add('ReceptorNumTelefonoTel', ftInteger, 0);
    FieldDefs.Add('ReceptorCodigoPaisFax', ftInteger, 0);
    FieldDefs.Add('ReceptorNumTelefonoFax', ftInteger, 0);
    FieldDefs.Add('ReceptorCorreoElectronico', ftString, 160);
    FieldDefs.Add('CondicionVenta', ftString, 2);
    FieldDefs.Add('PlazoCredito', ftString, 10);
    FieldDefs.Add('MedioPago', ftString, 2);
    FieldDefs.Add('CodigoMoneda', ftString, 3);
    FieldDefs.Add('TipoCambio', ftFloat, 0);
    FieldDefs.Add('TotalServGravados', ftFloat, 0);
    FieldDefs.Add('TotalServExentos', ftFloat, 0);
    FieldDefs.Add('TotalMercanciasGravadas', ftFloat, 0);
    FieldDefs.Add('TotalMercanciasExentas', ftFloat, 0);
    FieldDefs.Add('TotalGravado', ftFloat, 0);
    FieldDefs.Add('TotalExento', ftFloat, 0);
    FieldDefs.Add('TotalVenta', ftFloat, 0);
    FieldDefs.Add('TotalDescuentos', ftFloat, 0);
    FieldDefs.Add('TotalVentaNeta', ftFloat, 0);
    FieldDefs.Add('TotalImpuesto', ftFloat, 0);
    FieldDefs.Add('TotalComprobante', ftFloat, 0);
    FieldDefs.Add('ReferenciaNumero', ftString, 50);
    FieldDefs.Add('ReferenciaFechaEmision', ftString, 50);
    FieldDefs.Add('ReferenciaCodigo', ftString, 2);
    FieldDefs.Add('ReferenciaRazon', ftString, 180);
    FieldDefs.Add('NumeroResolucion', ftString, 13);
    FieldDefs.Add('FechaResolucion', ftString, 50);
    FieldDefs.Add('OtroTexto', ftMemo, 0);
    FieldDefs.Add('OtroContenido', ftMemo, 0);
    FieldDefs.Add('Signature', ftMemo, 0);
    FieldDefs.Add('IdSucursal', ftInteger, 0);
    FieldDefs.Add('IdTerminal', ftInteger, 0);
    FieldDefs.Add('Numero', ftInteger, 0);
    FieldDefs.Add('IdEstadoHacienda', ftInteger, 0);
    FieldDefs.Add('FechaEmisionD', ftDate, 0);
    FieldDefs.Add('HoraEmision', ftString, 30);
    FieldDefs.Add('ReferenciaFechaEmisionD', ftDate, 0);
    FieldDefs.Add('ReferenciaHoraEmision', ftString, 30);
    FieldDefs.Add('XMLSinFirma', ftMemo, 0);
    FieldDefs.Add('XMLConFirma', ftMemo, 0);
    FieldDefs.Add('Mensaje', ftMemo, 0);
    FieldDefs.Add('CodigoActividad', ftString, 6);
    FieldDefs.Add('TotalServExonerado', ftFloat, 0);
    FieldDefs.Add('TotalMercExonerada', ftFloat, 0);
    FieldDefs.Add('TotalExonerado', ftFloat, 0);
    FieldDefs.Add('TotalIVADevuelto', ftFloat, 0);
    FieldDefs.Add('TotalOtrosCargos', ftFloat, 0);
    FieldDefs.Add('ReceptorOtrasSenasExtranjero', ftString, 300);
    FieldDefs.Add('NumeroCuenta', ftString, 100);
    FieldDefs.Add('DocReferencia', ftString, 250);
    FieldDefs.Add('ReceptorCorreos', ftMemo, 0);
    FieldDefs.Add('IdSituacion', ftInteger, 0);
    FieldDefs.Add('IdPlantilla', ftInteger, 0);
    FieldDefs.Add('Adjuntos', ftBlob, 0);
    FieldDefs.Add('ExtensionAdjuntos', ftString, 10);
    FieldDefs.Add('ReferenciaTipo', ftString, 2);
    FieldDefs.Add('IdEmpresa', ftInteger, 0);
    FieldDefs.Add('DetalleHacienda', ftMemo, 0);
    FieldDefs.Add('CodigoEmail', ftInteger, 0);
    FieldDefs.Add('PDFHacienda', ftBlob, 0);
    CreateDataSet;
    Open;
  end;
end;

destructor TDL_tb_docunentosencabezado.Destroy;
begin
  Dataset.Close;
  Dataset.Free;
end;
{$ENDREGION}

end.
