-- DB2, MySQL, Oracle, MS SQL Server
select
    (max(population) - min(population)) diff_population
from city;
