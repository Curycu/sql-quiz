# Q1) select
# 모든 2017년 2월 이후 가입 고객의 id, status, signup을 표시해주세요
select 
  id, status, signup
from ba.interview_user
where signup >= '2017-02-01 00:00:00'
;

# Q2) count, distinct, join
# 월별 도서구매고객수를 표시해주세요
select
  substring(p.pay_date, 1, 7) as `pay_month`, 
  count(distinct ub.user_id) as `user_count`
from ba.interview_user_book ub
join ba.interview_payment p on ub.payment_id = p.id
group by
  substring(p.pay_date, 1, 7)
;

# Q3) group by, if, sum, left join
# 모든 고객별 id, 누적리디캐시충전액, 누적기기구매액을 표시해주세요
select
  u.id as `user_id`,
  sum(if(p.pay_for = 'ridicash', p.price, 0)) as `ridicash_price`,
  sum(if(p.pay_for = 'device', p.price, 0)) as `device_price`
from ba.interview_user u
left join ba.interview_payment p on u.id = p.user_id
group by
  u.id
;

# Q4) where, group by, having, if, left join
# 고객 status가 'active'이며 2017년 3월 이전 가입한 고객으로 한정하여 
# 누적도서구매액이 1000원 이상인 경우 grade 'A' 그 외 고객은 grade 'B' 로 
# 모든 고객에 대해 `user_id`, `signup`, `grade` 컬럼을 표시해주세요
select
  u.id as `user_id`,
  u.signup,
  if(g.grade = 'A', 'A', 'B') as `grade`
from ba.interview_user u
left join (
  select 
    ub.user_id, 
    if(count(*) >= 2, 'A', 'B') as `grade`
  from ba.interview_user_book ub
  join ba.interview_user u on ub.user_id = u.id 
    and u.status = 'active' 
    and substring(u.signup, 1, 7) < '2017-03'
  group by ub.user_id
  having sum(ub.price) >= 1000) g on u.id = g.user_id
;

# Q5) multikey left join, sub query
# Q4에서 테스트 데이터를 제거해주세요
select
  u.id as `user_id`,
  u.signup,
  if(g.grade = 'A', 'A', 'B') as `grade`
from ba.interview_user u
left join (
  select 
    ub.user_id, 
    if(count(*) >= 2, 'A', 'B') as `grade`
  from ba.interview_user_book ub
  join ba.interview_user u on ub.user_id = u.id 
    and u.status = 'active' 
    and substring(u.signup, 1, 7) < '2017-03'
  where ub.payment_id not in (
    select distinct p.id 
    from ba.interview_payment p
    join ba.interview_tester t on p.user_id = t.user_id and p.pay_date between t.`from` and t.`to`)
  group by ub.user_id
  having sum(ub.price) >= 1000) g on u.id = g.user_id
;
