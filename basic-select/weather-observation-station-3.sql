-- DB2, Oracle, MySQL

select
    distinct city
from station
where mod(id, 2) = 0;


-- MySQL, MS SQL Server

select
    distinct city
from station
where id % 2 = 0;
