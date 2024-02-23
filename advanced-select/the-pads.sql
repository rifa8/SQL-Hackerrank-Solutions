-- DB2, Oracle
select
    name || '(' || substr(occupation, 1, 1) || ')' name
from occupations
order by 1;
with cte as (
    select
        occupation,
        count(*) cnt
    from occupations
    group by occupation
    order by cnt, occupation
)
select
    case
        when occupation = 'Doctor' then 'There are a total of ' || cnt || ' doctors.'
        when occupation = 'Singer' then 'There are a total of ' || cnt || ' singers.'
        when occupation = 'Actor' then 'There are a total of ' || cnt || ' actors.'
        when occupation = 'Professor' then 'There are a total of ' || cnt || ' professors.'
    end cnt
from cte;

-- MySQL
select
    concat(name,'(', substr(occupation, 1, 1), ')') name
from occupations
order by 1;
with cte as (
    select
        occupation,
        count(*) cnt
    from occupations
    group by 1
    order by 2, 1
)
select
    case
        when occupation = 'Doctor' then concat('There are a total of ', cnt, ' doctors.')
        when occupation = 'Singer' then concat('There are a total of ', cnt, ' singers.')
        when occupation = 'Actor' then concat('There are a total of ', cnt, ' actors.')
        when occupation = 'Professor' then concat('There are a total of ', cnt, ' professors.')
    end cnt
from cte;

-- MySQL, MS SQL Server
select
    concat(name,'(', left(occupation, 1), ')') name
from occupations
order by 1;
with cte as (
    select
        occupation,
        count(*) cnt
    from occupations
    group by occupation
)
select
    case
        when occupation = 'Doctor' then concat('There are a total of ', cnt, ' doctors.')
        when occupation = 'Singer' then concat('There are a total of ', cnt, ' singers.')
        when occupation = 'Actor' then concat('There are a total of ', cnt, ' actors.')
        when occupation = 'Professor' then concat('There are a total of ', cnt, ' professors.')
    end cnt
from cte
order by cte.cnt, occupation;
