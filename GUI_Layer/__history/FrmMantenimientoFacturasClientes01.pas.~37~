unit FrmMantenimientoFacturasClientes01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  RzListVw, RzStatus, RzPanel, Vcl.ExtCtrls,
  System.RegularExpressions, uDL_Skeleton, RzButton, RzRadChk, RzEdit, Vcl.Mask,
  RzBtnEdt;

type
  TFormMantenimientoFacturasClientes01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnRefrescar: TBitBtn;
    btnCerrar: TBitBtn;
    stbEstado1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    pnlFiltro: TRzPanel;
    Label2: TLabel;
    pnlListaTitulo: TRzPanel;
    chkTodoLista1: TCheckBox;
    lvLista1: TRzListView;
    Label1: TLabel;
    Label3: TLabel;
    edtBuscar_Numero: TRzButtonEdit;
    dtpFechaDesde: TRzDateTimeEdit;
    dtpFechaHasta: TRzDateTimeEdit;
    chkAplicarRangoFecha: TRzCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure edtBuscar_NumeroInvokeSearch(Sender: TObject);
    procedure lvLista1CustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMantenimientoFacturasClientes01: TFormMantenimientoFacturasClientes01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Insertar;
  procedure Modificar(lv: TRzListView);
  procedure Refrescar(lv: TRzListView);
  procedure Cerrar;
  procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
  procedure Buscar_Numero(pTexto: string; lv: TRzListView);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_FACTURASCLIENTESENCABEZADO, BS_DBConexion,
  FrmFacturaClientes01, FrmMensaje_Espera01, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_FACTURASCLIENTESENCABEZADO;

const
  lv_Numero = 0;
  lv_id = 10;

var
  Forma01: TFormMantenimientoFacturasClientes01;

{$REGION 'Funciones Forma'}
procedure TFormMantenimientoFacturasClientes01.FormShow(Sender: TObject);
begin
  Forma01 := FormMantenimientoFacturasClientes01;

  InicializarForma;
end;

procedure TFormMantenimientoFacturasClientes01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormMantenimientoFacturasClientes01.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormMantenimientoFacturasClientes01.btnInsertarClick(
  Sender: TObject);
begin
  Insertar;
end;

procedure TFormMantenimientoFacturasClientes01.btnModificarClick(
  Sender: TObject);
begin
  Modificar(lvLista1);
end;

procedure TFormMantenimientoFacturasClientes01.btnRefrescarClick(
  Sender: TObject);
begin
  Refrescar(lvLista1);
end;

procedure TFormMantenimientoFacturasClientes01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormMantenimientoFacturasClientes01.edtBuscar_NumeroInvokeSearch(
  Sender: TObject);
begin
  Buscar_Numero(edtBuscar_Numero.Text, lvLista1);
end;

procedure TFormMantenimientoFacturasClientes01.lvLista1CustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
var
  mCodigoEstado: string;
begin
  mCodigoEstado := Trim(Item.SubItems[8]);
  if mCodigoEstado = '3' then
  begin
    Sender.Canvas.Font.Color := clWhite;
    Sender.Canvas.Brush.Color := clRed;
  end;
  if mCodigoEstado = '4' then
  begin
    Sender.Canvas.Font.Color := clBlack;
    Sender.Canvas.Brush.Color := clYellow;
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

      LimpiarCampos;
      CargarIdioma;
      Refrescar(lvLista1);
      if _Resultado = -1 then
        raise Exception.Create('');
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
    if Key = VK_F2 then
    begin
      Key := 0;
      Insertar;
    end;
    if Key = VK_F3 then
    begin
      Key := 0;
      btnModificar.Click;
    end;
    if Key = VK_F4 then
    begin
      Key := 0;
      btnRefrescar.Click;
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

    edtBuscar_Numero.Text := '1';
    dtpFechaDesde.Date := Date;
    dtpFechaHasta.Date := Date;
    chkAplicarRangoFecha.checked := True;

  end;
end;

procedure Insertar;
begin
  with Forma01 do
  begin

    FormFacturaClientes01._IdCliente := 0;
    FormFacturaClientes01._Orden := 0;
    FormFacturaClientes01._Origen := 1;
    FormFacturaClientes01._IdEstado := 1;
    FormFacturaClientes01._IdFormaPago := 0;
    FormFacturaClientes01._IdDocumento := 0;
    FormFacturaClientes01._Numero := 0;
    FormFacturaClientes01.WindowState := wsMaximized;
    FormFacturaClientes01.ShowModal;
    btnRefrescar.Click;

  end;
end;

procedure Modificar(lv: TRzListView);
var
  mLinea: string;
  mId, mEstado, mFormaPago, mDocumento: Integer;
begin
  with Forma01 do
  begin

    if lv.Selected <> nil then
    begin
      mLinea := lv.Selected.SubItems[lv_id];
      try
        mId := StrToInt(mLinea);
      except
        mId := 0;
      end;
      mLinea := lv.Selected.SubItems[8];
      try
        mEstado := StrToInt(mLinea);
      except
        mEstado := 0;
      end;
      mLinea := lv.Selected.SubItems[9];
      try
        mFormaPago := StrToInt(mLinea);
      except
        mFormaPago := 0;
      end;
      mLinea := lv.Selected.SubItems[0];
      try
        mDocumento := StrToInt(mLinea);
      except
        mDocumento := 0;
      end;
      if (mId > 0) and (mEstado > 0) and (mFormaPago > 0) and
        (mDocumento > 0) then
      begin
        FormFacturaClientes01._IdCliente := 0;
        FormFacturaClientes01._Orden := 0;
        FormFacturaClientes01._Origen := 1;
        FormFacturaClientes01._IdEstado := mEstado;
        FormFacturaClientes01._IdFormaPago := mFormaPago;
        FormFacturaClientes01._IdDocumento := mId;
        FormFacturaClientes01._Numero := mDocumento;
        FormFacturaClientes01.WindowState := wsMaximized;
        FormFacturaClientes01.ShowModal;
        btnRefrescar.Click;
      end;
    end;

  end;
end;

procedure Refrescar(lv: TRzListView);
var
  mBS_FacturasEncabezado: Clase_Tipo1;
  mWhere, mOrderBy: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    Screen.Cursor := crHourGlass;
    FormMensaje_Espera01.Show;
    FormMensaje_Espera01.Repaint;
    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_FacturasEncabezado := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Clear;
      if chkAplicarRangoFecha.checked = True then
      begin
        mWhere.Add('(A.Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFechaDesde.Date)));
        mWhere.Add(' And ');
        mWhere.Add('A.Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFechaHasta.Date)) + ')');
      end;
      mOrderBy := TStringList.Create;
      mOrderBy.Clear;
      mOrderBy.Add('A.Fecha DESC, A.Hora DESC');
      mBS_FacturasEncabezado.Consultar(_Resultado, _ErrorM, mWhere.Text,
        mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarlvLista1(lv, mBS_FacturasEncabezado.Dataset);
      mBS_FacturasEncabezado.Destroy;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      _Resultado := -1;
      mResultado := _Resultado;
      mErrorM := _ErrorM;
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := mResultado;
      _ErrorM := mErrorM;
    end;
    FormMensaje_Espera01.Close;
    Screen.Cursor := crDefault;

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
var
  mCodigoFormaPago: Integer;
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
        mCodigoFormaPago :=
          FieldByName('CODIGOFORMAPAGO').AsInteger;
        if mCodigoFormaPago = 0 then
          mCodigoFormaPago := 1;
        with lv.Items.Add do
        begin
          Caption :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('FECHA').AsDateTime);
          SubItems.Add(
            FieldByName('Numero').AsString);
          SubItems.Add(
            FieldByName('NOMBRECLIENTE').AsString);
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('SUBTOTAL').AsFloat));
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('DESCUENTOM').AsFloat));
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('IVAM').AsFloat));
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('TOTAL').AsFloat));
          SubItems.Add(
            FieldByName('EstadoNombre').AsString);
          case mCodigoFormaPago of
            1: SubItems.Add('Contado');
            5: SubItems.Add('Crédito');
          else
            SubItems.Add('Contado');
          end;
          SubItems.Add(
            FieldByName('CODIGOESTADO').AsString);
          SubItems.Add(
            IntToStr(mCodigoFormaPago));
          SubItems.Add(
            FieldByName('ID').AsString);
          SubItems.Add(
            FieldByName('ID').AsString);
        end;
        Next;
      end;
    end;

  end;
end;

procedure Buscar_Numero(pTexto: string; lv: TRzListView);
var
  mEncontrado: Boolean;
  mFila: Integer;
  mTexto, mLinea: string;
  regexpr : TRegEx;
  match   : TMatch;
begin
  with Forma01 do
  begin

    mEncontrado := False;
    mTexto := Trim(pTexto);
    for mFila := 0 to lv.Items.Count - 1 do
    begin
      mLinea := Trim(lv.Items[mFila].SubItems[lv_Numero]);
      if mTexto <> '' then
      begin
        regexpr := TRegEx.Create(mTexto,[roIgnoreCase,roMultiline]);
        match := regexpr.Match(mLinea);
        if match.Success then
        begin
          mEncontrado := True;
          lv.Items[mFila].Selected := true;
          lv.Items[mFila].MakeVisible(True);
          lv.SetFocus;
          Break;
        end;
      end
      else
        Break;
    end;
    if mEncontrado = False then
      Application.MessageBox('No encontrado', 'Advertencia', MB_OK);

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
