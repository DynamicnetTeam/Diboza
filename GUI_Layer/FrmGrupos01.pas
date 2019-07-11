unit FrmGrupos01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzTabs, Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, uDL_Skeleton, Vcl.ComCtrls, RzListVw, RzStatus,
  Vcl.Mask, RxToolEdit, RxCurrEdit, FireDAC.Comp.Client, Data.DB;

type
  TFormGrupos01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlAccion: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pgcCampos: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    pnlLista: TRzPanel;
    pnlListaOpciones: TRzPanel;
    pnlListaTitulo: TRzPanel;
    chkTodoLista1: TCheckBox;
    stbEstado1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    RzStatusPane2: TRzStatusPane;
    lvLista1: TRzListView;
    pnlListaOpciones1: TRzPanel;
    Label2: TLabel;
    cbProductos: TComboBoxEx;
    Label3: TLabel;
    edtCantidad: TCurrencyEdit;
    btnBuscar_Producto: TBitBtn;
    btnInsertarLinea: TBitBtn;
    btnEliminarLinea: TBitBtn;
    pnlCampos: TRzPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    edtCodigo: TEdit;
    edtCodigoBarras: TEdit;
    cbProveedor: TComboBoxEx;
    cbImpuesto: TComboBoxEx;
    cbFamilia: TComboBoxEx;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtUtilidad: TCurrencyEdit;
    edtCosto: TCurrencyEdit;
    edtVenta: TCurrencyEdit;
    edtMayorista: TCurrencyEdit;
    edtExistencia: TCurrencyEdit;
    edtMinimo: TCurrencyEdit;
    edtVentaIVA: TCurrencyEdit;
    dtpVencimiento: TDateTimePicker;
    RzPanel1: TRzPanel;
    edtNombre: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnBuscar_ProductoClick(Sender: TObject);
    procedure btnInsertarLineaClick(Sender: TObject);
    procedure btnEliminarLineaClick(Sender: TObject);
    procedure cbProductosChange(Sender: TObject);
    procedure chkTodoLista1Click(Sender: TObject);
    procedure cbImpuestoChange(Sender: TObject);
    procedure edtVentaChange(Sender: TObject);
    procedure edtUtilidadExit(Sender: TObject);
  private
    FId: Integer;
    FOpcion: Integer;
    FIdProducto: Integer;
  public
    property _Id: Integer read FId write FId;
    property _Opcion: Integer read FOpcion write FOpcion;
    property _IdProducto: Integer read FIdProducto write FIdProducto;
  end;

var
  FormGrupos01: TFormGrupos01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure DBToForma(ds1: TDatasetMem);
  procedure Consultar_Data(pId: Integer);
  procedure Consultar_Data_Detalle(pId: Integer);
  procedure CamposValidos;
  procedure Insertar_Data;
  procedure Modificar_Data(pId: Integer);
  procedure LlenarcbProductos(cb: TComboBoxEx);
  procedure Buscar_Producto;
  procedure Insertar_Detalle;
  procedure Eliminar_Detalle;
  procedure LlenarLista;
  procedure ActualizarTotales;
  procedure Consultar_Producto(pId: Integer);
  procedure MDLista_Todos(lv: TRzListView; chk: TCheckBox);
  procedure LlenarcbProveedores(cb: TComboBoxEx);
  procedure LlenarcbImpuestos(cb: TComboBoxEx);
  procedure LlenarcbFamilias(cb: TComboBoxEx);
  procedure CamposValidos_Productos;
  procedure Insertar_Data_Productos;
  procedure DBToForma_Productos(ds1: TDatasetMem);
  procedure Consultar_Data_Productos(pId: Integer);
  procedure Actualizar_Impuesto;
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_GruposEncabezado, BS_DBConexion, DL_DBGeneral,
  FrmBuscar_Productos01, uDL_TB_PRODUCTOS, uDL_TB_GruposDetalle,
  uDL_TB_FAMILIAS, uDL_TB_PROVEEDORES, uDL_TB_IMPUESTOS, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_tb_grupos_encabezado;
  Clase_Tipo2 = TDL_tb_grupos_detalle;

var
  Forma01: TFormGrupos01;
  _Nombre: string;
  _DL_tb_grupos_detalle: Clase_Tipo2;
  _Compra: Double;

{$REGION 'Funciones Forma'}
procedure TFormGrupos01.FormShow(Sender: TObject);
begin
  Forma01 := FormGrupos01;

  InicializarForma;
end;

procedure TFormGrupos01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormGrupos01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormGrupos01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormGrupos01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormGrupos01.btnBuscar_ProductoClick(Sender: TObject);
begin
  Buscar_Producto;
end;

procedure TFormGrupos01.btnInsertarLineaClick(Sender: TObject);
begin
  Insertar_Detalle;
end;

procedure TFormGrupos01.btnEliminarLineaClick(Sender: TObject);
begin
  Eliminar_Detalle;
end;

procedure TFormGrupos01.cbProductosChange(Sender: TObject);
begin
  Consultar_Producto(GetCombo(cbProductos));
end;

procedure TFormGrupos01.chkTodoLista1Click(Sender: TObject);
begin
  MDLista_Todos(lvLista1, chkTodoLista1);
end;

procedure TFormGrupos01.edtUtilidadExit(Sender: TObject);
var
  mUtilidad, mUtilidadPM: Double;
  mCompra, mVenta: Double;
begin
  mUtilidad := edtUtilidad.Value;
  mCompra := edtCosto.Value;
  mUtilidadPM := 0;
  if mUtilidad > 0 then
    mUtilidadPM := mUtilidad / 100;
  mVenta := (mCompra * mUtilidadPM) + mCompra;
  edtVenta.Value := mVenta;
end;

procedure TFormGrupos01.cbImpuestoChange(Sender: TObject);
begin
  Actualizar_Impuesto;
end;

procedure TFormGrupos01.edtVentaChange(Sender: TObject);
begin
  Actualizar_Impuesto;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
var
  mbs_DBGeneral: tbs_DBGeneral;
  mUltimo: Integer;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      _Compra := 0;

      _DL_tb_grupos_detalle := Clase_Tipo2.Create;

      LlenarcbProveedores(cbProveedor);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarcbImpuestos(cbImpuesto);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarcbFamilias(cbFamilia);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarcbProductos(cbProductos);
      if _Resultado = -1 then
        raise Exception.Create('');

      LimpiarCampos;
      CargarIdioma;

      case _Opcion of
        1: begin
          pnlAccion.Caption := 'NUEVO';
          pnlCampos.Enabled := True;
          mbs_DBGeneral := tbs_DBGeneral.Create;
          mUltimo :=
            mbs_DBGeneral.Obtener_Ultimo('TB_PRODUCTOS', _Resultado, _ErrorM);
          if _Resultado = -1 then
            raise Exception.Create('');
          mbs_DBGeneral.Destroy;
          Inc(mUltimo);
          edtCodigo.Text := IntToStr(mUltimo);
        end;
        2: begin
          pnlAccion.Caption := 'MODIFICAR';
          Consultar_Data(_Id);
          if _Resultado = -1 then
            raise Exception.Create('');
          Consultar_Data_Detalle(_Id);
          if _Resultado = -1 then
            raise Exception.Create('');
          Consultar_Data_Productos(_IdProducto);
          if _Resultado = -1 then
            raise Exception.Create('');
          pnlCampos.Enabled := False;
        end;
      end;
      edtNombre.SetFocus;
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
      _DL_tb_grupos_detalle.Destroy;
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
    if Key = VK_F10 then
    begin
      Key := 0;
      btnAceptar.Click;
    end;
    if Key = VK_F11 then
    begin
      Key := 0;
      btnCancelar.Click;
    end;

  end;
end;

procedure LimpiarCampos;
begin
  with Forma01 do
  begin

    _Nombre := '';
    pgcCampos.ActivePageIndex := 0;
    edtNombre.Clear;
    cbProductos.ItemIndex := 0;
    edtCantidad.Value := 1;
    chkTodoLista1.Checked := False;
    lvLista1.Items.Clear;
    RzStatusPane1.Caption := 'Registros: 0';
    RzStatusPane2.Caption := 'Valor: 0';
    edtCodigo.Clear;
    edtCodigoBarras.Clear;
    cbProveedor.ItemIndex := 0;
    cbImpuesto.ItemIndex := 0;
    edtUtilidad.Value := 0;
    edtCosto.Value := 0;
    edtVenta.Value := 0;
    edtMayorista.Value := 0;
    edtExistencia.Value := 0;
    edtMinimo.Value := 0;
    edtVentaIVA.Value := 0;
    cbFamilia.ItemIndex := 0;
    dtpVencimiento.Date := Date;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    case _Opcion of
      1: Insertar_Data;
      2: Modificar_Data(_Id);
    end;

    if _Resultado = 1 then
    begin
      Tag := 1;
      Close;
    end;

  end;
end;

procedure Cancelar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure DBToForma(ds1: TDatasetMem);
begin
  with Forma01 do
  begin

    with ds1 do
    begin
      _Nombre :=
        FieldByName('Nombre').AsString;
      edtNombre.Text :=
        FieldByName('Nombre').AsString;
    end;

  end;
end;

procedure Consultar_Data(pId: Integer);
var
  mDL_tb_grupos_encabezado: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mDL_tb_grupos_encabezado := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mDL_tb_grupos_encabezado.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToForma(mDL_tb_grupos_encabezado.Dataset);
      mDL_tb_grupos_encabezado.Destroy;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      mResultado := _Resultado;
      mErrorM := _ErrorM;
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := mResultado;
      _ErrorM := mErrorM;
      _Resultado := -1;
    end;

  end;
end;

procedure Consultar_Data_Detalle(pId: Integer);
var
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mWhere := TStringList.Create;
      mWhere.Add('A.IdEncabezado=' + IntToStr(pId));
      _DL_tb_grupos_detalle.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      LlenarLista;
      ActualizarTotales;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      mResultado := _Resultado;
      mErrorM := _ErrorM;
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := mResultado;
      _ErrorM := mErrorM;
      _Resultado := -1;
    end;

  end;
end;

procedure CamposValidos;
var
  mValido: Boolean;
  mDL_tb_grupos_encabezado: Clase_Tipo1;
  mEncontrado: Boolean;
  mWhere: TStringList;
  mNombre: string;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if (mValido = True) and (Trim(edtNombre.Text) = '') then
    begin
      mValido := False;
      _ErrorM := 'El nombre no puede estar vacio';
    end;

    if _Opcion = 1 then
      mNombre := Trim(edtNombre.Text);
    if _Opcion = 2 then
    begin
      // Nombre
      if Trim(_Nombre) = Trim(edtNombre.Text) then
        mNombre := _Nombre;
      if Trim(_Nombre) <> Trim(edtNombre.Text) then
        mNombre := Trim(edtNombre.Text);
    end;
    // Valida Nombre
    mDL_tb_grupos_encabezado := Clase_Tipo1.Create;
    mWhere := TStringList.Create;
    mWhere.Add('Nombre=' + QuotedStr(mNombre));
    mEncontrado :=
      mDL_tb_grupos_encabezado.Existe_Campo(mWhere.Text, 'Nombre', _Resultado, _ErrorM);
    mWhere.Free;
    mDL_tb_grupos_encabezado.Destroy;
    if _Opcion = 1 then
    begin
      if (mValido = True) and (mEncontrado = True) then
      begin
        mValido := False;
        _ErrorM := 'El nombre ya existe';
      end;
    end;
    if _Opcion = 2 then
    begin
      if Trim(edtNombre.Text) = _Nombre then
      begin
        if (mValido = True) and (mEncontrado = False) then
        begin
          mValido := False;
          _ErrorM := 'El nombre no existe';
        end;
      end;
      if Trim(edtNombre.Text) <> _Nombre then
      begin
        if (mValido = True) and (mEncontrado = True) then
        begin
          mValido := False;
          _ErrorM := 'El nombre ya existe';
        end;
      end;
    end;

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure Insertar_Data;
var
  mDL_tb_grupos_encabezado: Clase_Tipo1;
  mbs_DBGeneral: tbs_DBGeneral;
  mWhere: TStringList;
  mId, mIdProducto: Integer;
  mResultado, mUltimo: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      CamposValidos;
      if _Resultado = 0 then
        raise Exception.Create('');

      Insertar_Data_Productos;
      if _Resultado = -1 then
        raise Exception.Create('');

      mbs_DBGeneral := tbs_DBGeneral.Create;
      mIdProducto :=
        mbs_DBGeneral.Obtener_Ultimo('TB_PRODUCTOS', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mbs_DBGeneral.Destroy;

      // Encabezado
      mDL_tb_grupos_encabezado := Clase_Tipo1.Create;
      with mDL_tb_grupos_encabezado.Dataset do
      begin
        EmptyDataSet;
        mDL_tb_grupos_encabezado.Limpiar_Tag;
        Append;
        FieldByName('NOMBRE').Tag := 1;
        FieldByName('NOMBRE').AsString :=
          edtNombre.Text;
        FieldByName('TotalVenta').Tag := 1;
        FieldByName('TotalVenta').AsFloat := 0;
        FieldByName('TotalCompra').Tag := 1;
        FieldByName('TotalCompra').AsFloat :=
          _Compra;
        FieldByName('IdProducto').Tag := 1;
        FieldByName('IdProducto').AsFloat :=
          mIdProducto;
        Post;
      end;
      mDL_tb_grupos_encabezado.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_tb_grupos_encabezado.Destroy;

      mbs_DBGeneral := tbs_DBGeneral.Create;
      mUltimo :=
        mbs_DBGeneral.Obtener_Ultimo('tb_grupos_encabezado', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mbs_DBGeneral.Destroy;

      // Detalle
      with _DL_tb_grupos_detalle.Dataset do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('IdEncabezado').Tag := 1;
          FieldByName('IdEncabezado').AsInteger :=
            mUltimo;
          Post;
          Next;
        end;
      end;
      _DL_tb_grupos_detalle.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      mResultado := _Resultado;
      mErrorM := _ErrorM;
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := mResultado;
      _ErrorM := mErrorM;
      if _Resultado = -1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
      end;
      if _Resultado = 0 then
      begin
        Application.MessageBox(PChar(_ErrorM),
          'Advertencia', MB_ICONWARNING);
      end;
      _Resultado := -1;
    end;

  end;
end;

procedure Modificar_Data(pId: Integer);
var
  mDL_tb_grupos_encabezado: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      CamposValidos;
      if _Resultado = 0 then
        raise Exception.Create('');

      // Encabezado
      mDL_tb_grupos_encabezado := Clase_Tipo1.Create;
      with mDL_tb_grupos_encabezado.Dataset do
      begin
        EmptyDataSet;
        mDL_tb_grupos_encabezado.Limpiar_Tag;
        Append;
        FieldByName('NOMBRE').Tag := 1;
        FieldByName('NOMBRE').AsString :=
          edtNombre.Text;
        FieldByName('TotalVenta').Tag := 1;
        FieldByName('TotalVenta').AsFloat := 0;
        FieldByName('TotalCompra').Tag := 1;
        FieldByName('TotalCompra').AsFloat :=
          _Compra;
        Post;
      end;
      mDL_tb_grupos_encabezado.Modificar('Id=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_tb_grupos_encabezado.Destroy;

      // Detalle
      _DL_tb_grupos_detalle.Eliminar('IdEncabezado=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      with _DL_tb_grupos_detalle.Dataset do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('IdEncabezado').Tag := 1;
          FieldByName('IdEncabezado').AsInteger :=
            pId;
          Post;
          Next;
        end;
      end;
      _DL_tb_grupos_detalle.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      mResultado := _Resultado;
      mErrorM := _ErrorM;
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := mResultado;
      _ErrorM := mErrorM;
      if _Resultado = -1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
      end;
      if _Resultado = 0 then
      begin
        Application.MessageBox(PChar(_ErrorM),
          'Advertencia', MB_ICONWARNING);
      end;
      _Resultado := -1;
    end;

  end;
end;

procedure LlenarcbProductos(cb: TComboBoxEx);
var
  mDL_TB_PRODUCTOS: TDL_TB_PRODUCTOS;
  mWhere, mOrderBy: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      cb.Items.Clear;
      cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

      mWhere := TStringList.Create;
      mOrderBy := TStringList.Create;
      mOrderBy.Add('A.NOMBRE');
      mWhere.Add('A.ESCOMPUESTO=0');
      mDL_TB_PRODUCTOS := TDL_TB_PRODUCTOS.Create;
      mDL_TB_PRODUCTOS.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_PRODUCTOS.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(
            FieldByName('NOMBRE').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_PRODUCTOS.Destroy;

      _Resultado := 1;
    except
      if _Resultado = -1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
      end;
      if _Resultado = 0 then
      begin
        Application.MessageBox(PChar(_ErrorM),
          'Advertencia', MB_ICONWARNING);
      end;
      _Resultado := -1;
    end;

  end;
end;

procedure Buscar_Producto;
begin
  with Forma01 do
  begin

    FormBuscar_Productos01._Where := '';
    FormBuscar_Productos01._Where := '(A.ESCOMPUESTO=0)';
    FormBuscar_Productos01.ShowModal;
    if FormBuscar_Productos01.Tag = 1 then
      cbProductos.ItemIndex := SetCombo(cbProductos,
        FormBuscar_Productos01._Id);

  end;
end;

procedure Insertar_Detalle;
var
  mIdProducto: Integer;
  mEncontrado: Boolean;
  mCantidad: Double;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mCantidad := edtCantidad.Value;

      mIdProducto := GetCombo(cbProductos);
      if mIdProducto <= 0 then
      begin
        _ErrorM := 'Dbe seleccionar un producto';
        _Resultado := 0;
        raise Exception.Create('');
      end;

      mEncontrado :=
        _DL_tb_grupos_detalle.Dataset.Locate('IdProducto', mIdProducto, []);
      if mEncontrado = True then
        mCantidad := mCantidad +
          _DL_tb_grupos_detalle.Dataset.FieldByName('Cantidad').AsFloat;

      with _DL_tb_grupos_detalle.Dataset do
      begin
        if mEncontrado = True then
          Edit;
        if mEncontrado = False then
          Append;
        FieldByName('IdProducto').Tag := 1;
        FieldByName('IdProducto').AsInteger :=
          mIdProducto;
        FieldByName('Cantidad').Tag := 1;
        FieldByName('Cantidad').AsFloat :=
          mCantidad;
        FieldByName('PrecioFinal').Tag := 1;
        FieldByName('PrecioFinal').AsFloat :=
          _Compra;
        FieldByName('ProductoNombre').Tag := 1;
        FieldByName('ProductoNombre').AsString :=
          Trim(cbProductos.Text);
        Post;
      end;

      LlenarLista;
      ActualizarTotales;

      cbProductos.ItemIndex := 0;
      edtCantidad.Value := 1;

      _Resultado := 1;
    except
      Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
        'Error', MB_ICONERROR);
      _Resultado := -1;
    end;

  end;
end;

procedure Eliminar_Detalle;
var
  mFila: Integer;
  mLinea: string;
  mIdProducto: Integer;
  mEncontrado: Boolean;
begin
  with Forma01 do
  begin

    for mFila := 0 to lvLista1.Items.Count - 1 do
    begin
      if lvLista1.Items[mFila].Checked = True then
      begin
        mLinea := lvLista1.Items[mFila].SubItems[3];
        try
          mIdProducto := StrToInt(mLinea);
        except
          mIdProducto := 0;
        end;
        if mIdProducto > 0 then
        begin
          mEncontrado :=
            _DL_tb_grupos_detalle.Dataset.Locate('IdProducto', mIdProducto, []);
          if mEncontrado = True then
            _DL_tb_grupos_detalle.Dataset.Delete;
        end;
      end;
    end;
    LlenarLista;
    ActualizarTotales;

  end;
end;

procedure LlenarLista;
begin
  with Forma01 do
  begin

    lvLista1.Items.Clear;

    with _DL_tb_grupos_detalle.Dataset do
    begin
      First;
      RzStatusPane1.Caption := 'Registros: ' +
        FormatFloat('#,##0', RecordCount);
      while not Eof do
      begin
        with lvLista1.Items.Add do
        begin
          Caption := '';
          SubItems.Add(
            FieldByName('ProductoNombre').AsString);
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('Cantidad').AsFloat));
          SubItems.Add(
            FieldByName('PrecioFinal').AsString);
          SubItems.Add(
            FieldByName('IdProducto').AsString);
        end;

        Next;
      end;
    end;

  end;
end;

procedure ActualizarTotales;
var
  mPrecio: Double;
begin
  with Forma01 do
  begin

    mPrecio := 0;

    with _DL_tb_grupos_detalle.Dataset do
    begin
      First;
      while not Eof do
      begin
        mPrecio := mPrecio +
          FieldByName('PrecioFinal').AsFloat;

        Next;
      end;
    end;

    RzStatusPane2.Caption := 'Valor: ' +
      FormatFloat('#,##0.00', mPrecio);

  end;
end;

procedure Consultar_Producto(pId: Integer);
var
  mDL_TB_PRODUCTOS: TDL_TB_PRODUCTOS;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _Compra := 0;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mDL_TB_PRODUCTOS := TDL_TB_PRODUCTOS.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mDL_TB_PRODUCTOS.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      with mDL_TB_PRODUCTOS.Dataset do
      begin
        if IsEmpty = False then
        begin
          _Compra :=
            FieldByName('PRECIOCOSTO').AsFloat;
        end;
      end;
      mDL_TB_PRODUCTOS.Destroy;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      mResultado := _Resultado;
      mErrorM := _ErrorM;
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := mResultado;
      _ErrorM := mErrorM;
      _Resultado := -1;
    end;

  end;
end;

procedure MDLista_Todos(lv: TRzListView; chk: TCheckBox);
var
  mFila: Integer;
begin
  with Forma01 do
  begin

    for mFila := 0 to lv.Items.Count - 1 do
      lv.Items[mFila].Checked := chk.Checked;

  end;
end;

procedure LlenarcbProveedores(cb: TComboBoxEx);
var
  mDL_TB_PROVEEDORES: TDL_TB_PROVEEDORES;
  mWhere, mOrderBy: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      cb.Items.Clear;
      cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

      mWhere := TStringList.Create;
      mOrderBy := TStringList.Create;
      mOrderBy.Add('A.NOMBRECOMPLETO');
      mDL_TB_PROVEEDORES := TDL_TB_PROVEEDORES.Create;
      mDL_TB_PROVEEDORES.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_PROVEEDORES.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(
            FieldByName('NOMBRECOMPLETO').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_PROVEEDORES.Destroy;

      _Resultado := 1;
    except
      if _Resultado = -1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
      end;
      if _Resultado = 0 then
      begin
        Application.MessageBox(PChar(_ErrorM),
          'Advertencia', MB_ICONWARNING);
      end;
      _Resultado := -1;
    end;

  end;
end;

procedure LlenarcbImpuestos(cb: TComboBoxEx);
var
  mDL_TB_IMPUESTOS: TDL_TB_IMPUESTOS;
  mWhere, mOrderBy: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      cb.Items.Clear;
      cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

      mWhere := TStringList.Create;
      mOrderBy := TStringList.Create;
      mOrderBy.Add('A.NOMBRE');
      mDL_TB_IMPUESTOS := TDL_TB_IMPUESTOS.Create;
      mDL_TB_IMPUESTOS.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_IMPUESTOS.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(
            FieldByName('NOMBRE').AsString + ' - ' + FormatFloat('###0.00%', FieldByName('PORCENTAJE').AsFloat),
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_IMPUESTOS.Destroy;

      _Resultado := 1;
    except
      if _Resultado = -1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
      end;
      if _Resultado = 0 then
      begin
        Application.MessageBox(PChar(_ErrorM),
          'Advertencia', MB_ICONWARNING);
      end;
      _Resultado := -1;
    end;

  end;
end;

procedure LlenarcbFamilias(cb: TComboBoxEx);
var
  mDL_TB_FAMILIAS: TDL_TB_FAMILIAS;
  mWhere, mOrderBy: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      cb.Items.Clear;
      cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

      mWhere := TStringList.Create;
      mOrderBy := TStringList.Create;
      mOrderBy.Add('A.NOMBRE');
      mDL_TB_FAMILIAS := TDL_TB_FAMILIAS.Create;
      mDL_TB_FAMILIAS.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_FAMILIAS.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(
            FieldByName('NOMBRE').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FAMILIAS.Destroy;

      _Resultado := 1;
    except
      if _Resultado = -1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
      end;
      if _Resultado = 0 then
      begin
        Application.MessageBox(PChar(_ErrorM),
          'Advertencia', MB_ICONWARNING);
      end;
      _Resultado := -1;
    end;

  end;
end;

procedure CamposValidos_Productos;
var
  mValido: Boolean;
  mBS_Productos: TDL_TB_PRODUCTOS;
  mEncontrado: Boolean;
  mWhere: TStringList;
  mNombre, mCodigo, mCodigoBarras: string;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if (mValido = True) and (Trim(edtCodigo.Text) = '') then
    begin
      mValido := False;
      _ErrorM := 'El c�digo no puede estar vacio';
    end;
    if (mValido = True) and (Trim(edtNombre.Text) = '') then
    begin
      mValido := False;
      _ErrorM := 'El nombre no puede estar vacio';
    end;

    if _Opcion = 1 then
    begin
      mNombre := Trim(edtNombre.Text);
      mCodigo := Trim(edtCodigo.Text);
      mCodigoBarras := Trim(edtCodigoBarras.Text);
    end;
    if _Opcion = 2 then
    begin
      // Nombre
      if Trim(_Nombre) = Trim(edtNombre.Text) then
        mNombre := _Nombre;
      if Trim(_Nombre) <> Trim(edtNombre.Text) then
        mNombre := Trim(edtNombre.Text);
      // Codigo
        mCodigo := Trim(edtCodigo.Text);
      // Codigo Barras
        mCodigoBarras := Trim(edtCodigoBarras.Text);
    end;
    // Valida Nombre
    mBS_Productos := TDL_TB_PRODUCTOS.Create;
    mWhere := TStringList.Create;
    mWhere.Add('Nombre=' + QuotedStr(mNombre));
    mEncontrado :=
      mBS_Productos.Existe_Campo(mWhere.Text, 'Nombre', _Resultado, _ErrorM);
    mWhere.Free;
    mBS_Productos.Destroy;
    if _Opcion = 1 then
    begin
      if (mValido = True) and (mEncontrado = True) then
      begin
        mValido := False;
        _ErrorM := 'El nombre ya existe';
      end;
    end;
    if _Opcion = 2 then
    begin
      if Trim(edtNombre.Text) = _Nombre then
      begin
        if (mValido = True) and (mEncontrado = False) then
        begin
          mValido := False;
          _ErrorM := 'El nombre no existe';
        end;
      end;
      if Trim(edtNombre.Text) <> _Nombre then
      begin
        if (mValido = True) and (mEncontrado = True) then
        begin
          mValido := False;
          _ErrorM := 'El nombre ya existe';
        end;
      end;
    end;

    // Valida Codigo
    mBS_Productos := TDL_TB_PRODUCTOS.Create;
    mWhere := TStringList.Create;
    mWhere.Add('Codigo=' + QuotedStr(mCodigo));
    mEncontrado :=
      mBS_Productos.Existe_Campo(mWhere.Text, 'Codigo', _Resultado, _ErrorM);
    mWhere.Free;
    mBS_Productos.Destroy;
    if _Opcion = 1 then
    begin
      if (mValido = True) and (mEncontrado = True) then
      begin
        mValido := False;
        _ErrorM := 'El c�digo ya existe';
      end;
    end;

    // Valida C�digo Barras
    if Trim(edtCodigoBarras.Text) <> '' then
    begin
      mBS_Productos := TDL_TB_PRODUCTOS.Create;
      mWhere := TStringList.Create;
      mWhere.Add('CODIGOBARRAS=' + QuotedStr(mCodigoBarras));
      mEncontrado :=
        mBS_Productos.Existe_Campo(mWhere.Text, 'CODIGOBARRAS', _Resultado, _ErrorM);
      mWhere.Free;
      mBS_Productos.Destroy;
      if _Opcion = 1 then
      begin
        if (mValido = True) and (mEncontrado = True) then
        begin
          mValido := False;
          _ErrorM := 'El c�digo barras ya existe';
        end;
      end;
    end;

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure Insertar_Data_Productos;
var
  mBS_Productos: TDL_TB_PRODUCTOS;
  mWhere: TStringList;
  mId: Integer;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      CamposValidos_Productos;
      if _Resultado = 0 then
        raise Exception.Create('');

      mBS_Productos := TDL_TB_PRODUCTOS.Create;
      with mBS_Productos.Dataset do
      begin
        EmptyDataSet;
        mBS_Productos.Limpiar_Tag;
        Append;
        FieldByName('CODIGO').Tag := 1;
        FieldByName('CODIGO').AsString :=
          edtCodigo.Text;
        FieldByName('NOMBRE').Tag := 1;
        FieldByName('NOMBRE').AsString :=
          edtNombre.Text;
        FieldByName('EXISTENCIA').Tag := 1;
        FieldByName('EXISTENCIA').AsFloat :=
          edtExistencia.Value;
        FieldByName('EXISTENCIAMINIMA').Tag := 1;
        FieldByName('EXISTENCIAMINIMA').AsFloat :=
          edtMinimo.Value;
        FieldByName('APLICAREXISTENCIAMINIMA').Tag := 1;
        FieldByName('APLICAREXISTENCIAMINIMA').AsInteger := 1;
        FieldByName('APLICARIVA').Tag := 1;
        FieldByName('APLICARIVA').AsInteger := 1;
        FieldByName('COMPROMETIDOS').Tag := 1;
        FieldByName('COMPROMETIDOS').AsFloat := 0;
        FieldByName('PRECIOCOSTO').Tag := 1;
        FieldByName('PRECIOCOSTO').AsFloat :=
          edtCosto.Value;
        FieldByName('PRECIOVENTA').Tag := 1;
        FieldByName('PRECIOVENTA').AsFloat :=
          edtVenta.Value;
        FieldByName('UTILIDAD').Tag := 1;
        FieldByName('UTILIDAD').AsFloat :=
          edtUtilidad.Value;
        FieldByName('CODIGOIMPUESTO').Tag := 1;
        FieldByName('CODIGOIMPUESTO').AsInteger :=
          GetCombo(cbImpuesto);
        FieldByName('CODIGOBARRAS').Tag := 1;
        FieldByName('CODIGOBARRAS').AsString :=
          edtCodigoBarras.Text;
        FieldByName('PRECIOVENTASIMPLE').Tag := 1;
        FieldByName('PRECIOVENTASIMPLE').AsFloat :=
          edtVenta.Value;
        FieldByName('PRECIOMAYORISTA').Tag := 1;
        FieldByName('PRECIOMAYORISTA').AsFloat :=
          edtMayorista.Value;
        FieldByName('IDProveedor').Tag := 1;
        FieldByName('IDProveedor').AsInteger :=
          GetCombo(cbProveedor);
        FieldByName('CODIGOFAMILIA').Tag := 1;
        FieldByName('CODIGOFAMILIA').AsInteger :=
          GetCombo(cbFamilia);
        FieldByName('IdTipo').Tag := 1;
        FieldByName('IdTipo').AsInteger := 1;
        FieldByName('FechaVencimiento').Tag := 1;
        FieldByName('FechaVencimiento').AsString :=
          FormatDateTime('dd/MM/yyyy', dtpVencimiento.Date);
        FieldByName('ESCOMPUESTO').Tag := 1;
        FieldByName('ESCOMPUESTO').AsInteger := 1;
        Post;
      end;
      mBS_Productos.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Productos.Destroy;

      _Resultado := 1;
    except
      mResultado := _Resultado;
      mErrorM := _ErrorM;

      _Resultado := mResultado;
      _ErrorM := mErrorM;
      if _Resultado = -1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
      end;
      if _Resultado = 0 then
      begin
        Application.MessageBox(PChar(_ErrorM),
          'Advertencia', MB_ICONWARNING);
      end;
      _Resultado := -1;
    end;

  end;
end;

procedure DBToForma_Productos(ds1: TDatasetMem);
begin
  with Forma01 do
  begin

    with ds1 do
    begin
      edtCodigo.Text :=
        FieldByName('CODIGO').AsString;
      edtCodigoBarras.Text :=
        FieldByName('CODIGOBARRAS').AsString;
      cbProveedor.ItemIndex := SetCombo(cbProveedor,
        FieldByName('IDProveedor').AsInteger);
      cbImpuesto.ItemIndex := SetCombo(cbImpuesto,
        FieldByName('CODIGOIMPUESTO').AsInteger);
      edtUtilidad.Value :=
        FieldByName('UTILIDAD').AsFloat;
      edtCosto.Value :=
        FieldByName('PRECIOCOSTO').AsFloat;
      edtVenta.Value :=
        FieldByName('PRECIOVENTA').AsFloat;
      edtMayorista.Value :=
        FieldByName('PRECIOMAYORISTA').AsFloat;
      edtExistencia.Value :=
        FieldByName('EXISTENCIA').AsFloat;
      edtMinimo.Value :=
        FieldByName('EXISTENCIAMINIMA').AsFloat;
      cbFamilia.ItemIndex := SetCombo(cbFamilia,
        FieldByName('CODIGOFAMILIA').AsInteger);
      dtpVencimiento.Date :=
        FieldByName('FechaVencimiento').AsDateTime;
    end;
    Actualizar_Impuesto;

  end;
end;

procedure Consultar_Data_Productos(pId: Integer);
var
  mBS_Productos: TDL_TB_PRODUCTOS;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Productos := TDL_TB_PRODUCTOS.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mBS_Productos.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToForma_Productos(mBS_Productos.Dataset);
      mBS_Productos.Destroy;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      mResultado := _Resultado;
      mErrorM := _ErrorM;
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := mResultado;
      _ErrorM := mErrorM;
      _Resultado := -1;
    end;

  end;
end;

procedure Actualizar_Impuesto;
var
  mDL_TB_IMPUESTOS: TDL_TB_IMPUESTOS;
  mWhere: TStringList;
  mIVAPM, mPrecioIVA, mVenta: Double;
  mIdImpuesto: Integer;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mIdImpuesto := GetCombo(cbImpuesto);
      mVenta := edtVenta.Value;

      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(mIdImpuesto));
      mDL_TB_IMPUESTOS := TDL_TB_IMPUESTOS.Create;
      mIVAPM :=
        mDL_TB_IMPUESTOS.Obtener_PorcentajeValor(mWhere.Text,
          _Resultado, _ErrorM);
      mWhere.Free;
      mDL_TB_IMPUESTOS.Destroy;
      mPrecioIVA := (mIVAPM * mVenta) +
        mVenta;
      edtVentaIVA.Value := mPrecioIVA;

      _Resultado := 1;
    except
      _Resultado := -1;
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
      if Forma01.Components[mCount] is TRzTabSheet then
      begin
        mValor := TRzTabSheet(Forma01.Components[mCount]).Caption;
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TRzTabSheet(Forma01.Components[mCount]).Caption := mValor;
      end;
    end;

  end;
end;
{$ENDREGION}

end.