-- DB2, MySQL, Oracle, MS SQL Server
with cnt_chall as (
    select
        hacker_id,
        count(*) chall,
        max(count(*)) over() max_chall
    from challenges
    group by hacker_id
),
cnt_cnt_chall as (
    select
        chall,
        count(*) cnt
    from cnt_chall
    group by chall
)
select
    h.hacker_id,
    name,
    cc.chall
from hackers h
join cnt_chall cc
    on h.hacker_id = cc.hacker_id
join cnt_cnt_chall ccc
    on cc.chall = ccc.chall
where cc.chall = max_chall
    or cnt = 1
order by
    cc.chall desc,
    h.hacker_id;
