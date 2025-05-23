/**********************************/
-- SELECT 문
/**********************************/

-- ---------------------------------
-- WHERE 절
-- ---------------------------------

-- 부서아이디가 10인 사원 이름과 부서번호를 구하세요

select  first_name,
		department_id
from employees
where department_id = 30   -- •=, != <> ,>, <, >=, <= 연산자 사용

--  월급이 15000 이상인 사원들의 이름과 월급을 출력하세요

select first_name,
	   salary 
from employees
where salary >= 15000;

-- 07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요

select first_name,
       hire_date
from employees
where hire_date >= '07/01/01';

-- 이름이 Lex인 직원의 이름과 월급을 출력하세요 

select first_name,
	   salary	   
from employees
where first_name  = 'Lex';

-- 비교
select first_name,
	   salary	   
from employees
where first_name  = 'lex';	-- 대소문자 구분안함

-- 문자열 대소문자를 구별하지 않는다. 구별하려면 binary 사용
-- 비교
select first_name,
	   salary	   
from employees
where binary  first_name  = 'lex';	-- 대소문자 구분함

-- 월급이 14000이상 17000이하인 사원의 이름과 월급을 구하시오
-- salary >=14000 월급이 14000이상
-- salary <=17000 월급이 17000이하
-- 두 조건이 전부만족해야함 && --> AND , || or
select first_name,
	   salary
from employees
where salary >=14000
and salary <=17000;

 -- 월급이 14000 이하이거나 17000 이상인 사원의 이름과 월급을 출력하세요
 
 select first_name,
	   salary
from employees
where salary <=14000
or salary >17000;

-- 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요

select first_name,
	   hire_date
from employees
where hire_date >= '04-01-01'
and  hire_date  <= '05-12-31'; 

    
-- BETWEEN 연산자로 특정구간 값 출력하기
-- 월급이 14000 이상 17000이하인 사원의 이름과 월급을 구하시오

select first_name,
	   salary
from employees
where salary >=14000 and salary <=17000;

select first_name,
	   salary
from employees
where salary between 14000 and  17000;  

-- Neena, Lex, John 의 이름, 성, 월급의 구하시오

select wherefirst_name,
	   last_name,
       salary
from employees;
where first_name  = 'Neena'
or first_name = 'lex'
or first_name = 'john';

select wherefirst_name,
	   last_name,
       salary
from employees;
where first_name in ('Neena', 'Lex', 'John');

-- 월급이 2100, 3100, 4100, 5100 인 사원의 이름과 월급을 구하시오

select  first_name,
		last_name,
        salary
from employees;       
where salary in(2100, 3100, 4100, 5100);


-- Like 연산자로 비슷한것들 모두 찾기

-- 이름이 L(대소문자 구분x)로 시작하는 직원의 이름, 성, 월급을 출력하세요

select first_name,
	   last_name,
       salary
from employees
where first_name like 'l%' -- %l,l%,%l%,_l,_l

-- 이름에 am 을 포함한 사원의 이름과 월급을 출력하세요

select first_name,
	   salary
from employees
where first_name like '%am%';

-- 이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요

select first_name,
	   salary
from employees
where first_name like '_a%';

-- 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요

select first_name  
from employees
where first_name like '___a%';

-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요

select first_name	  
from employees
where first_name like '__a_';


-- null
-- 아무런 값도 정해지지 않았음을 의미 (0이 아님)
-- •어떠한 데이터타입에도 사용가능

-- 부서가 없는 사람의 이름 부서이름 출력
-- is null

select first_name,
	   department_id
from employees
where department_id is null;

-- 부서가 있는 사람의 이름 부서이름 출력
-- is not null

select first_name,
	   department_id
from employees
where department_id is not null;
/*
select first_name,
	   salary,
      commission_pct;
      salary*commission_pct,
      salary*commission_pct+200
from employees
*/
-- 커미션비율이 있는 사원의 이름과 월급 커미션비율을 출력하세요
select first_name,
	   salary,
       commission_pct
from employees
where commission_pct is not null
;
-- 담당매니저가 없고 커미션비율이 없는 직원의 이름과 매니저아이디 커미션 비율을 출력하세요
-- 담당매니저가 없고  manager_id is not null
-- 니저아이디 커미션 비율 commission_pct is null
-- 조검 동시에 만족 and

select first_name,
	   manager_id,
       commission_pct
from employees
where manager_id is  null
and commission_pct is null
;

-- 부서가 없는 직원의 이름과 월급을 출력하세요

select first_name,
	   department_id,
       salary
from employees
where department_id is null
;

-- 월급이 6000 이상 10000이하인 직원중 커미션비율이 없는 직원의
-- 이름 월급 커미션 비율 출력

select first_name,
	   salary,
       commission_pct
from employees
where salary >= 6000
and salary <=10000
and commission_pct is null
;

-- ---------------------------------
-- ORDER BY 절(정렬)
-- ---------------------------------

-- 직원의 이름 월급을 월급이 많은 직원 순으로 정렬(큰 --> 작은 : 내림차순)
-- 오름차순 asc(a-->z)  내림차순 desc(z-->a)

select first_name, 
	   salary
from employees
order by salary desc

;
 -- 월급이 9000이상인 직원의 이름과 월급을 월급이 많은 직원부터 출력하세요

 
 select first_name,
		salary 
 from employees
 where salary >=9000
 order by salary asc
 ;
-- 부서번호를 오름차순으로 정렬하고 부서번호, 월급, 이름을 출력하세요

select department_id,
	   salary,
       first_name
from employees
order by department_id asc
;
-- 월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요

select first_name,
	    salary
from employees
where salary >=10000
order by salary desc
;

-- 직원의 이름, 급여, 입사일을 이름의 알파벳 올림차순으로 출력하세요

select first_name,
	   salary,
       hire_date
from employees
order by first_name asc
;
-- 직원의 이름, 급여, 입사일을 입사일이 빠른 사람 부터 출력하세요

select first_name,
	   salary,
       hire_date
from employees
order by hire_date asc
;
 -- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 
 -- 월급이 높은 사람부터 부서번호 월급 이름을 출력하세요 
 
 select department_id,
		salary,
		first_name
 from employees
 order by department_id asc , salary desc 
 ;
