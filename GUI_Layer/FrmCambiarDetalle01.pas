unit FrmCambiarDetalle01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, RxToolEdit, RxCurrEdit,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, RzPanel;

type
  TFormCambiarDetalle01 = class(TForm)
    Label2: TLabel;
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    edtCantidad: TCurrencyEdit;
    Label1: TLabel;
    edtDescuentoP: TCurrencyEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtDescuentoM: TCurrencyEdit;
    Label5: TLabel;
    chkAplicarDescuentoM: TCheckBox;
    Label6: TLabel;
    edtDescripcion1: TEdit;
    Label7: TLabel;
    edtDescripcion2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FCantidad: Double;
    FDescuentoP: Double;
    FPrecio: Double;
    FOrigen: Integer;
    FDescripcion1: string;
    FDescripcion2: string;
    FAplicarDescuentoM: Integer;
  public
    property _Cantidad: Double  read FCantidad write FCantidad;
    property _DescuentoPd: Double  read FDescuentoP write FDescuentoP;
    property _Precio: Double  read FPrecio write FPrecio;
    property _Origen: Integer  read FOrigen write FOrigen;
    property _Descripcion1: string  read FDescripcion1 write FDescripcion1;
    property _Descripcion2: string  read FDescripcion2 write FDescripcion2;
    property _AplicarDescuentoM: Integer  read FAplicarDescuentoM write FAplicarDescuentoM;
  end;

var
  FormCambiarDetalle01: TFormCambiarDetalle01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure CargarIdioma;

implementation

uses
  udmLenguajes;

{$R *.dfm}

var
  Forma01: TFormCambiarDetalle01;

{$REGION 'Funciones Forma'}
procedure TFormCambiarDetalle01.FormShow(Sender: TObject);
begin
  Forma01 := FormCambiarDetalle01;

  InicializarForma;
end;

procedure TFormCambiarDetalle01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormCambiarDetalle01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormCambiarDetalle01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormCambiarDetalle01.btnCancelarClick(Sender: TObject);
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

    edtCantidad.Value := _Cantidad;
    edtDescuentoP.Value := _DescuentoPd;
    edtDescuentoM.Value := 0;
    chkAplicarDescuentoM.Checked := False;
    edtDescripcion1.Text := _Descripcion1;
    edtDescripcion2.Text := _Descripcion2;
    Label6.Visible := True;
    Label7.Visible := True;
    edtDescripcion1.Visible := True;
    edtDescripcion2.Visible := True;
    if _Origen = 2 then
    begin
      Label6.Visible := False;
      Label7.Visible := False;
      edtDescripcion1.Visible := False;
      edtDescripcion2.Visible := False;
    end;

  end;
end;

procedure Aceptar;
var
  mDescuentoP: Double;
  mPrecio: Double;
begin
  with Forma01 do
  begin

    _Cantidad := edtCantidad.Value;
    _Descripcion1 := edtDescripcion1.Text;
    _Descripcion2 := edtDescripcion2.Text;
    mDescuentoP := edtDescuentoP.Value;
    if chkAplicarDescuentoM.Checked = True then
    begin
      _AplicarDescuentoM := 1;
      mPrecio := _Precio * _Cantidad;
     if (edtDescuentoM.Value <> 0) and
       (mPrecio <> 0)then
     begin
       mDescuentoP := edtDescuentoM.Value / mPrecio;
       mDescuentoP := mDescuentoP * 100;
     end
     else
       mDescuentoP := 0;
    end
    else
      _AplicarDescuentoM := 0;
    _DescuentoPd := mDescuentoP;
    Tag := 1;
    Close;
  end;
end;

procedure Cancelar;
begin
  with Forma01 do
  begin

    Close;

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