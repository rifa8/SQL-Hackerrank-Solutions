-- DB2, MySQL, Oracle, MS SQL Server
with cte as (
    select
        case when occupation = 'Doctor' then name end doctor,
        case when occupation = 'Professor' then name end professor,
        case when occupation = 'Singer' then name end singer,
        case when occupation = 'Actor' then name end actor,
        row_number() over (partition by occupation order by name) r
    from occupations
)
select
    coalesce(min(doctor), 'NULL') doctor,
    coalesce(min(professor), 'NULL') professor,
    coalesce(min(singer), 'NULL') singer,
    coalesce(min(actor), 'NULL') actor
from cte
group by r
order by r;

-- MySQL
with cte as (
    select
        if(occupation = 'Doctor', name, null) doctor,
        if(occupation = 'Professor', name, null) professor,
        if(occupation = 'Singer', name, null) singer,
        if(occupation = 'Actor', name, null) actor,
        row_number() over (partition by occupation order by name) r
    from occupations
)
select
    min(doctor) doctor,
    min(professor) professor,
    min(singer) singer,
    min(actor) actor
from cte
group by r
order by r;
