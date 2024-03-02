-- DB2
with cte(num) as (
    select 2
    from sysibm.sysdummy1
    union all
    select num + 1
    from cte where num < 1000
)
select
    listagg(a.num, '&')
from cte a
where not exists (
    select 1
    from cte b
    where
        a.num > b.num
        and mod(a.num, b.num) = 0
);

-- MySQL
with recursive cte as (
    select 2 as nums
    union all
    select nums + 1
    from cte
    where nums < 1000
)
select
    group_concat(nums separator '&')
from cte
where nums not in (
    select
        distinct a.nums
    from cte a
    join cte b
        on b.nums != a.nums 
        and a.nums % b.nums = 0
);

-- Oracle
set serveroutput on;
declare
    num int := 2;
    sep varchar(1) := '&';
    primes varchar(32767) := '';
    isprime int;
    divisor int;
begin
    while num < 1000 loop
        isprime := 1;
        divisor := 2;
        
        while divisor <= sqrt(num) loop
            if mod(num, divisor) = 0 then
                isprime := 0;
                exit;
            end if;

            divisor := divisor + 1;
        end loop;

        if isprime = 1 then
            primes := primes || to_char(num) || sep;
        end if;

        num := num + 1;
    end loop;

    primes := substr(primes, 1, length(primes) - 1);

    dbms_output.put_line(primes);
end;
/

-- MS SQL Server
declare @number int = 2;
declare @separator varchar(1) = '&';
declare @primes varchar(max) = '';

while @number < 1000
begin
    declare @isprime bit = 1;
    declare @divisor int = 2;

    while @divisor <= sqrt(@number)
    begin
        if @number % @divisor = 0
        begin
            set @isprime = 0;
            break;
        end

        set @divisor = @divisor + 1;
    end

    if @isprime = 1
        set @primes = @primes + convert(varchar, @number) + @separator;

    set @number = @number + 1;
end

set @primes = left(@primes, len(@primes) - 1);

print @primes;
