-- DB2, MySQL, Oracle
select
    name
from students
where marks > 75
order by
    substr(name, length(name) - 2, 3),
    id;

-- MySQL, MS SQL Server
select
    name
from students
where marks > 75
order by
    right(name, 3),
    id;
