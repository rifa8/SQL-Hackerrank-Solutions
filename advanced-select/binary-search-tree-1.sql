-- DB2, MySQL, Oracle, MS SQL Server
select
    n,
    case
        when p is null then 'Root'
        when n in (select p from bst) then 'Inner'
        else 'Leaf'
    end typ
from bst
order by 1;
