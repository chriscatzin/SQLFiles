-- Subqueries:
-- a query within another query
-- the subquery is used to return data and the outer query further restricts the data
-- by setting its own conditions

# select database
use sakila;

-- -- FIRST EXAMPLE -- --

# select all films with film_id = 1
select * from film;
select * from film where film_id = 1;

# subquery: get the info for each actor who is in film with film_id = 1
select * from film_actor;
select * from actor;

select * from film_actor
where film_id = 1;

select * from actor
where actor_id in (select actor_id from film_actor
					where film_id = 1);




-- -- SECOND EXAMPLE -- --

# select actor who has first_name = sissy
select * from actor;
select * from actor where first_name = 'sissy';

# first subquery: find all films sissy is in from the film_actor table
select * from film_actor
where actor_id = (select actor_id from actor
				  where first_name = 'sissy');
                
# second subquery: find the info on all the films sissy is in
select * from film
where film_id in(
		select film_id from film_actor
		where actor_id = (select actor_id from actor
						  where first_name = 'sissy'));
