unit FrmMensaje_Espera01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, RzPanel;

type
  TFormMensaje_Espera01 = class(TForm)
    RzPanel1: TRzPanel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMensaje_Espera01: TFormMensaje_Espera01;

  procedure CargarIdioma;

implementation
uses
  udmLenguajes;

{$R *.dfm}

procedure TFormMensaje_Espera01.FormShow(Sender: TObject);
begin
  CargarIdioma;
end;

procedure CargarIdioma;
var
  mValor: string;
  mCount, mLen: Integer;
begin
  with FormMensaje_Espera01 do
  begin

    for mCount := 0 to FormMensaje_Espera01.ComponentCount - 1 do
    begin
      if FormMensaje_Espera01.Components[mCount] is TLabel then
      begin
        mValor := TLabel(FormMensaje_Espera01.Components[mCount]).Caption;
        mLen := Length(mValor);
        if mValor[mLen] = ':' then
          mValor := Copy(mValor, 1, mLen - 1);
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TLabel(FormMensaje_Espera01.Components[mCount]).Caption := mValor;
      end;
      if FormMensaje_Espera01.Components[mCount] is TRzPanel then
      begin
        mValor := TRzPanel(FormMensaje_Espera01.Components[mCount]).Caption;
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TRzPanel(FormMensaje_Espera01.Components[mCount]).Caption := mValor;
      end;
    end;

  end;
end;
end.
