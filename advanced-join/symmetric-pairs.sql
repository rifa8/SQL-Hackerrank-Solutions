-- DB2, MySQL, Oracle, MS SQL Server
with func as (
    select
        x,
        y,
        row_number() over(order by x) r
    from functions
)
select
    f1.x,
    f1.y
from func f1
join func f2
    on f1.x = f2.y
    and f1.y = f2.x
    and f1.r != f2.r
where f1.x <= f1.y
group by
    f1.x,
    f1.y
order by f1.x;
