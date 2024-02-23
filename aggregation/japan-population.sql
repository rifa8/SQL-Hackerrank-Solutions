-- DB2, MySQL, Oracle, MS SQL Server
select
    sum(population) sum_jpn_population
from city
where countrycode = 'JPN';
