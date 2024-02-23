-- DB2, MySQL, Oracle, MS SQL Server
select
    c.company_code,
    c.founder,
    count(distinct lm.lead_manager_code) lmc,
    count(distinct sm.senior_manager_code) smc,
    count(distinct m.manager_code) mc,
    count(distinct e.employee_code) ec
from company c
join lead_manager lm
    on c.company_code = lm.company_code
join senior_manager sm
    on c.company_code = sm.company_code
join manager m
    on c.company_code = m.company_code
join employee e
    on c.company_code = e.company_code
group by
    c.company_code,
    c.founder
order by c.company_code;
