-- DB2, MySQL, Oracle
select
    distinct city
from station
where upper(substr(city, length(city), 1)) not in ('A', 'E', 'I', 'O', 'U')
    or lower(substr(city, length(city), 1)) not in ('a', 'e', 'i', 'o', 'u');

-- MySQL, MS SQL Server
select
    distinct city
from station
where right(city, 1) not in ('a', 'e', 'i', 'o', 'u');
