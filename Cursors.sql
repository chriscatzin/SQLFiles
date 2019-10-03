-- Cursors:
-- control structure that allows you to traverse over records in a database

-- Important Cursor Properties:
-- 1. Asensitive: server may or may not make a copy of its result table
-- 2. Read only: Not updatable
-- 3. Nonscrollable: can traverse only in one direction, can't skip rows

use practice;

create table car
(
	car_id int primary key auto_increment,
    car_color varchar(15),
    car_price double not null
);

insert into car(car_id, car_color, car_price) values(null, 'red', 40000);
insert into car(car_id, car_color, car_price) values(null, 'blue', 30000);
insert into car(car_id, car_color, car_price) values(null, 'grey', 40000);
insert into car(car_id, car_color, car_price) values(null, 'white', 35000);
insert into car(car_id, car_color, car_price) values(null, 'red', 20000);
insert into car(car_id, car_color, car_price) values(null, 'red', 27000);
insert into car(car_id, car_color, car_price) values(null, 'blue', 100000);
insert into car(car_id, car_color, car_price) values(null, 'blue', 55000);
insert into car(car_id, car_color, car_price) values(null, 'red', 40000);
insert into car(car_id, car_color, car_price) values(null, 'black', 150000);
insert into car(car_id, car_color, car_price) values(null, 'grey', 20000);

select * from car;


delimiter $$
create procedure lotValue(out total double)
begin
	-- declare variables with defaults
    declare finished integer default 0;
	declare carValue double default 0;
    
    -- declare cursor
    declare allCars
    cursor for
    select car_price from car;
    
    -- declare not found handler
    declare continue handler for 
		not found set finished = 1;
        
	set @sum = 0;
    
    open allCars;
    
    getPrice: loop
		-- get records for a row
        fetch allCars into carValue;
        
        -- break out of the loop once we going through all the records
        if (finished = 1) then
			leave getPrice;
		end if;
        
        -- add value to the sum
        set @sum = @sum + carValue;
    
    end loop getPrice;
    close allCars;
    
    select @sum into total;
    
end $$
delimiter ;


call lotValue(@total);

select @total;

