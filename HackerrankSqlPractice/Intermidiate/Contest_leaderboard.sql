-- Link: https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

-- Working code
select st.hacker_id, h.name, sum(st.mx_score) as t_score 
from (
    select hacker_id, challenge_id, max(score) as mx_score
    from submissions group by 1, 2
) as st join hackers h on st.hacker_id = h.hacker_id
group by 1, 2
having t_score > 0
order by t_score desc, 1;

--  CTE - MS Sql Server
with st (hacker_id, challenge_id, mx_score) as
    (select hacker_id, challenge_id, max(score) as mx_score
    from submissions group by hacker_id, challenge_id
    )
select st.hacker_id, h.name, sum(st.mx_score) as t_score 
from st join hackers h on st.hacker_id = h.hacker_id
group by st.hacker_id, h.name
having sum(st.mx_score) > 0
order by t_score desc, 1;

-- CTE - MySql
with st (hacker_id,  challenge_id, mx_score) as
    (select hacker_id, challenge_id, max(score) as mx_score
     from submissions
     group by hacker_id, challenge_id
    )
select st.hacker_id, h.name, sum(st.mx_score) as t_score
from st join hackers h on st.hacker_id = h.hacker_id
group by st.hacker_id, h.name
having sum(st.mx_score) > 0
order by t_score desc, 1;