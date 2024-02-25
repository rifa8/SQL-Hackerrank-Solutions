-- DB2, MySQL, Oracle, MS SQL Server
select
    case
        when grade < 8 then 'NULL'
        else name
    end name,
    grade,
    marks
from students
join grades
    on marks between min_mark and max_mark
order by
    grade desc,
    name,
    marks;

-- MySQL, Oracle, MS SQL Server
select
    case
        when grade < 8 then null
        else name
    end name,
    grade,
    marks
from students
join grades
    on marks between min_mark and max_mark
order by
    grade desc,
    name,
    marks;

-- MySQL
select
    if(grade < 8, null, name) name,
    grade,
    marks
from students
join grades
where marks between min_mark and max_mark
order by
    grade desc,
    if(name is null, marks, name);
