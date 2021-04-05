DROP TRIGGER IF EXISTS acu_centro_after_update;

DELIMITER $$
CREATE TRIGGER  `acu_centro_after_update` AFTER UPDATE ON `acu_centro` FOR EACH ROW begin
  update tablacentros set NombreCorto=NEW.Nombre,Direccion=NEW.Domicilio,EntidadAdminis=NEW.EntidadAdminis,Telefono1=NEW.Telefono1 where Cuenta=NEW.Cuenta;
end
$$

DELIMITER ;

DROP TRIGGER IF EXISTS acu_centro_after_delete;

DELIMITER $$
CREATE TRIGGER  `acu_centro_after_delete` AFTER DELETE ON `acu_centro` FOR EACH ROW begin
  delete from acu_doccentro where (Cuenta=OLD.Cuenta) and (idCentro=OLD.idCentro);
end
$$

DELIMITER ;

DROP TRIGGER IF EXISTS acu_menevoltemporal_after_insert;

DELIMITER $$
CREATE TRIGGER  `acu_menevoltemporal_after_insert` AFTER INSERT ON `acu_menevoltemporal` FOR EACH ROW begin
  DECLARE sEstado CHAR(1);    
  SELECT Estado INTO sEstado FROM acu_menevoltemporal WHERE (Cuenta=NEW.Cuenta) and (idMenor=NEW.idMenor) order by DesdeFecha DESC LIMIT 1;
  IF (sEstado='B') THEN 
     Update acu_menores set EnAlta=0 where (Cuenta=NEW.Cuenta) and (idMenor=NEW.idMenor);
  ELSE
     Update acu_menores set EnAlta=1 where (Cuenta=NEW.Cuenta) and (idMenor=NEW.idMenor);
  END IF;  
end
$$

DELIMITER ;

DROP TRIGGER IF EXISTS acu_menevoltemporal_after_update;

DELIMITER $$
CREATE TRIGGER  `acu_menevoltemporal_after_update` AFTER UPDATE ON `acu_menevoltemporal` FOR EACH ROW begin
  DECLARE sEstado CHAR(1);       
  SELECT Estado INTO sEstado FROM acu_menevoltemporal WHERE (Cuenta=NEW.Cuenta) and (idMenor=NEW.idMenor) order by DesdeFecha DESC LIMIT 1;
  IF (sEstado='B') THEN   
     Update acu_menores set EnAlta=0 where (Cuenta=NEW.Cuenta) and (idMenor=NEW.idMenor);
  ELSE 
     Update acu_menores set EnAlta=1 where (Cuenta=NEW.Cuenta) and (idMenor=NEW.idMenor);
  END IF;
end
$$

DELIMITER ;

DROP TRIGGER IF EXISTS acu_menevoltemporal_after_delete;

DELIMITER $$
CREATE TRIGGER  `acu_menevoltemporal_after_delete` AFTER DELETE ON `acu_menevoltemporal` FOR EACH ROW begin
  DECLARE sEstado CHAR(1);    
  SELECT Estado INTO sEstado FROM acu_menevoltemporal WHERE (Cuenta=OLD.Cuenta) and (idMenor=OLD.idMenor) order by DesdeFecha DESC LIMIT 1;
  IF (sEstado='B') THEN                                                                   
     Update acu_menores set EnAlta=0 where (Cuenta=OLD.Cuenta) and (idMenor=OLD.idMenor);
  ELSE
     Update acu_menores set EnAlta=1 where (Cuenta=OLD.Cuenta) and (idMenor=OLD.idMenor);
  END IF;
end
$$

DELIMITER ;

DROP TRIGGER IF EXISTS acu_personal_after_delete;

DELIMITER $$
CREATE TRIGGER  `acu_personal_after_delete` AFTER DELETE ON `acu_personal` FOR EACH ROW begin
/* variables */
  DECLARE tmpVar INTEGER;
  delete from acu_percontratos where (Cuenta=OLD.Cuenta) and (idPersonal=OLD.idPersonal);
end
$$

DELIMITER ;

DROP TRIGGER IF EXISTS acu_resevoltemporal_after_insert;

DELIMITER $$
CREATE TRIGGER  `acu_resevoltemporal_after_insert` AFTER INSERT ON `acu_resevoltemporal` FOR EACH ROW begin
  DECLARE sEstado CHAR(1);    
  DECLARE iEstancia INTEGER;
  DECLARE iCaracterPlaza INTEGER;
  SELECT Estado,idEstancia,idCaracterPlaza INTO sEstado,iEstancia,iCaracterPlaza FROM acu_resevoltemporal WHERE (Cuenta=NEW.Cuenta) and (idResidente=NEW.idResidente) order by DesdeFecha DESC LIMIT 1;
  IF (sEstado='E') OR (sEstado='F') OR (sEstado='B') THEN 
     Update acu_residentes set EnAlta=0,idEstancia=iEstancia,idCaracterPlaza=iCaracterPlaza where (Cuenta=NEW.Cuenta) and (idResidente=NEW.idResidente);
  ELSE
     Update acu_residentes set EnAlta=1,idEstancia=iEstancia,idCaracterPlaza=iCaracterPlaza where (Cuenta=NEW.Cuenta) and (idResidente=NEW.idResidente);
  END IF;
end
$$

DELIMITER ;

DROP TRIGGER IF EXISTS acu_resevoltemporal_after_update;

DELIMITER $$
CREATE TRIGGER  `acu_resevoltemporal_after_update` AFTER UPDATE ON `acu_resevoltemporal` FOR EACH ROW begin
  DECLARE sEstado CHAR(1);       
  DECLARE iEstancia INTEGER;
  DECLARE iCaracterPlaza INTEGER;
  SELECT Estado,idEstancia,idCaracterPlaza INTO sEstado,iEstancia,iCaracterPlaza FROM acu_resevoltemporal WHERE (Cuenta=NEW.Cuenta) and (idResidente=NEW.idResidente) order by DesdeFecha DESC LIMIT 1;
  IF (sEstado='E') OR (sEstado='F') OR (sEstado='B') THEN   
     Update acu_residentes set EnAlta=0,idEstancia=iEstancia,idCaracterPlaza=iCaracterPlaza where (Cuenta=NEW.Cuenta) and (idResidente=NEW.idResidente);
  ELSE 
     Update acu_residentes set EnAlta=1,idEstancia=iEstancia,idCaracterPlaza=iCaracterPlaza where (Cuenta=NEW.Cuenta) and (idResidente=NEW.idResidente);
  END IF;
end
$$

DELIMITER ;

DROP TRIGGER IF EXISTS acu_resevoltemporal_after_delete;

DELIMITER $$
CREATE TRIGGER  `acu_resevoltemporal_after_delete` AFTER DELETE ON `acu_resevoltemporal` FOR EACH ROW begin
  DECLARE sEstado CHAR(1);    
  DECLARE iEstancia INTEGER;
  DECLARE iCaracterPlaza INTEGER;
  SELECT Estado,idEstancia,idCaracterPlaza INTO sEstado,iEstancia,iCaracterPlaza FROM acu_resevoltemporal WHERE (Cuenta=OLD.Cuenta) and (idResidente=OLD.idResidente) order by DesdeFecha DESC LIMIT 1;
  IF (sEstado='E') OR (sEstado='F') OR (sEstado='B') THEN                                                                   
     Update acu_residentes set EnAlta=0,idEstancia=iEstancia,idCaracterPlaza=iCaracterPlaza where (Cuenta=OLD.Cuenta) and (idResidente=OLD.idResidente);
  ELSE
     Update acu_residentes set EnAlta=1,idEstancia=iEstancia,idCaracterPlaza=iCaracterPlaza where (Cuenta=OLD.Cuenta) and (idResidente=OLD.idResidente);
  END IF;
end
$$

DELIMITER ;

DROP TRIGGER IF EXISTS usuarios_after_insert;

DELIMITER $$
CREATE TRIGGER  `usuarios_after_insert` AFTER INSERT ON `usuarios` FOR EACH ROW begin
  DECLARE done INT DEFAULT 0;                        
  DECLARE sCodOpcion CHAR(5);
  DECLARE sDescripcion CHAR(40);
  DECLARE iSeleccion,iVer,iEditor,iBorrar INT;
  DECLARE curPermisos CURSOR FOR SELECT CodOpcion,Descripcion,Seleccion,Ver,Editor,Borrar FROM permisos WHERE CodUsuario=NEW.Grupo;
  DECLARE curPermisosdef CURSOR FOR SELECT CodOpcion,Descripcion,Seleccion,Ver,Editor,Borrar FROM permisosdef WHERE (COALESCE(Aplicacion,0)=0) or (Aplicacion=NEW.Aplicacion);       
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
  IF (NEW.EsGrupo=0) and (NEW.Grupo<>'') THEN
     DELETE FROM permisos WHERE CodUsuario=NEW.Usuario;
     OPEN curPermisos;
     REPEAT
        FETCH curPermisos INTO sCodOpcion,sDescripcion,iSeleccion,iVer,iEditor,iBorrar;
        IF NOT done THEN
          INSERT INTO permisos (CodUsuario,CodOpcion,Descripcion,Seleccion,Ver,Editor,Borrar) VALUES (NEW.Usuario,sCodOpcion,sDescripcion,iSeleccion,iVer,iEditor,iBorrar);
        END IF;
     UNTIL done END REPEAT;
     CLOSE curPermisos; 
  ELSE
    OPEN curPermisosdef;
    REPEAT
       FETCH curPermisosdef INTO sCodOpcion,sDescripcion,iSeleccion,iVer,iEditor,iBorrar;
       IF NOT done THEN
          INSERT INTO permisos (CodUsuario,CodOpcion,Descripcion,Seleccion,Ver,Editor,Borrar) VALUES (NEW.Usuario,sCodOpcion,sDescripcion,iSeleccion,iVer,iEditor,iBorrar);
       END IF;
    UNTIL done END REPEAT;
    CLOSE curPermisosdef;
  END IF;
  
  INSERT INTO historico_usuarios SELECT NULL,'insert',d.* FROM usuarios d WHERE d.Usuario=NEW.Usuario;   
end
$$

DELIMITER ;

DROP TRIGGER IF EXISTS usuarios_after_update;

DELIMITER $$
CREATE TRIGGER  `usuarios_after_update` AFTER UPDATE ON `usuarios` FOR EACH ROW begin
  DECLARE done INT DEFAULT 0;                        
  DECLARE sCodOpcion CHAR(5);
  DECLARE sDescripcion CHAR(40);
  DECLARE iSeleccion,iVer,iEditor,iBorrar INT;
  DECLARE curPermisos CURSOR FOR SELECT CodOpcion,Descripcion,Seleccion,Ver,Editor,Borrar FROM permisos WHERE CodUsuario=NEW.Grupo;       
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
  IF (NEW.Grupo <> OLD.Grupo) THEN
     DELETE FROM PERMISOS WHERE CodUsuario=NEW.Usuario;  
     OPEN curPermisos;
     REPEAT
        FETCH curPermisos INTO sCodOpcion,sDescripcion,iSeleccion,iVer,iEditor,iBorrar;
        IF NOT done THEN
          INSERT INTO permisos (CodUsuario,CodOpcion,Descripcion,Seleccion,Ver,Editor,Borrar) VALUES (NEW.Usuario,sCodOpcion,sDescripcion,iSeleccion,iVer,iEditor,iBorrar);
        END IF;
     UNTIL done END REPEAT;
     CLOSE curPermisos; 
  END IF;          
  INSERT INTO historico_usuarios SELECT NULL,'update',d.* FROM usuarios d WHERE d.Usuario=NEW.Usuario; 
end
$$

DELIMITER ;

DROP TRIGGER IF EXISTS usuarios_before_delete;

DELIMITER $$
CREATE TRIGGER  `usuarios_before_delete` BEFORE DELETE ON `usuarios` FOR EACH ROW begin
  IF (OLD.EsGrupo = 1) AND ((SELECT COUNT(Usuario) FROM usuarios WHERE ((Grupo=OLD.Usuario) and (EsGrupo = 0) and (Grupo!='')))> 0) THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pude borrar un Grupo, asignado a Usuarios';
  END IF;
  DELETE FROM permisos WHERE CodUsuario=OLD.Usuario;                     
  INSERT INTO historico_usuarios SELECT NULL,'delete',d.* FROM usuarios d WHERE d.Usuario=OLD.Usuario; 
end
$$

DELIMITER ;