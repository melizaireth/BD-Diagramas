CREATE DATABASE `recursos_humanos` /*!40100 DEFAULT CHARACTER SET utf8 */;
CREATE TABLE `candidato` (
  `idcandidato` int(11) NOT NULL AUTO_INCREMENT,
  `idoferta` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `rutacv` varchar(150) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `seleccionado` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idcandidato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `compeofertacandidato` (
  `idofertafkc` int(11) DEFAULT NULL,
  `idcompetenciafkc` int(11) DEFAULT NULL,
  `idcandidatofkc` int(11) DEFAULT NULL,
  `nivelcandidato` varchar(45) DEFAULT NULL,
  KEY `idofertafkc_idx` (`idofertafkc`),
  KEY `idcompetenciafk_idx` (`idcompetenciafkc`),
  KEY `idcompetenciafkc_idx` (`idcompetenciafkc`),
  KEY `idcandidatofkc_idx` (`idcandidatofkc`),
  CONSTRAINT `idcandidatofkc` FOREIGN KEY (`idcandidatofkc`) REFERENCES `candidato` (`idcandidato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idcompetenciafkc` FOREIGN KEY (`idcompetenciafkc`) REFERENCES `ofertacompetencia` (`idcompetenciafk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idofertafkc` FOREIGN KEY (`idofertafkc`) REFERENCES `oferta` (`idoferta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `competencia` (
  `idcompetencia` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `bandera` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcompetencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `factura` (
  `idfactura` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedor` int(11) DEFAULT NULL,
  `concepto` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'nueva',
  `importetotal` float DEFAULT NULL,
  `nrofacproveedor` varchar(45) DEFAULT NULL,
  `fechaentrega` date DEFAULT NULL,
  `fechapago` date DEFAULT NULL,
  `observaciones` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `idproveedor_idx` (`idproveedor`),
  CONSTRAINT `idproveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `oferta` (
  `idoferta` int(11) NOT NULL AUTO_INCREMENT,
  `puesto` varchar(45) NOT NULL,
  `estudios` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'abierta',
  `fechainicio` date NOT NULL,
  `fechafin` date DEFAULT NULL,
  `segundonivel` varchar(45) DEFAULT NULL,
  `tercernivel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idoferta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `ofertacompetencia` (
  `idofertafka` int(11) DEFAULT '0',
  `idcompetenciafk` int(11) DEFAULT '0',
  `requerido` varchar(45) DEFAULT 'requerido',
  `experiencia` int(11) DEFAULT '0',
  KEY `idcompetencia_idx` (`idcompetenciafk`),
  KEY `idofertafka_idx` (`idofertafka`),
  CONSTRAINT `idcompetenciafk` FOREIGN KEY (`idcompetenciafk`) REFERENCES `competencia` (`idcompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idofertafka` FOREIGN KEY (`idofertafka`) REFERENCES `oferta` (`idoferta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `ofertaprovee` (
  `idofertafk` int(11) DEFAULT '0',
  `idproveedorfk` int(11) DEFAULT '0',
  KEY `idoferta_idx` (`idofertafk`),
  KEY `idproveedor_idx` (`idproveedorfk`),
  CONSTRAINT `idofertafk` FOREIGN KEY (`idofertafk`) REFERENCES `oferta` (`idoferta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idproveedorfk` FOREIGN KEY (`idproveedorfk`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombrepro` varchar(45) DEFAULT NULL,
  `fechaingreso` date DEFAULT NULL,
  `tipoproveedor` varchar(45) DEFAULT NULL,
  `direccion` varchar(105) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `perfil` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `idproveedor` int(11) DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'alta',
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
