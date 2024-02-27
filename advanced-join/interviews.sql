-- DB2, Oracle, MS SQL Server
with sum_view as (
    select
        challenge_id,
        sum(total_views) tv,
        sum(total_unique_views) tuv
    from view_stats
    group by challenge_id
),
sum_sub as (
    select
        challenge_id,
        sum(total_submissions) ts,
        sum(total_accepted_submissions) tas
    from submission_stats
    group by challenge_id
)
select
    con.contest_id,
    hacker_id,
    name,
    sum(ts) ts,
    sum(tas) tas,
    sum(tv) tv,
    sum(tuv) tuv
from contests con
join colleges col
    on con.contest_id = col.contest_id
join challenges ch
    on col.college_id = ch.college_id
left join sum_view sv
    on ch.challenge_id = sv.challenge_id
left join sum_sub ss
    on ch.challenge_id = ss.challenge_id
group by
    con.contest_id,
    hacker_id,
    name
having sum(ts) + sum(tas)+ sum(tv)+ sum(tuv) != 0
order by con.contest_id;

-- MySQL
select
    contest_id,
    hacker_id,
    name,
    sum(ts) ts,
    sum(tas) tas,
    sum(tv) tv,
    sum(tuv) tuv
from contests
join colleges
    using(contest_id)
join challenges
    using(college_id)
left join (
    select
        challenge_id,
        sum(total_submissions) as ts,
        sum(total_accepted_submissions) as tas
    from submission_stats
    group by 1
) as sum_sub
    using(challenge_id)
left join (
    select
        challenge_id,
        sum(total_views) as tv,
        sum(total_unique_views) as tuv
    from view_stats
    group by 1
) as sum_views
    using(challenge_id)
group by 1, 2, 3
having sum(ts) + sum(tas)+ sum(tv)+ sum(tuv) != 0
order by 1;
