-- Numeric Functions: 
-- used for numeric manipulation or calculation

##########
#  CEIL  #
##########

-- rounds a number up to the next whole number
select ceil(10.00001);


###########
#  FLOOR  #
###########

-- rounds a number down to the next whole number
select floor(19.999999999999999);


#########
#  POW  #
#########

-- gets the power of a number
select pow(2,5);


##############
#  GREATEST  #
##############

-- get the biggest value out of a list of values passed to it
select greatest(8,5,28,5,103);


-- cannot pass a whole column to greatest, must be a list of values, will
-- get an error if you do
select greatest(rental_rate) from film;


