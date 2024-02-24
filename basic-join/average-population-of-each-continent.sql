-- MySQL, Oracle, MS SQL Server
select
    continent,
    floor(avg(ci.population)) avg_population
from city ci
join country co
    on ci.countrycode = co.code
group by continent;
