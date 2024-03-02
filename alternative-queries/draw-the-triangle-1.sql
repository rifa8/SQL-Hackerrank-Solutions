-- MySQL
with recursive cte as (
    select 20 as stars
    union all
    select stars - 1
    from cte
    where stars > 1
)
select repeat('* ', stars) pattern
from cte;

-- Oracle
set serveroutput on;
begin
    for i in reverse 1..20 loop
        for j in 1..i loop
            dbms_output.put('* ');
        end loop;
        dbms_output.put_line('');
    end loop;
end;
/

-- MS SQL Server
declare @r int = 20;
while @r > 0
begin
    print replicate('* ', @r);
    set @r = @r - 1;
end;
