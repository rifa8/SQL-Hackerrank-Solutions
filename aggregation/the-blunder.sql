-- DB2, Oracle
select
    cast(ceil(avg(cast(salary as decimal)) - avg(cast(replace(salary, '0', '') as decimal))) as integer) diff
from employees;

-- DB2, MS SQL Server
select
    cast(ceiling(avg(cast(salary as decimal)) - avg(cast(replace(salary, '0', '') as decimal))) as integer) diff
from employees;

-- MySQL, Oracle
select
    ceil(avg(salary) - avg(replace(salary, '0', ''))) diff
from employees;

-- MySQL
select
    cast(ceiling(avg(cast(salary as decimal)) - avg(cast(replace(salary, '0', '') as decimal))) as unsigned) diff
from employees;
