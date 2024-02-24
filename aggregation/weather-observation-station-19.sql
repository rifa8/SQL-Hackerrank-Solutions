-- DB2, MySQL, Oracle, MS SQL Server
select
    cast(round(power(power(max(lat_n) - min(lat_n), 2) + power(max(long_w) - min(long_w), 2), 0.5), 4) as decimal(20, 4)) euclidean_distance
from station;

-- MySQL
select
    round(pow(pow(max(lat_n) - min(lat_n), 2) + pow(max(long_w) - min(long_w), 2), 0.5), 4) euclidean_distance
from station;

-- MySQL, Oracle
select
    round(power(power(max(lat_n) - min(lat_n), 2) + power(max(long_w) - min(long_w), 2), 0.5), 4) euclidean_distance
from station;
