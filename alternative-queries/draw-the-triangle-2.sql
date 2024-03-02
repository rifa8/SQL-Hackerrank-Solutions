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
SET SERVEROUTPUT ON;
BEGIN
    FOR I IN 1..20 LOOP
        FOR J IN 1..I LOOP
            DBMS_OUTPUT.PUT('* ');
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;
/

-- MS SQL Server
DECLARE @r INT = 1;
WHILE @r <= 20
BEGIN
    PRINT REPLICATE('* ', @r);
    SET @r = @r + 1;
END;
