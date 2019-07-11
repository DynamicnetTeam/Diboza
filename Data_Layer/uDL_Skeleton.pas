unit uDL_Skeleton;

interface
uses udmObjects, FireDAC.Comp.Client, System.SysUtils, Data.DB,
  System.Classes;

type
  TDatasetMem = TFDMemTable;

  TDL_Skeleton = class
    Dataset: TDatasetMem;
    _ListaCampos: TStringList;
  const
    Tabla = 'tb_Nombre';
    ClaseNombre = 'Skeleton';
  public
    {$REGION 'Metodos'}
    constructor Create;
    destructor Destroy;
    procedure Consultar(var pResultado: Integer; var pErrorM: string;
      pWhere: string = ''; pOrderBy: string = '';
      pGroupBy: string = ''; pHaving: string = ''; pSelect: string = '';
      pds1: TDatasetMem = nil);
    procedure Insertar(var pResultado: Integer; var pErrorM: string);
    procedure Modificar(pWhere: string; var pResultado: Integer;
      var pErrorM: string);
    procedure Eliminar(pWhere: string; var pResultado: Integer;
      var pErrorM: string);
    procedure Limpiar_Tag;
    function Existe_Id(pWhere: string; var pResultado: Integer;
      var pErrorM: string): Boolean;
    function Obtener_Id(pWhere: string; var pResultado: Integer;
      var pErrorM: string): Integer;
    function Existe_Campo(pWhere: string;
      pCampo: string; pResultado: Integer;
      var pErrorM: string): Boolean;
    function Obtener_Valor(pWhere: string;
      pCampo: string; var pResultado: Integer;
      var pErrorM: string): Variant;
    procedure Actualizar_Campo(pWhere: string;
      pCampo: string; pValor: Variant; var pResultado: Integer;
      var pErrorM: string);
    {$ENDREGION}
  end;

implementation

{ TDL_Skeleton }

{$REGION 'Metodos'}
constructor TDL_Skeleton.Create;
begin
  Dataset := TDatasetMem.Create(nil);
  with Dataset do
  begin
    FileName := Tabla;
    FieldDefs.Clear;
    CreateDataSet;
    Open;
  end;

  _ListaCampos := TStringList.Create;
end;

destructor TDL_Skeleton.Destroy;
begin
  Dataset.Close;
  Dataset.Free;
  _ListaCampos.Free;
end;

procedure TDL_Skeleton.Consultar(var pResultado: Integer;
  var pErrorM: string; pWhere, pOrderBy, pGroupBy, pHaving,
  pSelect: string; pds1: TDatasetMem);
var
  mWhere, mOrderBy, mGroupBy, mHaving, mSelect: string;
begin
  if Trim(pWhere) <> '' then
    mWhere := 'Where ' + pWhere;
  if Trim(pOrderBy) <> '' then
    mOrderBy := 'Order By  ' + pOrderBy;
  if Trim(pGroupBy) <> '' then
    mGroupBy := 'Group By  ' + pGroupBy;
  if Trim(pHaving) <> '' then
    mHaving := 'Having  ' + pHaving;
  if Trim(pSelect) <> '' then
    mSelect := 'Select  ' + pSelect;
  if Trim(pSelect) = '' then
    dmObjects.DB_Skeleton_Consultar(dmObjects.FDQuery1, Dataset,
      mWhere, mOrderBy, mGroupBy, mHaving, Tabla, ClaseNombre,pResultado, pErrorM)
  else
    dmObjects.DB_Consultar_Generico(dmObjects.FDQuery1, pds1,
      pWhere, pOrderBy, pGroupBy, pHaving, pSelect, _ListaCampos,
      pResultado, pErrorM);
end;

procedure TDL_Skeleton.Insertar(var pResultado: Integer; var pErrorM: string);
begin
  dmObjects.DB_Skeleton_Insertar(dmObjects.FDQuery1, Dataset, ClaseNombre,
    pResultado, pErrorM);
end;

procedure TDL_Skeleton.Modificar(pWhere: string; var pResultado: Integer;
  var pErrorM: string);
var
  mWhere: string;
begin
  if Trim(pWhere) <> '' then
    mWhere := 'Where ' + pWhere;
  dmObjects.DB_Skeleton_Modificar(dmObjects.FDQuery1, Dataset, mWhere,
    ClaseNombre, pResultado, pErrorM);
end;

procedure TDL_Skeleton.Eliminar(pWhere: string; var pResultado: Integer;
  var pErrorM: string);
var
  mWhere: string;
begin
  if Trim(pWhere) <> '' then
    mWhere := 'Where ' + pWhere;
  dmObjects.DB_Skeleton_Eliminar(dmObjects.FDQuery1, mWhere, Tabla, ClaseNombre,
    pResultado, pErrorM);
end;

procedure TDL_Skeleton.Limpiar_Tag;
begin
  dmObjects.DB_Limpiar_Tag(Dataset);
end;

function TDL_Skeleton.Existe_Id(pWhere: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mWhere: string;
begin
  if Trim(pWhere) <> '' then
    mWhere := 'Where ' + pWhere;
  Result :=
    dmObjects.DB_Skeleton_Existe_Id(dmObjects.FDQuery1, mWhere, Tabla,
      ClaseNombre, pResultado, pErrorM);
end;

function TDL_Skeleton.Obtener_Id(pWhere: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mWhere: string;
begin
  if Trim(pWhere) <> '' then
    mWhere := 'Where ' + pWhere;
  Result :=
    dmObjects.DB_Skeleton_Obtener_Id(dmObjects.FDQuery1, mWhere, Tabla,
      ClaseNombre, pResultado, pErrorM);
end;

function TDL_Skeleton.Existe_Campo(pWhere, pCampo: string; pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mWhere: string;
begin
  if Trim(pWhere) <> '' then
    mWhere := 'Where ' + pWhere;
  Result :=
    dmObjects.DB_Skeleton_Existe_Campo(dmObjects.FDQuery1, mWhere, Tabla,
      pCampo, ClaseNombre, pResultado, pErrorM);
end;

function TDL_Skeleton.Obtener_Valor(pWhere, pCampo: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mWhere: string;
begin
  if Trim(pWhere) <> '' then
    mWhere := 'Where ' + pWhere;
  Result :=
    dmObjects.DB_Skeleton_Obtener_Valor(dmObjects.FDQuery1, mWhere, Tabla,
      pCampo, ClaseNombre, pResultado, pErrorM);
end;

procedure TDL_Skeleton.Actualizar_Campo(pWhere, pCampo: string; pValor: Variant;
  var pResultado: Integer; var pErrorM: string);
var
  mWhere: string;
begin
  if Trim(pWhere) <> '' then
    mWhere := 'Where ' + pWhere;
  dmObjects.DB_Skeleton_Actualizar_Campo(dmObjects.FDQuery1, mWhere, Tabla,
    pCampo, pValor, ClaseNombre, pResultado, pErrorM);
end;
{$ENDREGION}

end.
