-- DB2, MySQL, Oracle, MS SQL Server
select
    cast(round(min(lat_n), 4) as decimal(20, 4)) min_lat
from station
where lat_n > 38.7780;

-- MySQL, Oracle
select
    round(min(lat_n), 4) min_lat
from station
where lat_n > 38.7780;
