unit DL_DBGeneral;

interface
uses udmObjects, FireDAC.Comp.Client, System.SysUtils,
  Data.DB, Generics.Collections, System.Contnrs, System.Classes;

type
  tbs_DBGeneral = class
    tb_DBGeneral: TFDMemTable;
  const
    Tabla = '';
  private
  public
    {$REGION 'Metodos'}
    constructor Create;
    destructor Destroy;
    procedure Asignar_Id(pTabla: string; ds: TFDMemTable;
      var pResultado: Integer; var pErrorM: string);
    function Obtener_Ultimo(pTabla: string;
      var pResultado: Integer; var pErrorM: string): Integer; overload;
    function Obtener_Ultimo(pTabla: string;
      pCampo: string; pWhere: string; var pResultado: Integer;
      var pErrorM: string): Integer; overload;
    procedure DBToStruct(ds1: TFDMemTable; var pResultado: Integer;
      var pErrorM: string); overload;
    procedure DB_DBToStruct(ds1: TFDMemTable;
      var pCamposNombre: TStringList; var pResultado: Integer;
      var pErrorM: string); overload;
    procedure StructToDB(ds1: TFDMemTable;
      pCampos: TStringList; var pResultado: Integer; var pErrorM: string);
    function Obtener_ListaCampos(ds1: TFDMemTable): TStringList;
    function Crear_SQL_Insert(pTabla: string; pCampos: string): string;
    function Crear_SQL_Update(pTabla: string; pCampos: string): string;
    function Obtener_SQL_ParametrosLista(
      pCampos: TStringList): string;
    procedure Limpiar_Tag(ds1: TFDMemTable);
    procedure Insert_Generico(s1: TFDMemTable; var pResultado: Integer;
      var pErrorM: string);
    procedure Update_Generico(ds1: TFDMemTable;
      pWhere: string; var pResultado: Integer; var pErrorM: string);
    procedure Delete_Generico(pTabla: string;
      pWhere: string; var pResultado: Integer; var pErrorM: string);
    procedure Copiar_Estructura(dsOrigen: TFDMemTable;
      dsDestino: TFDMemTable; var pResultado: Integer; var pErrorM: string);
    procedure Copiar_Datos(dsOrigen: TFDMemTable;
      dsDestino: TFDMemTable; var pResultado: Integer; var pErrorM: string);
    procedure Consultar_Generico(ds1: TFDMemTable;
      pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
      pSelect: string; var pCamposNombre: TStringList;
      var pResultado: Integer; var pErrorM: string);
    {$ENDREGION}
  end;

implementation

{ tbs_DBGeneral }

{$REGION 'Metodos'}
constructor tbs_DBGeneral.Create;
begin
//
end;

destructor tbs_DBGeneral.Destroy;
begin
//
end;

procedure tbs_DBGeneral.Asignar_Id(pTabla: string; ds: TFDMemTable;
  var pResultado: Integer; var pErrorM: string);
begin
  dmObjects.DB_Asignar_Id(dmObjects.FDQuery1, pTabla, ds, pResultado, pErrorM);
end;

function tbs_DBGeneral.Obtener_Ultimo(pTabla: string;
  var pResultado: Integer; var pErrorM: string): Integer;
begin
  Result :=
    dmObjects.DB_Obtener_Ultimo(dmObjects.FDQuery1, pTabla, pResultado,
      pErrorM);
end;

function tbs_DBGeneral.Obtener_Ultimo(pTabla, pCampo,
  pWhere: string; var pResultado: Integer; var pErrorM: string): Integer;
begin
  Result :=
    dmObjects.DB_Obtener_Ultimo(dmObjects.FDQuery1, pTabla, pCampo, pWhere,
      pResultado, pErrorM);
end;

procedure tbs_DBGeneral.DBToStruct(ds1: TFDMemTable; var pResultado: Integer;
  var pErrorM: string);
begin
  dmObjects.DB_DBToStruct(dmObjects.FDQuery1, ds1, pResultado, pErrorM);
end;

procedure tbs_DBGeneral.DB_DBToStruct(ds1: TFDMemTable;
  var pCamposNombre: TStringList; var pResultado: Integer; var pErrorM: string);
begin
  dmObjects.DB_DBToStruct(dmObjects.FDQuery1, ds1, pCamposNombre, pResultado,
    pErrorM);
end;

procedure tbs_DBGeneral.StructToDB(ds1: TFDMemTable; pCampos: TStringList;
  var pResultado: Integer; var pErrorM: string);
begin
  dmObjects.DB_StructToDB(dmObjects.FDQuery1, ds1, pCampos, pResultado,
    pErrorM);
end;

function tbs_DBGeneral.Obtener_ListaCampos(ds1: TFDMemTable): TStringList;
begin
  Result :=
    dmObjects.DB_Obtener_ListaCampos(ds1);
end;

function tbs_DBGeneral.Crear_SQL_Insert(pTabla, pCampos: string): string;
begin
  Result :=
    dmObjects.DB_Crear_SQL_Insert(pTabla, pCampos);
end;

function tbs_DBGeneral.Crear_SQL_Update(pTabla, pCampos: string): string;
begin
  Result :=
    dmObjects.DB_Crear_SQL_Update(pTabla, pCampos);
end;

function tbs_DBGeneral.Obtener_SQL_ParametrosLista(
  pCampos: TStringList): string;
begin
  Result :=
    dmObjects.DB_Obtener_SQL_ParametrosLista(pCampos);
end;

procedure tbs_DBGeneral.Limpiar_Tag(ds1: TFDMemTable);
begin
  dmObjects.DB_Limpiar_Tag(ds1);
end;

procedure tbs_DBGeneral.Insert_Generico(s1: TFDMemTable;
  var pResultado: Integer; var pErrorM: string);
begin
  dmObjects.DB_Insert_Generico(dmObjects.FDQuery1, s1, pResultado, pErrorM);
end;

procedure tbs_DBGeneral.Update_Generico(ds1: TFDMemTable; pWhere: string;
  var pResultado: Integer; var pErrorM: string);
begin
  dmObjects.DB_Update_Generico(dmObjects.FDQuery1, ds1, pWhere, pResultado,
    pErrorM);
end;

procedure tbs_DBGeneral.Delete_Generico(pTabla, pWhere: string;
  var pResultado: Integer; var pErrorM: string);
begin
  dmObjects.DB_Delete_Generico(dmObjects.FDQuery1, pTabla, pWhere, pResultado,
    pErrorM);
end;

procedure tbs_DBGeneral.Copiar_Estructura(dsOrigen, dsDestino: TFDMemTable;
  var pResultado: Integer; var pErrorM: string);
begin
  dmObjects.DB_Copiar_Estructura(dsOrigen, dsDestino, pResultado, pErrorM);
end;

procedure tbs_DBGeneral.Copiar_Datos(dsOrigen, dsDestino: TFDMemTable;
  var pResultado: Integer; var pErrorM: string);
begin
  dmObjects.DB_Copiar_Datos(dsOrigen, dsDestino, pResultado, pErrorM);
end;

procedure tbs_DBGeneral.Consultar_Generico(ds1: TFDMemTable; pWhere, pOrderBy,
  pGroupBy, pHaving, pSelect: string; var pCamposNombre: TStringList;
  var pResultado: Integer; var pErrorM: string);
begin
  dmObjects.DB_Consultar_Generico(dmObjects.FDQuery1, ds1, pWhere,
    pOrderBy, pGroupBy, pHaving, pSelect, pCamposNombre, pResultado, pErrorM);
end;
{$ENDREGION}

end.
