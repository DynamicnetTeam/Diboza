program Sisfac;

uses
  Vcl.Forms,
  FrmPrincipal01 in 'GUI_Layer\FrmPrincipal01.pas' {FormPrincipal01},
  Vcl.Themes,
  Vcl.Styles,
  udmConnection in 'Modules\udmConnection.pas' {dmConnection: TDataModule},
  udmObjects in 'Modules\udmObjects.pas' {dmObjects: TDataModule},
  uDL_Skeleton in 'Data_Layer\uDL_Skeleton.pas',
  DL_DBConexion in 'Data_Layer\DL_DBConexion.pas',
  DL_DBGeneral in 'Data_Layer\DL_DBGeneral.pas',
  BS_DBConexion in 'Business_Layer\BS_DBConexion.pas',
  uConfig in 'Functions\uConfig.pas',
  ufunciones in 'Functions\ufunciones.pas',
  uSistema in 'Functions\uSistema.pas',
  FrmPresentacion01 in 'GUI_Layer\FrmPresentacion01.pas' {FormPresentacion01},
  FmrEmpresas01 in 'GUI_Layer\FmrEmpresas01.pas' {FormEmpresas01},
  uDL_TB_APARTADOSDETALLE in 'Data_Layer\uDL_TB_APARTADOSDETALLE.pas',
  uDL_TB_APARTADOSENCABEZADO in 'Data_Layer\uDL_TB_APARTADOSENCABEZADO.pas',
  uDL_TB_CIERRESCAJAENCABEZADO in 'Data_Layer\uDL_TB_CIERRESCAJAENCABEZADO.pas',
  uDL_TB_CLIENTES in 'Data_Layer\uDL_TB_CLIENTES.pas',
  uDL_TB_CONSECUTIVOS in 'Data_Layer\uDL_TB_CONSECUTIVOS.pas',
  uDL_TB_EMPRESAS in 'Data_Layer\uDL_TB_EMPRESAS.pas',
  uDL_TB_ENTRADASDETALLE in 'Data_Layer\uDL_TB_ENTRADASDETALLE.pas',
  uDL_TB_ENTRADASENCABEZADO in 'Data_Layer\uDL_TB_ENTRADASENCABEZADO.pas',
  uDL_TB_ESTADOS in 'Data_Layer\uDL_TB_ESTADOS.pas',
  uDL_TB_FACTURASCLIENTESDETALLE in 'Data_Layer\uDL_TB_FACTURASCLIENTESDETALLE.pas',
  uDL_TB_FACTURASCLIENTESENCABEZADO in 'Data_Layer\uDL_TB_FACTURASCLIENTESENCABEZADO.pas',
  uDL_TB_FAMILIAS in 'Data_Layer\uDL_TB_FAMILIAS.pas',
  uDL_TB_FORMASPAGO in 'Data_Layer\uDL_TB_FORMASPAGO.pas',
  uDL_TB_IMPUESTOS in 'Data_Layer\uDL_TB_IMPUESTOS.pas',
  uDL_TB_NOTASCREDITOENCABEZADO in 'Data_Layer\uDL_TB_NOTASCREDITOENCABEZADO.pas',
  uDL_TB_NOTASDEBITOENCABEZADO in 'Data_Layer\uDL_TB_NOTASDEBITOENCABEZADO.pas',
  uDL_TB_PLANTILLAS in 'Data_Layer\uDL_TB_PLANTILLAS.pas',
  uDL_TB_PRODUCTOS in 'Data_Layer\uDL_TB_PRODUCTOS.pas',
  uDL_TB_PROFORMASDETALLE in 'Data_Layer\uDL_TB_PROFORMASDETALLE.pas',
  uDL_TB_PROFORMASENCABEZADO in 'Data_Layer\uDL_TB_PROFORMASENCABEZADO.pas',
  uDL_TB_PROVEEDORES in 'Data_Layer\uDL_TB_PROVEEDORES.pas',
  uDL_TB_RECIBOSAPARTADOSDETALLE in 'Data_Layer\uDL_TB_RECIBOSAPARTADOSDETALLE.pas',
  uDL_TB_RECIBOSAPARTADOSENCABEZADO in 'Data_Layer\uDL_TB_RECIBOSAPARTADOSENCABEZADO.pas',
  uDL_TB_RECIBOSCLIENTESDETALLE in 'Data_Layer\uDL_TB_RECIBOSCLIENTESDETALLE.pas',
  uDL_TB_RECIBOSCLIENTESENCABEZADO in 'Data_Layer\uDL_TB_RECIBOSCLIENTESENCABEZADO.pas',
  uDL_TB_RECIBOSPROVEEDORESDETALLE in 'Data_Layer\uDL_TB_RECIBOSPROVEEDORESDETALLE.pas',
  uDL_TB_RECIBOSPROVEEDORESENCABEZADO in 'Data_Layer\uDL_TB_RECIBOSPROVEEDORESENCABEZADO.pas',
  uDL_TB_SISTEMA in 'Data_Layer\uDL_TB_SISTEMA.pas',
  uDL_TB_TIPOS in 'Data_Layer\uDL_TB_TIPOS.pas',
  uDL_TB_UNIDADESMEDIDA in 'Data_Layer\uDL_TB_UNIDADESMEDIDA.pas',
  uDL_TB_USUARIOS in 'Data_Layer\uDL_TB_USUARIOS.pas',
  uDL_TB_VENDEDORES in 'Data_Layer\uDL_TB_VENDEDORES.pas',
  uBS_TB_EMPRESAS in 'Business_Layer\uBS_TB_EMPRESAS.pas',
  FrmMantenimientoUsuarios01 in 'GUI_Layer\FrmMantenimientoUsuarios01.pas' {FormMantenimientoUsuarios01},
  FrmUsuarios01 in 'GUI_Layer\FrmUsuarios01.pas' {FormUsuarios01},
  FrmBaseDatos01 in 'GUI_Layer\FrmBaseDatos01.pas' {FormBaseDatos01},
  FrmMensaje_Espera01 in 'GUI_Layer\FrmMensaje_Espera01.pas' {FormMensaje_Espera01},
  FrmMantenimientoFamilias01 in 'GUI_Layer\FrmMantenimientoFamilias01.pas' {FormMantenimientoFamilias01},
  FrmFamilias01 in 'GUI_Layer\FrmFamilias01.pas' {FormFamilias01},
  FrmMantenimientoProductos01 in 'GUI_Layer\FrmMantenimientoProductos01.pas' {FormMantenimientoProductos01},
  FrmProductos01 in 'GUI_Layer\FrmProductos01.pas' {FormProductos01},
  FrmMantenimientoClientes01 in 'GUI_Layer\FrmMantenimientoClientes01.pas' {FormMantenimientoClientes01},
  FrmClientes01 in 'GUI_Layer\FrmClientes01.pas' {FormClientes01},
  FrmMantenimientoProveedores01 in 'GUI_Layer\FrmMantenimientoProveedores01.pas' {FormMantenimientoProveedores01},
  FrmProveedores01 in 'GUI_Layer\FrmProveedores01.pas' {FormProveedores01},
  FrmMantenimientoVendedores01 in 'GUI_Layer\FrmMantenimientoVendedores01.pas' {FormMantenimientoVendedores01},
  FrmVendedores01 in 'GUI_Layer\FrmVendedores01.pas' {FormVendedores01},
  FrmMantenimientoImpuestos01 in 'GUI_Layer\FrmMantenimientoImpuestos01.pas' {FormMantenimientoImpuestos01},
  FrmImpuestos01 in 'GUI_Layer\FrmImpuestos01.pas' {FormImpuestos01},
  FrmCambiarPrecios01 in 'GUI_Layer\FrmCambiarPrecios01.pas' {FormCambiarPrecios01},
  FrmMantenimientoFacturasClientes01 in 'GUI_Layer\FrmMantenimientoFacturasClientes01.pas' {FormMantenimientoFacturasClientes01},
  FrmFacturaClientes01 in 'GUI_Layer\FrmFacturaClientes01.pas' {FormFacturaClientes01},
  FrmBuscar_Productos01 in 'GUI_Layer\FrmBuscar_Productos01.pas' {FormBuscar_Productos01},
  FrmPagar01 in 'GUI_Layer\FrmPagar01.pas' {FormPagar01},
  FrmMantenimientoPlantillas01 in 'GUI_Layer\FrmMantenimientoPlantillas01.pas' {FormMantenimientoPlantillas01},
  FrmPlantillas01 in 'GUI_Layer\FrmPlantillas01.pas' {FormPlantillas01},
  uReportBuild in 'Functions\uReportBuild.pas',
  FrmAcercaDe01 in 'GUI_Layer\FrmAcercaDe01.pas' {FormAcercaDe01},
  udmReports in 'Modules\udmReports.pas' {dmReports: TDataModule},
  FrmMantenimientoProformas01 in 'GUI_Layer\FrmMantenimientoProformas01.pas' {FormMantenimientoProformas01},
  FrmProformas01 in 'GUI_Layer\FrmProformas01.pas' {FormProformas01},
  FrmMantenimientoApartados01 in 'GUI_Layer\FrmMantenimientoApartados01.pas' {FormMantenimientoApartados01},
  FrmApartados01 in 'GUI_Layer\FrmApartados01.pas' {FormApartados01},
  FrmMantenimientoFacturasProveedores01 in 'GUI_Layer\FrmMantenimientoFacturasProveedores01.pas' {FormMantenimientoFacturasProveedores01},
  FrmFacturasProveedores01 in 'GUI_Layer\FrmFacturasProveedores01.pas' {FormFacturasProveedores01},
  FrmOpciones01 in 'GUI_Layer\FrmOpciones01.pas' {FormOpciones01},
  FrmMantenimientoRecibosClientes01 in 'GUI_Layer\FrmMantenimientoRecibosClientes01.pas' {FormMantenimientoRecibosClientes01},
  FrmMantenimientoRecibosProveedores01 in 'GUI_Layer\FrmMantenimientoRecibosProveedores01.pas' {FormMantenimientoRecibosProveedores01},
  FrmAcceso01 in 'GUI_Layer\FrmAcceso01.pas' {FormAcceso01},
  FrmMantenimientoRecibosCierresCaja01 in 'GUI_Layer\FrmMantenimientoRecibosCierresCaja01.pas' {FormMantenimientoRecibosCierresCaja01},
  FrmRecibosClientes01 in 'GUI_Layer\FrmRecibosClientes01.pas' {FormRecibosClientes01},
  FrmMantenimientoRecibosApartados01 in 'GUI_Layer\FrmMantenimientoRecibosApartados01.pas' {FormMantenimientoRecibosApartados01},
  FrmProductoFueraInventario01 in 'GUI_Layer\FrmProductoFueraInventario01.pas' {FormProductoFueraInventario01},
  FrmRecibosProveedores01 in 'GUI_Layer\FrmRecibosProveedores01.pas' {FormRecibosProveedores01},
  FrmRecibosApartados01 in 'GUI_Layer\FrmRecibosApartados01.pas' {FormRecibosApartados01},
  FrmCierresCaja01 in 'GUI_Layer\FrmCierresCaja01.pas' {FormCierresCaja01},
  RptListadoFamilias01 in 'Reports\RptListadoFamilias01.pas' {ReptListadoFamilias01},
  RptListadoProductos01 in 'Reports\RptListadoProductos01.pas' {ReptListadoProductos01},
  RptListadoClientes01 in 'Reports\RptListadoClientes01.pas' {ReptListadoClientes01},
  RptListadoProveedores01 in 'Reports\RptListadoProveedores01.pas' {ReptListadoProveedores01},
  RptListadoVendedores01 in 'Reports\RptListadoVendedores01.pas' {ReptListadoVendedores01},
  RptFacturasProveedores01 in 'Reports\RptFacturasProveedores01.pas' {ReptFacturasProveedores01},
  RptFacturasClientes01 in 'Reports\RptFacturasClientes01.pas' {ReptFacturasClientes01},
  RptRecibosProveedores01 in 'Reports\RptRecibosProveedores01.pas' {ReptRecibosProveedores01},
  RptRecibosClientes01 in 'Reports\RptRecibosClientes01.pas' {ReptRecibosClientes01},
  RptRecibosApartados01 in 'Reports\RptRecibosApartados01.pas' {ReptRecibosApartados01},
  RptApartados01 in 'Reports\RptApartados01.pas' {ReptApartados01},
  RptProformas01 in 'Reports\RptProformas01.pas' {ReptProformas01},
  RptCierresCaja01 in 'Reports\RptCierresCaja01.pas' {ReptCierresCaja01},
  RptCompras01 in 'Reports\RptCompras01.pas' {ReptCompras01},
  RptVentas01 in 'Reports\RptVentas01.pas' {ReptVentas01},
  RptEstadoCuenta01 in 'Reports\RptEstadoCuenta01.pas' {ReptEstadoCuenta01},
  uDL_TB_GruposEncabezado in 'Data_Layer\uDL_TB_GruposEncabezado.pas',
  uDL_TB_GruposDetalle in 'Data_Layer\uDL_TB_GruposDetalle.pas',
  FrmMantenimientoGrupos01 in 'GUI_Layer\FrmMantenimientoGrupos01.pas' {FormMantenimientoGrupos01},
  FrmGrupos01 in 'GUI_Layer\FrmGrupos01.pas' {FormGrupos01},
  RptNotasCredito01 in 'Reports\RptNotasCredito01.pas' {ReptNotasCredito01},
  RptUtilidad01 in 'Reports\RptUtilidad01.pas' {ReptUtilidad01},
  RptValorInventario01 in 'Reports\RptValorInventario01.pas' {ReptValorInventario01},
  FrmOpcionesIniciales01 in 'GUI_Layer\FrmOpcionesIniciales01.pas' {FormOpcionesIniciales01},
  FrmMantenimientoOrdenes01 in 'GUI_Layer\FrmMantenimientoOrdenes01.pas' {FormMantenimientoOrdenes01},
  uDL_TB_OrdenesEncabezado in 'Data_Layer\uDL_TB_OrdenesEncabezado.pas',
  uDL_TB_OrdenesDetalle in 'Data_Layer\uDL_TB_OrdenesDetalle.pas',
  uLicencia in 'Functions\uLicencia.pas',
  FrmPedirLicencia01 in 'GUI_Layer\FrmPedirLicencia01.pas' {FormPedirLicencia01},
  FrmOrdenes01 in 'GUI_Layer\FrmOrdenes01.pas' {FormOrdenes01},
  FrmActivarLicencia01 in 'GUI_Layer\FrmActivarLicencia01.pas' {FormActivarLicencia01},
  uDL_TB_Licencia in 'Data_Layer\uDL_TB_Licencia.pas',
  FrmCambiarDetalle01 in 'GUI_Layer\FrmCambiarDetalle01.pas' {FormCambiarDetalle01},
  FrmDesuentoMonto01 in 'GUI_Layer\FrmDesuentoMonto01.pas' {FormDesuentoMonto01},
  uDL_TB_Cuentas in 'Data_Layer\uDL_TB_Cuentas.pas',
  FrmMantenimientoCuentas01 in 'GUI_Layer\FrmMantenimientoCuentas01.pas' {FormMantenimientoCuentas01},
  FrmCuentas01 in 'GUI_Layer\FrmCuentas01.pas' {FormCuentas01},
  uDL_TB_AsientosEncabezado in 'Data_Layer\uDL_TB_AsientosEncabezado.pas',
  uDL_TB_AsientosDetalle in 'Data_Layer\uDL_TB_AsientosDetalle.pas',
  FrmAcceso02 in 'GUI_Layer\FrmAcceso02.pas' {FormAcceso02},
  uDL_TB_NIVELESUSUARIOS in 'Data_Layer\uDL_TB_NIVELESUSUARIOS.pas',
  RptEstadistico01 in 'Reports\RptEstadistico01.pas' {ReptEstadistico01},
  FrmMovimientoInventario01 in 'GUI_Layer\FrmMovimientoInventario01.pas' {FormMovimientoInventario01},
  uDL_TB_INVENTARIOM in 'Data_Layer\uDL_TB_INVENTARIOM.pas',
  FrmMantenimientoAsientos01 in 'GUI_Layer\FrmMantenimientoAsientos01.pas' {FormMantenimientoAsientos01},
  FrmAsientos01 in 'GUI_Layer\FrmAsientos01.pas' {FormAsientos01},
  uDialogDirectory in 'Functions\uDialogDirectory.pas',
  RptMovimientosInventario01 in 'Reports\RptMovimientosInventario01.pas' {ReptMovimientosInventario01},
  FrmMantenimientoNotasCredito01 in 'GUI_Layer\FrmMantenimientoNotasCredito01.pas' {FormMantenimientoNotasCredito01},
  FrmNotasCredito01 in 'GUI_Layer\FrmNotasCredito01.pas' {FormNotasCredito01},
  uDL_TB_NOTASCREDITODETALLE in 'Data_Layer\uDL_TB_NOTASCREDITODETALLE.pas',
  FrmBuscar_Facturas01 in 'GUI_Layer\FrmBuscar_Facturas01.pas' {FormBuscar_Facturas01},
  uDL_TB_VENDEDORESCLIENTES in 'Data_Layer\uDL_TB_VENDEDORESCLIENTES.pas',
  uDL_TB_CONEXIONES in 'Data_Layer\uDL_TB_CONEXIONES.pas',
  RptDescuentos01 in 'Reports\RptDescuentos01.pas' {ReptDescuentos01},
  RptKilos01 in 'Reports\RptKilos01.pas' {ReptKilos01},
  RptProductosDevueltos01 in 'GUI_Layer\RptProductosDevueltos01.pas' {ReptProductosDevueltos01},
  RptProductosMinimos01 in 'Reports\RptProductosMinimos01.pas' {ReptProductosMinimos01},
  FrmListadoProductos01 in 'GUI_Layer\FrmListadoProductos01.pas' {FormListadoProductos01},
  FrmListadoClientes01 in 'GUI_Layer\FrmListadoClientes01.pas' {FormListadoClientes01},
  FrmRuta01 in 'GUI_Layer\FrmRuta01.pas' {FormRuta01},
  udmLenguajes in 'Modules\udmLenguajes.pas' {dmLenguajes: TDataModule},
  FrmSeleccionarEmpresa01 in 'GUI_Layer\FrmSeleccionarEmpresa01.pas' {FormSeleccionarEmpresa01},
  FrmEmpresasLista01 in 'GUI_Layer\FrmEmpresasLista01.pas' {FormEmpresasLista01},
  uHacienda in 'Functions\uHacienda.pas',
  uAuxiliares in 'Functions\uAuxiliares.pas',
  uDL_TB_DOCUMENTOSHACIENDA in 'Data_Layer\uDL_TB_DOCUMENTOSHACIENDA.pas',
  FrmMantenimientoNotasDebito01 in 'GUI_Layer\FrmMantenimientoNotasDebito01.pas' {FormMantenimientoNotasDebito01},
  uDL_tb_docunentosencabezado in 'Data_Layer\uDL_tb_docunentosencabezado.pas',
  uDL_tb_docunentosdetalle in 'Data_Layer\uDL_tb_docunentosdetalle.pas',
  uDL_tb_documentosdescuentos in 'Data_Layer\uDL_tb_documentosdescuentos.pas',
  uDL_tb_documentosotroscargos in 'Data_Layer\uDL_tb_documentosotroscargos.pas',
  uDL_tb_docunentosimpuestos in 'Data_Layer\uDL_tb_docunentosimpuestos.pas',
  FrmImportarEmpresaServidor01 in 'GUI_Layer\FrmImportarEmpresaServidor01.pas' {FormImportarEmpresaServidor01},
  uDL_tb_empresas2 in 'Data_Layer\uDL_tb_empresas2.pas',
  FrmVerReporte01 in 'GUI_Layer\FrmVerReporte01.pas' {FormVerReporte01},
  uDL_tb_consecutivosdocumentos in 'Data_Layer\uDL_tb_consecutivosdocumentos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SISFAC';
  Application.CreateForm(TFormPrincipal01, FormPrincipal01);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TdmObjects, dmObjects);
  Application.CreateForm(TFormPresentacion01, FormPresentacion01);
  Application.CreateForm(TFormEmpresas01, FormEmpresas01);
  Application.CreateForm(TFormMantenimientoUsuarios01, FormMantenimientoUsuarios01);
  Application.CreateForm(TFormUsuarios01, FormUsuarios01);
  Application.CreateForm(TFormBaseDatos01, FormBaseDatos01);
  Application.CreateForm(TFormMensaje_Espera01, FormMensaje_Espera01);
  Application.CreateForm(TFormMantenimientoFamilias01, FormMantenimientoFamilias01);
  Application.CreateForm(TFormFamilias01, FormFamilias01);
  Application.CreateForm(TFormMantenimientoProductos01, FormMantenimientoProductos01);
  Application.CreateForm(TFormProductos01, FormProductos01);
  Application.CreateForm(TFormMantenimientoClientes01, FormMantenimientoClientes01);
  Application.CreateForm(TFormClientes01, FormClientes01);
  Application.CreateForm(TFormMantenimientoProveedores01, FormMantenimientoProveedores01);
  Application.CreateForm(TFormProveedores01, FormProveedores01);
  Application.CreateForm(TFormMantenimientoVendedores01, FormMantenimientoVendedores01);
  Application.CreateForm(TFormVendedores01, FormVendedores01);
  Application.CreateForm(TFormMantenimientoImpuestos01, FormMantenimientoImpuestos01);
  Application.CreateForm(TFormImpuestos01, FormImpuestos01);
  Application.CreateForm(TFormCambiarPrecios01, FormCambiarPrecios01);
  Application.CreateForm(TFormMantenimientoFacturasClientes01, FormMantenimientoFacturasClientes01);
  Application.CreateForm(TFormFacturaClientes01, FormFacturaClientes01);
  Application.CreateForm(TFormBuscar_Productos01, FormBuscar_Productos01);
  Application.CreateForm(TFormPagar01, FormPagar01);
  Application.CreateForm(TFormMantenimientoPlantillas01, FormMantenimientoPlantillas01);
  Application.CreateForm(TFormPlantillas01, FormPlantillas01);
  Application.CreateForm(TFormAcercaDe01, FormAcercaDe01);
  Application.CreateForm(TdmReports, dmReports);
  Application.CreateForm(TFormMantenimientoProformas01, FormMantenimientoProformas01);
  Application.CreateForm(TFormProformas01, FormProformas01);
  Application.CreateForm(TFormMantenimientoApartados01, FormMantenimientoApartados01);
  Application.CreateForm(TFormApartados01, FormApartados01);
  Application.CreateForm(TFormMantenimientoFacturasProveedores01, FormMantenimientoFacturasProveedores01);
  Application.CreateForm(TFormFacturasProveedores01, FormFacturasProveedores01);
  Application.CreateForm(TFormOpciones01, FormOpciones01);
  Application.CreateForm(TFormMantenimientoRecibosClientes01, FormMantenimientoRecibosClientes01);
  Application.CreateForm(TFormMantenimientoRecibosProveedores01, FormMantenimientoRecibosProveedores01);
  Application.CreateForm(TFormAcceso01, FormAcceso01);
  Application.CreateForm(TFormMantenimientoRecibosCierresCaja01, FormMantenimientoRecibosCierresCaja01);
  Application.CreateForm(TFormRecibosClientes01, FormRecibosClientes01);
  Application.CreateForm(TFormMantenimientoRecibosApartados01, FormMantenimientoRecibosApartados01);
  Application.CreateForm(TFormProductoFueraInventario01, FormProductoFueraInventario01);
  Application.CreateForm(TFormRecibosProveedores01, FormRecibosProveedores01);
  Application.CreateForm(TFormRecibosApartados01, FormRecibosApartados01);
  Application.CreateForm(TFormCierresCaja01, FormCierresCaja01);
  Application.CreateForm(TReptListadoFamilias01, ReptListadoFamilias01);
  Application.CreateForm(TReptListadoProductos01, ReptListadoProductos01);
  Application.CreateForm(TReptListadoClientes01, ReptListadoClientes01);
  Application.CreateForm(TReptListadoProveedores01, ReptListadoProveedores01);
  Application.CreateForm(TReptListadoVendedores01, ReptListadoVendedores01);
  Application.CreateForm(TReptFacturasProveedores01, ReptFacturasProveedores01);
  Application.CreateForm(TReptFacturasClientes01, ReptFacturasClientes01);
  Application.CreateForm(TReptRecibosProveedores01, ReptRecibosProveedores01);
  Application.CreateForm(TReptRecibosClientes01, ReptRecibosClientes01);
  Application.CreateForm(TReptRecibosApartados01, ReptRecibosApartados01);
  Application.CreateForm(TReptApartados01, ReptApartados01);
  Application.CreateForm(TReptProformas01, ReptProformas01);
  Application.CreateForm(TReptCierresCaja01, ReptCierresCaja01);
  Application.CreateForm(TReptCompras01, ReptCompras01);
  Application.CreateForm(TReptVentas01, ReptVentas01);
  Application.CreateForm(TReptEstadoCuenta01, ReptEstadoCuenta01);
  Application.CreateForm(TFormMantenimientoGrupos01, FormMantenimientoGrupos01);
  Application.CreateForm(TFormGrupos01, FormGrupos01);
  Application.CreateForm(TReptNotasCredito01, ReptNotasCredito01);
  Application.CreateForm(TReptUtilidad01, ReptUtilidad01);
  Application.CreateForm(TReptValorInventario01, ReptValorInventario01);
  Application.CreateForm(TFormOpcionesIniciales01, FormOpcionesIniciales01);
  Application.CreateForm(TFormMantenimientoOrdenes01, FormMantenimientoOrdenes01);
  Application.CreateForm(TFormPedirLicencia01, FormPedirLicencia01);
  Application.CreateForm(TFormOrdenes01, FormOrdenes01);
  Application.CreateForm(TFormActivarLicencia01, FormActivarLicencia01);
  Application.CreateForm(TFormCambiarDetalle01, FormCambiarDetalle01);
  Application.CreateForm(TFormDesuentoMonto01, FormDesuentoMonto01);
  Application.CreateForm(TFormMantenimientoCuentas01, FormMantenimientoCuentas01);
  Application.CreateForm(TFormCuentas01, FormCuentas01);
  Application.CreateForm(TFormAcceso02, FormAcceso02);
  Application.CreateForm(TReptEstadistico01, ReptEstadistico01);
  Application.CreateForm(TFormMovimientoInventario01, FormMovimientoInventario01);
  Application.CreateForm(TFormMantenimientoAsientos01, FormMantenimientoAsientos01);
  Application.CreateForm(TFormAsientos01, FormAsientos01);
  Application.CreateForm(TReptMovimientosInventario01, ReptMovimientosInventario01);
  Application.CreateForm(TFormMantenimientoNotasCredito01, FormMantenimientoNotasCredito01);
  Application.CreateForm(TFormNotasCredito01, FormNotasCredito01);
  Application.CreateForm(TFormBuscar_Facturas01, FormBuscar_Facturas01);
  Application.CreateForm(TReptDescuentos01, ReptDescuentos01);
  Application.CreateForm(TReptKilos01, ReptKilos01);
  Application.CreateForm(TReptProductosDevueltos01, ReptProductosDevueltos01);
  Application.CreateForm(TReptProductosMinimos01, ReptProductosMinimos01);
  Application.CreateForm(TFormListadoProductos01, FormListadoProductos01);
  Application.CreateForm(TFormListadoClientes01, FormListadoClientes01);
  Application.CreateForm(TFormRuta01, FormRuta01);
  Application.CreateForm(TdmLenguajes, dmLenguajes);
  Application.CreateForm(TFormEmpresasLista01, FormEmpresasLista01);
  Application.CreateForm(TFormSeleccionarEmpresa01, FormSeleccionarEmpresa01);
  Application.CreateForm(TFormSeleccionarEmpresa01, FormSeleccionarEmpresa01);
  Application.CreateForm(TFormEmpresasLista01, FormEmpresasLista01);
  Application.CreateForm(TFormMantenimientoNotasDebito01, FormMantenimientoNotasDebito01);
  Application.CreateForm(TFormImportarEmpresaServidor01, FormImportarEmpresaServidor01);
  Application.CreateForm(TFormVerReporte01, FormVerReporte01);
  Application.Run;
end.
