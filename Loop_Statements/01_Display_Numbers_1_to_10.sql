-- Write a stored procedure using a LOOP statement to display numbers from 1 to 10.
delimiter $$
create procedure loop1()
begin
declare i int default 1;
 dis: loop
select i;
set i = i+1;
if (i >= 11) then leave dis;
end if;
end loop;
end $$
delimiter ;

call loop1;
