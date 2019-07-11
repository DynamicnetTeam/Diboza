unit FrmUsuarios01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzTabs, Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, uDL_Skeleton, Vcl.ComCtrls;

type
  TFormUsuarios01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlAccion: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pgcCampos: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtUsuario: TEdit;
    edtClave: TEdit;
    edtNombre: TEdit;
    Label4: TLabel;
    cbNivel: TComboBoxEx;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
  private
    FId: Integer;
    FOpcion: Integer;
  public
    property _Id: Integer read FId write FId;
    property _Opcion: Integer read FOpcion write FOpcion;
  end;

var
  FormUsuarios01: TFormUsuarios01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure DBToForma(ds1: TDatasetMem);
  procedure Consultar_Data(pId: Integer);
  procedure CamposValidos;
  procedure Insertar_Data;
  procedure Modificar_Data(pId: Integer);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_USUARIOS, BS_DBConexion, DL_DBGeneral,
  udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_USUARIOS;

var
  Forma01: TFormUsuarios01;
  _Usuario: string;

{$REGION 'Funciones Forma'}
procedure TFormUsuarios01.FormShow(Sender: TObject);
begin
  Forma01 := FormUsuarios01;

  InicializarForma;
end;

procedure TFormUsuarios01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormUsuarios01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormUsuarios01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormUsuarios01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormUsuarios01.edtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', 'a'..'z', 'A'..'Z', '_', ' ']) then
    Key := #0;
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

      case _Opcion of
        1: begin
          pnlAccion.Caption := 'NUEVO';
        end;
        2: begin
          pnlAccion.Caption := 'MODIFICAR';
          Consultar_Data(_Id);
          if _Resultado = -1 then
            raise Exception.Create('');
        end;
      end;
      edtUsuario.SetFocus;
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

    _Usuario := '';
    pgcCampos.ActivePageIndex := 0;
    edtUsuario.Clear;
    edtClave.Clear;
    edtNombre.Clear;
    cbNivel.ItemIndex := 0;

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
      _Usuario :=
        FieldByName('USUARIO').AsString;
      edtUsuario.Text :=
        FieldByName('USUARIO').AsString;
      edtClave.Text := HexToString(
        FieldByName('CLAVE').AsString);
      edtNombre.Text :=
        FieldByName('NOMBRECOMPLETO').AsString;
    end;

  end;
end;

procedure Consultar_Data(pId: Integer);
var
  mBS_Usuarios: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Usuarios := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mBS_Usuarios.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToForma(mBS_Usuarios.Dataset);
      mBS_Usuarios.Destroy;

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
  mBS_Usuarios: Clase_Tipo1;
  mEncontrado: Boolean;
  mWhere: TStringList;
  mUsuario: string;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if (mValido = True) and (Trim(edtUsuario.Text) = '') then
    begin
      mValido := False;
      _ErrorM := 'El Usuario no puede estar vacio';
    end;
    if (mValido = True) and (Trim(edtNombre.Text) = '') then
    begin
      mValido := False;
      _ErrorM := 'El nombre no puede estar vacio';
    end;
    if (mValido = True) and (Trim(edtClave.Text) = '') then
    begin
      mValido := False;
      _ErrorM := 'La clave no puede estar vacia';
    end;

    if _Opcion = 1 then
      mUsuario := Trim(edtUsuario.Text);
    if _Opcion = 2 then
    begin
      // Usuario
      if Trim(_Usuario) = Trim(edtUsuario.Text) then
        mUsuario := _Usuario;
      if Trim(_Usuario) <> Trim(edtUsuario.Text) then
        mUsuario := Trim(edtUsuario.Text);
    end;
    // Valida Usuario
    mBS_Usuarios := Clase_Tipo1.Create;
    mWhere := TStringList.Create;
    mWhere.Add('USUARIO=' + QuotedStr(mUsuario));
    mEncontrado :=
      mBS_Usuarios.Existe_Campo(mWhere.Text, 'Usuario', _Resultado, _ErrorM);
    mWhere.Free;
    mBS_Usuarios.Destroy;
    if _Opcion = 1 then
    begin
      if (mValido = True) and (mEncontrado = True) then
      begin
        mValido := False;
        _ErrorM := 'El usuario ya existe';
      end;
    end;
    if _Opcion = 2 then
    begin
      if Trim(edtUsuario.Text) = _Usuario then
      begin
        if (mValido = True) and (mEncontrado = False) then
        begin
          mValido := False;
          _ErrorM := 'El usuario no existe';
        end;
      end;
      if Trim(edtUsuario.Text) <> _Usuario then
      begin
        if (mValido = True) and (mEncontrado = True) then
        begin
          mValido := False;
          _ErrorM := 'El usuario ya existe';
        end;
      end;
    end;

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure Insertar_Data;
var
  mBS_Usuarios: Clase_Tipo1;
  mWhere: TStringList;
  mId: Integer;
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

      mBS_Usuarios := Clase_Tipo1.Create;
      with mBS_Usuarios.Dataset do
      begin
        EmptyDataSet;
        mBS_Usuarios.Limpiar_Tag;
        Append;
        FieldByName('USUARIO').Tag := 1;
        FieldByName('USUARIO').AsString :=
          edtUsuario.Text;
        FieldByName('CLAVE').Tag := 1;
        FieldByName('CLAVE').AsString :=
          StringToHex(edtClave.Text);
        FieldByName('NOMBRECOMPLETO').Tag := 1;
        FieldByName('NOMBRECOMPLETO').AsString :=
          edtNombre.Text;
        FieldByName('CODIGONIVEL').Tag := 1;
        FieldByName('CODIGONIVEL').AsInteger :=
          GetCombo(cbNivel);
        FieldByName('ESVISIBLE').Tag := 1;
        FieldByName('ESVISIBLE').AsInteger := 1;
        FieldByName('CODIGOESTADO').Tag := 1;
        FieldByName('CODIGOESTADO').AsInteger := 1;
        Post;
      end;

      mBS_Usuarios.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Usuarios.Destroy;

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
  mBS_Usuarios: Clase_Tipo1;
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

      mBS_Usuarios := Clase_Tipo1.Create;
      with mBS_Usuarios.Dataset do
      begin
        EmptyDataSet;
        mBS_Usuarios.Limpiar_Tag;
        Append;
        FieldByName('USUARIO').Tag := 1;
        FieldByName('USUARIO').AsString :=
          edtUsuario.Text;
        FieldByName('CLAVE').Tag := 1;
        FieldByName('CLAVE').AsString :=
          StringToHex(edtClave.Text);
        FieldByName('NOMBRECOMPLETO').Tag := 1;
        FieldByName('NOMBRECOMPLETO').AsString :=
          edtNombre.Text;
        FieldByName('CODIGONIVEL').Tag := 1;
        FieldByName('CODIGONIVEL').AsInteger :=
          GetCombo(cbNivel);
        Post;
      end;
      mBS_Usuarios.Modificar('Id=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Usuarios.Destroy;

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

procedure CargarIdioma;
var
  mValor: string;
  mCount, mLen: Integer;
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
