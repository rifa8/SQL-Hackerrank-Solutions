-- DB2, Oracle
with cte as (
    select
        submission_date,
        s.hacker_id,
        name,
        count(*) cnt, 
        case 
            when (submission_date - (select min(submission_date) from submissions)) = row_number() over(partition by s.hacker_id order by submission_date) - 1 then 1
            else 0
        end isstreak,
        row_number() over(partition by submission_date order by submission_date, count(*) desc, s.hacker_id) r
    from submissions s
    left join hackers h
        on s.hacker_id = h.hacker_id
    group by 
        submission_date, 
        s.hacker_id,
        name
    order by 
        submission_date,
        cnt desc,
        s.hacker_id
)
select
    submission_date, 
    sum(case when isstreak = 1 then 1 else 0 end), 
    min(case when r = 1 then hacker_id end), 
    min(case when r = 1 then name end)
from cte
group by 
    submission_date
order by 
    submission_date;

-- MySQL
select
    submission_date,
    (select
        count(distinct hacker_id)
     from submissions s2
     where s2.submission_date = s1.submission_date
        and (select
                count(distinct s3.submission_date)
             from submissions s3
             where s3.hacker_id = s2.hacker_id
                and s3.submission_date < s1.submission_date
        ) = datediff(s1.submission_date, (select min(submission_date) from submissions))
    ) hackers,
    (select
        hacker_id
     from submissions s2
     where s2.submission_date = s1.submission_date
     group by hacker_id
     order by
        count(submission_id) desc,
        hacker_id
     limit 1
    ) h_id,
    (select
        name
     from hackers
     where hacker_id = h_id
    ) name
from (
    select
        distinct submission_date
    from submissions
) s1;

-- MS SQL Server
with cte as (
    select
        submission_date,
        s.hacker_id,
        name,
        count(*) cnt, 
        case 
            when datediff(day, (select min(submission_date) from submissions), submission_date) = row_number() over(partition by s.hacker_id order by submission_date) - 1 then 1
            else 0
        end isstreak,
        row_number() over(partition by submission_date order by submission_date, count(*) desc, s.hacker_id) r
    from submissions s
    left join hackers h
        on s.hacker_id = h.hacker_id
    group by 
        submission_date, 
        s.hacker_id,
        name
)
select
    submission_date, 
    sum(case when isstreak = 1 then 1 else 0 end) as streak_count, 
    min(case when r = 1 then hacker_id end) as first_hacker_id, 
    min(case when r = 1 then name end) as first_hacker_name
from cte
group by 
    submission_date
order by 
    submission_date;
