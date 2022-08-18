-- Link: https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

select h.hacker_id, h.name, count(*) as total_cnt
from hackers as h inner join challenges as ch on h.hacker_id = ch.hacker_id
group by ch.hacker_id, h.name
having total_cnt = (
    select count(*) as cnt1 from challenges ch1 group by ch1.hacker_id order by cnt1 desc limit 1
  ) or
  total_cnt not in (
    select count(*) from challenges ch2 group by ch2.hacker_id having ch2.hacker_id <> ch.hacker_id
  )
order by total_cnt desc, h.hacker_id;