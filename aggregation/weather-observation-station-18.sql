-- DB2, MySQL, Oracle, Ms SQL Server
select
    cast(round(max(lat_n) - min(lat_n), 4) + round(max(long_w) - min(long_w), 4) as decimal(20, 4)) manhattan_distance
from station;

-- MySQL, Oracle
select
    (round(max(lat_n) - min(lat_n), 4) + round(max(long_w) - min(long_w), 4)) manhattan_distance
from station;
