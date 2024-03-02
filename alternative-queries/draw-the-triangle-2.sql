-- MySQL
with recursive cte as (
    select 1 as stars
    union all
    select stars + 1
    from cte
    where stars < 20
)
select repeat('* ', stars) pattern
from cte;

-- Oracle
set serveroutput on;
begin
    for i in 1..20 loop
        for j in 1..i loop
            dbms_output.put('* ');
        end loop;
        dbms_output.put_line('');
    end loop;
end;
/

-- MS SQL Server
declare @r int = 1;
while @r <= 20
begin
    print replicate('* ', @r);
    set @r = @r + 1;
end;
