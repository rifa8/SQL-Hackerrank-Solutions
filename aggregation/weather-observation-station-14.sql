-- DB2, MySQL, Oracle, MS SQL Server
select
    cast(round(max(lat_n), 4) as decimal(20,4)) max_lat
from station
where lat_n < 137.2345;

-- MySQL, Oracle
select
    round(max(lat_n), 4) max_lat
from station
where lat_n < 137.2345;
