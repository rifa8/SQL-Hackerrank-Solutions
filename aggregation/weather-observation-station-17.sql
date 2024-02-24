-- DB2, MySQL
select
    cast(round(long_w, 4) as decimal(20,4)) long_w
from station
where lat_n > 38.7780
order by lat_n
limit 1;

-- MySQL
select
    round(long_w, 4) long_w
from station
where lat_n > 38.7780
order by lat_n
limit 1;

-- MySQL, Oracle
select
    round(long_w, 4) long_w
from station
where lat_n = (
    select
        min(lat_n)
    from station
    where lat_n > 38.7780
);

-- MySQL, MS SQL Server
select
    cast(round(long_w, 4) as decimal(20, 4)) long_w
from station
where lat_n = (
    select
        min(lat_n)
    from station
    where lat_n > 38.7780
);

-- MS SQL Server
select top 1
    cast(round(long_w, 4) as decimal(20,4)) long_w
from station
where lat_n > 38.7780
order by lat_n;
