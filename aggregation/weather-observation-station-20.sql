-- DB2

-- MySQL
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
where
    case
        when total_rows % 2 = 0 then r in (
            ceil(total_rows / 2),
            ceil(total_rows / 2) + 1
        )
        else r in (ceil(total_rows / 2))
    end;
