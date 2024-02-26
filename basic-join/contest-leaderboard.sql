-- DB2, Oracle, MS SQL Server
with max_scr as (
    select
        hacker_id,
        challenge_id,
        max(score) mxs
    from submissions
    group by
        hacker_id,
        challenge_id
),
sum_scr as (
    select
        hacker_id,
        sum(mxs) tot_scr
    from max_scr
    group by
        hacker_id
)
select
    ss.hacker_id,
    name,
    tot_scr
from sum_scr ss
join hackers h
    on ss.hacker_id = h.hacker_id
where tot_scr > 0
order by
    tot_scr desc,
    ss.hacker_id;

-- DB2, MySQL, Oracle, MS SQL Server
select
    sum_scr.hacker_id,
    name,
    tot_scr
from (
    select
        hacker_id,
        sum(mxs) tot_scr
    from (
        select
            hacker_id,
            challenge_id,
            max(score) mxs
        from submissions
        group by
            hacker_id,
            challenge_id
    ) max_scr
    group by
        hacker_id
) sum_scr
join hackers h
    on sum_scr.hacker_id = h.hacker_id
where tot_scr > 0
order by
    tot_scr desc,
    sum_scr.hacker_id;
