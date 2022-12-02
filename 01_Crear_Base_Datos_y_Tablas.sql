DROP DATABASE IF EXISTS universidad;

CREATE DATABASE universidad;

use universidad;

CREATE TABLE `asistencia` (
  `idAsistencia` int(11) NOT NULL,
  `A_Fecha` date NOT NULL,
  `A_Estado` char(8) NOT NULL,
  `codPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `aulas` (
  `idAula` int(11) NOT NULL,
  `A_Nombre` varchar(8) NOT NULL,
  `Capacidad` tinyint(4) NOT NULL,
  `idMateria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `becas` (
  `IdBecas` int(11) NOT NULL,
  `Descuento` tinyint(4) NOT NULL,
  `idEstudiantes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `calificaciones` (
  `idCalificacion` int(11) NOT NULL,
  `Puntaje` float NOT NULL,
  `C_Estado` char(9) NOT NULL,
  `idMateria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `carreras` (
  `idCarrera` int(11) NOT NULL,
  `Nombre_C` char(26) NOT NULL,
  `Sigla` varchar(10) NOT NULL,
  `idEstudiantes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `docente` (
  `idDocente` int(11) NOT NULL,
  `Profecional` varchar(35) NOT NULL,
  `codPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `estudiantes` (
  `idEstudiantes` int(11) NOT NULL,
  `Fecha_ingreso` date NOT NULL,
  `Fecha_egreso` date DEFAULT NULL,
  `Estado` varchar(8) NOT NULL,
  `codPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `grupo` (
  `IdGrupo` int(11) NOT NULL,
  `G_Nombre` varchar(14) NOT NULL,
  `G_Tipo` char(16) NOT NULL,
  `idEstudiantes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `horario` (
  `idHorario` int(11) NOT NULL,
  `Entrada` time NOT NULL,
  `Salida` time NOT NULL,
  `Fecha` varchar(35) NOT NULL,
  `codPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `materias` (
  `idMateria` int(11) NOT NULL,
  `M_Nombre` char(30) NOT NULL,
  `M_Inicio` date NOT NULL,
  `M_Fin` date NOT NULL,
  `Estado_M` char(8) NOT NULL,
  `DocCarr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `personal` (
  `idPersonal` int(11) NOT NULL,
  `area` varchar(60) NOT NULL,
  `codPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `personas` (
  `CodPersona` int(11) NOT NULL,
  `CI` varchar(8) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `A_Primer` varchar(20) NOT NULL,
  `A_Segundo` varchar(20) DEFAULT NULL,
  `Sexo` enum('F','M','nf') NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `Direccion` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`idAsistencia`),
  ADD KEY `codPersona` (`codPersona`);

ALTER TABLE `aulas`
  ADD PRIMARY KEY (`idAula`),
  ADD KEY `idMateria` (`idMateria`);

ALTER TABLE `becas`
  ADD PRIMARY KEY (`IdBecas`),
  ADD KEY `idEstudiantes` (`idEstudiantes`);

ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`idCalificacion`),
  ADD KEY `idMateria` (`idMateria`);

ALTER TABLE `carreras`
  ADD PRIMARY KEY (`idCarrera`),
  ADD KEY `idEstudiantes` (`idEstudiantes`);

ALTER TABLE `docente`
  ADD PRIMARY KEY (`idDocente`),
  ADD KEY `codPersona` (`codPersona`);

ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`idEstudiantes`),
  ADD KEY `codPersona` (`codPersona`);

ALTER TABLE `grupo`
  ADD PRIMARY KEY (`IdGrupo`),
  ADD UNIQUE KEY `idEstudiantes` (`idEstudiantes`);

ALTER TABLE `horario`
  ADD PRIMARY KEY (`idHorario`),
  ADD KEY `codPersona` (`codPersona`);

ALTER TABLE `materias`
  ADD PRIMARY KEY (`idMateria`),
  ADD KEY `DocCarr` (`DocCarr`);

ALTER TABLE `personal`
  ADD PRIMARY KEY (`idPersonal`),
  ADD KEY `codPersona` (`codPersona`) USING BTREE;

ALTER TABLE `personas`
  ADD PRIMARY KEY (`CodPersona`),
  ADD UNIQUE KEY `telefono` (`telefono`);

ALTER TABLE `asistencia`
  MODIFY `idAsistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `docente`
  MODIFY `idDocente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `estudiantes`
  MODIFY `idEstudiantes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `personal`
  MODIFY `idPersonal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`codPersona`) REFERENCES `personas` (`CodPersona`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `aulas`
  ADD CONSTRAINT `aulas_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`);

ALTER TABLE `becas`
  ADD CONSTRAINT `becas_ibfk_1` FOREIGN KEY (`idEstudiantes`) REFERENCES `estudiantes` (`idEstudiantes`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`);

ALTER TABLE `carreras`
  ADD CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`idEstudiantes`) REFERENCES `estudiantes` (`idEstudiantes`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `docente`
  ADD CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`codPersona`) REFERENCES `personas` (`CodPersona`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`codPersona`) REFERENCES `personas` (`CodPersona`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`idEstudiantes`) REFERENCES `estudiantes` (`idEstudiantes`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`codPersona`) REFERENCES `personas` (`CodPersona`);

ALTER TABLE `materias`
  ADD CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`DocCarr`) REFERENCES `docente` (`idDocente`),
  ADD CONSTRAINT `materias_ibfk_2` FOREIGN KEY (`DocCarr`) REFERENCES `carreras` (`idCarrera`);

ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`codPersona`) REFERENCES `personas` (`CodPersona`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
