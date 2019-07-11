unit FrmMovimientoInventario01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RzPanel, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TFormMovimientoInventario01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Label2: TLabel;
    edtCantidad: TCurrencyEdit;
    Label1: TLabel;
    rbEntrada: TRadioButton;
    rbSalida: TRadioButton;
    Label3: TLabel;
    memMotivo: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FExistenciaActual: Double;
    FMovimiento: Integer;
    FCantidad: Double;
    FMotivo: string;
  public
    property _ExistenciaActual: Double read FExistenciaActual write FExistenciaActual;
    property _Movimiento: Integer read FMovimiento write FMovimiento;
    property _Cantidad: Double read FCantidad write FCantidad;
    property _Motivo: string read FMotivo write FMotivo;
  end;

var
  FormMovimientoInventario01: TFormMovimientoInventario01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure CamposValidos;
  procedure CargarIdioma;

implementation
uses
  uSistema, ufunciones, udmLenguajes;

{$R *.dfm}

var
  Forma01: TFormMovimientoInventario01;

{$REGION 'Funciones Forma'}
procedure TFormMovimientoInventario01.FormShow(Sender: TObject);
begin
  Forma01 := FormMovimientoInventario01;

  InicializarForma;
end;

procedure TFormMovimientoInventario01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormMovimientoInventario01.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormMovimientoInventario01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormMovimientoInventario01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
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
      edtCantidad.SetFocus;
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

    edtCantidad.Value := 0;
    rbEntrada.Checked := True;
    memMotivo.Clear;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    CamposValidos;
    if _Resultado = 1 then
    begin
      _Cantidad := edtCantidad.Value;
      if rbEntrada.Checked = True then
        _Movimiento := 1;
      if rbSalida.Checked = True then
        _Movimiento := 2;
      _Motivo := memMotivo.Text;
      Tag := 1;
      Close;
    end;
    if _Resultado = 0 then
    begin
      Application.MessageBox(PChar(_ErrorM),
        'Advertencia', MB_ICONWARNING);
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

procedure CamposValidos;
var
  mValido: Boolean;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if (mValido = True) and (edtCantidad.Value = 0) then
    begin
      mValido := False;
      _ErrorM := 'La cantidad debe ser mayor a cero';
    end;
    if (mValido = True) and (rbSalida.Checked = True) then
    begin
      if edtCantidad.Value > _ExistenciaActual then
      begin
        mValido := False;
        _ErrorM := 'La cantidad no puede ser mayor a la existencia actual';
      end;
    end;

    if mValido = False then
      _Resultado := 0;

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
    end;

  end;
end;
{$ENDREGION}

end.