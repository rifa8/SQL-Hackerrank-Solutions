-- MySQL, Oracle, MS SQL Server
select
    ci.name
from city ci
join country co
    on ci.countrycode = co.code
where continent = 'Africa';
