-- DB2, MySQL
select
    city,
    length(city) shortest
from station
order by 2, 1
limit 1;
select
    city,
    length(city) longest
from station
order by 2 desc, 1
limit 1;

-- Oracle
select
    city,
    len
from (
    select
        city,
        length(city) len
    from station
    order by 2, 1
)
where rownum = 1;
select
    city,
    len
from (
    select
        city,
        length(city) len
    from station
    order by 2 desc, 1
)
where rownum = 1;

-- MS SQL Server
select top 1
    city,
    len(city) shortest
from station
order by 2, 1;
select top 1
    city,
    len(city) longest
from station
order by 2 desc, 1;
