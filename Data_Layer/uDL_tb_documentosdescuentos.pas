unit uDL_tb_documentosdescuentos;

interface
uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  System.Classes;

type
  TDL_tb_documentosdescuentos = class
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

{ TDL_tb_documentosdescuentos }

{$REGION 'Metodos'}
constructor TDL_tb_documentosdescuentos.Create;
begin
  Tabla := 'tb_documentosdescuentos';
  ClaseNombre := 'TDL_tb_documentosdescuentos';
  _IdNombre := 'Id';

  Dataset := TFDMemTable.Create(nil);
  with Dataset do
  begin
    FileName := 'tb_documentosdescuentos';
    FieldDefs.Clear;
    FieldDefs.Add('Id', ftInteger, 0);
    FieldDefs.Add('IdEncabezado', ftInteger, 0);
    FieldDefs.Add('MontoDescuento', ftFloat, 0);
    FieldDefs.Add('NaturalezaDescuento', ftString, 80);
    CreateDataSet;
    Open;
  end;
end;

destructor TDL_tb_documentosdescuentos.Destroy;
begin
  Dataset.Close;
  Dataset.Free;
end;
{$ENDREGION}

end.
