-- Stored Functions:
-- perform an operation and return a single value
-- it can take in prameters but they are all in by default and you cannot
-- specify them as in, out, or inout


delimiter $$
create function funcExample(x1 int, x2 int)
returns int
deterministic
begin
	declare ans int;
    set ans = x1 * x2;
    return ans;
end $$
delimiter ;

-- deterministic
select funcExample(2,5);

-- nondeterministic
select now();

