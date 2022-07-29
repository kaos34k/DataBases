-- usar un right join 
	select u.id, u.email, p.name from user u left join product p on u.id = p.created_by;