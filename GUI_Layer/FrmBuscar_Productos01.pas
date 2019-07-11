unit FrmBuscar_Productos01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, Vcl.ComCtrls,
  RzListVw, RzStatus, Vcl.StdCtrls, Vcl.Buttons,
  System.RegularExpressions, uDL_Skeleton, Vcl.ImgList;

type
  TFormBuscar_Productos01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnCerrar: TBitBtn;
    pnlFiltro: TRzPanel;
    edtBuscar: TButtonedEdit;
    pnlListaTitulo: TRzPanel;
    stbEstado1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    lvLista1: TRzListView;
    btnSeleccionar: TBitBtn;
    btnBuscar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnSeleccionarClick(Sender: TObject);
    procedure lvLista1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure btnBuscarClick(Sender: TObject);
  private
    FId: Integer;
    FCodigo: string;
    FWhere: string;
    function WhereDefault: Boolean;
  public
    property _Id: Integer read FId write FId;
    property _Codigo: string read FCodigo write FCodigo;
    property _Where: string read FWhere write FWhere stored WhereDefault;
  end;

var
  FormBuscar_Productos01: TFormBuscar_Productos01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Seleccionar;
  procedure Cerrar;
  procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
  procedure Buscar(pTexto: string);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, BS_DBConexion, udmLenguajes,
  FrmMensaje_Espera01, uDL_TB_PRODUCTOS;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_PRODUCTOS;

const
  lv_Nombre = 0;
  lv_id = 1;

var
  Forma01: TFormBuscar_Productos01;
  _IdProducto: Integer;

{$REGION 'Funciones Forma'}
function TFormBuscar_Productos01.WhereDefault: Boolean;
begin
  Result := FWhere <> '';
end;

procedure TFormBuscar_Productos01.FormShow(Sender: TObject);
begin
  Forma01 := FormBuscar_Productos01;

  InicializarForma;
end;

procedure TFormBuscar_Productos01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormBuscar_Productos01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormBuscar_Productos01.btnSeleccionarClick(Sender: TObject);
begin
  Seleccionar;
end;

procedure TFormBuscar_Productos01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormBuscar_Productos01.btnBuscarClick(Sender: TObject);
begin
  Buscar(edtBuscar.Text);
end;

procedure TFormBuscar_Productos01.lvLista1CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
var
  mLinea: string;
  mExistencia: Double;
begin
  if SubItem = 6 then
  begin
    mLinea := Item.SubItems[7];
    try
      mExistencia := StrToFloat(mLinea);
    except
      mExistencia := 0;
    end;
    if mExistencia <= 0 then
    begin
      Sender.Canvas.Font.Color := clWhite;
      Sender.Canvas.Brush.Color := clRed;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      _IdProducto := 0;
      lvLista1.Items.Clear;
      edtBuscar.Clear;

      LimpiarCampos;
      CargarIdioma;
      edtBuscar.SetFocus;
    except
      if _Resultado = -1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
        PostMessage(Handle, WM_CLOSE, 0, 0);
      end;
      _Resultado := -1;
    end;

  end;
end;

procedure FinalizarForma;
begin
  with Forma01 do
  begin

    try

    except
    end;

  end;
end;

procedure KeyDownForma(var Key: Word; Shift: TShiftState);
begin
  with Forma01 do
  begin

    if Key = VK_ESCAPE then
    begin
      Key := 0;
      Close;
    end;
    if (Key = (ord('T') Or ord('t'))) and (Shift = [ssCtrl]) then
    begin
      Key := 0;
      lvLista1.SetFocus;
    end;

  end;
end;

procedure LimpiarCampos;
begin
  with Forma01 do
  begin


  end;
end;

procedure Seleccionar;
var
  mLinea: string;
begin
  with Forma01 do
  begin

    if lvLista1.Selected <> nil then
    begin
      mLinea := lvLista1.Selected.SubItems[5];
      try
        _Id := StrToInt(mLinea);
      except
        _Id := 0;
      end;
      if _Id > 0 then
      begin
        _Codigo := lvLista1.Selected.Caption;
        Tag := 1;
        Close;
      end;
    end;

  end;
end;

procedure Cerrar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
begin
  with Forma01 do
  begin

    lv.Items.Clear;

    with ds1 do
    begin
      RzStatusPane1.Caption := 'Registros: ' +
        FormatFloat('#,##0', RecordCount);
      First;
      while not Eof do
      begin
        with lv.Items.Add do
        begin
          Caption :=
            FieldByName('CODIGO').AsString;
          SubItems.Add(
            FieldByName('NOMBRE').AsString);
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('UTILIDAD').AsFloat));
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('PRECIOCOSTO').AsFloat));
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('PRECIOVENTA').AsFloat));
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('PRECIOMAYORISTA').AsFloat));
          SubItems.Add(
            FieldByName('ID').AsString);
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('Existencia').AsFloat));
          SubItems.Add(
            FieldByName('Existencia').AsString);
        end;
        Next;
      end;
    end;

  end;
end;

procedure Buscar(pTexto: string);
var
  mTexto: string;
  mBS_Productos: Clase_Tipo1;
  mWhere, mOrderBy: TStringList;
  mBuscar, mBuscar2, mWhere2: string;
begin
  with Forma01 do
  begin

    lvLista1.Items.Clear;
    RzStatusPane1.Caption := 'Registros: 0';

    mTexto := pTexto;
    mTexto := Trim(mTexto);
    mTexto := UpperCase(mTexto);
    mBuscar := QuotedStr(mTexto + '%');
    mBuscar2 := QuotedStr(mTexto);
//    mBuscar := QuotedStr('%' + mTexto + '%');
    mWhere2 := '';
    if _Where <> '' then
      mWhere2 := ' And ' + _Where;
    if mTexto <> '' then
    begin
      mBS_Productos := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mOrderBy := TStringList.Create;
      mWhere.Add('(UPPER(A.Codigo) = UPPER(' + mBuscar2 + '))');
      mWhere.Add(' Or ');
      mWhere.Add('(UPPER(A.Nombre) like UPPER(' + mBuscar + '))');
      mWhere.Add(' Or ');
      mWhere.Add('(A.CODIGOBARRAS = ' + mBuscar2 + ')');
      mWhere.Add(mWhere2);
      mOrderBy.Add('A.Nombre');
      mBS_Productos.Consultar(_Resultado, _ErrorM, mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      LlenarlvLista1(lvLista1, mBS_Productos.Dataset);
      mBS_Productos.Destroy;
    end;

  end;
end;

procedure CargarIdioma;
var
  mValor: string;
  mCount, mLen, mCount2: Integer;
begin
  with Forma01 do
  begin

    for mCount := 0 to Forma01.ComponentCount - 1 do
    begin
      if Forma01.Components[mCount] is TLabel then
      begin
        mValor := TLabel(Forma01.Components[mCount]).Caption;
        mLen := Length(mValor);
        if mValor[mLen] = ':' then
          mValor := Copy(mValor, 1, mLen - 1);
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TLabel(Forma01.Components[mCount]).Caption := mValor;
      end;
      if Forma01.Components[mCount] is TBitBtn then
      begin
        mValor := TBitBtn(Forma01.Components[mCount]).Caption;
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TBitBtn(Forma01.Components[mCount]).Caption := mValor;
      end;
      if Forma01.Components[mCount] is TRzPanel then
      begin
        mValor := TRzPanel(Forma01.Components[mCount]).Caption;
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TRzPanel(Forma01.Components[mCount]).Caption := mValor;
      end;
      if Forma01.Components[mCount] is TRzListView then
      begin
        for mCount2 := 0 to TRzListView(Forma01.Components[mCount]).Columns.Count - 1 do
        begin
          mValor := TRzListView(Forma01.Components[mCount]).Columns[mCount2].Caption;
          mValor := dmLenguajes.GetValue(mValor);
          if Trim(mValor) <> '' then
            TRzListView(Forma01.Components[mCount]).Columns[mCount2].Caption := mValor;
        end;
      end;
    end;

  end;
end;
{$ENDREGION}

end.
