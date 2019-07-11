unit uDL_tb_docunentosdetalle;

interface
uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  System.Classes;

type
  TDL_tb_docunentosdetalle = class
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

{ TDL_tb_docunentosdetalle }

{$REGION 'Metodos'}
constructor TDL_tb_docunentosdetalle.Create;
begin
  Tabla := 'tb_docunentosdetalle';
  ClaseNombre := 'TDL_tb_docunentosdetalle';
  _IdNombre := 'Id';

  Dataset := TFDMemTable.Create(nil);
  with Dataset do
  begin
    FileName := 'tb_docunentosdetalle';
    FieldDefs.Clear;
    FieldDefs.Add('Id', ftInteger, 0);
    FieldDefs.Add('IdEncabezado', ftInteger, 0);
    FieldDefs.Add('NumeroLinea', ftInteger, 0);
    FieldDefs.Add('Tipo', ftString, 2);
    FieldDefs.Add('Codigo', ftString, 13);
    FieldDefs.Add('Cantidad', ftFloat, 0);
    FieldDefs.Add('UnidadMedida', ftString, 15);
    FieldDefs.Add('UnidadMedidaComercial', ftString, 20);
    FieldDefs.Add('Detalle', ftString, 200);
    FieldDefs.Add('PrecioUnitario', ftFloat, 0);
    FieldDefs.Add('MontoTotal', ftFloat, 0);
    FieldDefs.Add('MontoDescuento', ftFloat, 0);
    FieldDefs.Add('NaturalezaDescuento', ftString, 80);
    FieldDefs.Add('SubTotal', ftFloat, 0);
    FieldDefs.Add('ImpuestoCodigo', ftString, 3);
    FieldDefs.Add('ImpuestoTarifa', ftFloat, 0);
    FieldDefs.Add('ImpuestoMonto', ftFloat, 0);
    FieldDefs.Add('TipoDocumento', ftString, 2);
    FieldDefs.Add('NumeroDocumento', ftString, 40);
    FieldDefs.Add('NombreInstitucion', ftString, 160);
    FieldDefs.Add('FechaEmision', ftString, 50);
    FieldDefs.Add('MontoImpuesto', ftFloat, 0);
    FieldDefs.Add('PorcentajeCompra', ftInteger, 0);
    FieldDefs.Add('MontoTotalLinea', ftFloat, 0);
    FieldDefs.Add('FechaEmisionD', ftDate, 0);
    FieldDefs.Add('HoraEmision', ftString, 30);
    FieldDefs.Add('CodigoComercial', ftString, 5);
    FieldDefs.Add('BaseImponible', ftFloat, 0);
    FieldDefs.Add('ImpuestoNeto', ftFloat, 0);
    FieldDefs.Add('PartidaArancelaria', ftString, 15);
    FieldDefs.Add('CodigoComercialCodigo', ftString, 20);
    FieldDefs.Add('CodigoTarifa', ftString, 2);
    FieldDefs.Add('FactorIVA', ftFloat, 0);
    FieldDefs.Add('MontoExportacion', ftFloat, 0);
    FieldDefs.Add('PorcentajeExoneracion', ftFloat, 0);
    FieldDefs.Add('MontoExoneracion', ftFloat, 0);
    FieldDefs.Add('IdProducto', ftInteger, 0);
    CreateDataSet;
    Open;
  end;
end;

destructor TDL_tb_docunentosdetalle.Destroy;
begin
  Dataset.Close;
  Dataset.Free;
end;
{$ENDREGION}

end.
