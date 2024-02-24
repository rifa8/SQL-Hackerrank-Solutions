-- DB2, MySQL, Oracle, MS SQL Server
with cte as (
    select
        lat_n,
        row_number() over (order by lat_n) r,
        count(*) over () total_rows
    from station
)
select
    cast(round(avg(lat_n), 4) as decimal(20, 4)) median
from cte
where r in ((total_rows + 1) / 2, (total_rows + 2) / 2);

-- MySQL, Oracle
with cte as (
    select
        lat_n,
        row_number() over (order by lat_n) r,
        count(*) over () total_rows
    from station
)
select
    round(avg(lat_n), 4) median
from cte
where r in ((total_rows) / 2, (total_rows + 1) / 2, (total_rows + 2) / 2);
