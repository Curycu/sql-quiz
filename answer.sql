-- Q1) hint: select, where
-- 2017년 2월 이후 가입 고객의 id, status, signup을 표시해주세요
select 
  id, `status`, signup 
from ba.interview_user 
where signup >= '2017-02-01 00:00:00'
;
 
-- Q2) hint: group by, count, distinct
-- 월별 도서구매고객수를 표시해주세요
select 
  year(pay_date), 
  month(pay_date), 
  count(distinct user_id) as user_count 
from ba.interview_payment 
where pay_for = 'book' 
group by 
  year(pay_date), 
  month(pay_date)
;
 
-- Q3) hint: left join, sum, if
-- 모든 고객의 id, 누적리디캐시충전액, 누적기기구매액을 표시해주세요
select 
  u.id, 
  sum(if(p.pay_for = 'ridicash', p.price, 0)) as ridicash, 
  sum(if(p.pay_for = 'device', p.price, 0)) as device 
from ba.interview_user u
left join ba.interview_payment p on u.id = p.user_id 
group by u.id
;
 
-- Q4) hint: having, case when
-- 고객 status가 'active'이며 2017년 3월 이전 가입하였고 누적도서구매액이 1000원 이상인 경우 grade 'A' 그 외 고객은 grade 'B'
-- 모든 고객에 대해 `user_id`, `signup`, `status`, `cummulative_book_price`, `grade` 컬럼을 표시해주세요
select 
  u.id as `user_id`,
  u.signup,
  u.`status`,
  p.price as `cummulative_book_price`,
  (case 
    when u.status = 'active' and u.signup < '2017-03-01 00:00:00' and p.price >= 1000 then 'A' 
    else 'B' end) as `grade`
from ba.interview_user u
left join (
  select 
    user_id, 
    sum(price) as price 
  from ba.interview_payment 
  where pay_for = 'book'
  group by user_id) p on u.id = p.user_id
;
 
-- Q5) hint: multi-key join, range join
-- Q4에서 테스트 데이터를 제거해주세요 (tester : from ~ to 기간 동안 테스트 아이디였다는 뜻입니다)
select 
  u.id as `user_id`,
  u.signup,
  u.`status`,
  p.price as `cummulative_book_price`,
  (case 
    when u.status = 'active' and u.signup < '2017-03-01 00:00:00' and p.price >= 1000 then 'A' 
    else 'B' end) as `grade`
from ba.interview_user u
left join (
  select 
    p.user_id, 
    sum(p.price) as price 
  from ba.interview_payment p
  left join ba.interview_tester t on p.user_id = t.user_id and p.pay_date between t.`from` and t.`to`
  where t.user_id is null
  and p.pay_for = 'book'
  group by p.user_id) p on u.id = p.user_id
;
