unit FrmActivarLicencia01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  uDL_TB_Licencia;

type
  TFormActivarLicencia01 = class(TForm)
    pnlTitulo: TPanel;
    pnlOpciones: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCampos: TPanel;
    Panel1: TPanel;
    btnCopiar: TBitBtn;
    btnBorrar: TBitBtn;
    edtSerial: TButtonedEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtSerialClick(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
  private
    FLicencia: string;
    FSerial: string;
    FVersion: string;
  public
    property _Licencia: string read FLicencia write FLicencia;
    property _Serial: string read FSerial write FSerial;
    property _Version: string read FVersion write FVersion;
  end;

var
  FormActivarLicencia01: TFormActivarLicencia01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure Copiar;
  procedure Borrar;
  procedure CamposValidos;
  procedure CargarIdioma;

implementation
uses
  uSistema, BS_DBConexion, udmLenguajes;

{$R *.dfm}

var
  Forma01: TFormActivarLicencia01;

{$REGION 'Funciones Forma'}
procedure TFormActivarLicencia01.FormShow(Sender: TObject);
begin
  Forma01 := FormActivarLicencia01;

  InicializarForma;
end;

procedure TFormActivarLicencia01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormActivarLicencia01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormActivarLicencia01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormActivarLicencia01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormActivarLicencia01.edtSerialClick(Sender: TObject);
begin
  edtSerial.SelectAll;
end;

procedure TFormActivarLicencia01.btnCopiarClick(Sender: TObject);
begin
  Copiar;
end;

procedure TFormActivarLicencia01.btnBorrarClick(Sender: TObject);
begin
  Borrar;
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
      edtSerial.SetFocus;
    except
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

    edtSerial.Text := _Licencia;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    CamposValidos;
    if _Resultado = 1 then
    begin
      Tag := 1;
      Close;
    end;
    if _Resultado = 0 then
      Application.MessageBox('Licencia no valida', 'Advertencia', MB_ICONERROR);

  end;
end;

procedure Cancelar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure Copiar;
begin
  with Forma01 do
  begin

    edtSerial.SelectAll;
    edtSerial.CopyToClipboard;

  end;
end;

procedure Borrar;
begin
  with Forma01 do
  begin

    edtSerial.Clear;

  end;
end;

procedure CamposValidos;
var
  mDL_TB_Licencia: TDL_TB_Licencia;
  mEncontrado: Boolean;
  mWhere: TStringList;
  mLicencia: string;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 0;

      mLicencia := Trim(edtSerial.Text);
      Global.DB_LicenciaServidor :=
        'dblicencias.cc2psgorqtux.us-west-2.rds.amazonaws.com';
      Global.DB_LicenciaBaseDatos :=
        'db_licencias';
      Global.DB_LicenciaUsuario :=
        'root';
      Global.DB_LicenciaClave :=
        'licencias123';
      Global.DB_LicenciaPuerto := 3306;
      BS_DBConexion_Conectar_Licencia('MySQL');
      if _Resultado = -1 then
        raise Exception.Create('');

      _Resultado := 0;
      mWhere := TStringList.Create;
      mWhere.Add('Licencia=' + QuotedStr(mLicencia));
      mWhere.Add(' And ');
      mWhere.Add('CodigoEstado=1');
      mDL_TB_Licencia := TDL_TB_Licencia.Create;
      mEncontrado :=
        mDL_TB_Licencia.Existe_Campo(mWhere.Text, 'Licencia', mResultado, mErrorM);
      mWhere.Free;
      mDL_TB_Licencia.Destroy;

      if mEncontrado = True then
      begin
        mWhere := TStringList.Create;
        mWhere.Add('Licencia=' + QuotedStr(mLicencia));
        mDL_TB_Licencia := TDL_TB_Licencia.Create;
        mDL_TB_Licencia.Actualizar_Campo(mWhere.Text, 'CodigoEstado', 2,
          mResultado, mErrorM);
        mDL_TB_Licencia.Actualizar_Campo(mWhere.Text, 'CodigoVenta', 1,
          mResultado, mErrorM);
        mDL_TB_Licencia.Actualizar_Campo(mWhere.Text, 'Serial', QuotedStr(_Serial),
          mResultado, mErrorM);
        mDL_TB_Licencia.Actualizar_Campo(mWhere.Text, 'Fecha', QuotedStr(FormatDateTime('yyyy-MM-dd', Date)),
          mResultado, mErrorM);
        mDL_TB_Licencia.Actualizar_Campo(mWhere.Text, 'Hora', QuotedStr(FormatDateTime('HH:mm:ss', Time)),
          mResultado, mErrorM);
        mDL_TB_Licencia.Actualizar_Campo(mWhere.Text, 'version', QuotedStr(_Version),
          mResultado, mErrorM);

        mWhere.Free;
        mDL_TB_Licencia.Destroy;
        _Resultado := 1;
      end;

      BS_DBConexion_Desonectar_Licencia;
    except
      _Resultado := -1;
      Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
        'Error', MB_ICONERROR);
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
      if Forma01.Components[mCount] is TPanel then
      begin
        mValor := TPanel(Forma01.Components[mCount]).Caption;
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TPanel(Forma01.Components[mCount]).Caption := mValor;
      end;
    end;

  end;
end;
{$ENDREGION}

end.