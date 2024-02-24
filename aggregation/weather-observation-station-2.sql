-- DB2, MySQL, Oracle, MS SQL Server
select
    cast(round(sum(lat_n), 2) as decimal(8, 2)) sum_lat,
    cast(round(sum(long_w), 2) as decimal(8, 2)) sum_long
from station;

-- MySQL, Oracle
select
    round(sum(lat_n), 2) sum_lat,
    round(sum(long_w), 2) sum_long
from station;
