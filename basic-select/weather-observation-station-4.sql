-- DB2, MySQL, Oracle, MS SQL Server

select
    count(city) - count(distinct city) diff
from station;
