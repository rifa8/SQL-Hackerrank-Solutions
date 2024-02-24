-- MySQL, Oracle, MS SQL Server
select
    sum(ci.population) populations
from city ci
join country co
    on ci.countrycode = co.code
where continent = 'Asia';
