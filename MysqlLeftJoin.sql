create table products (
	id int not null auto_increment,
    name varchar(50) not null,
    created_by int not null,
    marca varchar(50) not null,
    primary key(id),
    foreign key(created_by) references user(id)
);
-- sentencia para cambiar nombre de una tabla en este caso de plural a singular.
rename table products to product;

-- insertar productos y alimentar tabla 
insert into product (name, created_by, marca)
values
	('ipad', 1, 'apple'),
    ('iphone', 2, 'apple'),
    ('watch', 3, 'apple'),
    ('macbook-pro', 4, 'apple'),
    ('imac', 1, 'apple'),
    ('ipad mini', 3, 'apple');
-- consulta basica que datos esten correctos     
    select * from product;
-- consulta entre tabla de usuarios y producto, al que tambien se le dio un alias como lo indica la exprecion al final
	select u.id, u.email, p.name from user u left join product p on u.id = p.created_by;
    
-- usar un right join 
	select u.id, u.email, p.name from user u right join product p on u.id = p.created_by;
    
-- usar innerjoin
	select u.id, u.email, p.name from user u inner join product p on u.id = p.created_by;
        
-- Cross Join trae cualquier clase de registro en la consulta consultada por producto relacionado con su usuario
	select u.id, u.name, p.id, p.name from user u cross join product p;
    
-- group by, consulta sobre un referente especifico en este caso marca
	select count(id), marca from product group by marca;
    
-- otro metodo de ordenar datos (grup by, having y drop table)
	select count(p.id), u.name from product p left join user u on u.id = p.created_by group by p.created_by;
		-- having
    	select count(p.id), u.name from product p left join user u 
        on u.id = p.created_by group by p.created_by
        having count(p.id) >=2;
    