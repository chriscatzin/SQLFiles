-- Data Query/Retrieval Language (DQL/DRL):
-- select statements can be used for 
-- 1. Projection = choose columns in a table you want
-- 2. Selection  = choose rows in a table you want
-- 3. Joining    = bring together data stored in different tables

use sakila;

##################
# SELECT COMMAND #
##################

-- select all columns from table
select * from actor;

-- select distinct columns from table
select first_name, last_name from actor;


###########################
# ARITHMETIC EXPRESSIONS #
###########################

-- can set id to start at 1000
select actor_id+1000, first_name from actor;


##################
# COLUMN ALIASES #
##################

-- instead of having the arithmetic expression, set a better name to a column
-- that makes sense to person viewing table
select actor_id+1000 as id, first_name from actor;

select * from film;
select title, rental_rate, replacement_cost, rental_rate*3 as 'late fee' from film;


############
# DISTINCT #
############

-- distinct keyword used to eliminate any duplicate records so only unique records are
-- selected in a query
select * from address;
select distinct district from address;


#########
# WHERE #
#########

-- where clause also used to update and delete records
select * from film where rental_rate = 0.99;


############
# ORDER BY #
############

-- sort by ascending or decending order of the column we specify
-- defaults to ascending order if not specified

# acending
select * from customer;
select * from customer order by last_name;
select * from customer order by last_name asc;

# decending
select * from customer order by last_name desc;


############
# GROUP BY #
############

-- group by is used to group together rows in a table
-- by doing this you are not selecting the individual rows, but groups of rows

-- from the film_actor table, we can now find how many actors are in each film
select * from film_actor;

select film_id, count(actor_id) as 'actors'
from film_actor
group by film_id;


##########
# HAVING #
##########

-- having allows you to specify conditions in a group by statement just like you
-- would be able to with a where clause

-- from the film_actor table, we can now find how many actors are in each film
-- where there are 10 actors
select film_id, count(actor_id) as 'actors'
from film_actor
group by film_id
having count(actor_id) = 10;


######################
# LOGICAL CONDITIONS #
######################

-- AND --
 select title, rental_rate, rating
 from film
 where rental_rate = 0.99 and rating = 'PG';
 
-- OR --
 select title, rental_rate, rating
 from film
 where rental_rate = 0.99 or rating = 'PG';

-- NOT --
select title, rating
from film
where not rating = 'R';


##########################
# COMPARISION CONDITIONS #
##########################

-- Operator Comparisons --

/****************************************************
*   Operator      |          Meaning                *
* ------------------------------------------------- *
*     =           |  Equal to                       *
*     >           |  Greater than                   *
*     >=          |  Greater than or Equal to       *
*     <           |  Less than                      *
*     <=          |  Less than or Equal to          *
*    <>, !=, ^=   |  Not equal to                   *
****************************************************/

select title, replacement_cost
from film
where replacement_cost > 20;


# BETWEEN 
-- condition to find a value between a lower and higher bound
select title, replacement_cost
from film
where replacement_cost between 10 and 20;


# IN
-- tests if value is in the list of values given
select title, rating
from film
where rating in ('G', 'PG', 'PG-13');


# LIKE
-- looks for a string pattern that matches it
-- % denotes zero or more characters
-- _ denotes one character

-- finds titles that has 'a' as the second character and 'a' as the second
-- to last character
select title
from film
where title like '_a%a_';


# IS NULL
-- check if a column has null values or not
select * from film;
select * from film where original_language_id is null;
select * from film where original_language_id is not null;


