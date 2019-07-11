-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.27


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema sisfac
--

CREATE DATABASE IF NOT EXISTS ERutas7;
USE ERutas7;

--
-- Definition of table `tb_apartadosdetalle`
--

DROP TABLE IF EXISTS `tb_apartadosdetalle`;
CREATE TABLE `tb_apartadosdetalle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `CODIGO` varchar(100) DEFAULT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `CANTIDAD` double DEFAULT NULL,
  `CODIGOUNIDADMEDIDA` int(11) DEFAULT NULL,
  `NOMBREUNIDADMEDIDA` varchar(100) DEFAULT NULL,
  `PRECIOUNITARIO` double DEFAULT NULL,
  `DESCUENTOP` double DEFAULT NULL,
  `DESCUENTOM` double DEFAULT NULL,
  `IVAP` double DEFAULT NULL,
  `IVAM` double DEFAULT NULL,
  `PRECIOUNITARIOFINAL` double DEFAULT NULL,
  `PRECIOFINAL` double DEFAULT NULL,
  `LINEA` int(11) DEFAULT NULL,
  `NOMBREESTADO` varchar(100) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOIMPUESTO` int(11) DEFAULT NULL,
  `NOMBREIMPUESTO` varchar(20) DEFAULT NULL,
  `PRECIOMAYORISTAAPLICADO` int(11) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_apartadosdetalle`
--

/*!40000 ALTER TABLE `tb_apartadosdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_apartadosdetalle` ENABLE KEYS */;


--
-- Definition of table `tb_apartadosencabezado`
--

DROP TABLE IF EXISTS `tb_apartadosencabezado`;
CREATE TABLE `tb_apartadosencabezado` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `NUMEROS` varchar(50) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` varchar(30) DEFAULT NULL,
  `CODIGOMESA` int(11) DEFAULT NULL,
  `NUMEROMESA` varchar(10) DEFAULT NULL,
  `CODIGOSALONERO` varchar(100) DEFAULT NULL,
  `USUARIOSALONERO` varchar(15) DEFAULT NULL,
  `NOMBRESALONERO` varchar(160) DEFAULT NULL,
  `CODIGOCLIENTE` varchar(100) DEFAULT NULL,
  `NOMBRECLIENTE` varchar(160) DEFAULT NULL,
  `SUBTOTAL` double DEFAULT NULL,
  `DESCUENTOP` double DEFAULT NULL,
  `DESCUENTOM` double DEFAULT NULL,
  `IVAP` double DEFAULT NULL,
  `IVAM` double DEFAULT NULL,
  `ISP` double DEFAULT NULL,
  `ISM` double DEFAULT NULL,
  `TRANSPORTE` double DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `TOTALGRAVADO` double DEFAULT NULL,
  `TOTALEXCENTO` double DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOFORMAPAGO` int(11) DEFAULT NULL,
  `CODIGOMONEDA` int(11) DEFAULT NULL,
  `TIPOCAMBIO` double DEFAULT NULL,
  `SERIE` varchar(5) DEFAULT NULL,
  `CODIGOIMPRESA` int(11) DEFAULT NULL,
  `NUMERODOC` varchar(100) DEFAULT NULL,
  `FECHAVENCIMIENTO` date DEFAULT NULL,
  `CODIGOTIPO` int(11) DEFAULT NULL,
  `SALDO` double DEFAULT NULL,
  `CARCREDITO` varchar(5) DEFAULT NULL,
  `CARCONTADO` varchar(5) DEFAULT NULL,
  `CODIGOVENDEDOR` varchar(100) DEFAULT NULL,
  `NOMBREVENDEDOR` varchar(160) DEFAULT NULL,
  `NUMEROFACTURA` int(11) DEFAULT NULL,
  `NUMEROSFACTURA` varchar(50) DEFAULT NULL,
  `PAGOCON` double DEFAULT NULL,
  `CAMBIO` double DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `IdVendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_apartadosencabezado`
--

/*!40000 ALTER TABLE `tb_apartadosencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_apartadosencabezado` ENABLE KEYS */;


--
-- Definition of table `tb_asientosdetalle`
--

DROP TABLE IF EXISTS `tb_asientosdetalle`;
CREATE TABLE `tb_asientosdetalle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDENCABEZADO` int(11) DEFAULT NULL,
  `IDMOVIMIENTO` int(11) DEFAULT NULL,
  `IDCUENTA` int(11) DEFAULT NULL,
  `DESCRIPCION` longtext,
  `REFERENCIA` varchar(100) DEFAULT NULL,
  `MONTO` double DEFAULT NULL,
  `DEBE` double DEFAULT NULL,
  `HABER` double DEFAULT NULL,
  `LINEA` int(11) DEFAULT NULL,
  `NOTAS` longtext,
  `IDTIPOORIGEN` int(11) DEFAULT NULL,
  `IDORIGEN` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_asientosdetalle`
--

/*!40000 ALTER TABLE `tb_asientosdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_asientosdetalle` ENABLE KEYS */;


--
-- Definition of table `tb_asientosencabezado`
--

DROP TABLE IF EXISTS `tb_asientosencabezado`;
CREATE TABLE `tb_asientosencabezado` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHACREACION` date DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `NUMERO` varchar(200) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOCIERRE` int(11) DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `NOTAS` longtext,
  `IDTIPOORIGEN` int(11) DEFAULT NULL,
  `IDORIGEN` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_asientosencabezado`
--

/*!40000 ALTER TABLE `tb_asientosencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_asientosencabezado` ENABLE KEYS */;


--
-- Definition of table `tb_cierrescajaencabezado`
--

DROP TABLE IF EXISTS `tb_cierrescajaencabezado`;
CREATE TABLE `tb_cierrescajaencabezado` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO` int(11) DEFAULT NULL,
  `IDMAQUINA` varchar(100) DEFAULT NULL,
  `FECHADE` date DEFAULT NULL,
  `FECHAHASTA` date DEFAULT NULL,
  `HORADE` varchar(30) DEFAULT NULL,
  `HORAHASTA` varchar(30) DEFAULT NULL,
  `MONTOINICIAL` double DEFAULT NULL,
  `MONTOFINAL` double DEFAULT NULL,
  `TOTALCANTIDADENTRADAS` int(11) DEFAULT NULL,
  `TOTALCANTIDADSALIDAS` int(11) DEFAULT NULL,
  `TOTALMONTOENTRADAS` double DEFAULT NULL,
  `TOTALMONTOSALIDAS` double DEFAULT NULL,
  `TOTALCANTIDADEFECTIVO` int(11) DEFAULT NULL,
  `TOTALCANTIDADTARJETA` int(11) DEFAULT NULL,
  `TOTALCANTIDADTRANSFERENCIA` int(11) DEFAULT NULL,
  `TOTALCANTIDADCHEQUE` int(11) DEFAULT NULL,
  `TOTALCANTIDADCREDITO` int(11) DEFAULT NULL,
  `TOTALMONTOEFECTIVO` double DEFAULT NULL,
  `TOTALMONTOTARJETA` double DEFAULT NULL,
  `TOTALMONTOTRANSFERENCIA` double DEFAULT NULL,
  `TOTALMONTOCHEQUE` double DEFAULT NULL,
  `TOTALMONTOCREDITO` double DEFAULT NULL,
  `COMENTARIOS` longtext,
  `TOTALNOTASCREDITO` double DEFAULT NULL,
  `TOTALDESCUENTOS` double DEFAULT NULL,
  `TOTALKILOS` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_cierrescajaencabezado`
--

/*!40000 ALTER TABLE `tb_cierrescajaencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cierrescajaencabezado` ENABLE KEYS */;


--
-- Definition of table `tb_clientes`
--

DROP TABLE IF EXISTS `tb_clientes`;
CREATE TABLE `tb_clientes` (
  `ID` int(11) NOT NULL,
  `CODIGO` varchar(100) DEFAULT NULL,
  `FECHAALTA` date DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO1` varchar(50) DEFAULT NULL,
  `APELLIDO2` varchar(50) DEFAULT NULL,
  `NOMBRECOMPLETO` varchar(160) DEFAULT NULL,
  `CODIGOPOSTAL` varchar(25) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `TELEFONO1` varchar(17) DEFAULT NULL,
  `TELEFONO2` varchar(17) DEFAULT NULL,
  `WEB` varchar(100) DEFAULT NULL,
  `NOMBREIMPRIMIR` varchar(160) DEFAULT NULL,
  `CEDULA` varchar(30) DEFAULT NULL,
  `IMAGEN1` longblob,
  `NOMBREARCHIVO` varchar(255) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `SALDO` double DEFAULT NULL,
  `LIMITECREDITO` double DEFAULT NULL,
  `APLICARLIMITECREDITO` int(11) DEFAULT NULL,
  `TIPO` int(11) DEFAULT NULL,
  `PRECIOVENTAPORCENTAJE` double DEFAULT NULL,
  `CONTACTONOMBRE` varchar(255) DEFAULT NULL,
  `TIPOPAGO` int(11) DEFAULT NULL,
  `PLAZO` int(11) DEFAULT NULL,
  `APLICARIMPUESTO` int(11) DEFAULT NULL,
  `DESCUENTOPOR` double DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `TEMP` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_clientes`
--

/*!40000 ALTER TABLE `tb_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_clientes` ENABLE KEYS */;


--
-- Definition of table `tb_consecutivos`
--

DROP TABLE IF EXISTS `tb_consecutivos`;
CREATE TABLE `tb_consecutivos` (
  `FACTURASCLIENTES` int(11) DEFAULT NULL,
  `ENTRADAS` int(11) DEFAULT NULL,
  `SALIDAS` int(11) DEFAULT NULL,
  `PROFORMAS` int(11) DEFAULT NULL,
  `RECIBOSABONOSCLIENTES` int(11) DEFAULT NULL,
  `APARTADOS` int(11) DEFAULT NULL,
  `RECIBOSABONOSAPARTADOS` int(11) DEFAULT NULL,
  `NOTASCREDITO` int(11) DEFAULT NULL,
  `NOTASDEBITO` int(11) DEFAULT NULL,
  `RECIBOSABONOSPROVEEDORES` int(11) DEFAULT NULL,
  `CLIENTES` int(11) DEFAULT NULL,
  `PRODUCTOS` int(11) DEFAULT NULL,
  `VENDEDORES` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_consecutivos`
--

/*!40000 ALTER TABLE `tb_consecutivos` DISABLE KEYS */;
INSERT INTO `tb_consecutivos` (`FACTURASCLIENTES`,`ENTRADAS`,`SALIDAS`,`PROFORMAS`,`RECIBOSABONOSCLIENTES`,`APARTADOS`,`RECIBOSABONOSAPARTADOS`,`NOTASCREDITO`,`NOTASDEBITO`,`RECIBOSABONOSPROVEEDORES`,`CLIENTES`,`PRODUCTOS`,`VENDEDORES`) VALUES 
 (0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `tb_consecutivos` ENABLE KEYS */;


--
-- Definition of table `tb_cuentas`
--

DROP TABLE IF EXISTS `tb_cuentas`;
CREATE TABLE `tb_cuentas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `CODIGO` varchar(100) DEFAULT NULL,
  `IDTIPO` int(11) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOPADREID` int(11) DEFAULT NULL,
  `NIVEL` int(11) DEFAULT NULL,
  `CODIGOPADRENOMBRE` longtext,
  `TEMP` longtext,
  `SALDO` double DEFAULT NULL,
  `EDITABLE` int(11) DEFAULT NULL,
  `MOSTRALISTA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_cuentas`
--

/*!40000 ALTER TABLE `tb_cuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cuentas` ENABLE KEYS */;


--
-- Definition of table `tb_empresas`
--

DROP TABLE IF EXISTS `tb_empresas`;
CREATE TABLE `tb_empresas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(200) DEFAULT NULL,
  `CEDULA` varchar(100) DEFAULT NULL,
  `DIRECCION` varchar(250) DEFAULT NULL,
  `TELEFONO1` varchar(17) DEFAULT NULL,
  `TELEFONO2` varchar(17) DEFAULT NULL,
  `FAX` varchar(17) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `WEB` varchar(200) DEFAULT NULL,
  `NOMBREJURIDICO` varchar(200) DEFAULT NULL,
  `REDSOCIAL` varchar(200) DEFAULT NULL,
  `INICIOPERIODOFISCAL` date DEFAULT NULL,
  `USARCONTABILIDAD` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_empresas`
--

/*!40000 ALTER TABLE `tb_empresas` DISABLE KEYS */;
INSERT INTO `tb_empresas` (`ID`,`CODIGO`,`NOMBRE`,`CEDULA`,`DIRECCION`,`TELEFONO1`,`TELEFONO2`,`FAX`,`EMAIL`,`WEB`,`NOMBREJURIDICO`,`REDSOCIAL`,`INICIOPERIODOFISCAL`,`USARCONTABILIDAD`) VALUES 
 (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tb_empresas` ENABLE KEYS */;


--
-- Definition of table `tb_entradasdetalle`
--

DROP TABLE IF EXISTS `tb_entradasdetalle`;
CREATE TABLE `tb_entradasdetalle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `CODIGO` varchar(100) DEFAULT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `CANTIDAD` double DEFAULT NULL,
  `CODIGOUNIDADMEDIDA` int(11) DEFAULT NULL,
  `NOMBREUNIDADMEDIDA` varchar(100) DEFAULT NULL,
  `PRECIOUNITARIO` double DEFAULT NULL,
  `DESCUENTOP` double DEFAULT NULL,
  `DESCUENTOM` double DEFAULT NULL,
  `IVAP` double DEFAULT NULL,
  `IVAM` double DEFAULT NULL,
  `PRECIOUNITARIOFINAL` double DEFAULT NULL,
  `PRECIOFINAL` double DEFAULT NULL,
  `LINEA` int(11) DEFAULT NULL,
  `NOMBREESTADO` varchar(100) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOIMPUESTO` int(11) DEFAULT NULL,
  `NOMBREIMPUESTO` varchar(20) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_entradasdetalle`
--

/*!40000 ALTER TABLE `tb_entradasdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_entradasdetalle` ENABLE KEYS */;


--
-- Definition of table `tb_entradasencabezado`
--

DROP TABLE IF EXISTS `tb_entradasencabezado`;
CREATE TABLE `tb_entradasencabezado` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `NUMEROS` varchar(50) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` varchar(30) DEFAULT NULL,
  `CODIGOMESA` int(11) DEFAULT NULL,
  `NUMEROMESA` varchar(10) DEFAULT NULL,
  `CODIGOSALONERO` varchar(100) DEFAULT NULL,
  `USUARIOSALONERO` varchar(15) DEFAULT NULL,
  `NOMBRESALONERO` varchar(160) DEFAULT NULL,
  `CODIGOPROVEEDOR` varchar(100) DEFAULT NULL,
  `NOMBREPROVEEDOR` varchar(160) DEFAULT NULL,
  `SUBTOTAL` double DEFAULT NULL,
  `DESCUENTOP` double DEFAULT NULL,
  `DESCUENTOM` double DEFAULT NULL,
  `IVAP` double DEFAULT NULL,
  `IVAM` double DEFAULT NULL,
  `ISP` double DEFAULT NULL,
  `ISM` double DEFAULT NULL,
  `TRANSPORTE` double DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `TOTALGRAVADO` double DEFAULT NULL,
  `TOTALEXCENTO` double DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOFORMAPAGO` int(11) DEFAULT NULL,
  `CODIGOMONEDA` int(11) DEFAULT NULL,
  `TIPOCAMBIO` double DEFAULT NULL,
  `SERIE` varchar(5) DEFAULT NULL,
  `CODIGOIMPRESA` int(11) DEFAULT NULL,
  `NUMERODOC` varchar(100) DEFAULT NULL,
  `FECHAVENCIMIENTO` date DEFAULT NULL,
  `CODIGOTIPO` int(11) DEFAULT NULL,
  `SALDO` double DEFAULT NULL,
  `CARCREDITO` varchar(5) DEFAULT NULL,
  `CARCONTADO` varchar(5) DEFAULT NULL,
  `CODIGOVENDEDOR` varchar(100) DEFAULT NULL,
  `NOMBREVENDEDOR` varchar(160) DEFAULT NULL,
  `NUMEROPROFORMA` int(11) DEFAULT NULL,
  `NUMEROSPROFORMA` varchar(50) DEFAULT NULL,
  `PAGOCON` double DEFAULT NULL,
  `CAMBIO` double DEFAULT NULL,
  `IdProveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_entradasencabezado`
--

/*!40000 ALTER TABLE `tb_entradasencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_entradasencabezado` ENABLE KEYS */;


--
-- Definition of table `tb_estados`
--

DROP TABLE IF EXISTS `tb_estados`;
CREATE TABLE `tb_estados` (
  `Id` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_estados`
--

/*!40000 ALTER TABLE `tb_estados` DISABLE KEYS */;
INSERT INTO `tb_estados` (`Id`,`NOMBRE`) VALUES 
 (1,'Abierto'),
 (2,'Pagado'),
 (3,'Anulado'),
 (4,'Pendiente');
/*!40000 ALTER TABLE `tb_estados` ENABLE KEYS */;


--
-- Definition of table `tb_facturasclientesdetalle`
--

DROP TABLE IF EXISTS `tb_facturasclientesdetalle`;
CREATE TABLE `tb_facturasclientesdetalle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `CODIGO` varchar(100) DEFAULT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `CANTIDAD` double DEFAULT NULL,
  `CODIGOUNIDADMEDIDA` int(11) DEFAULT NULL,
  `NOMBREUNIDADMEDIDA` varbinary(100) DEFAULT NULL,
  `PRECIOUNITARIO` double DEFAULT NULL,
  `DESCUENTOP` double DEFAULT NULL,
  `DESCUENTOM` double DEFAULT NULL,
  `IVAP` double DEFAULT NULL,
  `IVAM` double DEFAULT NULL,
  `PRECIOUNITARIOFINAL` double DEFAULT NULL,
  `PRECIOFINAL` double DEFAULT NULL,
  `LINEA` int(11) DEFAULT NULL,
  `NOMBREESTADO` varchar(100) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOIMPUESTO` int(11) DEFAULT NULL,
  `NOMBREIMPUESTO` varchar(20) DEFAULT NULL,
  `PRECIOMAYORISTAAPLICADO` int(11) DEFAULT NULL,
  `ISP` double DEFAULT NULL,
  `ISM` double DEFAULT NULL,
  `PRECIOUNITARIOBASE` double DEFAULT NULL,
  `PRECIOFINALBASE` double DEFAULT NULL,
  `DESCRIPCION1` varchar(255) DEFAULT NULL,
  `DESCRIPCION2` varchar(255) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `TOTALKILOS` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_facturasclientesdetalle`
--

/*!40000 ALTER TABLE `tb_facturasclientesdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_facturasclientesdetalle` ENABLE KEYS */;


--
-- Definition of table `tb_facturasclientesencabezado`
--

DROP TABLE IF EXISTS `tb_facturasclientesencabezado`;
CREATE TABLE `tb_facturasclientesencabezado` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `NUMEROS` varchar(50) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` varchar(30) DEFAULT NULL,
  `CODIGOMESA` int(11) DEFAULT NULL,
  `NUMEROMESA` varchar(10) DEFAULT NULL,
  `CODIGOSALONERO` varchar(100) DEFAULT NULL,
  `USUARIOSALONERO` varchar(15) DEFAULT NULL,
  `NOMBRESALONERO` varchar(160) DEFAULT NULL,
  `CODIGOCLIENTE` varchar(100) DEFAULT NULL,
  `NOMBRECLIENTE` varchar(160) DEFAULT NULL,
  `SUBTOTAL` double DEFAULT NULL,
  `DESCUENTOP` double DEFAULT NULL,
  `DESCUENTOM` double DEFAULT NULL,
  `IVAP` double DEFAULT NULL,
  `IVAM` double DEFAULT NULL,
  `ISP` double DEFAULT NULL,
  `ISM` double DEFAULT NULL,
  `TRANSPORTE` double DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `TOTALGRAVADO` double DEFAULT NULL,
  `TOTALEXCENTO` double DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOFORMAPAGO` int(11) DEFAULT NULL,
  `CODIGOMONEDA` int(11) DEFAULT NULL,
  `TIPOCAMBIO` double DEFAULT NULL,
  `SERIE` varchar(5) DEFAULT NULL,
  `CODIGOIMPRESA` int(11) DEFAULT NULL,
  `NUMERODOC` varchar(100) DEFAULT NULL,
  `FECHAVENCIMIENTO` date DEFAULT NULL,
  `CODIGOTIPO` int(11) DEFAULT NULL,
  `SALDO` double DEFAULT NULL,
  `CARCREDITO` varchar(5) DEFAULT NULL,
  `CARCONTADO` varchar(5) DEFAULT NULL,
  `CODIGOVENDEDOR` varchar(100) DEFAULT NULL,
  `NOMBREVENDEDOR` varchar(160) DEFAULT NULL,
  `NUMEROPROFORMA` int(11) DEFAULT NULL,
  `NUMEROSPROFORMA` varchar(50) DEFAULT NULL,
  `PAGOCON` double DEFAULT NULL,
  `CAMBIO` double DEFAULT NULL,
  `EFECTIVO` double DEFAULT NULL,
  `TARJETA` double DEFAULT NULL,
  `TRANSFERENCIA` double DEFAULT NULL,
  `CHEQUE` double DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `IdVendedor` int(11) DEFAULT NULL,
  `NUMERONOTACREDITO` int(11) DEFAULT NULL,
  `KILOS` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_facturasclientesencabezado`
--

/*!40000 ALTER TABLE `tb_facturasclientesencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_facturasclientesencabezado` ENABLE KEYS */;


--
-- Definition of table `tb_familias`
--

DROP TABLE IF EXISTS `tb_familias`;
CREATE TABLE `tb_familias` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_familias`
--

/*!40000 ALTER TABLE `tb_familias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_familias` ENABLE KEYS */;


--
-- Definition of table `tb_formaspago`
--

DROP TABLE IF EXISTS `tb_formaspago`;
CREATE TABLE `tb_formaspago` (
  `Id` int(11) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_formaspago`
--

/*!40000 ALTER TABLE `tb_formaspago` DISABLE KEYS */;
INSERT INTO `tb_formaspago` (`Id`,`NOMBRE`) VALUES 
 (1,'Efectivo'),
 (2,'Tarjeta'),
 (3,'Cheque'),
 (4,'Transferencia'),
 (5,'Crédito');
/*!40000 ALTER TABLE `tb_formaspago` ENABLE KEYS */;


--
-- Definition of table `tb_grupos_detalle`
--

DROP TABLE IF EXISTS `tb_grupos_detalle`;
CREATE TABLE `tb_grupos_detalle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdEncabezado` int(11) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `Cantidad` double DEFAULT NULL,
  `PrecioFinal` double DEFAULT NULL,
  `ProductoNombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_grupos_detalle`
--

/*!40000 ALTER TABLE `tb_grupos_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_grupos_detalle` ENABLE KEYS */;


--
-- Definition of table `tb_grupos_encabezado`
--

DROP TABLE IF EXISTS `tb_grupos_encabezado`;
CREATE TABLE `tb_grupos_encabezado` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) DEFAULT NULL,
  `TotalVenta` double DEFAULT NULL,
  `TotalCompra` double DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_grupos_encabezado`
--

/*!40000 ALTER TABLE `tb_grupos_encabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_grupos_encabezado` ENABLE KEYS */;


--
-- Definition of table `tb_impuestos`
--

DROP TABLE IF EXISTS `tb_impuestos`;
CREATE TABLE `tb_impuestos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `PORCENTAJE` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_impuestos`
--

/*!40000 ALTER TABLE `tb_impuestos` DISABLE KEYS */;
INSERT INTO `tb_impuestos` (`Id`,`NOMBRE`,`PORCENTAJE`) VALUES 
 (1,'Excento',0),
 (2,'I.V.A.',13);
/*!40000 ALTER TABLE `tb_impuestos` ENABLE KEYS */;


--
-- Definition of table `tb_inventariom`
--

DROP TABLE IF EXISTS `tb_inventariom`;
CREATE TABLE `tb_inventariom` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` date DEFAULT NULL,
  `IDPRODUCTO` int(11) DEFAULT NULL,
  `CANTIDAD` double DEFAULT NULL,
  `TIPO` int(11) DEFAULT NULL,
  `MOTIVO` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_inventariom`
--

/*!40000 ALTER TABLE `tb_inventariom` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_inventariom` ENABLE KEYS */;


--
-- Definition of table `tb_nivelesusuarios`
--

DROP TABLE IF EXISTS `tb_nivelesusuarios`;
CREATE TABLE `tb_nivelesusuarios` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_nivelesusuarios`
--

/*!40000 ALTER TABLE `tb_nivelesusuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_nivelesusuarios` ENABLE KEYS */;


--
-- Definition of table `tb_notascreditodetalle`
--

DROP TABLE IF EXISTS `tb_notascreditodetalle`;
CREATE TABLE `tb_notascreditodetalle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `CODIGO` varchar(100) DEFAULT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `CANTIDAD` double DEFAULT NULL,
  `CODIGOUNIDADMEDIDA` int(11) DEFAULT NULL,
  `NOMBREUNIDADMEDIDA` varchar(100) DEFAULT NULL,
  `PRECIOUNITARIO` double DEFAULT NULL,
  `DESCUENTOP` double DEFAULT NULL,
  `DESCUENTOM` double DEFAULT NULL,
  `IVAP` double DEFAULT NULL,
  `IVAM` double DEFAULT NULL,
  `PRECIOUNITARIOFINAL` double DEFAULT NULL,
  `PRECIOFINAL` double DEFAULT NULL,
  `LINEA` int(11) DEFAULT NULL,
  `NOMBREESTADO` varchar(100) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOIMPUESTO` int(11) DEFAULT NULL,
  `NOMBREIMPUESTO` varchar(20) DEFAULT NULL,
  `PRECIOMAYORISTAAPLICADO` int(11) DEFAULT NULL,
  `ISP` double DEFAULT NULL,
  `ISM` double DEFAULT NULL,
  `PRECIOUNITARIOBASE` int(11) DEFAULT NULL,
  `PRECIOFINALBASE` double DEFAULT NULL,
  `DESCRIPCION1` varchar(255) DEFAULT NULL,
  `DESCRIPCION2` varchar(255) DEFAULT NULL,
  `IDPRODUCTO` int(11) DEFAULT NULL,
  `TOTALKILOS` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_notascreditodetalle`
--

/*!40000 ALTER TABLE `tb_notascreditodetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_notascreditodetalle` ENABLE KEYS */;


--
-- Definition of table `tb_notascreditoencabezado`
--

DROP TABLE IF EXISTS `tb_notascreditoencabezado`;
CREATE TABLE `tb_notascreditoencabezado` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` varchar(30) DEFAULT NULL,
  `NOMBRECLIENTE` varchar(160) DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `NumeroDocumento` int(11) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Comentarios` longtext,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOFORMAPAGO` int(11) DEFAULT NULL,
  `EFECTIVO` double DEFAULT NULL,
  `TARJETA` double DEFAULT NULL,
  `TRANSFERENCIA` double DEFAULT NULL,
  `CHEQUE` double DEFAULT NULL,
  `KILOS` double DEFAULT NULL,
  `IDVENDEDOR` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_notascreditoencabezado`
--

/*!40000 ALTER TABLE `tb_notascreditoencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_notascreditoencabezado` ENABLE KEYS */;


--
-- Definition of table `tb_notasdebitoencabezado`
--

DROP TABLE IF EXISTS `tb_notasdebitoencabezado`;
CREATE TABLE `tb_notasdebitoencabezado` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `NUMEROS` varchar(50) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` varchar(30) DEFAULT NULL,
  `MONTOLETRAS` longtext,
  `SALDOANTERIOR` double DEFAULT NULL,
  `MONTONUMERO` double DEFAULT NULL,
  `SALDOACTUAL` double DEFAULT NULL,
  `CODIGOCLIENTE` varchar(100) DEFAULT NULL,
  `NOMBRECLIENTE` varchar(160) DEFAULT NULL,
  `INTERESESP` double DEFAULT NULL,
  `INTERESESM` double DEFAULT NULL,
  `TOTALFINAL` double DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOFORMAPAGO` int(11) DEFAULT NULL,
  `CODIGOMONEDA` int(11) DEFAULT NULL,
  `TIPOCAMBIO` double DEFAULT NULL,
  `SERIE` varchar(5) DEFAULT NULL,
  `CODIGOIMPRESA` int(11) DEFAULT NULL,
  `NUMERODOC` varchar(100) DEFAULT NULL,
  `FECHAVENCIMIENTO` date DEFAULT NULL,
  `CODIGOTIPO` int(11) DEFAULT NULL,
  `CARCREDITO` varchar(5) DEFAULT NULL,
  `CARCONTADO` varchar(5) DEFAULT NULL,
  `CODIGOVENDEDOR` varchar(100) DEFAULT NULL,
  `NOMBREVENDEDOR` varchar(160) DEFAULT NULL,
  `DESCRIPCION` longtext,
  `IdCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_notasdebitoencabezado`
--

/*!40000 ALTER TABLE `tb_notasdebitoencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_notasdebitoencabezado` ENABLE KEYS */;


--
-- Definition of table `tb_plantillas`
--

DROP TABLE IF EXISTS `tb_plantillas`;
CREATE TABLE `tb_plantillas` (
  `Id` int(11) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `PLANTILLA` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_plantillas`
--

/*!40000 ALTER TABLE `tb_plantillas` DISABLE KEYS */;
INSERT INTO `tb_plantillas` (`Id`,`DESCRIPCION`,`PLANTILLA`) VALUES 
 (1,'Factura de Contado','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\r\n<TfrxReport Version=\"5.2.12\" DotMatrixReport=\"False\" IniFile=\"\\Software\\Fast Reports\" PreviewOptions.Buttons=\"4089\" PreviewOptions.Zoom=\"1\" PrintOptions.Printer=\"Por defecto\" PrintOptions.PrintOnSheet=\"0\" ReportOptions.CreateDate=\"41335,7510912153\" ReportOptions.Description.Text=\"\" ReportOptions.LastChange=\"42897,832375\" ScriptLanguage=\"PascalScript\" ScriptText.Text=\"&#13;&#10;begin&#13;&#10;&#13;&#10;end.\">\r\n  <Datasets>\r\n    <item DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\"/>\r\n    <item DataSet=\"frxDBDataset2\" DataSetName=\"Facturas_Detalle\"/>\r\n    <item DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\"/>\r\n  </Datasets>\r\n  <TfrxDataPage Name=\"Data\" Height=\"1000\" Left=\"0\" Top=\"0\" Width=\"1000\"/>\r\n  <TfrxReportPage Name=\"Page1\" PaperWidth=\"76\" PaperHeight=\"280\" PaperSize=\"256\" LeftMargin=\"0\" RightMargin=\"0\" TopMargin=\"0\" BottomMargin=\"0\" ColumnWidth=\"0\" ColumnPositions.Text=\"\" EndlessHeight=\"True\" HGuides.Text=\"\" VGuides.Text=\"\">\r\n    <TfrxReportTitle Name=\"ReportTitle1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"491,33868031\" Left=\"0\" Top=\"18,89765\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo7\" Left=\"3,77953\" Top=\"185,19697\" Width=\"98,26778\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Factura de Contado\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFactura_Numero\" Left=\"3,77953\" Top=\"204,09462\" Width=\"151,18110236\" Height=\"18,89765\" DataField=\"Factura_Numero\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;Factura_Numero&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo9\" Left=\"3,77953\" Top=\"226,7718\" Width=\"41,57483\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Fecha:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFecha\" Left=\"45,35436\" Top=\"226,7718\" Width=\"90,70862236\" Height=\"18,89765\" DataField=\"Fecha\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;Fecha&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo11\" Left=\"3,77953\" Top=\"272,12616\" Width=\"52,91342\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoNombreCliente\" Left=\"3,77953\" Top=\"298,58287\" Width=\"275,90559236\" Height=\"41,57483\" DataField=\"NombreCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;NombreCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo12\" Left=\"170,07885\" Top=\"457,32313\" Width=\"30,23624\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cant.\"/>\r\n      <TfrxMemoView Name=\"Memo13\" Left=\"3,77953\" Top=\"457,32313\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"DescripciÃ³n\"/>\r\n      <TfrxMemoView Name=\"EmpresaTelefono1\" Align=\"baWidth\" Left=\"0\" Top=\"109,60637\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Telefono1\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Telefono1&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaDireccion\" Align=\"baWidth\" Left=\"0\" Top=\"86,92919\" Width=\"287,24428\" Height=\"22,67715559\" DataField=\"Direccion\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Direccion&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaNombre\" Align=\"baWidth\" Left=\"0\" Top=\"15,11812\" Width=\"287,24428\" Height=\"18,89762559\" DataField=\"Nombre\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"1\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Nombre&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaCedula\" Align=\"baWidth\" Left=\"0\" Top=\"68,03154\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Cedula\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Cedula&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaEmail\" Align=\"baWidth\" Left=\"0\" Top=\"128,50402\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Email\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Email&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo15\" Left=\"204,09462\" Top=\"457,32313\" Width=\"75,59055118\" Height=\"15,11812\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" SuppressRepeated=\"True\" Text=\"Precio \"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoDireccionCliente\" Left=\"3,77953\" Top=\"370,39394\" Width=\"275,90569\" Height=\"45,35436\" DataField=\"DireccionCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;DireccionCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo16\" Left=\"3,77953\" Top=\"343,93723\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Direccion Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoTelefono1Cliente\" Left=\"98,26778\" Top=\"423,30736\" Width=\"113,3859\" Height=\"15,11812\" DataField=\"Telefono1Cliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;Telefono1Cliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo19\" Left=\"3,77953\" Top=\"423,30736\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"TelÃ©fono. Cliente:\"/>\r\n      <TfrxMemoView Name=\"Memo29\" Left=\"3,77953\" Top=\"430,86642\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"frxDBDataset3RedSocial\" Align=\"baWidth\" Left=\"0\" Top=\"41,57483\" Width=\"287,24428\" Height=\"18,89765\" DataField=\"NombreJuridico\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;NombreJuridico&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo3\" Left=\"3,77953\" Top=\"468,66150031\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportTitle>\r\n    <TfrxMasterData Name=\"MasterData1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" Height=\"37,7953\" Left=\"0\" ParentFont=\"False\" Top=\"570,70903\" Width=\"287,24428\" ColumnWidth=\"0\" ColumnGap=\"0\" DataSet=\"frxDBDataset2\" DataSetName=\"Facturas_Detalle\" RowCount=\"0\">\r\n      <TfrxMemoView Name=\"Facturas_DetalleCantidad\" Left=\"158,74026\" Top=\"3,77953\" Width=\"41,57483\" Height=\"30,23624\" DataField=\"Cantidad\" DataSet=\"frxDBDataset2\" DataSetName=\"Facturas_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Detalle.&#34;Cantidad&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetalleNombre_Producto\" Left=\"3,77953\" Top=\"3,77953\" Width=\"151,1812\" Height=\"30,23624\" DataField=\"Nombre_Producto\" DataSet=\"frxDBDataset2\" DataSetName=\"Facturas_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Detalle.&#34;Nombre_Producto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetallePrecioUnitario\" Left=\"204,09462\" Top=\"3,77953\" Width=\"71,81104559\" Height=\"15,11812\" DataField=\"PrecioUnitario\" DataSet=\"frxDBDataset2\" DataSetName=\"Facturas_Detalle\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Facturas_Detalle.&#34;PrecioUnitario&#34;]\"/>\r\n    </TfrxMasterData>\r\n    <TfrxReportSummary Name=\"ReportSummary1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"222,99227\" Left=\"0\" Top=\"668,97681\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo17\" Left=\"3,77953\" Top=\"105,82684\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Total:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoTotal\" Left=\"147,40167\" Top=\"105,82684\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"Total\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;Total&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo23\" Align=\"baWidth\" Left=\"0\" Top=\"196,53556\" Width=\"287,24428\" Height=\"26,45671\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"Autorizado mediante resoluciÃ³n n. 04-0021-97, 30/09//97 de la D.G.T.D.\"/>\r\n      <TfrxMemoView Name=\"Memo1\" Left=\"3,77953\" Top=\"52,91342\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"+ I.V.:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoIVAMonto\" Left=\"147,40167\" Top=\"52,91342\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"IVAMonto\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;IVAMonto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoSubTotal\" Left=\"147,40167\" Top=\"26,45671\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"SubTotal\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;SubTotal&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo2\" Left=\"3,77953\" Top=\"75,5906\" Width=\"79,37013\" Height=\"22,67718\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"- descuento:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFechaVencimiento\" Left=\"83,14966\" Top=\"132,28355\" Width=\"124,72449\" Height=\"18,89765\" Visible=\"False\" DataField=\"FechaVencimiento\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;FechaVencimiento&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo5\" Left=\"3,77953\" Top=\"132,28355\" Width=\"79,37013\" Height=\"18,89765\" Visible=\"False\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Factura vence:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoServicioMonto\" Left=\"147,40167\" Top=\"79,37013\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"DescuentoMonto\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;DescuentoMonto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo28\" Left=\"3,77953\" Top=\"26,45671\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Subtotal:\"/>\r\n      <TfrxMemoView Name=\"Memo24\" Align=\"baWidth\" Left=\"0\" Top=\"177,63791\" Width=\"287,24428\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"Gracias por su compra.\"/>\r\n      <TfrxMemoView Name=\"Memo26\" Left=\"3,77953\" Top=\"3,77953\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"Memo31\" Left=\"3,77953\" Top=\"151,1812\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportSummary>\r\n  </TfrxReportPage>\r\n</TfrxReport>\r\n'),
 (2,'Factura de Crédito','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\r\n<TfrxReport Version=\"5.2.12\" DotMatrixReport=\"False\" IniFile=\"\\Software\\Fast Reports\" PreviewOptions.Buttons=\"4089\" PreviewOptions.Zoom=\"1\" PrintOptions.Printer=\"Por defecto\" PrintOptions.PrintOnSheet=\"0\" ReportOptions.CreateDate=\"41335,7510912153\" ReportOptions.Description.Text=\"\" ReportOptions.LastChange=\"42897,8333911574\" ScriptLanguage=\"PascalScript\" ScriptText.Text=\"&#13;&#10;begin&#13;&#10;&#13;&#10;end.\">\r\n  <Datasets>\r\n    <item DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\"/>\r\n    <item DataSet=\"frxDBDataset2\" DataSetName=\"Facturas_Detalle\"/>\r\n    <item DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\"/>\r\n  </Datasets>\r\n  <TfrxDataPage Name=\"Data\" Height=\"1000\" Left=\"0\" Top=\"0\" Width=\"1000\"/>\r\n  <TfrxReportPage Name=\"Page1\" PaperWidth=\"76\" PaperHeight=\"280\" PaperSize=\"256\" LeftMargin=\"0\" RightMargin=\"0\" TopMargin=\"0\" BottomMargin=\"0\" ColumnWidth=\"0\" ColumnPositions.Text=\"\" EndlessHeight=\"True\" HGuides.Text=\"\" VGuides.Text=\"\">\r\n    <TfrxReportTitle Name=\"ReportTitle1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"491,33868031\" Left=\"0\" Top=\"18,89765\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo7\" Left=\"3,77953\" Top=\"185,19697\" Width=\"98,26778\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Factura de CrÃ©dito\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFactura_Numero\" Left=\"3,77953\" Top=\"204,09462\" Width=\"151,18110236\" Height=\"18,89765\" DataField=\"Factura_Numero\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;Factura_Numero&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo9\" Left=\"3,77953\" Top=\"226,7718\" Width=\"41,57483\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Fecha:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFecha\" Left=\"45,35436\" Top=\"226,7718\" Width=\"90,70862236\" Height=\"18,89765\" DataField=\"Fecha\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;Fecha&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo11\" Left=\"3,77953\" Top=\"272,12616\" Width=\"52,91342\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoNombreCliente\" Left=\"3,77953\" Top=\"298,58287\" Width=\"275,90559236\" Height=\"41,57483\" DataField=\"NombreCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;NombreCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo12\" Left=\"170,07885\" Top=\"457,32313\" Width=\"30,23624\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cant.\"/>\r\n      <TfrxMemoView Name=\"Memo13\" Left=\"3,77953\" Top=\"457,32313\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"DescripciÃ³n\"/>\r\n      <TfrxMemoView Name=\"EmpresaTelefono1\" Align=\"baWidth\" Left=\"0\" Top=\"109,60637\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Telefono1\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Telefono1&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaDireccion\" Align=\"baWidth\" Left=\"0\" Top=\"86,92919\" Width=\"287,24428\" Height=\"22,67715559\" DataField=\"Direccion\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Direccion&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaNombre\" Align=\"baWidth\" Left=\"0\" Top=\"15,11812\" Width=\"287,24428\" Height=\"18,89762559\" DataField=\"Nombre\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"1\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Nombre&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaCedula\" Align=\"baWidth\" Left=\"0\" Top=\"68,03154\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Cedula\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Cedula&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaEmail\" Align=\"baWidth\" Left=\"0\" Top=\"128,50402\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Email\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Email&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo15\" Left=\"204,09462\" Top=\"457,32313\" Width=\"75,59055118\" Height=\"15,11812\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" SuppressRepeated=\"True\" Text=\"Precio \"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoDireccionCliente\" Left=\"3,77953\" Top=\"370,39394\" Width=\"275,90569\" Height=\"45,35436\" DataField=\"DireccionCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;DireccionCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo16\" Left=\"3,77953\" Top=\"343,93723\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Direccion Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoTelefono1Cliente\" Left=\"98,26778\" Top=\"423,30736\" Width=\"113,3859\" Height=\"15,11812\" DataField=\"Telefono1Cliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;Telefono1Cliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo19\" Left=\"3,77953\" Top=\"423,30736\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"TelÃ©fono. Cliente:\"/>\r\n      <TfrxMemoView Name=\"Memo29\" Left=\"3,77953\" Top=\"430,86642\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"frxDBDataset3RedSocial\" Align=\"baWidth\" Left=\"0\" Top=\"41,57483\" Width=\"287,24428\" Height=\"18,89765\" DataField=\"NombreJuridico\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;NombreJuridico&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo3\" Left=\"3,77953\" Top=\"468,66150031\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportTitle>\r\n    <TfrxMasterData Name=\"MasterData1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" Height=\"37,7953\" Left=\"0\" ParentFont=\"False\" Top=\"570,70903\" Width=\"287,24428\" ColumnWidth=\"0\" ColumnGap=\"0\" DataSet=\"frxDBDataset2\" DataSetName=\"Facturas_Detalle\" RowCount=\"0\">\r\n      <TfrxMemoView Name=\"Facturas_DetalleCantidad\" Left=\"158,74026\" Top=\"3,77953\" Width=\"41,57483\" Height=\"30,23624\" DataField=\"Cantidad\" DataSet=\"frxDBDataset2\" DataSetName=\"Facturas_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Detalle.&#34;Cantidad&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetalleNombre_Producto\" Left=\"3,77953\" Top=\"3,77953\" Width=\"151,1812\" Height=\"30,23624\" DataField=\"Nombre_Producto\" DataSet=\"frxDBDataset2\" DataSetName=\"Facturas_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Detalle.&#34;Nombre_Producto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetallePrecioUnitario\" Left=\"204,09462\" Top=\"3,77953\" Width=\"71,81104559\" Height=\"15,11812\" DataField=\"PrecioUnitario\" DataSet=\"frxDBDataset2\" DataSetName=\"Facturas_Detalle\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Facturas_Detalle.&#34;PrecioUnitario&#34;]\"/>\r\n    </TfrxMasterData>\r\n    <TfrxReportSummary Name=\"ReportSummary1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"222,99227\" Left=\"0\" Top=\"668,97681\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo17\" Left=\"3,77953\" Top=\"105,82684\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Total:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoTotal\" Left=\"147,40167\" Top=\"105,82684\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"Total\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;Total&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo23\" Align=\"baWidth\" Left=\"0\" Top=\"196,53556\" Width=\"287,24428\" Height=\"26,45671\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"Autorizado mediante resoluciÃ³n n. 04-0021-97, 30/09//97 de la D.G.T.D.\"/>\r\n      <TfrxMemoView Name=\"Memo1\" Left=\"3,77953\" Top=\"52,91342\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"+ I.V.:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoIVAMonto\" Left=\"147,40167\" Top=\"52,91342\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"IVAMonto\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;IVAMonto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoSubTotal\" Left=\"147,40167\" Top=\"26,45671\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"SubTotal\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;SubTotal&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo2\" Left=\"3,77953\" Top=\"75,5906\" Width=\"79,37013\" Height=\"22,67718\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"- descuento:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFechaVencimiento\" Left=\"83,14966\" Top=\"132,28355\" Width=\"124,72449\" Height=\"18,89765\" DataField=\"FechaVencimiento\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;FechaVencimiento&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo5\" Left=\"3,77953\" Top=\"132,28355\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Factura vence:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoServicioMonto\" Left=\"147,40167\" Top=\"79,37013\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"DescuentoMonto\" DataSet=\"frxDBDataset1\" DataSetName=\"Facturas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Facturas_Encabezado.&#34;DescuentoMonto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo28\" Left=\"3,77953\" Top=\"26,45671\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Subtotal:\"/>\r\n      <TfrxMemoView Name=\"Memo24\" Align=\"baWidth\" Left=\"0\" Top=\"177,63791\" Width=\"287,24428\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"Gracias por su compra.\"/>\r\n      <TfrxMemoView Name=\"Memo26\" Left=\"3,77953\" Top=\"3,77953\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"Memo31\" Left=\"3,77953\" Top=\"151,1812\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportSummary>\r\n  </TfrxReportPage>\r\n</TfrxReport>\r\n'),
 (3,'Proforma de Contado','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\r\n<TfrxReport Version=\"5.2.12\" DotMatrixReport=\"False\" IniFile=\"\\Software\\Fast Reports\" PreviewOptions.Buttons=\"4089\" PreviewOptions.Zoom=\"1\" PrintOptions.Printer=\"Por defecto\" PrintOptions.PrintOnSheet=\"0\" ReportOptions.CreateDate=\"41335,7510912153\" ReportOptions.Description.Text=\"\" ReportOptions.LastChange=\"42897,848379456\" ScriptLanguage=\"PascalScript\" ScriptText.Text=\"&#13;&#10;begin&#13;&#10;&#13;&#10;end.\">\r\n  <Datasets>\r\n    <item DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\"/>\r\n    <item DataSet=\"frxDBDataset2\" DataSetName=\"Proformas_Detalle\"/>\r\n    <item DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\"/>\r\n  </Datasets>\r\n  <TfrxDataPage Name=\"Data\" Height=\"1000\" Left=\"0\" Top=\"0\" Width=\"1000\"/>\r\n  <TfrxReportPage Name=\"Page1\" PaperWidth=\"76\" PaperHeight=\"280\" PaperSize=\"256\" LeftMargin=\"0\" RightMargin=\"0\" TopMargin=\"0\" BottomMargin=\"0\" ColumnWidth=\"0\" ColumnPositions.Text=\"\" EndlessHeight=\"True\" HGuides.Text=\"\" VGuides.Text=\"\">\r\n    <TfrxReportTitle Name=\"ReportTitle1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"491,33868031\" Left=\"0\" Top=\"18,89765\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo7\" Left=\"3,77953\" Top=\"177,63791\" Width=\"113,3859\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Proforma de Contado\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFactura_Numero\" Left=\"3,77953\" Top=\"204,09462\" Width=\"151,18110236\" Height=\"18,89765\" DataField=\"Proforma_Numero\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;Proforma_Numero&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo9\" Left=\"3,77953\" Top=\"226,7718\" Width=\"41,57483\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Fecha:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFecha\" Left=\"45,35436\" Top=\"226,7718\" Width=\"90,70862236\" Height=\"18,89765\" DataField=\"Fecha\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;Fecha&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo11\" Left=\"3,77953\" Top=\"272,12616\" Width=\"52,91342\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoNombreCliente\" Left=\"3,77953\" Top=\"298,58287\" Width=\"275,90559236\" Height=\"41,57483\" DataField=\"NombreCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;NombreCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo12\" Left=\"170,07885\" Top=\"457,32313\" Width=\"30,23624\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cant.\"/>\r\n      <TfrxMemoView Name=\"Memo13\" Left=\"3,77953\" Top=\"457,32313\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"DescripciÃ³n\"/>\r\n      <TfrxMemoView Name=\"EmpresaTelefono1\" Align=\"baWidth\" Left=\"0\" Top=\"109,60637\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Telefono1\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Telefono1&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaDireccion\" Align=\"baWidth\" Left=\"0\" Top=\"86,92919\" Width=\"287,24428\" Height=\"22,67715559\" DataField=\"Direccion\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Direccion&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaNombre\" Align=\"baWidth\" Left=\"0\" Top=\"15,11812\" Width=\"287,24428\" Height=\"18,89762559\" DataField=\"Nombre\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"1\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Nombre&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaCedula\" Align=\"baWidth\" Left=\"0\" Top=\"68,03154\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Cedula\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Cedula&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaEmail\" Align=\"baWidth\" Left=\"0\" Top=\"128,50402\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Email\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Email&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo15\" Left=\"204,09462\" Top=\"457,32313\" Width=\"75,59055118\" Height=\"15,11812\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" SuppressRepeated=\"True\" Text=\"Precio \"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoDireccionCliente\" Left=\"3,77953\" Top=\"370,39394\" Width=\"275,90569\" Height=\"45,35436\" DataField=\"DireccionCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;DireccionCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo16\" Left=\"3,77953\" Top=\"343,93723\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Direccion Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoTelefono1Cliente\" Left=\"98,26778\" Top=\"423,30736\" Width=\"113,3859\" Height=\"15,11812\" DataField=\"Telefono1Cliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;Telefono1Cliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo19\" Left=\"3,77953\" Top=\"423,30736\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"TelÃ©fono. Cliente:\"/>\r\n      <TfrxMemoView Name=\"Memo29\" Left=\"3,77953\" Top=\"430,86642\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"frxDBDataset3RedSocial\" Align=\"baWidth\" Left=\"0\" Top=\"41,57483\" Width=\"287,24428\" Height=\"18,89765\" DataField=\"NombreJuridico\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;NombreJuridico&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo3\" Left=\"3,77953\" Top=\"468,66150031\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportTitle>\r\n    <TfrxMasterData Name=\"MasterData1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" Height=\"37,7953\" Left=\"0\" ParentFont=\"False\" Top=\"570,70903\" Width=\"287,24428\" ColumnWidth=\"0\" ColumnGap=\"0\" DataSet=\"frxDBDataset2\" DataSetName=\"Proformas_Detalle\" RowCount=\"0\">\r\n      <TfrxMemoView Name=\"Facturas_DetalleCantidad\" Left=\"158,74026\" Top=\"3,77953\" Width=\"41,57483\" Height=\"30,23624\" DataField=\"Cantidad\" DataSet=\"frxDBDataset2\" DataSetName=\"Proformas_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Detalle.&#34;Cantidad&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetalleNombre_Producto\" Left=\"3,77953\" Top=\"3,77953\" Width=\"151,1812\" Height=\"30,23624\" DataField=\"Nombre_Producto\" DataSet=\"frxDBDataset2\" DataSetName=\"Proformas_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Detalle.&#34;Nombre_Producto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetallePrecioUnitario\" Left=\"204,09462\" Top=\"3,77953\" Width=\"71,81104559\" Height=\"15,11812\" DataField=\"PrecioUnitario\" DataSet=\"frxDBDataset2\" DataSetName=\"Proformas_Detalle\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Proformas_Detalle.&#34;PrecioUnitario&#34;]\"/>\r\n    </TfrxMasterData>\r\n    <TfrxReportSummary Name=\"ReportSummary1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"204,09462\" Left=\"0\" Top=\"668,97681\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo17\" Left=\"3,77953\" Top=\"105,82684\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Total:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoTotal\" Left=\"147,40167\" Top=\"105,82684\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"Total\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;Total&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo1\" Left=\"3,77953\" Top=\"52,91342\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"+ I.V.:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoIVAMonto\" Left=\"147,40167\" Top=\"52,91342\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"IVAMonto\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;IVAMonto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoSubTotal\" Left=\"147,40167\" Top=\"26,45671\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"SubTotal\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;SubTotal&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo2\" Left=\"3,77953\" Top=\"75,5906\" Width=\"79,37013\" Height=\"22,67718\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"- descuento:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFechaVencimiento\" Left=\"83,14966\" Top=\"132,28355\" Width=\"124,72449\" Height=\"18,89765\" Visible=\"False\" DataField=\"FechaVencimiento\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;FechaVencimiento&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo5\" Left=\"3,77953\" Top=\"132,28355\" Width=\"79,37013\" Height=\"18,89765\" Visible=\"False\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Factura vence:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoServicioMonto\" Left=\"147,40167\" Top=\"79,37013\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"DescuentoMonto\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;DescuentoMonto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo28\" Left=\"3,77953\" Top=\"26,45671\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Subtotal:\"/>\r\n      <TfrxMemoView Name=\"Memo24\" Align=\"baWidth\" Left=\"0\" Top=\"177,63791\" Width=\"287,24428\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"Gracias por su compra.\"/>\r\n      <TfrxMemoView Name=\"Memo26\" Left=\"3,77953\" Top=\"3,77953\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"Memo31\" Left=\"3,77953\" Top=\"151,1812\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportSummary>\r\n  </TfrxReportPage>\r\n</TfrxReport>\r\n'),
 (4,'Proforma de Crédito','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\r\n<TfrxReport Version=\"5.2.12\" DotMatrixReport=\"False\" IniFile=\"\\Software\\Fast Reports\" PreviewOptions.Buttons=\"4089\" PreviewOptions.Zoom=\"1\" PrintOptions.Printer=\"Por defecto\" PrintOptions.PrintOnSheet=\"0\" ReportOptions.CreateDate=\"41335,7510912153\" ReportOptions.Description.Text=\"\" ReportOptions.LastChange=\"42897,8510659144\" ScriptLanguage=\"PascalScript\" ScriptText.Text=\"&#13;&#10;begin&#13;&#10;&#13;&#10;end.\">\r\n  <Datasets>\r\n    <item DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\"/>\r\n    <item DataSet=\"frxDBDataset2\" DataSetName=\"Proformas_Detalle\"/>\r\n    <item DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\"/>\r\n  </Datasets>\r\n  <TfrxDataPage Name=\"Data\" Height=\"1000\" Left=\"0\" Top=\"0\" Width=\"1000\"/>\r\n  <TfrxReportPage Name=\"Page1\" PaperWidth=\"76\" PaperHeight=\"280\" PaperSize=\"256\" LeftMargin=\"0\" RightMargin=\"0\" TopMargin=\"0\" BottomMargin=\"0\" ColumnWidth=\"0\" ColumnPositions.Text=\"\" EndlessHeight=\"True\" HGuides.Text=\"\" VGuides.Text=\"\">\r\n    <TfrxReportTitle Name=\"ReportTitle1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"491,33868031\" Left=\"0\" Top=\"18,89765\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo7\" Left=\"3,77953\" Top=\"177,63791\" Width=\"113,3859\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Proforma de CrÃ©dito\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFactura_Numero\" Left=\"3,77953\" Top=\"204,09462\" Width=\"151,18110236\" Height=\"18,89765\" DataField=\"Proforma_Numero\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;Proforma_Numero&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo9\" Left=\"3,77953\" Top=\"226,7718\" Width=\"41,57483\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Fecha:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFecha\" Left=\"45,35436\" Top=\"226,7718\" Width=\"90,70862236\" Height=\"18,89765\" DataField=\"Fecha\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;Fecha&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo11\" Left=\"3,77953\" Top=\"272,12616\" Width=\"52,91342\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoNombreCliente\" Left=\"3,77953\" Top=\"298,58287\" Width=\"275,90559236\" Height=\"41,57483\" DataField=\"NombreCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;NombreCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo12\" Left=\"170,07885\" Top=\"457,32313\" Width=\"30,23624\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cant.\"/>\r\n      <TfrxMemoView Name=\"Memo13\" Left=\"3,77953\" Top=\"457,32313\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"DescripciÃ³n\"/>\r\n      <TfrxMemoView Name=\"EmpresaTelefono1\" Align=\"baWidth\" Left=\"0\" Top=\"109,60637\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Telefono1\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Telefono1&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaDireccion\" Align=\"baWidth\" Left=\"0\" Top=\"86,92919\" Width=\"287,24428\" Height=\"22,67715559\" DataField=\"Direccion\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Direccion&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaNombre\" Align=\"baWidth\" Left=\"0\" Top=\"15,11812\" Width=\"287,24428\" Height=\"18,89762559\" DataField=\"Nombre\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"1\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Nombre&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaCedula\" Align=\"baWidth\" Left=\"0\" Top=\"68,03154\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Cedula\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Cedula&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaEmail\" Align=\"baWidth\" Left=\"0\" Top=\"128,50402\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Email\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Email&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo15\" Left=\"204,09462\" Top=\"457,32313\" Width=\"75,59055118\" Height=\"15,11812\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" SuppressRepeated=\"True\" Text=\"Precio \"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoDireccionCliente\" Left=\"3,77953\" Top=\"370,39394\" Width=\"275,90569\" Height=\"45,35436\" DataField=\"DireccionCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;DireccionCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo16\" Left=\"3,77953\" Top=\"343,93723\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Direccion Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoTelefono1Cliente\" Left=\"98,26778\" Top=\"423,30736\" Width=\"113,3859\" Height=\"15,11812\" DataField=\"Telefono1Cliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;Telefono1Cliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo19\" Left=\"3,77953\" Top=\"423,30736\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"TelÃ©fono. Cliente:\"/>\r\n      <TfrxMemoView Name=\"Memo29\" Left=\"3,77953\" Top=\"430,86642\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"frxDBDataset3RedSocial\" Align=\"baWidth\" Left=\"0\" Top=\"41,57483\" Width=\"287,24428\" Height=\"18,89765\" DataField=\"NombreJuridico\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;NombreJuridico&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo3\" Left=\"3,77953\" Top=\"468,66150031\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportTitle>\r\n    <TfrxMasterData Name=\"MasterData1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" Height=\"37,7953\" Left=\"0\" ParentFont=\"False\" Top=\"570,70903\" Width=\"287,24428\" ColumnWidth=\"0\" ColumnGap=\"0\" DataSet=\"frxDBDataset2\" DataSetName=\"Proformas_Detalle\" RowCount=\"0\">\r\n      <TfrxMemoView Name=\"Facturas_DetalleCantidad\" Left=\"158,74026\" Top=\"3,77953\" Width=\"41,57483\" Height=\"30,23624\" DataField=\"Cantidad\" DataSet=\"frxDBDataset2\" DataSetName=\"Proformas_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Detalle.&#34;Cantidad&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetalleNombre_Producto\" Left=\"3,77953\" Top=\"3,77953\" Width=\"151,1812\" Height=\"30,23624\" DataField=\"Nombre_Producto\" DataSet=\"frxDBDataset2\" DataSetName=\"Proformas_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Detalle.&#34;Nombre_Producto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetallePrecioUnitario\" Left=\"204,09462\" Top=\"3,77953\" Width=\"71,81104559\" Height=\"15,11812\" DataField=\"PrecioUnitario\" DataSet=\"frxDBDataset2\" DataSetName=\"Proformas_Detalle\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Proformas_Detalle.&#34;PrecioUnitario&#34;]\"/>\r\n    </TfrxMasterData>\r\n    <TfrxReportSummary Name=\"ReportSummary1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"204,09462\" Left=\"0\" Top=\"668,97681\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo17\" Left=\"3,77953\" Top=\"105,82684\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Total:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoTotal\" Left=\"147,40167\" Top=\"105,82684\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"Total\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;Total&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo1\" Left=\"3,77953\" Top=\"52,91342\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"+ I.V.:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoIVAMonto\" Left=\"147,40167\" Top=\"52,91342\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"IVAMonto\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;IVAMonto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoSubTotal\" Left=\"147,40167\" Top=\"26,45671\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"SubTotal\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;SubTotal&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo2\" Left=\"3,77953\" Top=\"75,5906\" Width=\"79,37013\" Height=\"22,67718\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"- descuento:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFechaVencimiento\" Left=\"83,14966\" Top=\"132,28355\" Width=\"124,72449\" Height=\"18,89765\" DataField=\"FechaVencimiento\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;FechaVencimiento&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo5\" Left=\"3,77953\" Top=\"132,28355\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Vence:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoServicioMonto\" Left=\"147,40167\" Top=\"79,37013\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"DescuentoMonto\" DataSet=\"frxDBDataset1\" DataSetName=\"Proformas_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Proformas_Encabezado.&#34;DescuentoMonto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo28\" Left=\"3,77953\" Top=\"26,45671\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Subtotal:\"/>\r\n      <TfrxMemoView Name=\"Memo24\" Align=\"baWidth\" Left=\"0\" Top=\"177,63791\" Width=\"287,24428\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"Gracias por su compra.\"/>\r\n      <TfrxMemoView Name=\"Memo26\" Left=\"3,77953\" Top=\"3,77953\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"Memo31\" Left=\"3,77953\" Top=\"151,1812\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportSummary>\r\n  </TfrxReportPage>\r\n</TfrxReport>\r\n'),
 (5,'Entrada de Contado',NULL),
 (6,'Entrada de Crédito',NULL),
 (7,'Salida de Contado',NULL),
 (8,'Salida de Crédito',NULL),
 (9,'Recibo de Abono Cliente','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\r\n<TfrxReport Version=\"5.2.12\" DotMatrixReport=\"False\" IniFile=\"\\Software\\Fast Reports\" PreviewOptions.Buttons=\"4089\" PreviewOptions.Zoom=\"1\" PrintOptions.Printer=\"Por defecto\" PrintOptions.PrintOnSheet=\"0\" ReportOptions.CreateDate=\"41335,7510912153\" ReportOptions.Description.Text=\"\" ReportOptions.LastChange=\"42897,8616833796\" ScriptLanguage=\"PascalScript\" ScriptText.Text=\"&#13;&#10;begin&#13;&#10;&#13;&#10;end.\">\r\n  <Datasets>\r\n    <item DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\"/>\r\n    <item DataSet=\"frxDBDataset2\" DataSetName=\"RecibosAbonos_Detalle\"/>\r\n    <item DataSet=\"frxDBDataset1\" DataSetName=\"RecibosAbonos_Encabezado\"/>\r\n  </Datasets>\r\n  <TfrxDataPage Name=\"Data\" Height=\"1000\" Left=\"0\" Top=\"0\" Width=\"1000\"/>\r\n  <TfrxReportPage Name=\"Page1\" PaperWidth=\"76\" PaperHeight=\"280\" PaperSize=\"256\" LeftMargin=\"0\" RightMargin=\"0\" TopMargin=\"0\" BottomMargin=\"0\" ColumnWidth=\"0\" ColumnPositions.Text=\"\" EndlessHeight=\"True\" HGuides.Text=\"\" VGuides.Text=\"\">\r\n    <TfrxReportTitle Name=\"ReportTitle1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"362,83466031\" Left=\"0\" Top=\"18,89765\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo7\" Left=\"3,77953\" Top=\"185,19697\" Width=\"98,26778\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Recibo:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFactura_Numero\" Left=\"3,77953\" Top=\"207,87415\" Width=\"151,18110236\" Height=\"18,89765\" DataField=\"Recibo_Numero\" DataSet=\"frxDBDataset1\" DataSetName=\"RecibosAbonos_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[RecibosAbonos_Encabezado.&#34;Recibo_Numero&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo9\" Left=\"3,77953\" Top=\"230,55133\" Width=\"41,57483\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Fecha:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFecha\" Left=\"49,13389\" Top=\"230,55133\" Width=\"90,70862236\" Height=\"18,89765\" DataField=\"Fecha\" DataSet=\"frxDBDataset1\" DataSetName=\"RecibosAbonos_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[RecibosAbonos_Encabezado.&#34;Fecha&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo11\" Left=\"3,77953\" Top=\"260,78757\" Width=\"52,91342\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoNombreCliente\" Left=\"3,77953\" Top=\"287,24428\" Width=\"275,90559236\" Height=\"18,89765\" DataField=\"NombreCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"RecibosAbonos_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[RecibosAbonos_Encabezado.&#34;NombreCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo12\" Left=\"132,28355\" Top=\"321,26005\" Width=\"41,57483\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Factura:\"/>\r\n      <TfrxMemoView Name=\"EmpresaTelefono1\" Align=\"baWidth\" Left=\"0\" Top=\"109,60637\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Telefono1\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Telefono1&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaDireccion\" Align=\"baWidth\" Left=\"0\" Top=\"86,92919\" Width=\"287,24428\" Height=\"22,67715559\" DataField=\"Direccion\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Direccion&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaNombre\" Align=\"baWidth\" Left=\"0\" Top=\"15,11812\" Width=\"287,24428\" Height=\"18,89762559\" DataField=\"Nombre\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"1\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Nombre&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaCedula\" Align=\"baWidth\" Left=\"0\" Top=\"68,03154\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Cedula\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Cedula&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaEmail\" Align=\"baWidth\" Left=\"0\" Top=\"128,50402\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Email\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Email&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo8\" Left=\"3,77953\" Top=\"321,25983031\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Factura:\"/>\r\n      <TfrxMemoView Name=\"Memo29\" Left=\"0\" Top=\"294,80334\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"frxDBDataset3RedSocial\" Align=\"baWidth\" Left=\"0\" Top=\"41,57483\" Width=\"287,24428\" Height=\"18,89765\" DataField=\"NombreJuridico\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;NombreJuridico&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo3\" Left=\"0\" Top=\"332,59842031\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportTitle>\r\n    <TfrxMasterData Name=\"MasterData1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" Height=\"37,7953\" Left=\"0\" ParentFont=\"False\" Top=\"442,20501\" Width=\"287,24428\" ColumnWidth=\"0\" ColumnGap=\"0\" DataSet=\"frxDBDataset2\" DataSetName=\"RecibosAbonos_Detalle\" RowCount=\"0\">\r\n      <TfrxMemoView Name=\"Facturas_DetalleCantidad\" Left=\"136,06308\" Top=\"3,77953\" Width=\"105,82684\" Height=\"30,23624\" DataField=\"MontoAbono\" DataSet=\"frxDBDataset2\" DataSetName=\"RecibosAbonos_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[RecibosAbonos_Detalle.&#34;MontoAbono&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetalleCodigo_Producto\" Left=\"3,77953\" Top=\"3,77953\" Width=\"79,37013\" Height=\"26,45671\" DataField=\"Factura_Numero\" DataSet=\"frxDBDataset2\" DataSetName=\"RecibosAbonos_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[RecibosAbonos_Detalle.&#34;Factura_Numero&#34;]\"/>\r\n    </TfrxMasterData>\r\n    <TfrxReportSummary Name=\"ReportSummary1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"56,69295\" Left=\"0\" Top=\"540,47279\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoSubTotal\" Left=\"120,94496\" Top=\"26,45671\" Width=\"132,28355\" Height=\"18,89765\" DataField=\"MontoNumero\" DataSet=\"frxDBDataset1\" DataSetName=\"RecibosAbonos_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[RecibosAbonos_Encabezado.&#34;MontoNumero&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo28\" Left=\"34,01577\" Top=\"26,45671\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Total:\"/>\r\n      <TfrxMemoView Name=\"Memo26\" Left=\"3,77953\" Top=\"3,77953\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportSummary>\r\n  </TfrxReportPage>\r\n</TfrxReport>\r\n'),
 (10,'Cierre de Caja',NULL);
INSERT INTO `tb_plantillas` (`Id`,`DESCRIPCION`,`PLANTILLA`) VALUES 
 (11,'Apartado','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\r\n<TfrxReport Version=\"5.2.12\" DotMatrixReport=\"False\" IniFile=\"\\Software\\Fast Reports\" PreviewOptions.Buttons=\"4089\" PreviewOptions.Zoom=\"1\" PrintOptions.Printer=\"Por defecto\" PrintOptions.PrintOnSheet=\"0\" ReportOptions.CreateDate=\"41335,7510912153\" ReportOptions.Description.Text=\"\" ReportOptions.LastChange=\"42897,8544778009\" ScriptLanguage=\"PascalScript\" ScriptText.Text=\"&#13;&#10;begin&#13;&#10;&#13;&#10;end.\">\r\n  <Datasets>\r\n    <item DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\"/>\r\n    <item DataSet=\"frxDBDataset2\" DataSetName=\"Apartado_Detalle\"/>\r\n    <item DataSet=\"frxDBDataset1\" DataSetName=\"Apartado_Encabezado\"/>\r\n  </Datasets>\r\n  <TfrxDataPage Name=\"Data\" Height=\"1000\" Left=\"0\" Top=\"0\" Width=\"1000\"/>\r\n  <TfrxReportPage Name=\"Page1\" PaperWidth=\"76\" PaperHeight=\"280\" PaperSize=\"256\" LeftMargin=\"0\" RightMargin=\"0\" TopMargin=\"0\" BottomMargin=\"0\" ColumnWidth=\"0\" ColumnPositions.Text=\"\" EndlessHeight=\"True\" HGuides.Text=\"\" VGuides.Text=\"\">\r\n    <TfrxReportTitle Name=\"ReportTitle1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"491,33868031\" Left=\"0\" Top=\"18,89765\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo7\" Left=\"3,77953\" Top=\"185,19697\" Width=\"98,26778\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Apartado:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFactura_Numero\" Left=\"3,77953\" Top=\"204,09462\" Width=\"151,18110236\" Height=\"18,89765\" DataField=\"Apartado_Numero\" DataSet=\"frxDBDataset1\" DataSetName=\"Apartado_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Apartado_Encabezado.&#34;Apartado_Numero&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo9\" Left=\"3,77953\" Top=\"226,7718\" Width=\"41,57483\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Fecha:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFecha\" Left=\"45,35436\" Top=\"226,7718\" Width=\"90,70862236\" Height=\"18,89765\" DataField=\"Fecha\" DataSet=\"frxDBDataset1\" DataSetName=\"Apartado_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Apartado_Encabezado.&#34;Fecha&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo11\" Left=\"3,77953\" Top=\"272,12616\" Width=\"52,91342\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoNombreCliente\" Left=\"3,77953\" Top=\"298,58287\" Width=\"275,90559236\" Height=\"41,57483\" DataField=\"NombreCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Apartado_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Apartado_Encabezado.&#34;NombreCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo12\" Left=\"170,07885\" Top=\"457,32313\" Width=\"30,23624\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cant.\"/>\r\n      <TfrxMemoView Name=\"Memo13\" Left=\"3,77953\" Top=\"457,32313\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"DescripciÃ³n\"/>\r\n      <TfrxMemoView Name=\"EmpresaTelefono1\" Align=\"baWidth\" Left=\"0\" Top=\"109,60637\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Telefono1\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Telefono1&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaDireccion\" Align=\"baWidth\" Left=\"0\" Top=\"86,92919\" Width=\"287,24428\" Height=\"22,67715559\" DataField=\"Direccion\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Direccion&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaNombre\" Align=\"baWidth\" Left=\"0\" Top=\"15,11812\" Width=\"287,24428\" Height=\"18,89762559\" DataField=\"Nombre\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"1\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Nombre&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaCedula\" Align=\"baWidth\" Left=\"0\" Top=\"68,03154\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Cedula\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Cedula&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaEmail\" Align=\"baWidth\" Left=\"0\" Top=\"128,50402\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Email\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Email&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo15\" Left=\"204,09462\" Top=\"457,32313\" Width=\"75,59055118\" Height=\"15,11812\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" SuppressRepeated=\"True\" Text=\"Precio \"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoDireccionCliente\" Left=\"3,77953\" Top=\"370,39394\" Width=\"275,90569\" Height=\"45,35436\" DataField=\"DireccionCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Apartado_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Apartado_Encabezado.&#34;DireccionCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo16\" Left=\"3,77953\" Top=\"343,93723\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Direccion Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoTelefono1Cliente\" Left=\"98,26778\" Top=\"423,30736\" Width=\"113,3859\" Height=\"15,11812\" DataField=\"Telefono1Cliente\" DataSet=\"frxDBDataset1\" DataSetName=\"Apartado_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Apartado_Encabezado.&#34;Telefono1Cliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo19\" Left=\"3,77953\" Top=\"423,30736\" Width=\"94,48825\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"TelÃ©fono. Cliente:\"/>\r\n      <TfrxMemoView Name=\"Memo29\" Left=\"3,77953\" Top=\"430,86642\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"frxDBDataset3RedSocial\" Align=\"baWidth\" Left=\"0\" Top=\"41,57483\" Width=\"287,24428\" Height=\"18,89765\" DataField=\"NombreJuridico\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;NombreJuridico&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo3\" Left=\"3,77953\" Top=\"468,66150031\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportTitle>\r\n    <TfrxMasterData Name=\"MasterData1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" Height=\"37,7953\" Left=\"0\" ParentFont=\"False\" Top=\"570,70903\" Width=\"287,24428\" ColumnWidth=\"0\" ColumnGap=\"0\" DataSet=\"frxDBDataset2\" DataSetName=\"Apartado_Detalle\" RowCount=\"0\">\r\n      <TfrxMemoView Name=\"Facturas_DetalleCantidad\" Left=\"158,74026\" Top=\"3,77953\" Width=\"41,57483\" Height=\"30,23624\" DataField=\"Cantidad\" DataSet=\"frxDBDataset2\" DataSetName=\"Apartado_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Apartado_Detalle.&#34;Cantidad&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetalleNombre_Producto\" Left=\"3,77953\" Top=\"3,77953\" Width=\"151,1812\" Height=\"30,23624\" DataField=\"Nombre_Producto\" DataSet=\"frxDBDataset2\" DataSetName=\"Apartado_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Apartado_Detalle.&#34;Nombre_Producto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetallePrecioUnitario\" Left=\"204,09462\" Top=\"3,77953\" Width=\"71,81104559\" Height=\"15,11812\" DataField=\"PrecioUnitario\" DataSet=\"frxDBDataset2\" DataSetName=\"Apartado_Detalle\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Apartado_Detalle.&#34;PrecioUnitario&#34;]\"/>\r\n    </TfrxMasterData>\r\n    <TfrxReportSummary Name=\"ReportSummary1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"173,85838\" Left=\"0\" Top=\"668,97681\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo17\" Left=\"3,77953\" Top=\"105,82684\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Total:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoTotal\" Left=\"147,40167\" Top=\"105,82684\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"Total\" DataSet=\"frxDBDataset1\" DataSetName=\"Apartado_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Apartado_Encabezado.&#34;Total&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo1\" Left=\"3,77953\" Top=\"52,91342\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"+ I.V.:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoIVAMonto\" Left=\"147,40167\" Top=\"52,91342\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"IVAMonto\" DataSet=\"frxDBDataset1\" DataSetName=\"Apartado_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Apartado_Encabezado.&#34;IVAMonto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoSubTotal\" Left=\"147,40167\" Top=\"26,45671\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"SubTotal\" DataSet=\"frxDBDataset1\" DataSetName=\"Apartado_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Apartado_Encabezado.&#34;SubTotal&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo2\" Left=\"3,77953\" Top=\"75,5906\" Width=\"79,37013\" Height=\"22,67718\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"- descuento:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFechaVencimiento\" Left=\"83,14966\" Top=\"132,28355\" Width=\"124,72449\" Height=\"18,89765\" Visible=\"False\" DataField=\"FechaVencimiento\" DataSet=\"frxDBDataset1\" DataSetName=\"Apartado_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[Apartado_Encabezado.&#34;FechaVencimiento&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo5\" Left=\"3,77953\" Top=\"132,28355\" Width=\"79,37013\" Height=\"18,89765\" Visible=\"False\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Factura vence:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoServicioMonto\" Left=\"147,40167\" Top=\"79,37013\" Width=\"128,50402\" Height=\"18,89765\" DataField=\"DescuentoMonto\" DataSet=\"frxDBDataset1\" DataSetName=\"Apartado_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[Apartado_Encabezado.&#34;DescuentoMonto&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo28\" Left=\"3,77953\" Top=\"26,45671\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Subtotal:\"/>\r\n      <TfrxMemoView Name=\"Memo26\" Left=\"3,77953\" Top=\"3,77953\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"Memo31\" Left=\"3,77953\" Top=\"151,1812\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportSummary>\r\n  </TfrxReportPage>\r\n</TfrxReport>\r\n'),
 (12,'Recibo de Abono Apartado','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\r\n<TfrxReport Version=\"5.2.12\" DotMatrixReport=\"False\" IniFile=\"\\Software\\Fast Reports\" PreviewOptions.Buttons=\"4089\" PreviewOptions.Zoom=\"1\" PrintOptions.Printer=\"Por defecto\" PrintOptions.PrintOnSheet=\"0\" ReportOptions.CreateDate=\"41335,7510912153\" ReportOptions.Description.Text=\"\" ReportOptions.LastChange=\"42897,8633921528\" ScriptLanguage=\"PascalScript\" ScriptText.Text=\"&#13;&#10;begin&#13;&#10;&#13;&#10;end.\">\r\n  <Datasets>\r\n    <item DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\"/>\r\n    <item DataSet=\"frxDBDataset2\" DataSetName=\"RecibosAbonos_Detalle\"/>\r\n    <item DataSet=\"frxDBDataset1\" DataSetName=\"RecibosAbonos_Encabezado\"/>\r\n  </Datasets>\r\n  <TfrxDataPage Name=\"Data\" Height=\"1000\" Left=\"0\" Top=\"0\" Width=\"1000\"/>\r\n  <TfrxReportPage Name=\"Page1\" PaperWidth=\"76\" PaperHeight=\"280\" PaperSize=\"256\" LeftMargin=\"0\" RightMargin=\"0\" TopMargin=\"0\" BottomMargin=\"0\" ColumnWidth=\"0\" ColumnPositions.Text=\"\" EndlessHeight=\"True\" HGuides.Text=\"\" VGuides.Text=\"\">\r\n    <TfrxReportTitle Name=\"ReportTitle1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"362,83466031\" Left=\"0\" Top=\"18,89765\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo7\" Left=\"3,77953\" Top=\"185,19697\" Width=\"98,26778\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Recibo:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFactura_Numero\" Left=\"3,77953\" Top=\"207,87415\" Width=\"151,18110236\" Height=\"18,89765\" DataField=\"Recibo_Numero\" DataSet=\"frxDBDataset1\" DataSetName=\"RecibosAbonos_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[RecibosAbonos_Encabezado.&#34;Recibo_Numero&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo9\" Left=\"3,77953\" Top=\"230,55133\" Width=\"41,57483\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Fecha:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoFecha\" Left=\"49,13389\" Top=\"230,55133\" Width=\"90,70862236\" Height=\"18,89765\" DataField=\"Fecha\" DataSet=\"frxDBDataset1\" DataSetName=\"RecibosAbonos_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[RecibosAbonos_Encabezado.&#34;Fecha&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo11\" Left=\"3,77953\" Top=\"260,78757\" Width=\"52,91342\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Cliente:\"/>\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoNombreCliente\" Left=\"3,77953\" Top=\"287,24428\" Width=\"275,90559236\" Height=\"18,89765\" DataField=\"NombreCliente\" DataSet=\"frxDBDataset1\" DataSetName=\"RecibosAbonos_Encabezado\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[RecibosAbonos_Encabezado.&#34;NombreCliente&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo12\" Left=\"132,28355\" Top=\"321,26005\" Width=\"41,57483\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Factura:\"/>\r\n      <TfrxMemoView Name=\"EmpresaTelefono1\" Align=\"baWidth\" Left=\"0\" Top=\"109,60637\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Telefono1\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Telefono1&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaDireccion\" Align=\"baWidth\" Left=\"0\" Top=\"86,92919\" Width=\"287,24428\" Height=\"22,67715559\" DataField=\"Direccion\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Direccion&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaNombre\" Align=\"baWidth\" Left=\"0\" Top=\"15,11812\" Width=\"287,24428\" Height=\"18,89762559\" DataField=\"Nombre\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"1\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Nombre&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaCedula\" Align=\"baWidth\" Left=\"0\" Top=\"68,03154\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Cedula\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Cedula&#34;]\"/>\r\n      <TfrxMemoView Name=\"EmpresaEmail\" Align=\"baWidth\" Left=\"0\" Top=\"128,50402\" Width=\"287,24428\" Height=\"15,11812\" DataField=\"Email\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;Email&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo8\" Left=\"3,77953\" Top=\"321,25983031\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Factura:\"/>\r\n      <TfrxMemoView Name=\"Memo29\" Left=\"0\" Top=\"294,80334\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n      <TfrxMemoView Name=\"frxDBDataset3RedSocial\" Align=\"baWidth\" Left=\"0\" Top=\"41,57483\" Width=\"287,24428\" Height=\"18,89765\" DataField=\"NombreJuridico\" DataSet=\"frxDBDataset3\" DataSetName=\"Empresa\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[Empresa.&#34;NombreJuridico&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo3\" Left=\"0\" Top=\"332,59842031\" Width=\"279,68522\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportTitle>\r\n    <TfrxMasterData Name=\"MasterData1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Font.Charset=\"1\" Font.Color=\"0\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" Height=\"37,7953\" Left=\"0\" ParentFont=\"False\" Top=\"442,20501\" Width=\"287,24428\" ColumnWidth=\"0\" ColumnGap=\"0\" DataSet=\"frxDBDataset2\" DataSetName=\"RecibosAbonos_Detalle\" RowCount=\"0\">\r\n      <TfrxMemoView Name=\"Facturas_DetalleCantidad\" Left=\"136,06308\" Top=\"3,77953\" Width=\"105,82684\" Height=\"30,23624\" DataField=\"MontoAbono\" DataSet=\"frxDBDataset2\" DataSetName=\"RecibosAbonos_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"[RecibosAbonos_Detalle.&#34;MontoAbono&#34;]\"/>\r\n      <TfrxMemoView Name=\"Facturas_DetalleCodigo_Producto\" Left=\"3,77953\" Top=\"3,77953\" Width=\"79,37013\" Height=\"26,45671\" DataField=\"Factura_Numero\" DataSet=\"frxDBDataset2\" DataSetName=\"RecibosAbonos_Detalle\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"[RecibosAbonos_Detalle.&#34;Factura_Numero&#34;]\"/>\r\n    </TfrxMasterData>\r\n    <TfrxReportSummary Name=\"ReportSummary1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"56,69295\" Left=\"0\" Top=\"540,47279\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Facturas_EncabezadoSubTotal\" Left=\"120,94496\" Top=\"26,45671\" Width=\"132,28355\" Height=\"18,89765\" DataField=\"MontoNumero\" DataSet=\"frxDBDataset1\" DataSetName=\"RecibosAbonos_Encabezado\" DisplayFormat.FormatStr=\"%2.2n\" DisplayFormat.Kind=\"fkNumeric\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-11\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haRight\" ParentFont=\"False\" Text=\"[RecibosAbonos_Encabezado.&#34;MontoNumero&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo28\" Left=\"34,01577\" Top=\"26,45671\" Width=\"79,37013\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" ParentFont=\"False\" Text=\"Total:\"/>\r\n      <TfrxMemoView Name=\"Memo26\" Left=\"3,77953\" Top=\"3,77953\" Width=\"275,90569\" Height=\"18,89765\" Font.Charset=\"1\" Font.Color=\"-16777208\" Font.Height=\"-13\" Font.Name=\"Arial\" Font.Style=\"0\" HAlign=\"haCenter\" ParentFont=\"False\" Text=\"___________________________________________________________________________________________________________\"/>\r\n    </TfrxReportSummary>\r\n  </TfrxReportPage>\r\n</TfrxReport>\r\n'),
 (13,'Cierre de Caja Resumen','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"no\"?>\r\n<TfrxReport Version=\"5.2.12\" DotMatrixReport=\"False\" IniFile=\"\\Software\\Fast Reports\" PreviewOptions.Buttons=\"4089\" PreviewOptions.Zoom=\"1\" PrintOptions.Printer=\"Por defecto\" PrintOptions.PrintOnSheet=\"0\" ReportOptions.CreateDate=\"41335,7510912153\" ReportOptions.Description.Text=\"\" ReportOptions.LastChange=\"42897,8689343056\" ScriptLanguage=\"PascalScript\" ScriptText.Text=\"&#13;&#10;begin&#13;&#10;&#13;&#10;end.\">\r\n  <Datasets>\r\n    <item DataSet=\"frxDBDataset1\" DataSetName=\"Cierre_Caja_Encabezado\"/>\r\n  </Datasets>\r\n  <TfrxDataPage Name=\"Data\" Height=\"1000\" Left=\"0\" Top=\"0\" Width=\"1000\"/>\r\n  <TfrxReportPage Name=\"Page1\" PaperWidth=\"76\" PaperHeight=\"280\" PaperSize=\"256\" LeftMargin=\"0\" RightMargin=\"0\" TopMargin=\"0\" BottomMargin=\"0\" ColumnWidth=\"0\" ColumnPositions.Text=\"\" EndlessHeight=\"True\" HGuides.Text=\"\" VGuides.Text=\"\">\r\n    <TfrxReportTitle Name=\"ReportTitle1\" FillType=\"ftBrush\" FillGap.Top=\"0\" FillGap.Left=\"0\" FillGap.Bottom=\"0\" FillGap.Right=\"0\" Height=\"196,53534031\" Left=\"0\" Top=\"18,89765\" Width=\"287,24428\">\r\n      <TfrxMemoView Name=\"Memo1\" Left=\"11,33859\" Top=\"7,55906\" Width=\"94,48825\" Height=\"18,89765\" Text=\"NÃºmero:\"/>\r\n      <TfrxMemoView Name=\"facturasencabezadoCodigo\" Left=\"109,60637\" Top=\"3,77953\" Width=\"173,85838\" Height=\"18,89765\" DataField=\"Codigo\" DataSet=\"frxDBDataset1\" DataSetName=\"Cierre_Caja_Encabezado\" Text=\"[Cierre_Caja_Encabezado.&#34;Codigo&#34;]\"/>\r\n      <TfrxMemoView Name=\"facturasencabezadoFechaDe\" Left=\"109,60637\" Top=\"37,7953\" Width=\"170,07885\" Height=\"18,89765\" DataField=\"FechaDe\" DataSet=\"frxDBDataset1\" DataSetName=\"Cierre_Caja_Encabezado\" Text=\"[Cierre_Caja_Encabezado.&#34;FechaDe&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo2\" Left=\"11,33859\" Top=\"37,7953\" Width=\"94,48825\" Height=\"18,89765\" Text=\"Fecha:\"/>\r\n      <TfrxMemoView Name=\"facturasencabezadoTotalMontoEfectivo\" Left=\"109,60637\" Top=\"68,03154\" Width=\"170,07885\" Height=\"18,89765\" DataField=\"TotalMontoEfectivo\" DataSet=\"frxDBDataset1\" DataSetName=\"Cierre_Caja_Encabezado\" Text=\"[Cierre_Caja_Encabezado.&#34;TotalMontoEfectivo&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo3\" Left=\"11,33859\" Top=\"68,03154\" Width=\"94,48825\" Height=\"18,89765\" Text=\"Efectivo:\"/>\r\n      <TfrxMemoView Name=\"Memo4\" Left=\"11,33859\" Top=\"94,48825\" Width=\"94,48825\" Height=\"18,89765\" Text=\"Tarjeta:\"/>\r\n      <TfrxMemoView Name=\"facturasencabezadoTotalMontoTarjeta\" Left=\"109,60637\" Top=\"94,48825\" Width=\"170,07885\" Height=\"18,89765\" DataField=\"TotalMontoTarjeta\" DataSet=\"frxDBDataset1\" DataSetName=\"Cierre_Caja_Encabezado\" Text=\"[Cierre_Caja_Encabezado.&#34;TotalMontoTarjeta&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo5\" Left=\"11,33859\" Top=\"120,94496\" Width=\"94,48825\" Height=\"18,89765\" Text=\"Cheque:\"/>\r\n      <TfrxMemoView Name=\"facturasencabezadoTotalMontoCheque\" Left=\"113,3859\" Top=\"120,94496\" Width=\"166,29932\" Height=\"18,89765\" DataField=\"TotalMontoCheque\" DataSet=\"frxDBDataset1\" DataSetName=\"Cierre_Caja_Encabezado\" Text=\"[Cierre_Caja_Encabezado.&#34;TotalMontoCheque&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo6\" Left=\"11,33859\" Top=\"147,40167\" Width=\"94,48825\" Height=\"18,89765\" Text=\"Transferencia:\"/>\r\n      <TfrxMemoView Name=\"facturasencabezadoTotalMontoTransferencia\" Left=\"109,60637\" Top=\"147,40167\" Width=\"170,07885\" Height=\"18,89765\" DataField=\"TotalMontoTransferencia\" DataSet=\"frxDBDataset1\" DataSetName=\"Cierre_Caja_Encabezado\" Text=\"[Cierre_Caja_Encabezado.&#34;TotalMontoTransferencia&#34;]\"/>\r\n      <TfrxMemoView Name=\"Memo7\" Left=\"11,33859\" Top=\"170,07885\" Width=\"94,48825\" Height=\"18,89765\" Text=\"Total:\"/>\r\n      <TfrxMemoView Name=\"facturasencabezadoTotalMontoFinal\" Left=\"109,60637\" Top=\"170,07885\" Width=\"170,07885\" Height=\"18,89765\" DataField=\"TotalMontoFinal\" DataSet=\"frxDBDataset1\" DataSetName=\"Cierre_Caja_Encabezado\" Text=\"[Cierre_Caja_Encabezado.&#34;TotalMontoFinal&#34;]\"/>\r\n    </TfrxReportTitle>\r\n  </TfrxReportPage>\r\n</TfrxReport>\r\n'),
 (14,'Recibo de Abono Proveedor',NULL),
 (15,'Notas de Credito',NULL),
 (16,'Notas de Debito',NULL);
/*!40000 ALTER TABLE `tb_plantillas` ENABLE KEYS */;


--
-- Definition of table `tb_productos`
--

DROP TABLE IF EXISTS `tb_productos`;
CREATE TABLE `tb_productos` (
  `Id` int(11) NOT NULL,
  `CODIGO` varchar(100) DEFAULT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `CODIGOTIPOBARRAS` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  `CODIGOFAMILIA` int(11) DEFAULT NULL,
  `CODIGOUNIDADMEDIDA` int(11) DEFAULT NULL,
  `EXISTENCIA` double DEFAULT NULL,
  `EXISTENCIAMINIMA` double DEFAULT NULL,
  `APLICAREXISTENCIAMINIMA` int(11) DEFAULT NULL,
  `APLICARIVA` int(11) DEFAULT NULL,
  `CODIGOUBICACION` int(11) DEFAULT NULL,
  `COMPROMETIDOS` double DEFAULT NULL,
  `FECHAALTA` double DEFAULT NULL,
  `PRECIOCOSTO` double DEFAULT NULL,
  `PRECIOVENTA` double DEFAULT NULL,
  `IMAGEN1` longblob,
  `NOMBREARCHIVO` varchar(255) DEFAULT NULL,
  `LISTAVENTAS` int(11) DEFAULT NULL,
  `LISTACOMPRAS` int(11) DEFAULT NULL,
  `ESCOMPUESTO` int(11) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `UTILIDAD` double DEFAULT NULL,
  `LISTAMENUS` int(11) DEFAULT NULL,
  `CODIGOIMPUESTO` int(11) DEFAULT NULL,
  `IMPRIMECOMANDA` int(11) DEFAULT NULL,
  `CODIGOCOMANDA` int(11) DEFAULT NULL,
  `RECETA` longtext,
  `CODIGOBARRAS` varchar(100) DEFAULT NULL,
  `PRECIOVENTASIMPLE` double DEFAULT NULL,
  `PRECIOMAYORISTA` double DEFAULT NULL,
  `CODIGOPROVEEDOR` varchar(100) DEFAULT NULL,
  `IdProveedor` int(11) DEFAULT NULL,
  `IdTipo` int(11) DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `PESO` double DEFAULT NULL,
  `MINIMOLUNES` double DEFAULT NULL,
  `MINIMOMARTES` double DEFAULT NULL,
  `MINIMOMIERCOLES` double DEFAULT NULL,
  `MINIMOJUEVES` double DEFAULT NULL,
  `MINIMOVIERNES` double DEFAULT NULL,
  `MINIMOSABADO` double DEFAULT NULL,
  `MINIMODOMINGO` double DEFAULT NULL,
  `PERMITIRDESCUENTOS` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_productos`
--

/*!40000 ALTER TABLE `tb_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_productos` ENABLE KEYS */;


--
-- Definition of table `tb_proformasdetalle`
--

DROP TABLE IF EXISTS `tb_proformasdetalle`;
CREATE TABLE `tb_proformasdetalle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `CODIGO` varchar(50) DEFAULT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `CANTIDAD` double DEFAULT NULL,
  `CODIGOUNIDADMEDIDA` int(11) DEFAULT NULL,
  `NOMBREUNIDADMEDIDA` varchar(100) DEFAULT NULL,
  `PRECIOUNITARIO` double DEFAULT NULL,
  `DESCUENTOP` double DEFAULT NULL,
  `DESCUENTOM` double DEFAULT NULL,
  `IVAP` double DEFAULT NULL,
  `IVAM` double DEFAULT NULL,
  `PRECIOUNITARIOFINAL` double DEFAULT NULL,
  `PRECIOFINAL` double DEFAULT NULL,
  `LINEA` int(11) DEFAULT NULL,
  `NOMBREESTADO` varchar(100) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOIMPUESTO` int(11) DEFAULT NULL,
  `NOMBREIMPUESTO` varchar(20) DEFAULT NULL,
  `PRECIOMAYORISTAAPLICADO` int(11) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_proformasdetalle`
--

/*!40000 ALTER TABLE `tb_proformasdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_proformasdetalle` ENABLE KEYS */;


--
-- Definition of table `tb_proformasencabezado`
--

DROP TABLE IF EXISTS `tb_proformasencabezado`;
CREATE TABLE `tb_proformasencabezado` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `NumeroS` varchar(50) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` varchar(30) DEFAULT NULL,
  `CODIGOMESA` int(11) DEFAULT NULL,
  `NUMEROMESA` varchar(10) DEFAULT NULL,
  `CODIGOSALONERO` varchar(100) DEFAULT NULL,
  `USUARIOSALONERO` varchar(15) DEFAULT NULL,
  `NOMBRESALONERO` varchar(160) DEFAULT NULL,
  `CODIGOCLIENTE` varchar(100) DEFAULT NULL,
  `NOMBRECLIENTE` varchar(160) DEFAULT NULL,
  `SUBTOTAL` double DEFAULT NULL,
  `DESCUENTOP` double DEFAULT NULL,
  `DESCUENTOM` double DEFAULT NULL,
  `IVAP` double DEFAULT NULL,
  `IVAM` double DEFAULT NULL,
  `ISP` double DEFAULT NULL,
  `ISM` double DEFAULT NULL,
  `TRANSPORTE` double DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `TOTALGRAVADO` double DEFAULT NULL,
  `TOTALEXCENTO` double DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOFORMAPAGO` int(11) DEFAULT NULL,
  `CODIGOMONEDA` int(11) DEFAULT NULL,
  `TIPOCAMBIO` double DEFAULT NULL,
  `SERIE` varchar(5) DEFAULT NULL,
  `CODIGOIMPRESA` int(11) DEFAULT NULL,
  `NUMERODOC` varchar(100) DEFAULT NULL,
  `FECHAVENCIMIENTO` date DEFAULT NULL,
  `CODIGOTIPO` int(11) DEFAULT NULL,
  `SALDO` double DEFAULT NULL,
  `CARCREDITO` varchar(5) DEFAULT NULL,
  `CARCONTADO` varchar(5) DEFAULT NULL,
  `CODIGOVENDEDOR` varchar(100) DEFAULT NULL,
  `NOMBREVENDEDOR` varchar(160) DEFAULT NULL,
  `NUMEROFACTURA` int(11) DEFAULT NULL,
  `NUMEROSFACTURA` varchar(50) DEFAULT NULL,
  `PAGOCON` double DEFAULT NULL,
  `CAMBIO` double DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `IdVendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_proformasencabezado`
--

/*!40000 ALTER TABLE `tb_proformasencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_proformasencabezado` ENABLE KEYS */;


--
-- Definition of table `tb_proveedores`
--

DROP TABLE IF EXISTS `tb_proveedores`;
CREATE TABLE `tb_proveedores` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CODIGO` varchar(100) DEFAULT NULL,
  `FECHAALTA` date DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO1` varchar(50) DEFAULT NULL,
  `APELLIDO2` varchar(50) DEFAULT NULL,
  `NOMBRECOMPLETO` varchar(160) DEFAULT NULL,
  `CODIGOPOSTAL` varchar(25) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `TELEFONO1` varchar(17) DEFAULT NULL,
  `TELEFONO2` varchar(17) DEFAULT NULL,
  `WEB` varchar(100) DEFAULT NULL,
  `NOMBREIMPRIMIR` varchar(160) DEFAULT NULL,
  `CEDULA` varchar(30) DEFAULT NULL,
  `IMAGEN1` longblob,
  `NOMBREARCHIVO` varchar(255) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  `SALDO` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_proveedores`
--

/*!40000 ALTER TABLE `tb_proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_proveedores` ENABLE KEYS */;


--
-- Definition of table `tb_recibosapartadosdetalle`
--

DROP TABLE IF EXISTS `tb_recibosapartadosdetalle`;
CREATE TABLE `tb_recibosapartadosdetalle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `NUMEROFACTURA` int(11) DEFAULT NULL,
  `NUMEROSFACTURA` varchar(50) DEFAULT NULL,
  `MONTOABONO` double DEFAULT NULL,
  `LINEA` int(11) DEFAULT NULL,
  `NOMBREESTADO` varchar(100) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_recibosapartadosdetalle`
--

/*!40000 ALTER TABLE `tb_recibosapartadosdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_recibosapartadosdetalle` ENABLE KEYS */;


--
-- Definition of table `tb_recibosapartadosencabezado`
--

DROP TABLE IF EXISTS `tb_recibosapartadosencabezado`;
CREATE TABLE `tb_recibosapartadosencabezado` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `NUMEROS` varchar(50) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` varchar(30) DEFAULT NULL,
  `MONTOLETRAS` longtext,
  `SALDOANTERIOR` double DEFAULT NULL,
  `MONTONUMERO` double DEFAULT NULL,
  `SALDOACTUAL` double DEFAULT NULL,
  `CODIGOCLIENTE` varchar(100) DEFAULT NULL,
  `NOMBRECLIENTE` varchar(160) DEFAULT NULL,
  `INTERESESP` double DEFAULT NULL,
  `INTERESESM` double DEFAULT NULL,
  `TOTALFINAL` double DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOFORMAPAGO` int(11) DEFAULT NULL,
  `CODIGOMONEDA` int(11) DEFAULT NULL,
  `TIPOCAMBIO` double DEFAULT NULL,
  `SERIE` varchar(5) DEFAULT NULL,
  `CODIGOIMPRESA` int(11) DEFAULT NULL,
  `NUMERODOC` varchar(100) DEFAULT NULL,
  `FECHAVENCIMIENTO` date DEFAULT NULL,
  `CODIGOTIPO` int(11) DEFAULT NULL,
  `CARCREDITO` varchar(5) DEFAULT NULL,
  `CARCONTADO` varchar(5) DEFAULT NULL,
  `CODIGOVENDEDOR` varchar(100) DEFAULT NULL,
  `NOMBREVENDEDOR` varchar(160) DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `IdVendedor` int(11) DEFAULT NULL,
  `EFECTIVO` double DEFAULT NULL,
  `TARJETA` double DEFAULT NULL,
  `TRANSFERENCIA` double DEFAULT NULL,
  `CHEQUE` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_recibosapartadosencabezado`
--

/*!40000 ALTER TABLE `tb_recibosapartadosencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_recibosapartadosencabezado` ENABLE KEYS */;


--
-- Definition of table `tb_recibosclientesdetalle`
--

DROP TABLE IF EXISTS `tb_recibosclientesdetalle`;
CREATE TABLE `tb_recibosclientesdetalle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `NUMEROFACTURA` int(11) DEFAULT NULL,
  `NUMEROSFACTURA` varchar(50) DEFAULT NULL,
  `MONTOABONO` double DEFAULT NULL,
  `LINEA` int(11) DEFAULT NULL,
  `NOMBREESTADO` varchar(100) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_recibosclientesdetalle`
--

/*!40000 ALTER TABLE `tb_recibosclientesdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_recibosclientesdetalle` ENABLE KEYS */;


--
-- Definition of table `tb_recibosclientesencabezado`
--

DROP TABLE IF EXISTS `tb_recibosclientesencabezado`;
CREATE TABLE `tb_recibosclientesencabezado` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `NUMEROS` varchar(50) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` varchar(30) DEFAULT NULL,
  `MONTOLETRAS` longtext,
  `SALDOANTERIOR` double DEFAULT NULL,
  `MONTONUMERO` double DEFAULT NULL,
  `SALDOACTUAL` double DEFAULT NULL,
  `CODIGOCLIENTE` varchar(100) DEFAULT NULL,
  `NOMBRECLIENTE` varchar(160) DEFAULT NULL,
  `INTERESESP` double DEFAULT NULL,
  `INTERESESM` double DEFAULT NULL,
  `TOTALFINAL` double DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOFORMAPAGO` int(11) DEFAULT NULL,
  `CODIGOMONEDA` int(11) DEFAULT NULL,
  `TIPOCAMBIO` double DEFAULT NULL,
  `SERIE` varchar(5) DEFAULT NULL,
  `CODIGOIMPRESA` int(11) DEFAULT NULL,
  `NUMERODOC` varchar(100) DEFAULT NULL,
  `FECHAVENCIMIENTO` date DEFAULT NULL,
  `CODIGOTIPO` int(11) DEFAULT NULL,
  `CARCREDITO` varchar(5) DEFAULT NULL,
  `CARCONTADO` varchar(5) DEFAULT NULL,
  `CODIGOVENDEDOR` varchar(100) DEFAULT NULL,
  `NOMBREVENDEDOR` varchar(160) DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `IdVendedor` int(11) DEFAULT NULL,
  `EFECTIVO` double DEFAULT NULL,
  `TARJETA` double DEFAULT NULL,
  `TRANSFERENCIA` double DEFAULT NULL,
  `CHEQUE` double DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_recibosclientesencabezado`
--

/*!40000 ALTER TABLE `tb_recibosclientesencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_recibosclientesencabezado` ENABLE KEYS */;


--
-- Definition of table `tb_recibosproveedoresdetalle`
--

DROP TABLE IF EXISTS `tb_recibosproveedoresdetalle`;
CREATE TABLE `tb_recibosproveedoresdetalle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `NUMEROFACTURA` int(11) DEFAULT NULL,
  `NUMEROSFACTURA` varchar(50) DEFAULT NULL,
  `MONTOABONO` double DEFAULT NULL,
  `LINEA` int(11) DEFAULT NULL,
  `NOMBREESTADO` varchar(100) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_recibosproveedoresdetalle`
--

/*!40000 ALTER TABLE `tb_recibosproveedoresdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_recibosproveedoresdetalle` ENABLE KEYS */;


--
-- Definition of table `tb_recibosproveedoresencabezado`
--

DROP TABLE IF EXISTS `tb_recibosproveedoresencabezado`;
CREATE TABLE `tb_recibosproveedoresencabezado` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO` int(11) DEFAULT NULL,
  `NUMEROS` varchar(50) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `HORA` varchar(30) DEFAULT NULL,
  `MONTOLETRAS` longtext,
  `SALDOANTERIOR` double DEFAULT NULL,
  `MONTONUMERO` double DEFAULT NULL,
  `SALDOACTUAL` double DEFAULT NULL,
  `CODIGOPROVEEDOR` varchar(100) DEFAULT NULL,
  `NOMBREPROVEEDOR` varchar(160) DEFAULT NULL,
  `INTERESESP` double DEFAULT NULL,
  `INTERESESM` double DEFAULT NULL,
  `TOTALFINAL` double DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CODIGOFORMAPAGO` int(11) DEFAULT NULL,
  `CODIGOMONEDA` int(11) DEFAULT NULL,
  `TIPOCAMBIO` double DEFAULT NULL,
  `SERIE` varchar(5) DEFAULT NULL,
  `CODIGOIMPRESA` int(11) DEFAULT NULL,
  `NUMERODOC` varchar(100) DEFAULT NULL,
  `FECHAVENCIMIENTO` date DEFAULT NULL,
  `CODIGOTIPO` int(11) DEFAULT NULL,
  `CARCREDITO` varchar(5) DEFAULT NULL,
  `CARCONTADO` varchar(5) DEFAULT NULL,
  `CODIGOVENDEDOR` varchar(100) DEFAULT NULL,
  `NOMBREVENDEDOR` varchar(160) DEFAULT NULL,
  `IdProveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_recibosproveedoresencabezado`
--

/*!40000 ALTER TABLE `tb_recibosproveedoresencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_recibosproveedoresencabezado` ENABLE KEYS */;


--
-- Definition of table `tb_reportesplantillas`
--

DROP TABLE IF EXISTS `tb_reportesplantillas`;
CREATE TABLE `tb_reportesplantillas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) DEFAULT NULL,
  `Plantilla` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_reportesplantillas`
--

/*!40000 ALTER TABLE `tb_reportesplantillas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_reportesplantillas` ENABLE KEYS */;


--
-- Definition of table `tb_sistema`
--

DROP TABLE IF EXISTS `tb_sistema`;
CREATE TABLE `tb_sistema` (
  `VERSIONS` varchar(100) DEFAULT NULL,
  `IMAGENFONDO` longblob,
  `NOMBREIMAGEN` varchar(255) DEFAULT NULL,
  `IVADEFAULT` int(11) DEFAULT NULL,
  `ISERVICIO` double DEFAULT NULL,
  `MONEDADEFAULT` int(11) DEFAULT NULL,
  `FAMILIADEFAULT` int(11) DEFAULT NULL,
  `UNIDADMEDIDADEFAULT` int(11) DEFAULT NULL,
  `MINIMODEFAULT` int(11) DEFAULT NULL,
  `APLICARMINIMODEFAULT` int(11) DEFAULT NULL,
  `APLICARREDONDEO` int(11) DEFAULT NULL,
  `APLICARREDONDEO5` int(11) DEFAULT NULL,
  `Clave` varchar(100) DEFAULT NULL,
  `MontoInicial` double DEFAULT NULL,
  `PRODUCTOIMPUESTOINCLUIDO` int(11) DEFAULT NULL,
  `USARSEGURIDAD` int(11) DEFAULT NULL,
  `USARCONTABILIDAD` int(11) DEFAULT NULL,
  `TIPOMAQUINA` int(11) DEFAULT NULL,
  `IDVENDEDOR` int(11) DEFAULT NULL,
  `APLICARBAJARINVENTARIONC` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_sistema`
--

/*!40000 ALTER TABLE `tb_sistema` DISABLE KEYS */;
INSERT INTO `tb_sistema` (`VERSIONS`,`IMAGENFONDO`,`NOMBREIMAGEN`,`IVADEFAULT`,`ISERVICIO`,`MONEDADEFAULT`,`FAMILIADEFAULT`,`UNIDADMEDIDADEFAULT`,`MINIMODEFAULT`,`APLICARMINIMODEFAULT`,`APLICARREDONDEO`,`APLICARREDONDEO5`,`Clave`,`MontoInicial`,`PRODUCTOIMPUESTOINCLUIDO`,`USARSEGURIDAD`,`USARCONTABILIDAD`,`TIPOMAQUINA`,`IDVENDEDOR`,`APLICARBAJARINVENTARIONC`) VALUES 
 (' ',NULL,'',0,10,0,0,0,0,0,0,0,'',0,0,0,0,0,0,1);
/*!40000 ALTER TABLE `tb_sistema` ENABLE KEYS */;


--
-- Definition of table `tb_tipos`
--

DROP TABLE IF EXISTS `tb_tipos`;
CREATE TABLE `tb_tipos` (
  `Id` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_tipos`
--

/*!40000 ALTER TABLE `tb_tipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipos` ENABLE KEYS */;


--
-- Definition of table `tb_tiposcuentas`
--

DROP TABLE IF EXISTS `tb_tiposcuentas`;
CREATE TABLE `tb_tiposcuentas` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(200) DEFAULT NULL,
  `TIPO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_tiposcuentas`
--

/*!40000 ALTER TABLE `tb_tiposcuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tiposcuentas` ENABLE KEYS */;


--
-- Definition of table `tb_tiposproductos`
--

DROP TABLE IF EXISTS `tb_tiposproductos`;
CREATE TABLE `tb_tiposproductos` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_tiposproductos`
--

/*!40000 ALTER TABLE `tb_tiposproductos` DISABLE KEYS */;
INSERT INTO `tb_tiposproductos` (`Id`,`Nombre`) VALUES 
 (1,'Físico'),
 (2,'Servicio');
/*!40000 ALTER TABLE `tb_tiposproductos` ENABLE KEYS */;


--
-- Definition of table `tb_unidadesmedida`
--

DROP TABLE IF EXISTS `tb_unidadesmedida`;
CREATE TABLE `tb_unidadesmedida` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `ABREVIATURA` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_unidadesmedida`
--

/*!40000 ALTER TABLE `tb_unidadesmedida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_unidadesmedida` ENABLE KEYS */;


--
-- Definition of table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
CREATE TABLE `tb_usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `USUARIO` varchar(15) DEFAULT NULL,
  `CLAVE` varchar(15) DEFAULT NULL,
  `FECHAALTA` date DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO1` varchar(50) DEFAULT NULL,
  `APELLIDO2` varchar(50) DEFAULT NULL,
  `NOMBRECOMPLETO` varchar(160) DEFAULT NULL,
  `CODIGOPOSTAL` varchar(25) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `TELEFONO1` varchar(17) DEFAULT NULL,
  `TELEFONO2` varchar(17) DEFAULT NULL,
  `CODIGONIVEL` int(11) DEFAULT NULL,
  `CODIGOESTADO` int(11) DEFAULT NULL,
  `CEDULA` varchar(30) DEFAULT NULL,
  `ESVISIBLE` int(11) DEFAULT NULL,
  `FECHANACIMIENTO` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_usuarios`
--

/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
INSERT INTO `tb_usuarios` (`Id`,`USUARIO`,`CLAVE`,`FECHAALTA`,`NOMBRE`,`APELLIDO1`,`APELLIDO2`,`NOMBRECOMPLETO`,`CODIGOPOSTAL`,`DIRECCION`,`EMAIL`,`TELEFONO1`,`TELEFONO2`,`CODIGONIVEL`,`CODIGOESTADO`,`CEDULA`,`ESVISIBLE`,`FECHANACIMIENTO`) VALUES 
 (1,'dynamicsoporte','dynamic123',NULL,NULL,NULL,NULL,'dynamic',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),
 (2,'dynamicdba','dynamicdba123',NULL,NULL,NULL,NULL,'dynamic',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),
 (3,'admin','admin123',NULL,NULL,NULL,NULL,'admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `tb_usuarios` ENABLE KEYS */;


--
-- Definition of table `tb_vendedores`
--

DROP TABLE IF EXISTS `tb_vendedores`;
CREATE TABLE `tb_vendedores` (
  `Id` int(11) NOT NULL,
  `CODIGO` varchar(100) DEFAULT NULL,
  `FECHAALTA` date DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO1` varchar(50) DEFAULT NULL,
  `APELLIDO2` varchar(50) DEFAULT NULL,
  `NOMBRECOMPLETO` varchar(160) DEFAULT NULL,
  `CODIGOPOSTAL` int(11) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `TELEFONO1` varchar(17) DEFAULT NULL,
  `TELEFONO2` varchar(17) DEFAULT NULL,
  `WEB` varchar(100) DEFAULT NULL,
  `NOMBREIMPRIMIR` varchar(160) DEFAULT NULL,
  `CEDULA` varchar(30) DEFAULT NULL,
  `IMAGEN1` longblob,
  `NOMBREARCHIVO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_vendedores`
--

/*!40000 ALTER TABLE `tb_vendedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_vendedores` ENABLE KEYS */;


--
-- Definition of table `tb_vendedoresclientes`
--

DROP TABLE IF EXISTS `tb_vendedoresclientes`;
CREATE TABLE `tb_vendedoresclientes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDVENDEDOR` int(11) DEFAULT NULL,
  `IDCLIENTE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_vendedoresclientes`
--

/*!40000 ALTER TABLE `tb_vendedoresclientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_vendedoresclientes` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
