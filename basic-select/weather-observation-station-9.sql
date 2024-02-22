-- DB2, MySQL, Oracle
select
    distinct city
from station
where upper(substr(city, 1, 1)) not in ('A', 'E', 'I', 'O', 'U')
    or lower(substr(city, 1, 1)) not in ('a', 'e', 'i', 'o', 'u');

-- MySQL, MS SQL Server
select
    distinct city
from station
where left(city, 1) not in ('a', 'e', 'i', 'o', 'u');
