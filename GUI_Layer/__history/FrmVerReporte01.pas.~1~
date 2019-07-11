unit FrmVerReporte01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxPreview, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus;

type
  TFormVerReporte01 = class(TForm)
    pnlTitulo: TPanel;
    pnlOpciones1: TPanel;
    pnlOpciones2: TPanel;
    pnlOpciones21: TPanel;
    btnPrimero: TSpeedButton;
    btnSiguiente: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnImprimir: TSpeedButton;
    btnAcercar: TSpeedButton;
    btnAlejar: TSpeedButton;
    pnlZoomModo: TPanel;
    btnConfiguracion: TSpeedButton;
    btnExportar: TSpeedButton;
    btnCerrar: TSpeedButton;
    cbZoomModo: TComboBoxEx;
    popExportar: TPopupMenu;
    PDF1: TMenuItem;
    Excel1: TMenuItem;
    Word1: TMenuItem;
    CSV1: TMenuItem;
    HTML1: TMenuItem;
    XML1: TMenuItem;
    exto1: TMenuItem;
    JPG1: TMenuItem;
    Email1: TMenuItem;
    lblPaginas: TLabel;
    frxPreview1: TfrxPreview;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnPrimeroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnSiguienteClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAcercarClick(Sender: TObject);
    procedure btnAlejarClick(Sender: TObject);
    procedure btnConfiguracionClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure cbZoomModoChange(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure PDF1Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure Word1Click(Sender: TObject);
    procedure CSV1Click(Sender: TObject);
    procedure HTML1Click(Sender: TObject);
    procedure XML1Click(Sender: TObject);
    procedure exto1Click(Sender: TObject);
    procedure JPG1Click(Sender: TObject);
    procedure Email1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FReporteNombre: string;
    FTotalPaginas: Integer;
    property _ReporteNombre: string read FReporteNombre write FReporteNombre;
    property _TotalPaginas: Integer read FTotalPaginas write FTotalPaginas;
  end;

var
  FormVerReporte01: TFormVerReporte01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Imprimir;
  procedure Primero;
  procedure Anterior;
  procedure Siguiente;
  procedure Ultimo;
  procedure Acercar;
  procedure Alejar;
  procedure Configuracion;
  procedure Cerrar;
  procedure LlenarcbZoomModo(cb: TComboBoxEx);
  procedure CambiarZoom(cb: TComboBoxEx);
  procedure Exportar_PDF;
  procedure Exportar_Excel;
  procedure Exportar_Word;
  procedure Exportar_CSV;
  procedure Exportar_HTML;
  procedure Exportar_XML;
  procedure Exportar_TXT;
  procedure Exportar_JPG;
  procedure Exportar_Email;

implementation

uses
  uSistema, ufunciones,
  udmReports;

{$R *.dfm}

var
  Forma01: TFormVerReporte01;

{$REGION 'Funciones Forma'}
procedure TFormVerReporte01.FormShow(Sender: TObject);
begin
  Forma01 := FormVerReporte01;

  InicializarForma;
end;

procedure TFormVerReporte01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormVerReporte01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormVerReporte01.btnImprimirClick(Sender: TObject);
begin
  Imprimir;
end;

procedure TFormVerReporte01.btnPrimeroClick(Sender: TObject);
begin
  Primero;
end;

procedure TFormVerReporte01.btnAnteriorClick(Sender: TObject);
begin
  Anterior;
end;

procedure TFormVerReporte01.btnSiguienteClick(Sender: TObject);
begin
  Siguiente;
end;

procedure TFormVerReporte01.btnUltimoClick(Sender: TObject);
begin
  Ultimo;
end;

procedure TFormVerReporte01.btnAcercarClick(Sender: TObject);
begin
  Acercar;
end;

procedure TFormVerReporte01.btnAlejarClick(Sender: TObject);
begin
  Alejar;
end;

procedure TFormVerReporte01.btnConfiguracionClick(Sender: TObject);
begin
  Configuracion;
end;

procedure TFormVerReporte01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormVerReporte01.cbZoomModoChange(Sender: TObject);
begin
  CambiarZoom(cbZoomModo);
end;

procedure TFormVerReporte01.btnExportarClick(Sender: TObject);
var
  button: TControl;
  lowerLeft: TPoint;
begin
  if Sender is TControl then
  begin
    button := TControl(Sender);
    lowerLeft := Point(0, button.Height);
    lowerLeft := button.ClientToScreen(lowerLeft);
    popExportar.Popup(lowerLeft.X, lowerLeft.Y);
  end;
end;

procedure TFormVerReporte01.PDF1Click(Sender: TObject);
begin
  Exportar_PDF;
end;

procedure TFormVerReporte01.Excel1Click(Sender: TObject);
begin
  Exportar_Excel;
end;

procedure TFormVerReporte01.Word1Click(Sender: TObject);
begin
  Exportar_Word;
end;

procedure TFormVerReporte01.CSV1Click(Sender: TObject);
begin
  Exportar_CSV;
end;

procedure TFormVerReporte01.HTML1Click(Sender: TObject);
begin
  Exportar_HTML;
end;

procedure TFormVerReporte01.XML1Click(Sender: TObject);
begin
  Exportar_XML;
end;

procedure TFormVerReporte01.exto1Click(Sender: TObject);
begin
  Exportar_TXT;
end;

procedure TFormVerReporte01.JPG1Click(Sender: TObject);
begin
  Exportar_JPG;
end;

procedure TFormVerReporte01.Email1Click(Sender: TObject);
begin
  Exportar_Email;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      LlenarcbZoomModo(cbZoomModo);

      LimpiarCampos;
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

    pnlTitulo.Caption := _ReporteNombre;
    cbZoomModo.ItemIndex := 0;
    frxPreview1.ZoomMode := zmWholePage;
    lblPaginas.Caption := '1 de ' +
      IntToStr(_TotalPaginas);
   // Primero;

  end;
end;

procedure Imprimir;
begin
  with Forma01 do
  begin

    frxPreview1.Print;

  end;
end;

procedure Primero;
begin
  with Forma01 do
  begin

     frxPreview1.First;
     lblPaginas.Caption := IntToStr(frxPreview1.PageNo) + ' de ' +
        IntToStr(_TotalPaginas);

  end;
end;

procedure Anterior;
begin
  with Forma01 do
  begin

     frxPreview1.Prior;
     lblPaginas.Caption := IntToStr(frxPreview1.PageNo) + ' de ' +
        IntToStr(_TotalPaginas);

  end;
end;

procedure Siguiente;
begin
  with Forma01 do
  begin

     frxPreview1.Next;
     lblPaginas.Caption := IntToStr(frxPreview1.PageNo) + ' de ' +
        IntToStr(_TotalPaginas);

  end;
end;

procedure Ultimo;
begin
  with Forma01 do
  begin

    frxPreview1.Last;
     lblPaginas.Caption := IntToStr(frxPreview1.PageNo) + ' de ' +
        IntToStr(_TotalPaginas);

  end;
end;

procedure Acercar;
begin
  with Forma01 do
  begin

     frxPreview1.Zoom :=
      frxPreview1.Zoom + 0.1;

  end;
end;

procedure Alejar;
begin
  with Forma01 do
  begin

     frxPreview1.Zoom :=
       frxPreview1.Zoom - 0.1;

  end;
end;

procedure Configuracion;
begin
  with Forma01 do
  begin

     frxPreview1.PageSetupDlg;

  end;
end;

procedure Cerrar;
begin
  with Forma01 do
  begin

     Close;

  end;
end;

procedure LlenarcbZoomModo(cb: TComboBoxEx);
begin
  with Forma01 do
  begin

    cb.Items.Clear;
    cb.Items.AddObject('Toda la Página', TObject(0)); //zmWholePage
    cb.Items.AddObject('Ancho de Página', TObject(1)); //zmPageWidth
    cb.Items.AddObject('Varias Páginas', TObject(2)); //zmManyPages

  end;
end;

procedure CambiarZoom(cb: TComboBoxEx);
begin
  with Forma01 do
  begin

    case cb.ItemIndex of
      0: frxPreview1.ZoomMode := zmWholePage;
      1: frxPreview1.ZoomMode := zmPageWidth;
      2: frxPreview1.ZoomMode := zmManyPages;
    end;

  end;
end;

procedure Exportar_PDF;
begin
  with Forma01 do
  begin

    frxPreview1.Export(dmReports.frxPDFExport1);

  end;
end;

procedure Exportar_Excel;
begin
  with Forma01 do
  begin

   // frxPreview1.Export(dmReports.frxXLSExport1);

  end;
end;

procedure Exportar_Word;
begin
  with Forma01 do
  begin

    frxPreview1.Export(dmReports.frxRTFExport1);

  end;
end;

procedure Exportar_CSV;
begin
  with Forma01 do
  begin

    frxPreview1.Export(dmReports.frxCSVExport1);

  end;
end;

procedure Exportar_HTML;
begin
  with Forma01 do
  begin

   // frxPreview1.Export(dmReports.frxHTML5DivExport1);

  end;
end;

procedure Exportar_XML;
begin
  with Forma01 do
  begin

   // frxPreview1.Export(dmReports.frxXMLExport1);

  end;
end;

procedure Exportar_TXT;
begin
  with Forma01 do
  begin

    frxPreview1.Export(dmReports.frxSimpleTextExport1);

  end;
end;

procedure Exportar_JPG;
begin
  with Forma01 do
  begin

    frxPreview1.Export(dmReports.frxJPEGExport1);

  end;
end;

procedure Exportar_Email;
begin
  with Forma01 do
  begin

   // frxPreview1.Export(dmReports.frxMailExport1);

  end;
end;
{$ENDREGION}

end.
