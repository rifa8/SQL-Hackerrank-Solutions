-- DB2, MySQL, Oracle, MS SQL Server

select
    *
from city
where countrycode = 'USA'
    and population > 100000;
