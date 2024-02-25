-- DB2, MySQL, Oracle, MS SQL Server
select
    s.hacker_id,
    name
from submissions s
join challenges c
    on s.challenge_id = c.challenge_id
join difficulty d
    on c.difficulty_level = d.difficulty_level 
join hackers h
    on s.hacker_id = h.hacker_id
where s.score = d.score 
group by
    s.hacker_id,
    name
having count(s.hacker_id) > 1
order by
    count(s.hacker_id) desc,
    s.hacker_id;
