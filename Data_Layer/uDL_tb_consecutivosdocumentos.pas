unit uDL_tb_consecutivosdocumentos;

interface
uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  System.Classes;

type
  TDL_tb_consecutivosdocumentos = class
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

{ TDL_tb_consecutivosdocumentos }

{$REGION 'Metodos'}
constructor TDL_tb_consecutivosdocumentos.Create;
begin
  Tabla := 'tb_consecutivosdocumentos';
  ClaseNombre := 'TDL_tb_consecutivosdocumentos';
  _IdNombre := 'Id';

  Dataset := TFDMemTable.Create(nil);
  with Dataset do
  begin
    FileName := 'tb_consecutivosdocumentos';
    FieldDefs.Clear;
    FieldDefs.Add('Id', ftInteger, 0);
    FieldDefs.Add('IdEmpresa', ftInteger, 0);
    FieldDefs.Add('Consecutivo', ftInteger, 0);
    FieldDefs.Add('Sucursal', ftInteger, 0);
    FieldDefs.Add('Terminal', ftInteger, 0);
    FieldDefs.Add('TipoDoc', ftInteger, 0);
    CreateDataSet;
    Open;
  end;
end;

destructor TDL_tb_consecutivosdocumentos.Destroy;
begin
  Dataset.Close;
  Dataset.Free;
end;
{$ENDREGION}

end.
