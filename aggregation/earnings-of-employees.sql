-- DB2, MySQL, Oracle, MS SQL Server
select
    max(salary * months) max_earnings,
    count(*) cnt
from employee
where (salary * months) = (
    select max(salary * months) from employee
);
