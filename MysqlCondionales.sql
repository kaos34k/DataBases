use holamundo;
show databases;
show tables;

CREATE TABLE user (
    id int not null auto_increment,
    name varchar(50) not null,
    edad int not null,
    email varchar(100) not null,
    primary key (id)
);
-- datos que alimentaran la tabla anterior para incertar datos para realizar consultas
INSERT INTO user (name, edad, email) values ('jairo', 36, 'jmejia@icloud.com');
INSERT INTO user (name, edad, email) values ('natalia', 35, 'namy@icloud.com');
INSERT INTO user (name, edad, email) values ('margarita', 52, 'maroram@icloud.com');
INSERT INTO user (name, edad, email) values ('dalia', 75, 'darco@icloud.com');
-- ejercicio de consultas en diferentes etapas de consulta segun cumplan o no condicion
select * from user;
select * from user limit 1;
select * from user where edad > 36;
select * from user where edad >= 36;
select * from user where edad > 20 and email = 'jmejia@icloud.com';
select * from user where edad >20 or email = 'maroram@icloud.com';
-- siguiente consulta busca todos los criterios que no incluya a maroram con la exprecion !
select * from user where email != 'maroram@icloud.com';
-- en el siguiente script busca todos lols registros cuya edad esten entre 15 y 55
select * from user where edad between 15 and 55;
-- siguiente script busca especificamente la cadena que especifique indiferente de como inicie o termine
select * from user where email like '%gmail%';
select * from user where email like '%gmail';
select * from user where email like 'jmejia%';
-- La siguiente sentencias ordenan datos de forma Asendente (asc) o Desendente (desc);
select * from user order by edad asc;
select * from user order by edad desc;
-- la siguiente sentencia llama al registro en este caso al de mayor edad con marca o funcion (max) mayor o menor 
-- solo se marca como un alias luego de la palabra reservada (as)
select max(edad) as mayor from user;
-- la siguiente sentencia buscara al usuario de menor edad con marca o funcion (min)
select min(edad) as menor from user;

-- seleccionar columnas
select id, name from user;
-- con la siguiente sentencia se le puede crear un alias a una columna cuando no seseamos revelar el nombre de columna por un nombre personalizado
select id, name as nombre from user;

