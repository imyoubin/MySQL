-- ----------------------------------------------------
-- *혼합 SQL 문제입니다
-- ----------------------------------------------------
/*
문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
(45건)
*/

select 	first_name,
		manager_id,
        commission_pct,
        salary
from employees
where manager_id is not null
and commission_pct is null
and salary >3000
;

/*
문제2. 
각 부서별로 최고의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name), 월급
(salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하
세요
-조건절비교 방법으로 작성하세요
-월급의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)
*/

-- 1) 각 부서별로 최고의 월급을 받는 사원
select max(salary)
from employees e
where department_id=e.department_id
and e.department_id is not null
order by e.salary desc
;

-- 2)사원의 직원번호(employee_id), 이름(first_name), 월급
-- (salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회
select 	employee_id,
		first_name,
        salary ,
        date_format(e.hire_date, '%Y-%m-%d %W') '입사일', 
        concat(	substr( e.phone_number, 1,3),'-',
				substr( e.phone_number, 5,3),'-',
                substr( e.phone_number, 9)), '전화번호',
                e.department_id          
from employees e
where e.salary =(24000)
;

-- 3) 1,2 합치기
select 	e.employee_id,
		e.first_name,
		e.salary,
		date_format(e.hire_date, '%Y-%m-%d %W') AS 입사일,
		concat(	substr(e.phone_number, 1, 3), '-', 
				substr(e.phone_number, 5, 3), '-', 
				substr(e.phone_number, 9)) AS 전화번호,
    e.department_id
from employees e
where e.salary = (select max(salary)
					from employees
					where department_id = e.department_id
                    and e.department_id is not null
					order by e.salary desc
)
;
/*
문제3
매니저별 담당직원들의 평균월급 최소월급 최대월급을 알아보려고 한다.
-통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
-매니저별 평균월급이 5000이상만 출력합니다.
-매니저별 평균월급의 내림차순으로 출력합니다.
-매니저별 평균월급은 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균월급, 매니저별최소월급, 매
니저별최대월급 입니다.
(9건)
*/

select  e.manager_id,
		m.first_name,
		round(avg(e.salary), 0) as a_salary,
		max(e.salary),
		min(e.salary)
from employees e
inner join employees m
on e.manager_id = m.employee_id
where e.hire_date >= '2005-01-01'
group by e.manager_id, m.first_name
having round(avg(e.salary), 0) >= 5000
order by a_salary desc
;
/*
문제4.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 
부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)은 표시 합니다.
매니저가 없는 직원(Steven) 은 출력하지 않습니다.
(106명)
*/

select  e.employee_id,
		e.first_name,
		d.department_name,
		m.first_name
from employees e
left join departments d
    on e.department_id = d.department_id
inner join employees m
    on e.manager_id = m.employee_id
order by e.employee_id;
/*
문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의
사번, 이름, 부서명, 월급, 입사일을 입사일 순서로 출력하세요
*/

select 	e.employee_id,
		e.first_name,
        d.department_name,
        e.salary,
        e.hire_date
from employees e
left join departments d
on e.department_id=d.department_id
where e.hire_date >='2005-01-01'
limit 10 offset 10
;
/*
문제6.
가장 늦게 입사한 직원의 이름(first_name last_name)과 월급(salary)과 근무하는 부서 이름
(department_name)은?
*/

select 	e.first_name,
		e.last_name,
        e.salary,
        d.department_name
from employees e
left join departments d
on d.department_id=d.department_id
order by e.hire_date desc
limit 1
;
/*
문제7.
평균월급(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(firt_name), 성
(last_name)과 업무(job_title), 월급(salary)을 조회하시오.
*/


/*
문제8.
평균 월급(salary)이 가장 높은 부서명과 월급은? (limt사용하지 말고 그룹함수 사용할 것)
*/


/*
문제9.
평균 월급(salary)이 가장 높은 지역과 평균월급은?( limt사용하지 말고 그룹함수 사용할 것)
*/


/*
문제10.
평균 월급(salary)이 가장 높은 업무와 평균월급은? (limt사용하지 말고 그룹함수 사용할 것)
*/






