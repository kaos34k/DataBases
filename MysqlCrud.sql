create database holamundo;
show databases;
use holamundo;
CREATE TABLE animales (
    id int,
    tipo varchar(255),
    estado varchar(255),
    PRIMARY KEY (id)
);

ALTER TABLE animales MODIFY COLUMN id int auto_increment;

-- INSERT INTO ANIMALES (tipo, estado) VALUES ('chanchito', 'feliz');
-- Esta linea no sera ejecutada solo se crea para insertar valores en la tabla animales.
SHOW CREATE TABLE animales; 

CREATE TABLE `animales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
-- ejercicio de ingestion de datos a la tabla animales.
INSERT INTO ANIMALES (tipo, estado) VALUES ('chanchito', 'feliz');
INSERT INTO ANIMALES (tipo, estado) VALUES ('dragon', 'feliz');
INSERT INTO ANIMALES (tipo, estado) VALUES ('felipe', 'trsite');

-- linea de consulta para validar valores en la tabla 
SELECT * FROM animales;
SELECT * FROM animales WHERE id=1;
SELECT * FROM animales WHERE estado = 'feliz' AND tipo = 'chanchito';

-- esta seccion de script devera devolver un valor null 
SELECT * FROM animales WHERE estado = 'feliz' AND tipo = 'felipe';

-- actualizar registro dentro de una base de datos
UPDATE animales SET estado ='feliz' where id =4;

-- Eliminar registro dentro de la base de datos
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  
-- To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
DELETE from animales where estado = 'feliz';

-- mysql nueva ver siempre exigira un comando para eliminar algun registro con un ID
DELETE from animales where id = 4; -- esta seleccion solo borrara el ID relacionado

-- actualizar tabla con la informacion que requeramos
-- este tambien arroja error 1175 devido a que siempre con la nueva v de msql se requerira que se determine un id
UPDATE animales set estado = 'triste' where tipo ='dragon'; 
-- estados Basicos Del crub en base de datos CREATE READ UPDATE DELETE