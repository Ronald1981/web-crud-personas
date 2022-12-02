INSERT INTO `asistencia` (`idAsistencia`, `A_Fecha`, `A_Estado`, `codPersona`) VALUES
(2, '2022-11-30', 'Activo', 202111003),
(3, '2022-12-01', 'Activo', 202111003),
(4, '2022-11-30', 'Activo', 202111003),
(5, '2022-12-01', 'Activo', 202111003);

INSERT INTO `aulas` (`idAula`, `A_Nombre`, `Capacidad`, `idMateria`) VALUES
(1, '101', 30, 4),
(2, '202', 30, 2);

INSERT INTO `becas` (`IdBecas`, `Descuento`, `idEstudiantes`) VALUES
(1, 60, 3),
(2, 40, 4);

INSERT INTO `calificaciones` (`idCalificacion`, `Puntaje`, `C_Estado`, `idMateria`) VALUES
(1, 100, 'Activo', 4),
(2, 100, 'Activo', 2);

INSERT INTO `carreras` (`idCarrera`, `Nombre_C`, `Sigla`, `idEstudiantes`) VALUES
(1, 'Ingeniería Informática', 'INF', 3),
(2, 'ADMINISTRACION', 'ADM', 4);

INSERT INTO `docente` (`idDocente`, `Profecional`, `codPersona`) VALUES
(2, 'ING INFORMATICO', 202201007),
(3, 'ING INFORMATICO', 202201008),
(4, 'ING CIVIL', 202201009),
(5, 'LIC EN IDIOMAS', 202204015),
(6, 'LIC EN ADMINISTRACION', 202204017);

INSERT INTO `estudiantes` (`idEstudiantes`, `Fecha_ingreso`, `Fecha_egreso`, `Estado`, `codPersona`) VALUES
(3, '2022-11-01', '2024-12-31', 'ACTIVO', 202111003),
(4, '2022-11-01', '2025-12-31', 'ACTIVO', 202111004);

INSERT INTO `grupo` (`IdGrupo`, `G_Nombre`, `G_Tipo`, `idEstudiantes`) VALUES
(1, 'Grup I/2022', 'Mañana', 3),
(2, 'Grupo II/2022', 'Noche', 4);

INSERT INTO `materias` (`idMateria`, `M_Nombre`, `M_Inicio`, `M_Fin`, `Estado_M`, `DocCarr`) VALUES
(1, 'Introducción a la Informatica', '2022-11-01', '2022-12-31', 'Activo', 2),
(2, 'Programación', '2022-11-01', '2022-12-31', 'Activo', 2),
(3, 'Introducción a la Metodólogaia', '2022-11-01', '2022-12-31', 'Activo', 2),
(4, 'Ingles', '2022-11-01', '2022-12-31', 'Activo', 2),
(5, 'Calculo', '2022-11-01', '2022-12-31', 'Activo', 2);

INSERT INTO `personal` (`idPersonal`, `area`, `codPersona`) VALUES
(3, 'Administracion', 33333),
(4, 'Marketing', 33334),
(5, 'Contable', 33335);

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

INSERT INTO `personas` (`CodPersona`, `CI`, `Nombre`, `A_Primer`, `A_Segundo`, `Sexo`, `telefono`, `Direccion`, `email`) VALUES
(9, '119', 'Maria Roxana', 'Rojas', 'Rosales', 'F', 7913456, 'Sin Datos', 'docente@unibeth.edu.bo'),
(10, '1110', 'Juan Gabriel', 'Coca', 'Acuña', 'M', 23146857, 'Sin Datos', 'docente@unibeth.edu.bo'),
(11, '1111', 'Edgar Luis', 'Gómez', 'Saiquita', 'M', 67913452, 'sin informacion', 'docente@unibeth.edu.bo'),
(33333, '33333', 'Tito', 'Cazon', '', 'M', 465281, 'Sin Datos', 'administrativo@gmail.com'),
(33334, '33334', 'Carla', 'Caballero', '', 'F', 4856752, 'sin informacion', 'administrativo@gmail.com'),
(33335, '33335', 'Erika', 'Douglas', '', 'F', 6551354, '', 'administrativo@gmail.com'),
(10101010, '30303030', 'MARIA', 'ROSALES', '', 'F', 90908080, 'desconocido', ''),
(202000001, '5052410', 'Farit Fernando ', 'Condori ', 'Tito', 'M', 70000000, 'sin informacion', 'estudiante@unibeth.edu.bo'),
(202000002, '9716206', 'Roberto Carlos', 'Cruz', 'Orellana', 'M', 70000001, 'Av. Doble Vía La Guardia', '2@unibeth.edu.bo'),
(202000003, '5052412', 'Carlos Yonatan', 'Flores ', 'Cuellar', 'M', 70000002, 'desconocida', '3@unibeth.edu.bo'),
(202000004, '5052413', 'Maria Jose', 'Osinaga', '', 'F', 70000003, 'desconocida', '5@unibeth.edu.bo'),
(202000005, '5052414', 'Esteban Andres', 'Pereira ', 'Alba', 'M', 70000004, 'desconocida', '6@unibeth.edu.bo'),
(202100101, '5052415', 'Junior David ', 'Pinaya ', 'Hoyos', 'M', 70000005, 'desconocida', '7@unibeth.edu.bo'),
(202100102, '5052416', 'Carlos Andres ', 'Sossa ', 'Antelo', 'M', 70000006, 'desconocida', '8@unibeth.edu.bo'),
(202100103, '5052414', 'Jorge Josue ', 'Quinteros ', 'Guzman', 'M', 70000007, 'desconocida', '9@unibeth.edu.bo'),
(202100104, '5052415', 'Kerin Joel ', 'Pardo ', 'Villanueva', 'M', 70000008, 'desconocida', '10@unibeth.edu.bo'),
(202100105, '5052416', 'Josue Wilfredo ', 'Orellana ', 'Suarez', 'M', 70000009, 'desconocida', '11@unibeth.edu.bo'),
(202111003, '5052417', 'Delfin Ronald', 'Gareca', 'Condori', 'M', 72127871, 'Calle Virgen del Socavon Nro 7', '202111003@unibeth.edu.bo'),
(202111004, '5052418', 'Veronica', 'Toledo', 'Rojas', 'F', 78429688, 'La Guardia', '202111004@unibeth.edu.bo'),
(202111005, '5052419', 'James Dilan ', 'Severiche ', 'Caballero', 'M', 78429689, 'desconocida', '14@unibeth.edu.bo'),
(202111006, '5052420', 'Pedro Luis ', 'Herbas ', 'Vidal', 'M', 78429690, 'desconocida', '15@unibeth.edu.bo'),
(202111007, '5052421', 'Ulises Alejandro ', 'Balderrama ', 'Cros', 'M', 78429691, 'desconocida', '16@unibeth.edu.bo'),
(202201007, '111', 'Christian Mario ', 'Toranzos ', 'Caero', 'M', 78429692, 'desconocida', 'docente@unibeth.edu.bo'),
(202201008, '112', 'Tito ', 'Flores', '', 'M', 78429693, '6mo Anillo y Av Mariscal Santa Cruz', 'docente@unibeth.edu.bo'),
(202201009, '113', 'Maria Cristina ', 'Caballero ', 'Lafuente', 'F', 78429694, 'desconocida', 'docente@unibeth.edu.bo'),
(202201010, '5052425', 'Yael Dayan', 'Aguilar ', 'Vargas', 'M', 78429695, 'desconocida', '20@unibeth.edu.bo'),
(202201011, '5052426', 'Natalia ', 'Bengoa ', 'Velasco', 'F', 78429696, 'desconocida', '21@unibeth.edu.bo'),
(202204009, '5052427', 'Angel ', 'Velez ', 'Cortez', 'M', 78429697, 'desconocida', '22@unibeth.edu.bo'),
(202204011, '5052428', 'Miguel Angel ', 'Vasquez ', 'Velasquez', 'M', 78429698, 'desconocida', '23@unibeth.edu.bo'),
(202204013, '5052429', 'Leonardo ', 'Zelaya ', 'Castro', 'M', 78429699, 'desconocida', '24@unibeth.edu.bo'),
(202204015, '114', 'Graciela ', 'Revollo ', 'Espinoza', 'F', 78429700, 'desconocida', 'docente@unibeth.edu.bo'),
(202204017, '115', 'Maria Eugenia ', 'Garcia ', 'Peña', 'F', 78429701, 'desconocida', 'docente@unibeth.edu.bo'),
(202204019, '116', 'Ana María', 'Méndez', ' Galarza', 'F', 78429702, 'desconocida', 'docente@unibeth.edu.bo'),
(202204021, '117', 'Benjamí', 'Vargas ', 'Alvarez', 'M', 78429703, 'desconocida', 'docente@unibeth.edu.bo'),
(202204023, '118', 'Raúl Rafae', 'Galvez', 'Villegas', 'M', 78429704, 'desconocida', 'docente@unibeth.edu.bo'),
(202300111, '3216547', 'JESUS', 'DE NAZARETH', '', 'M', 1, 'Todos lados', 'dios@dios.com'),
(202501001, '5052419', 'CRISTIANO', 'GARECK', 'CONDOR', 'M', 2147483647, 'Misiones del Carmen', 'dgareck@gmail.com'),
(999999999, '123', 'Admin', '', '', '', 0, '', '');
