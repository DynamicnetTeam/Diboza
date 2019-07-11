unit FrmPedirLicencia01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormPedirLicencia01 = class(TForm)
    pnlTitulo: TPanel;
    pnlOpciones: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCampos: TPanel;
    Panel1: TPanel;
    edtSerial: TButtonedEdit;
    btnCopiar: TBitBtn;
    btnBorrar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtSerialClick(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPedirLicencia01: TFormPedirLicencia01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure Copiar;
  procedure Borrar;
  procedure CargarIdioma;

implementation
uses
  udmLenguajes;

{$R *.dfm}

var
  Forma01: TFormPedirLicencia01;

{$REGION 'Funciones Forma'}
procedure TFormPedirLicencia01.FormShow(Sender: TObject);
begin
  Forma01 := FormPedirLicencia01;

  InicializarForma;
end;

procedure TFormPedirLicencia01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormPedirLicencia01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormPedirLicencia01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormPedirLicencia01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormPedirLicencia01.edtSerialClick(Sender: TObject);
begin
  edtSerial.SelectAll;
end;

procedure TFormPedirLicencia01.btnCopiarClick(Sender: TObject);
begin
  Copiar;
end;

procedure TFormPedirLicencia01.btnBorrarClick(Sender: TObject);
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
      CargarIdioma;
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

    edtSerial.Clear;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

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
