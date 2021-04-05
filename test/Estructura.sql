CREATE TABLE IF NOT EXISTS `acu_absentismo` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idAbsentismo` int(11) NOT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `Ejercicio` varchar(4) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Enero` decimal(5,2) DEFAULT NULL,
  `Febrero` decimal(5,2) DEFAULT NULL,
  `Marzo` decimal(5,2) DEFAULT NULL,
  `Abril` decimal(5,2) DEFAULT NULL,
  `Mayo` decimal(5,2) DEFAULT NULL,
  `Junio` decimal(5,2) DEFAULT NULL,
  `Julio` decimal(5,2) DEFAULT NULL,
  `Agosto` decimal(5,2) DEFAULT NULL,
  `Septiembre` decimal(5,2) DEFAULT NULL,
  `Octubre` decimal(5,2) DEFAULT NULL,
  `Noviembre` decimal(5,2) DEFAULT NULL,
  `Diciembre` decimal(5,2) DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idIncidencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idAbsentismo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_centro` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idCentro` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EntidadAdminis` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CIFEntidadAdminis` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TipoEntidadAdminis` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EntidadGestora` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CIFEntidadGestora` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TipoEntidadGestora` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Representante` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PContacto` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cargo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PlazasAutorizadas` int(11) DEFAULT NULL,
  `PlazasAcreditadas` int(11) DEFAULT NULL,
  `PlazasConcertadas` int(11) DEFAULT NULL,
  `Domicilio` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Telefono1` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Telefono2` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Telefono3` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMail` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PaginaWeb` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FaceBook` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Twitter` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IP1` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IP2` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IP3` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Comedor` tinyint(1) DEFAULT NULL,
  `Estancia` tinyint(1) DEFAULT NULL,
  `Terapia` tinyint(1) DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Latitud` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Longitud` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Transporte` tinyint(1) DEFAULT NULL,
  `PContactoEntidad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ProgCentro` blob DEFAULT NULL,
  `NotDomicilio` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NotCPostal` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NotPoblacion` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NotProvincia` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NotTelefono` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NotEMail` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NotLocalidad` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CaracterAdminis` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CaracterGestora` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NumeroCCC` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NumeroCCC2` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NumeroCCC3` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Voluntariado` tinyint(1) DEFAULT 0,
  `ServOpcionales` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`Cuenta`,`idCentro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_doccentro` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idDocCentro` int(11) NOT NULL,
  `idTipoDocumento` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idCentro` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idDocCentro`),
  KEY `FK_acu_doccentro_acu_centro` (`Cuenta`,`idCentro`),
  CONSTRAINT `FK_acu_doccentro_acu_centro` FOREIGN KEY (`Cuenta`, `idCentro`) REFERENCES `acu_centro` (`Cuenta`, `idCentro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_docmenor` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idDocMenor` int(11) NOT NULL,
  `idMenor` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `idTipoDocumento` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Cuenta`,`idDocMenor`),
  KEY `FK_acu_docmenor_acu_menores` (`Cuenta`,`idMenor`),
  CONSTRAINT `FK_acu_docmenor_acu_menores` FOREIGN KEY (`Cuenta`, `idMenor`) REFERENCES `acu_menores` (`Cuenta`, `idMenor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `acu_docresidente` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idDocResidente` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `idTipoDocumento` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idResidente` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idDocResidente`),
  KEY `FK_acu_docresidente_acu_docresidente` (`Cuenta`,`idResidente`),
  CONSTRAINT `FK_acu_docresidente_acu_docresidente` FOREIGN KEY (`Cuenta`, `idResidente`) REFERENCES `acu_residentes` (`Cuenta`, `idResidente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_mencontactos` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idContacto` int(11) NOT NULL,
  `idMenor` int(11) DEFAULT NULL,
  `idTipo` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `DesdeHora` time DEFAULT NULL,
  `HastaHora` time DEFAULT NULL,
  `Observaciones` blob DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Contactos` blob DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idContacto`),
  KEY `FK_acu_mencontactos_acu_menores` (`Cuenta`,`idMenor`),
  CONSTRAINT `FK_acu_mencontactos_acu_menores` FOREIGN KEY (`Cuenta`, `idMenor`) REFERENCES `acu_menores` (`Cuenta`, `idMenor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_menevoltemporal` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idMenor` int(11) DEFAULT NULL,
  `DesdeFecha` date DEFAULT NULL,
  `Estado` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idEvolucion` int(11) NOT NULL,
  `idMotivoBaja` int(11) DEFAULT NULL,
  `Observaciones` blob DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idEvolucion`),
  KEY `FK_acu_menevoltemporal_acu_menores` (`Cuenta`,`idMenor`),
  CONSTRAINT `FK_acu_menevoltemporal_acu_menores` FOREIGN KEY (`Cuenta`, `idMenor`) REFERENCES `acu_menores` (`Cuenta`, `idMenor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_menfamiliares` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idFamiliar` int(11) NOT NULL,
  `idMenor` int(11) DEFAULT NULL,
  `idParentesco` int(11) DEFAULT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Telefono` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Cuenta`,`idFamiliar`),
  KEY `FK_acu_menfamiliares_acu_menores` (`Cuenta`,`idMenor`),
  CONSTRAINT `FK_acu_menfamiliares_acu_menores` FOREIGN KEY (`Cuenta`, `idMenor`) REFERENCES `acu_menores` (`Cuenta`, `idMenor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `acu_menincidencias` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idIncidencia` int(11) NOT NULL,
  `idMenor` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `idTipoIncidencia` int(11) DEFAULT NULL,
  `Incidencia` blob DEFAULT NULL,
  `UsurioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Cuenta`,`idIncidencia`),
  KEY `FK_acu_menincidencias_acu_menores` (`Cuenta`,`idMenor`),
  CONSTRAINT `FK_acu_menincidencias_acu_menores` FOREIGN KEY (`Cuenta`, `idMenor`) REFERENCES `acu_menores` (`Cuenta`, `idMenor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `acu_menores` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idMenor` int(11) NOT NULL,
  `DNI` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NUSSA` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaNac` date DEFAULT NULL,
  `Sexo` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EnAlta` tinyint(4) DEFAULT NULL,
  `FIngreso` date DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IPolicial` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FPCF` date DEFAULT NULL,
  `ResultadoPCF` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Origen` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `LugarNacimiento` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Direccion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CodPostal` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Poblacion` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Provincia` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Telefono` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Movil` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idMenor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_menpcr` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idMenPCR` int(11) NOT NULL,
  `idMenor` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Resultado` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idMenPCR`),
  KEY `FK_acu_menpcr_acu_menores` (`Cuenta`,`idMenor`),
  CONSTRAINT `FK_acu_menpcr_acu_menores` FOREIGN KEY (`Cuenta`, `idMenor`) REFERENCES `acu_menores` (`Cuenta`, `idMenor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `acu_mensalidas` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idSalida` int(11) NOT NULL,
  `idMenor` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `DesdeHora` time DEFAULT NULL,
  `HastaHora` time DEFAULT NULL,
  `NAcompanantes` int(11) DEFAULT NULL,
  `Acompanantes` blob DEFAULT NULL,
  `Observaciones` blob DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Cuenta`,`idSalida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `acu_menseguimiento` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idSeguimiento` int(11) NOT NULL,
  `idMenor` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Seguimiento` blob DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Cuenta`,`idSeguimiento`),
  KEY `FK_acu_menseguimiento_acu_menores` (`Cuenta`,`idMenor`),
  CONSTRAINT `FK_acu_menseguimiento_acu_menores` FOREIGN KEY (`Cuenta`, `idMenor`) REFERENCES `acu_menores` (`Cuenta`, `idMenor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `acu_menvisitas` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idVisita` int(11) NOT NULL,
  `idMenor` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `DesdeHora` time DEFAULT NULL,
  `HastaHora` time DEFAULT NULL,
  `NVisitantes` int(11) DEFAULT NULL,
  `Visitantes` blob DEFAULT NULL,
  `Observaciones` blob DEFAULT NULL,
  `UsurioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Cuenta`,`idVisita`),
  KEY `FK_acu_menvisitas_acu_menores` (`Cuenta`,`idMenor`),
  CONSTRAINT `FK_acu_menvisitas_acu_menores` FOREIGN KEY (`Cuenta`, `idMenor`) REFERENCES `acu_menores` (`Cuenta`, `idMenor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `acu_percontratos` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idPerContrato` int(11) NOT NULL,
  `idPersonal` int(11) DEFAULT NULL,
  `Desde` date DEFAULT NULL,
  `Hasta` date DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TipoServicio` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TipoContrato` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TipoJornada` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NHorasAnuales` decimal(9,2) DEFAULT NULL,
  `NHorasConvenio` decimal(9,2) DEFAULT NULL,
  `NHorasSema` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idPerContrato`),
  KEY `FK_acu_percontratos_acu_personal` (`Cuenta`,`idPersonal`),
  CONSTRAINT `FK_acu_percontratos_acu_personal` FOREIGN KEY (`Cuenta`, `idPersonal`) REFERENCES `acu_personal` (`Cuenta`, `idPersonal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_perpcr` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idPerPCR` int(11) NOT NULL,
  `idPersonal` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Resultado` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idPerPCR`),
  KEY `FK_acu_perpcr_acu_personal` (`Cuenta`,`idPersonal`),
  CONSTRAINT `FK_acu_perpcr_acu_personal` FOREIGN KEY (`Cuenta`, `idPersonal`) REFERENCES `acu_personal` (`Cuenta`, `idPersonal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `acu_personal` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idPersonal` int(11) NOT NULL,
  `NIF` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Nombre` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Direccion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CodPostal` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Poblacion` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Provincia` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMail` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Telefono` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Movil` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Apellido1` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Apellido2` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FBaja` date DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FPCR` date DEFAULT NULL,
  `ResultadoPCR` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaNac` date DEFAULT NULL,
  `Sexo` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idTipoPersonal` int(11) DEFAULT 1,
  `FAlta` date DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idPersonal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_resantecedentes` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idResAntecedente` int(11) NOT NULL,
  `idResidente` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `idTipoAntecedente` int(11) DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Observaciones` blob DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idResAntecedente`),
  KEY `FK_acu_resantecedentes_acu_residentes` (`Cuenta`,`idResidente`),
  CONSTRAINT `FK_acu_resantecedentes_acu_residentes` FOREIGN KEY (`Cuenta`, `idResidente`) REFERENCES `acu_residentes` (`Cuenta`, `idResidente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_rescontactos` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idContacto` int(11) NOT NULL,
  `idResidente` int(11) DEFAULT NULL,
  `idTipo` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `DesdeHora` time DEFAULT NULL,
  `HastaHora` time DEFAULT NULL,
  `Observaciones` blob DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Contactos` blob DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idContacto`),
  KEY `FK_acu_rescontactos_acu_residentes` (`Cuenta`,`idResidente`),
  CONSTRAINT `FK_acu_rescontactos_acu_residentes` FOREIGN KEY (`Cuenta`, `idResidente`) REFERENCES `acu_residentes` (`Cuenta`, `idResidente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_resevoltemporal` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idEvolucion` int(11) NOT NULL,
  `idResidente` int(11) DEFAULT NULL,
  `DesdeFecha` date DEFAULT NULL,
  `Estado` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idEstancia` int(11) DEFAULT NULL,
  `idCaracterPlaza` int(11) DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Observaciones` blob DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idEvolucion`),
  KEY `FK_acu_resevoltemporal_acu_residentes` (`Cuenta`,`idResidente`),
  CONSTRAINT `FK_acu_resevoltemporal_acu_residentes` FOREIGN KEY (`Cuenta`, `idResidente`) REFERENCES `acu_residentes` (`Cuenta`, `idResidente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_residentes` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idResidente` int(11) NOT NULL,
  `Nombre` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Apellido1` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Apellido2` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NIF` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NUHSA` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaNac` date DEFAULT NULL,
  `Sexo` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EstadoCivil` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Tabaco` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Alcohol` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `OtrosHabitos` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DescripcionOtros` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FIngreso` date DEFAULT NULL,
  `Beneficiario` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FNombre` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FApellido1` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FApellido2` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `FTelefono` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FMovil` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FEMail` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EnAlta` tinyint(4) DEFAULT NULL,
  `Polimedicado` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idAlimentacion` int(11) DEFAULT NULL,
  `ObserAlimentacion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idIncontinencia` int(11) DEFAULT NULL,
  `ObserIncontinencia` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idDemencia` int(11) DEFAULT NULL,
  `idTipoGDS` int(11) DEFAULT NULL,
  `idTipologia` int(11) DEFAULT NULL,
  `idEstancia` int(11) DEFAULT NULL,
  `idCaracterPlaza` int(11) DEFAULT NULL,
  `Peso` decimal(5,2) DEFAULT NULL,
  `Talla` decimal(5,2) DEFAULT NULL,
  `IMC` decimal(5,2) DEFAULT NULL,
  `idParentesco` int(11) DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FPCR` date DEFAULT NULL,
  `ResultadoPCR` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Lunes` tinyint(1) DEFAULT 0,
  `Martes` tinyint(1) DEFAULT 0,
  `Miercoles` tinyint(1) DEFAULT 0,
  `Jueves` tinyint(1) DEFAULT 0,
  `Viernes` tinyint(1) DEFAULT 0,
  `Sabado` tinyint(1) DEFAULT 0,
  `Domingo` tinyint(1) DEFAULT 0,
  `idTipoDisca` int(11) DEFAULT NULL,
  `SubTipoDisca` varchar(60) CHARACTER SET utf8 COLLATE utf8_danish_ci DEFAULT NULL,
  `GradoDisca` decimal(5,2) DEFAULT NULL,
  `Antecedentes` blob DEFAULT NULL,
  `ResIncapacitacion` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idResidente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_respcr` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idResPCR` int(11) NOT NULL,
  `idResidente` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Resultado` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idResPCR`),
  KEY `FK_acu_respcr_acu_residentes` (`Cuenta`,`idResidente`),
  CONSTRAINT `FK_acu_respcr_acu_residentes` FOREIGN KEY (`Cuenta`, `idResidente`) REFERENCES `acu_residentes` (`Cuenta`, `idResidente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `acu_ressalidas` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idSalida` int(11) NOT NULL,
  `idResidente` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `DesdeHora` time DEFAULT NULL,
  `HastaHora` time DEFAULT NULL,
  `NAcompanantes` int(11) DEFAULT NULL,
  `Acompanantes` blob DEFAULT NULL,
  `Observaciones` blob DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Cuenta`,`idSalida`),
  KEY `FK_acu_ressalidas_acu_residentes` (`Cuenta`,`idResidente`),
  CONSTRAINT `FK_acu_ressalidas_acu_residentes` FOREIGN KEY (`Cuenta`, `idResidente`) REFERENCES `acu_residentes` (`Cuenta`, `idResidente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `acu_resvaloraciones` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idResValoracion` int(11) NOT NULL,
  `idResidente` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `idTipoValoracion` int(11) DEFAULT NULL,
  `Resultado` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Observaciones` blob DEFAULT NULL,
  PRIMARY KEY (`Cuenta`,`idResValoracion`),
  KEY `FK_acu_resvaloraciones_acu_residentes` (`Cuenta`,`idResidente`),
  CONSTRAINT `FK_acu_resvaloraciones_acu_residentes` FOREIGN KEY (`Cuenta`, `idResidente`) REFERENCES `acu_residentes` (`Cuenta`, `idResidente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `acu_resvisitas` (
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idVisita` int(11) NOT NULL,
  `idResidente` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `DesdeHora` time DEFAULT NULL,
  `HastaHora` time DEFAULT NULL,
  `NVisitantes` int(11) DEFAULT NULL,
  `Visitantes` blob DEFAULT NULL,
  `Observaciones` blob DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Cuenta`,`idVisita`),
  KEY `FK_acu_resvisitas_acu_residentes` (`Cuenta`,`idResidente`),
  CONSTRAINT `FK_acu_resvisitas_acu_residentes` FOREIGN KEY (`Cuenta`, `idResidente`) REFERENCES `acu_residentes` (`Cuenta`, `idResidente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `areaservicios` (
  `idAreaServicio` int(11) NOT NULL AUTO_INCREMENT,
  `CodProvincia` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CodArea` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Descripcion` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idAreaServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_gencaracterplaza` (
  `idCaracterPlaza` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idCaracterPlaza`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla de definicion de caracter de las plazas';

CREATE TABLE IF NOT EXISTS `aux_genestado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Descripcion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Origen` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `aux_genparentescos` (
  `idParentesco` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idParentesco`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `aux_gentipoestancia` (
  `idEstancia` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Nombre de la Estancia',
  `Estancia` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Horario de estancia',
  PRIMARY KEY (`idEstancia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Definicion de tipos de estancia con horarios';

CREATE TABLE IF NOT EXISTS `aux_gentipologia` (
  `idTipologia` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipologia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_motivobaja` (
  `idMotivo` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idMotivo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_programacentro` (
  `idPrograma` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idPrograma`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_tipoalimentacion` (
  `idTipoAlimentacion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoAlimentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_tipoantecedentes` (
  `idTipoAntecedente` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoAntecedente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `aux_tipocontratos` (
  `idTipoContrato` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoContrato`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_tipodemencia` (
  `idTipoDemencia` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoDemencia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_tipodiscapacidad` (
  `idTipoDiscapacidad` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoDiscapacidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_tipodocumentos` (
  `idTipoDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(160) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Origen` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `aux_tipogds` (
  `idTipoGDS` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoGDS`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_tipoincidencias` (
  `idTipoIncidencia` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoIncidencia`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_tipoincontinencia` (
  `idTipoIncontinencia` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoIncontinencia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_tipopersonal` (
  `idTipoPersonal` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoPersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `aux_tipovaloraciones` (
  `idTipoValoracion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoValoracion`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `configuracion` (
  `Codigo` int(11) NOT NULL,
  `VersionBD` varchar(3) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Img_LogoCentro` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Host` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SMTPAuth` tinyint(1) DEFAULT NULL,
  `Username` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Password` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SMTPSecure` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Port` int(11) DEFAULT NULL,
  `EMailFrom` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PathUrl` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `correos` (
  `idCorreo` int(11) NOT NULL AUTO_INCREMENT,
  `idTablaCentro` int(11) DEFAULT NULL,
  `Destinatario` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaEnvio` date DEFAULT NULL,
  `Asunto` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Html_Texto` blob DEFAULT NULL,
  `Adjunto` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idCorreo`)
) ENGINE=InnoDB AUTO_INCREMENT=2256 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `cuentacentros` (
  `idCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `Cuenta` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idCuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=2221 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `estructuraterritorial` (
  `idEstructuraTerritorial` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idEstructuraTerritorial`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `historico_usuarios` (
  `idRevision` int(11) NOT NULL AUTO_INCREMENT,
  `Accion` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Usuario` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Clave` varbinary(32) DEFAULT NULL,
  `NombreCompleto` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Correo` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Activa` tinyint(1) DEFAULT NULL,
  `Reseteada` tinyint(1) DEFAULT NULL,
  `Administrador` tinyint(1) DEFAULT NULL,
  `Grupo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Observaciones` blob DEFAULT NULL,
  `IdiomaInterface` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `IdiomaImpresion` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EsGrupo` tinyint(1) DEFAULT NULL,
  `Img_Usuario` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `AccesosFallidos` int(11) DEFAULT NULL,
  `FClave` date DEFAULT NULL,
  `Aplicacion` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Seguridad` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idRevision`)
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `municipios` (
  `CodMunicipio` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Descripcion` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CodProvincia` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CodMunicipio`),
  KEY `FK_municipios_provincias` (`CodProvincia`),
  CONSTRAINT `FK_municipios_provincias` FOREIGN KEY (`CodProvincia`) REFERENCES `provincias` (`CodProvincia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `nivelesproximidad` (
  `idNivelProximidad` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idNivelProximidad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `notificaciones` (
  `idNotificacion` int(11) NOT NULL AUTO_INCREMENT,
  `Origen` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Cuenta` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Asunto` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Texto` blob DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Leida` tinyint(4) DEFAULT 0,
  `CodAplicacion` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Inicialmente son 15->Mayores, 16->Discapacidad, 17->Menores, 18->Servicios Sociales',
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idNotificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `permisos` (
  `IDPermiso` int(11) NOT NULL AUTO_INCREMENT,
  `CodUsuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `CodOpcion` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `Seleccion` tinyint(1) NOT NULL DEFAULT 1,
  `Ver` tinyint(1) NOT NULL DEFAULT 1,
  `Editor` tinyint(1) NOT NULL DEFAULT 1,
  `Borrar` tinyint(1) NOT NULL DEFAULT 1,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`IDPermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `permisosdef` (
  `idPermisosdef` int(11) NOT NULL AUTO_INCREMENT,
  `CodOpcion` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Descripcion` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Seleccion` tinyint(1) DEFAULT NULL,
  `Ver` tinyint(1) DEFAULT NULL,
  `Editor` tinyint(1) DEFAULT NULL,
  `Borrar` tinyint(1) DEFAULT NULL,
  `Aplicacion` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idPermisosdef`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `provincias` (
  `CodProvincia` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `Descripcion` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`CodProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `san_documentos` (
  `idDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `idRegistro` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Doc_Documento` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idDocumento`),
  KEY `FK_san_documentos_san_registro` (`idRegistro`),
  CONSTRAINT `FK_san_documentos_san_registro` FOREIGN KEY (`idRegistro`) REFERENCES `san_registro` (`idRegistro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `san_lsanciones` (
  `idLSancion` int(11) NOT NULL AUTO_INCREMENT,
  `idRegistro` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `idTipoInfraccion` int(11) DEFAULT NULL,
  `Articulos` blob DEFAULT NULL,
  `Fase` int(11) DEFAULT NULL,
  `UsuarioAnota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idLSancion`),
  KEY `FK_san_lsanciones_san_registro` (`idRegistro`),
  CONSTRAINT `FK_san_lsanciones_san_registro` FOREIGN KEY (`idRegistro`) REFERENCES `san_registro` (`idRegistro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `san_registro` (
  `idRegistro` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `idCentro` int(11) DEFAULT NULL,
  `Motivo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `idTipoSancion` int(11) DEFAULT NULL,
  `Articulos` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FVisita` date DEFAULT NULL,
  `FInforme` date DEFAULT NULL,
  `UsuarioFase1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `EstadoFase1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT 'A',
  `FAcuerdo` date DEFAULT NULL,
  `FPropuesta` date DEFAULT NULL,
  `UsuarioFase2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `EstadoFase2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT 'A',
  `FResolucion` date DEFAULT NULL,
  `Sancion` decimal(9,2) DEFAULT NULL,
  `FGrabacion` date DEFAULT NULL,
  `UsuarioFase3` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `EstadoFase3` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT 'A',
  `FRecurso` date DEFAULT NULL,
  `FFirmeza` date DEFAULT NULL,
  `Entidad` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `NRegEntidad` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FContencioso` date DEFAULT NULL,
  `FRecaudacion` date DEFAULT NULL,
  `UsuarioFase4` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `EstadoFase4` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT 'A',
  `UsuarioAnota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TipoRecurso` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `EntidadAdminis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CIFEntidadAdminis` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `EntidadGestora` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CIFEntidadGestora` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Inspector1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Inspector2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Instructor1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Instructor2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CIFEntidad` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `AC_Alegaciones` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `AC_FAlegaciones` date DEFAULT NULL,
  `PeriodoSancion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Doc_Expediente` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `idTipoSancion2` int(11) DEFAULT NULL,
  `FFinSuspension` date DEFAULT NULL,
  `AC_Envio` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `AC_PagoBonificado` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `AC_FRecaudacion` date DEFAULT NULL,
  `AC_Sancion` decimal(9,2) DEFAULT NULL,
  `PR_Envio` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PR_Alegaciones` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PR_FAlegaciones` date DEFAULT NULL,
  `PR_PagoBonificado` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PR_FRecaudacion` date DEFAULT NULL,
  `PR_Sancion` decimal(9,2) DEFAULT NULL,
  `Conclusion` varchar(1) COLLATE utf8_spanish_ci DEFAULT 'A',
  `NombreCentro` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CodProvincia` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CodMunicipio` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idSector` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRegistro`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `san_tipoinfracciones` (
  `idTipoInfraccion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(60) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idTipoInfraccion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS `san_tiposancion` (
  `idTipoSancion` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioAnota` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Tipo` varchar(1) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoSancion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `sectores` (
  `idSector` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Referencia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idSector`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `subtipologias` (
  `idSubTipologia` int(11) NOT NULL AUTO_INCREMENT,
  `idTipologia` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Referencia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idSubTipologia`),
  KEY `FK_subtipologias_tipologias` (`idTipologia`),
  CONSTRAINT `FK_subtipologias_tipologias` FOREIGN KEY (`idTipologia`) REFERENCES `tipologias` (`idTipologia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `tablacentros` (
  `idTablaCentro` int(11) NOT NULL AUTO_INCREMENT,
  `NombreCorto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Cuenta` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Servidor` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `BaseDatos` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Usuario` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Clave` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CodAplicacion` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioAnota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `NRegistro` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CodProvincia` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CodMunicipio` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `CodPostal` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `idZonaBasica` int(11) DEFAULT NULL,
  `idSector` int(11) DEFAULT NULL,
  `idTipologia` int(11) DEFAULT NULL,
  `idSubTipologia` int(11) DEFAULT NULL,
  `idNivelProximidad` int(11) DEFAULT NULL,
  `idEstructuraTerritorial` int(11) DEFAULT NULL,
  `idAreaServicio` int(11) DEFAULT NULL,
  `FActuDatos` date DEFAULT NULL,
  `EMailCentro` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ClaveAdmin` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Localidad` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PlazasAutorizadas` int(11) DEFAULT NULL,
  `PlazasAcreditadas` int(11) DEFAULT NULL,
  `PlazasConcertadas` int(11) DEFAULT NULL,
  `Direccion` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EntidadAdminis` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Telefono1` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EMail` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Observaciones` blob DEFAULT NULL,
  `PlazasAutorizadas1` int(11) DEFAULT NULL,
  `PlazasAutorizadas2` int(11) DEFAULT NULL,
  `PlazasAutorizadas3` int(11) DEFAULT NULL,
  `PlazasAutorizadas4` int(11) DEFAULT NULL,
  `PlazasAcreditadas1` int(11) DEFAULT NULL,
  `PlazasAcreditadas2` int(11) DEFAULT NULL,
  `PlazasAcreditadas3` int(11) DEFAULT NULL,
  `PlazasAcreditadas4` int(11) DEFAULT NULL,
  `PlazasConcertadas1` int(11) DEFAULT NULL,
  `PlazasConcertadas2` int(11) DEFAULT NULL,
  `PlazasConcertadas3` int(11) DEFAULT NULL,
  `PlazasConcertadas4` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTablaCentro`),
  KEY `Cuenta` (`Cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=2415 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `tipologias` (
  `idTipologia` int(11) NOT NULL AUTO_INCREMENT,
  `idSector` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Referencia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idTipologia`),
  KEY `FK_tipologias_sectores` (`idSector`),
  CONSTRAINT `FK_tipologias_sectores` FOREIGN KEY (`idSector`) REFERENCES `sectores` (`idSector`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `Usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Clave` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `NombreCompleto` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `Correo` varchar(60) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `Activa` tinyint(1) NOT NULL DEFAULT 0,
  `Reseteada` tinyint(1) NOT NULL DEFAULT 0,
  `Administrador` tinyint(1) NOT NULL DEFAULT 0,
  `Grupo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Observaciones` blob DEFAULT NULL,
  `IdiomaInterface` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `IdiomaImpresion` varchar(2) COLLATE utf8_spanish_ci NOT NULL,
  `EsGrupo` tinyint(1) NOT NULL DEFAULT 0,
  `Img_Usuario` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UsuarioAnota` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `AccesosFallidos` int(11) DEFAULT NULL,
  `FClave` date DEFAULT NULL,
  `Aplicacion` varchar(2) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Seguridad` varchar(1) COLLATE utf8_spanish_ci DEFAULT 'N',
  PRIMARY KEY (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `validaciones` (
  `idValidacion` int(11) NOT NULL AUTO_INCREMENT,
  `Cuenta` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `FechaReg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idValidacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS `zonasbasicas` (
  `idZonaBasica` int(11) NOT NULL AUTO_INCREMENT,
  `idAreaServicio` int(11) DEFAULT NULL,
  `CodZona` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idZonaBasica`),
  KEY `FK_zonasbasicas_areaservicios` (`idAreaServicio`),
  CONSTRAINT `FK_zonasbasicas_areaservicios` FOREIGN KEY (`idAreaServicio`) REFERENCES `areaservicios` (`idAreaServicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

