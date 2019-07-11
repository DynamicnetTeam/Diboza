unit FrmListadoClientes01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, RzListVw, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, RzPanel, uDL_Skeleton,
  System.RegularExpressions, Vcl.Mask, RzEdit, RzBtnEdt;

type
  TFormListadoClientes01 = class(TForm)
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    lvLista1: TRzListView;
    pnlFiltro: TRzPanel;
    Label2: TLabel;
    Label1: TLabel;
    edtBuscar_Nombre: TRzButtonEdit;
    edtBuscar_Codigo: TRzButtonEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBuscar_NombreInvokeSearch(Sender: TObject);
    procedure edtBuscar_CodigoInvokeSearch(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormListadoClientes01: TFormListadoClientes01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Refrescar(lv: TRzListView);
  procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
  procedure Buscar_Nombre(pTexto: string; lv: TRzListView);
  procedure Buscar_Codigo(pTexto: string; lv: TRzListView);
  //procedure MDLista_Todos(lv: TRzListView; chk: TCheckBox);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_CLIENTES, BS_DBConexion,
  FrmClientes01, FrmMensaje_Espera01, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_Clientes;

const
  lv_Codigo = 5;
  lv_Nombre = 1;
  lv_id = 4;

var
  Forma01: TFormListadoClientes01;

{$REGION 'Funciones Forma'}
procedure TFormListadoClientes01.FormShow(Sender: TObject);
begin
  Forma01 := FormListadoClientes01;

  InicializarForma;
end;

procedure TFormListadoClientes01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormListadoClientes01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormListadoClientes01.edtBuscar_NombreInvokeSearch(Sender: TObject);
begin
  Buscar_Nombre(edtBuscar_Nombre.Text, lvLista1);
end;

procedure TFormListadoClientes01.btnAceptarClick(Sender: TObject);
begin
  Tag := 1;
  Close;
end;

procedure TFormListadoClientes01.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormListadoClientes01.edtBuscar_CodigoInvokeSearch(Sender: TObject);
begin
  Buscar_Codigo(edtBuscar_Codigo.Text, lvLista1);
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

  end;
end;

procedure LimpiarCampos;
begin
  with Forma01 do
  begin

    edtBuscar_Nombre.Clear;
    edtBuscar_Codigo.Clear;

  end;
end;

procedure Refrescar(lv: TRzListView);
var
  mBS_Clientes: Clase_Tipo1;
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

      mBS_Clientes := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Clear;
      mOrderBy := TStringList.Create;
      mOrderBy.Clear;
      mOrderBy.Add('A.NombreCompleto');
      mBS_Clientes.Consultar(_Resultado, _ErrorM, mWhere.Text,
        mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarlvLista1(lv, mBS_Clientes.Dataset);
      mBS_Clientes.Destroy;

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

procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
begin
  with Forma01 do
  begin

    lv.Items.Clear;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        with lv.Items.Add do
        begin
          Caption := '';
          SubItems.Add(
            FieldByName('NOMBRECompleto').AsString);
          SubItems.Add(
            FieldByName('TELEFONO1').AsString);
          SubItems.Add(
            FieldByName('TELEFONO2').AsString);
          SubItems.Add(
            FieldByName('EMAIL').AsString);
          SubItems.Add(
            FieldByName('ID').AsString);
          SubItems.Add(
            FieldByName('CODIGO').AsString);
        end;
        Next;
      end;
    end;

  end;
end;

procedure Buscar_Nombre(pTexto: string; lv: TRzListView);
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
      mLinea := Trim(lv.Items[mFila].SubItems[lv_Nombre]);
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

procedure Buscar_Codigo(pTexto: string; lv: TRzListView);
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
      mLinea := Trim(lv.Items[mFila].SubItems[lv_Codigo]);
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
