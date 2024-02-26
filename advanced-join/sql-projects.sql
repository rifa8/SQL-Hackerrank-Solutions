-- DB2
with cte as (
    select
        start_date,
        end_date,
        (day(end_date) - row_number() over(order by end_date)) r
    from projects
)
select
    min(start_date) sd,
    max(end_date) ed
from cte
group by r
order by
    ed - sd,
    sd;

-- MySQL, Oracle
with cte as (
    select
        start_date,
        end_date,
        (end_date - row_number() over(order by end_date)) r
    from projects
)
select
    min(start_date) sd,
    max(end_date) ed
from cte
group by r
order by
    ed - sd,
    sd;

-- MS SQL Server
with cte as (
    select
        start_date,
        end_date,
        datediff(day, end_date, row_number() over(order by end_date)) r
    from projects
)
select
    min(start_date) sd,
    max(end_date) ed
from cte
group by r
order by
    datediff(day, min(start_date), max(end_date)),
    min(start_date);
