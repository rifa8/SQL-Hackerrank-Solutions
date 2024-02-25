-- DB2, Oracle
with cte as (
    select
        age,
        min(coins_needed) min_coin,
        power
    from wands w
    join wands_property wp
        on w.code = wp.code
    where is_evil = 0
    group by
        age,
        power
)
select
    id,
    age,
    coins_needed,
    power
from wands w
join wands_property wp
    on w.code = wp.code
where (age, coins_needed, power) in (select * from cte)
order by
    power desc,
    age desc;

-- MySQL
select
    id,
    age,
    coins_needed,
    power
from wands w
join wands_property wp
    on w.code = wp.code
where (age, coins_needed, power) in (
    select
        age,
        min(coins_needed) min_coin,
        power
    from wands w
    join wands_property wp
        on w.code = wp.code
    where is_evil = 0
    group by
        age,
        power
)
order by
    power desc,
    age desc;

-- MS SQL Server
with cte as (
    select
        age,
        min(coins_needed) min_coin,
        power
    from wands w
    join wands_property wp
        on w.code = wp.code
    where is_evil = 0
    group by
        age,
        power
)
select
    id,
    age,
    coins_needed,
    power
from wands w
join wands_property wp
    on w.code = wp.code
where concat(age, '|', coins_needed, '|', power) in (select concat(age, '|', min_coin, '|', power) from cte)
order by
    power desc,
    age desc;
