-- DB2, MySQL, Oracle, MS SQL Server
select
    cast(round(sum(lat_n), 4) as decimal(20,4)) sum_lat
from station
where lat_n between 38.7880 and 137.2345;

-- MySQL, Oracle
select
    round(sum(lat_n), 4) sum_lat
from station
where lat_n between 38.7880 and 137.2345;
