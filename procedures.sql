

------------------------------------------------------------guarda paciente
DELIMITER //
CREATE PROCEDURE guardaPaciente( 
    i_id_paciente VARCHAR(20),
    i_nombre VARCHAR(50),
    i_ap_apellido VARCHAR(30),
    i_am_apellido VARCHAR(30),
    i_sexo CHAR,
    i_fecha_nacimiento DATE,
    i_estadoCivil VARCHAR(30),
    i_ocupacion VARCHAR(100),
    i_escolaridad VARCHAR(50)
)
BEGIN
INSERT INTO paciente (
    id_paciente,
    nombre,
    ap_apellido,
    am_apellido,
    sexo,
    fecha_nacimiento,
    estadoCivil,
    ocupacion,
    escolaridad)
    VALUES(
 	i_id_paciente,
 	i_nombre,
    i_ap_apellido,
    i_am_apellido,
    i_sexo,
    i_fecha_nacimiento,
    i_estadoCivil,
    i_ocupacion,
    i_escolaridad
    );
END //
DELIMITER ;

------------------------------------------------------------save telefono
DELIMITER //
CREATE PROCEDURE saveTelefono(
    i_id_paciente VARCHAR(20),
    i_num_tel VARCHAR(10)
    )
BEGIN

INSERT INTO telefono(
    id_paciente,
    num_tel
)VALUES(
    i_id_paciente,
    i_num_tel
);
END//
DELIMITER ;

------------------------------------------------------------save correo
DELIMITER //
CREATE PROCEDURE saveCorreo(
    i_id_paciente VARCHAR(20),
    i_correo VARCHAR(300)
    )
BEGIN

INSERT INTO correo(
    id_paciente,
    correo
)VALUES(
    i_id_paciente,
    i_correo
);
END//
DELIMITER ;

------------------------------------------------------------save domicilio
DELIMITER //
CREATE PROCEDURE saveDomicilio(
    i_id_paciente VARCHAR(20),
    i_name_dom VARCHAR(300)
    )
BEGIN

INSERT INTO domicilio(
    id_paciente,
    nombre_domicilio
)VALUES(
    i_id_paciente,
    i_name_dom
);
END//
DELIMITER ;

------------------------------------------------------------save tutor
DROP PROCEDURE IF EXISTS saveTutor;
DELIMITER //
CREATE PROCEDURE saveTutor(
    i_id_paciente VARCHAR(20),
    i_name_tutor VARCHAR(100),
    i_numTel VARCHAR(10)
    )
BEGIN

INSERT INTO tutor(
    id_paciente,
    nombre_tutor,
    num_tel
)VALUES(
    i_id_paciente,
    i_name_tutor,
    i_numTel
);
END//
DELIMITER ;

------------------------------------------------------------save antecedentes
DELIMITER //
CREATE PROCEDURE saveAntecedentes(
    i_higieneBucal VARCHAR(5),
    i_alimntacion VARCHAR(5),
    i_id_paciente VARCHAR(20),
    in_motivo_visita VARCHAR(200)
    )
BEGIN

INSERT INTO antecedentes(
    fecha,
    higiene_bucal,
    alimentacion,
    id_paciente,
    motivo_visita
)VALUES(
    curdate(),
    i_higieneBucal,
    i_alimntacion,
    i_id_paciente,
    in_motivo_visita
);
END//
DELIMITER ;

--------------------------------------------------------------------save tipo_consulta
DELIMITER //
CREATE PROCEDURE saveTipoConsulta(
    i_id_antecedente INT,
    i_id_consulta INT
    )
BEGIN

INSERT INTO tipo_consulta(
    id_antecedente,
    id_consulta
)VALUES(
    i_id_antecedente,
    i_id_consulta
);
END//
DELIMITER ;


------------------------------------------------------------save tratamiento
DELIMITER //
CREATE PROCEDURE saveTratamiento(
    i_id_antecedente INT,
    i_tipo_tratamiento VARCHAR(100),
    i_observaciones   VARCHAR(200)
    )
BEGIN

INSERT INTO tratamiento(
    id_antecedente,
    tipo_tratamiento,
    observaciones
)VALUES(
    i_id_antecedente,
    i_tipo_tratamiento,
    i_observaciones
);
END//
DELIMITER ;

--------------------------------------------------------------------ANTICs
DELIMITER //
CREATE PROCEDURE saveAntic(
    i_id_antecedente INT,
    i_nombreAntic VARCHAR(100)
    )
BEGIN

INSERT INTO anticonceptivo(
    id_antecedente,
    nombre_antico
)VALUES(
    i_id_antecedente,
    i_nombreAntic
);
END//
DELIMITER ;

--------------------------------------------------------------------alergia
DELIMITER //
CREATE PROCEDURE saveAlergia(
    i_id_antecedente INT,
    i_nombre_alergia VARCHAR(100)
    )
BEGIN

INSERT INTO alergia(
    id_antecedente,
    nombre_alergia
)VALUES(
    i_id_antecedente,
    i_nombre_alergia
);
END//
DELIMITER ;

--------------------------------------------------------------------embazazada
DELIMITER //
CREATE PROCEDURE saveEmbarazo(
    i_id_antecedente INT,
    i_meses VARCHAR(100)
    )
BEGIN

INSERT INTO embarazada(
    id_antecedente,
    meses
)VALUES(
    i_id_antecedente,
    i_meses
);
END//
DELIMITER ;

--------------------------------------------------------------------medicamento
DELIMITER //
CREATE PROCEDURE saveMedicamento(
    i_id_antecedente INT,
    i_nombre_medicamento VARCHAR(100)
    )
BEGIN

INSERT INTO medicamento(
    id_antecedente,
    nombre_medicamento
)VALUES(
    i_id_antecedente,
    i_nombre_medicamento
);
END//
DELIMITER ;

--------------------------------------------------------------------hospitalizado
DELIMITER //
CREATE PROCEDURE saveHospitalizado(
    i_id_antecedente INT,
    i_motivo VARCHAR(60)
    )
BEGIN

INSERT INTO hospitalizado(
    id_antecedente,
    motivo
)VALUES(
    i_id_antecedente,
    i_motivo
);
END//
DELIMITER ;

--------------------------------------------------------------------tegidos Blandos
DELIMITER //
CREATE PROCEDURE saveTejidos(
    i_id_paciente VARCHAR(20),
    i_frenillo VARCHAR(5),
    i_mejilla VARCHAR(20),
    i_labios VARCHAR(50),
    i_paladar VARCHAR(50),
    i_encia VARCHAR(50),
    i_lengua VARCHAR(70)
    )
BEGIN

INSERT INTO tejidos_blandos(
    id_paciente,
    frenillo,
    mejilla,
    labios,
    paladar,
    encia,
    lengua
)VALUES(
    i_id_paciente,
    i_frenillo,
    i_mejilla,
    i_labios,
    i_paladar,
    i_encia,
    i_lengua
);
END//
DELIMITER ;

-----------------------------------------------------------------save anteced_habito
DELIMITER //
CREATE PROCEDURE saveAntecHabit(
    i_id_antecedente INT,
    i_id_habito INT
    )
BEGIN

INSERT INTO anteced_habit(
    id_antecedente,
    id_habito
)VALUES(
    i_id_antecedente,
    i_id_habito
);
END//
DELIMITER ;

-----------------------------------------------------------------save padeci_paciente
DELIMITER //
CREATE PROCEDURE savePadecimientos(
    i_id_paciente VARCHAR(20),
    i_id_padecimiento INT
    )
BEGIN

INSERT INTO padeci_paciente(
    id_paciente,
    id_padecimiento,
    fecha
)VALUES(
    i_id_paciente,
    i_id_padecimiento,
    CURDATE()
);
END//
DELIMITER ;

--------------------------------------------------------------------agenda
drop PROCEDURE saveCita;
DELIMITER //
CREATE PROCEDURE saveCita(
    i_id_paciente VARCHAR(20),
    i_fecha_agenda DATE,
    i_motivo VARCHAR(300)
    )
BEGIN

INSERT INTO agenda(
    id_paciente,
    fecha_agenda,
    motivo,
    atendido
)VALUES(
    i_id_paciente,
    i_fecha_agenda,
    i_motivo,
    false
);
END//
DELIMITER ;
-----------------------------------------------------------------atender paciente
DELIMITER //
CREATE PROCEDURE atenderPaciente(
    i_id_paciente VARCHAR(20),
    i_fecha DATE
    )
BEGIN
    UPDATE agenda set atendido=1 WHERE id_paciente=i_id_paciente AND fecha_agenda=i_fecha;

END//
DELIMITER ;
------------------------------------------------------------------------------------------function get id antecedente

drop FUNCTION getIdAntecedente
DELIMITER //
CREATE FUNCTION getIdAntecedente(
	i_id_paciente VARCHAR(20)
)
RETURNS INT
BEGIN
DECLARE out_id INT;
	SELECT id_antecedente INTO out_id FROM antecedentes WHERE id_paciente=i_id_paciente;
RETURN out_id;
END //
DELIMITER ;
--------------------------------------------------------------------------------------------alimina por completo un paciente
DELIMITER //
CREATE PROCEDURE eliminarPaciente(i_id_paciente VARCHAR(20))
BEGIN
    DECLARE var_antecedente INT;
    SELECT getIdAntecedente(i_id_paciente) INTO var_antecedente;
    DELETE FROM hospitalizado WHERE id_antecedente=var_antecedente;
    DELETE FROM embarazada WHERE id_antecedente=var_antecedente;
    DELETE FROM tratamiento WHERE id_antecedente=var_antecedente;
    DELETE FROM medicamento WHERE id_antecedente=var_antecedente;
    DELETE FROM alergia WHERE id_antecedente=var_antecedente;
    DELETE FROM anticonceptivo WHERE id_antecedente=var_antecedente;
    DELETE FROM tipo_consulta WHERE id_antecedente=var_antecedente;
    DELETE FROM anteced_habit WHERE id_antecedente=var_antecedente;
    DELETE FROM antecedentes WHERE id_antecedente=var_antecedente;

    DELETE FROM domicilio WHERE id_paciente=i_id_paciente;
    DELETE FROM telefono WHERE id_paciente=i_id_paciente;
    DELETE FROM correo WHERE id_paciente=i_id_paciente;
    DELETE FROM tutor WHERE id_paciente=i_id_paciente;
    DELETE FROM padeci_paciente WHERE id_paciente=i_id_paciente;
    DELETE FROM tejidos_blandos WHERE id_paciente=i_id_paciente;
    DELETE FROM agenda WHERE id_paciente=i_id_paciente;
    DELETE FROM abonos WHERE id_paciente=i_id_paciente;
    DELETE FROM cuenta WHERE id_paciente=i_id_paciente;
    DELETE FROM paciente WHERE id_paciente=i_id_paciente;
END //
DELIMITER ;


----------------------------------------------------------------creaCuenta otorga credito
DROP PROCEDURE IF EXISTS otorgaCredito;
DROP PROCEDURE otorgaCredito;
DELIMITER //
CREATE PROCEDURE otorgaCredito(
    in_id_paciente VARCHAR(20),
    in_cantidad DOUBLE
    )
BEGIN
    INSERT INTO cuenta(
            id_paciente,
            cantidad
        )VALUES(
            in_id_paciente,
            in_cantidad
        );
END//
DELIMITER ;

----------------------------------------------------------------actualiza credito
DROP PROCEDURE IF EXISTS actualizarCredito;
DELIMITER //
CREATE PROCEDURE actualizarCredito(
    in_id_paciente VARCHAR(20),
    in_cantidad DOUBLE
    )
BEGIN
    UPDATE  cuenta SET cantidad=in_cantidad WHERE id_paciente=in_id_paciente;
END//
DELIMITER ;

DROP FUNCTION IF EXISTS validaCredito;
DROP FUNCTION validaCredito;
DELIMITER //
CREATE FUNCTION validaCredito(
    in_id_paciente VARCHAR(20)
    )
    RETURNS VARCHAR (20)
BEGIN
    DECLARE valida VARCHAR (20);
    DECLARE cantidadCredito VARCHAR(20);
    SELECT id_paciente INTO valida FROM cuenta WHERE id_paciente=in_id_paciente;

    CASE valida
    WHEN in_id_paciente then
        select cantidad INTO cantidadCredito from cuenta where id_paciente=in_id_paciente;
            IF strcmp(cantidadCredito, '0') = 0 then
                SET cantidadCredito='-1';
            END IF;
    ELSE
        SET cantidadCredito='0';

    END CASE;
    RETURN cantidadCredito;
END//
DELIMITER ;
---------------------------------------------------------------- abonar
DROP FUNCTION IF EXISTS abonarCuenta;
DELIMITER //
CREATE FUNCTION abonarCuenta(
    in_id_paciente VARCHAR(20),
    in_cantidad DOUBLE
    )
RETURNS VARCHAR (30)

BEGIN
DECLARE cant_cuenta DOUBLE;
DECLARE mensaje VARCHAR(30);
DECLARE in_id_cuenta INT;

    SELECT  cantidad INTO cant_cuenta FROM cuenta WHERE id_paciente=in_id_paciente;
    SELECT id_cuenta INTO in_id_cuenta FROM cuenta WHERE id_paciente=in_id_paciente;
CASE
    WHEN  in_cantidad > cant_cuenta THEN
        SET mensaje='Cobro Excesivo';
    WHEN in_cantidad=cant_cuenta THEN
            INSERT INTO abonos(
                    cantidad,
                    fecha,
                    id_paciente,
                    id_cuenta
                )VALUES(
                    in_cantidad,
                    curdate(),
                    in_id_paciente,
                    in_id_cuenta
                );
    UPDATE cuenta SET cantidad = cantidad-in_cantidad WHERE cuenta.id_paciente = in_id_paciente;
        SET mensaje='Cuenta saldada';
    ELSE
                INSERT INTO abonos(
                    cantidad,
                    fecha,
                    id_paciente,
                    id_cuenta
                )VALUES(
                    in_cantidad,
                    curdate(),
                    in_id_paciente,
                    in_id_cuenta
                );
    UPDATE cuenta SET cantidad = cantidad-in_cantidad WHERE cuenta.id_paciente = in_id_paciente;    
        SET mensaje='Anono exitoso!';
END case;

RETURN mensaje;
END//
DELIMITER ;
--------------------------------------------------------------------------------total_ventas
DROP procedure IF EXISTS saveVenta;
DELIMITER //
CREATE PROCEDURE saveVenta(
	in_nombre varchar(100),
    in_concepto VARCHAR(50),
    in_precio DOUBLE,
    in_cantidad INT,
    in_total DOUBLE
)
BEGIN
    INSERT INTO venta(
		nombre_cliente,
        concepto_pago,
        precio,
        cantidad,
        total,
        fecha
    )VALUES(
		in_nombre,
        in_concepto,
        in_precio,
        in_cantidad,
        in_total,
        curdate()
    );
END//
DELIMITER ;
call saveVenta('MOSTRARDOR','Revicion',900,1,900);

---------------------------------------------------------------------------calcula la edad  
DELIMITER //
CREATE FUNCTION getEdad(
    in_fecha_nacimiento DATE
)
RETURNS VARCHAR(3)

BEGIN
    DECLARE edad VARCHAR(3);
    SELECT TIMESTAMPDIFF(YEAR,in_fecha_nacimiento,CURDATE()) INTO edad;
return edad;
END //
DELIMITER ;