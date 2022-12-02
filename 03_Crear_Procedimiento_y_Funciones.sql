CREATE TABLE `bitacora` (
  `idbitacora` int(11) NOT NULL,
  `log_user` varchar(350) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `executedSQL` varchar(1000) DEFAULT NULL,
  `reverseSQL` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `dato1` (
`CodPersona` int(11)
,`Nombre` varchar(20)
,`A_Primer` varchar(20)
,`Sexo` enum('F','M','nf')
);

CREATE TABLE `dato2` (
`CI` varchar(8)
,`Nombre` varchar(20)
,`A_Primer` varchar(20)
,`telefono` int(11)
);

DELIMITER $$
CREATE TRIGGER `after_delete_personas` AFTER DELETE ON `personas` FOR EACH ROW BEGIN
 insert into bitacora( fecha, executedSQL, reverseSQL, log_user )
values(
	now(),
    -- La funcion CONCAT, junta dos valores como una cadena de caracteres.
    -- construyendo el SQL que elimina el registro recien insertado
    CONCAT("DELETE FROM personas WHERE CodPersona = ",OLD.CodPersona,";"),
    CONCAT("INSERT INTO personas (CodPersona, CI, Nombre, A_Primer, A_Segundo, Sexo, telefono, Direccion, email) VALUES (",OLD.CodPersona,", """,OLD.CI,""", """,OLD.Nombre,""", """,OLD.A_Primer,""", """,OLD.A_Segundo,""", """,OLD.Sexo,""", """,OLD.telefono,""", """,OLD.Direccion,""", ",OLD.email,");"),
    current_user()
);
END
$$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER `after_insert_personas` AFTER INSERT ON `personas` FOR EACH ROW BEGIN
 insert into bitacora ( fecha, executedSQL, reverseSQL, log_user )
	values(
    now(),
    -- La funcion CONCAT, junta dos valores como una cadena de caracteres.
    -- construyendo el SQL que elimina el registro recien insertado
    CONCAT("INSERT INTO personas (CodPersona, CI, Nombre, A_Primer, A_Segundo, Sexo, telefono, Direccion, email) VALUES (",NEW.CodPersona,", """,NEW.CI,""", """,NEW.Nombre,""",  """,NEW.A_Primer,""", """,NEW.A_Segundo,""", """,NEW.Sexo,""", """,NEW.telefono,""", """,NEW.Direccion,""", ",NEW.email,");"),
    CONCAT("DELETE FROM personas WHERE CodPersona = ",  NEW.CodPersona,";"),
    current_user()
);
END
$$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER `after_update_personas` AFTER UPDATE ON `personas` FOR EACH ROW BEGIN
 insert into bitacora( fecha, executedSQL, reverseSQL, log_user )
values(   
    now(),
    -- La funcion CONCAT, junta dos valores como una cadena de caracteres.
    -- construyendo el SQL que elimina el registro recien insertado
    CONCAT("UPDATE personas SET CodPersona = ",NEW.CodPersona,", CI = """,NEW.CI,""", Nombre = """,NEW.Nombre,""", A_Primer = """,NEW.A_Primer,""", A_Segundo = """,NEW.A_Segundo,""", Sexo = """,NEW.Sexo,""", telefono = """,NEW.telefono,""", Direccion = """,NEW.Direccion,""", email = ",NEW.email," WHERE CodPersona = ", OLD.CodPersona,";"),
    CONCAT("UPDATE personas SET CodPersona = ",OLD.CodPersona,", CI = """,OLD.CI,""", Nombre = """,OLD.Nombre,""", A_Primer = """,OLD.A_Primer,""", A_Segundo = """,OLD.A_Segundo,""", Sexo = """,OLD.Sexo,""", telefono = """,OLD.telefono,""", Direccion = """,OLD.Direccion,""", email = ",OLD.email," WHERE CodPersona = ", NEW.CodPersona,";"),
    current_user()
);
END
$$

DELIMITER ;
