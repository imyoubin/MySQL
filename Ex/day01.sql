use hr_db;
select * from employees;

-- select 문(조회)


-- select문 (select절 +from절)

select * from employees;			 -- 마침표
SELECT * from employees; 		-- 대소문자 구분하지앟음


-- 테이블 전체 초회하기

select *from employees;		--직업
select *from locations;		--도시
select *from regions;		--지역
select *from countiriees;	--나라
select *from job_histosy	-- 업무현황
select *from jobs;			--업무
select *from  departments;	--부서
-- -------------------------------------
-- select(절) 
----------------------------------------
-- 전체
select *from employees;
-- employee_id 절
select employee_id 
from employees;
-- employee_id, first_name ,list 절
select employee_id, first_name ,list 
from employees;

select first_name,  phone_number, hire_date, salary 
from employees;

select  first_name, 
		list_name,
        salary,
        phone_number,
        email,
        hire_date
from employees;
--
-- 직원아이디, 이름, 월급을 출력하세요. 
-- 단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요
select employee_id as empNO,
	   first_name as 'f-name',
	   salary as '월 급'
from employees;
-- 직원의 이름(fisrt_name)과 전화번호, 입사일, 월급 으로 표시되도록 출력하세요
select fisrt_name as 이름,
	   phone_number as 전화번호;
       hire_date as 입사일,
        salary as 월급
from employees;
-- 직원의 직원아이디를 사 번, 이름(first_name), 성(last_name), 월급, 전화번호, 이메일,
-- 입사일로 표시되도록 출력하세요
select employee_id, 
	   first_name,
       last_name,
       salary,
	   phone_number;
       email,
       hire_date
from employees;

-- 산술 연산자 사용하기

select first_name,
	   salary 월급,
	   salary-100 as '월급-식대',
       salary*12 연봉,
       salary*12+5000 보너스포함;
       salary/30 일급;
	   meplayee_id%3 '워크샵 팀'
from employees;

-- 다음을 실행해 보세요
-- 연산시 문자열은 0으로 처리
select job_id*12
from employees;
select first_name, li  

from employees;

select  first_name, last_name,
	concat(first_name,last_name) as  전체이름,    
	concat(first_name, '_', last_name) as '전체 이름'
	concat(fifirst_name,' ',last_name) as '전체 이름'
    concat(first_name, ' ',last_name, ' 전체이름 ', hire_date, ' 입니다.') as 문장
    
from employees;
		