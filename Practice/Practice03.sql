/*
문제1.
직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서명(department_name)을
조회하여 부서이름(department_name) 오름차순, 사번(employee_id) 내림차순 으로 정렬하세
요.
(106건)
*/

select 	e.employee_id,
		e.first_name,
        e.last_name,
		d.department_name,
        e.employee_id
from employees e, departments d
order by d.department_name asc, e.employee_id desc
;
/*
문제2.
employees 테이블의 job_id는 현재의 업무아이디를 가지고 있습니다.
직원들의 사번(employee_id), 이름(firt_name), 월급(salary), 부서명(department_name), 
현재업무(job_title)를 사번(employee_id) 오름차순 으로 정렬하세요.
부서가 없는 Kimberely(사번 178)은 표시하지 않습니다.
(106건)
*/

select  e.employee_id,
		e.first_name,
		e.salary,
		d.department_name,
		j.job_title
from employees e
join departments d
    on e.department_id = d.department_id
join jobs j
    on e.job_id = j.job_id
order by  e.employee_id asc;
; 
/*
문제2-1.
문제2에서 부서가 없는 Kimberely(사번 178)까지 표시해 보세요
(107건)
*/

select 	e.employee_id,
		e.first_name,
		e.salary,
		d.department_name,
		j.job_title
from employees e
left join departments d
    on e.department_id = d.department_id
join jobs j
    on e.job_id = j.job_id
order by e.employee_id asc;
/*
문제3.
도시별로 위치한 부서들을 파악하려고 합니다.
도시아이디, 도시명, 부서명, 부서아이디를 도시아이디(오름차순)로 정렬하여 출력하세요
부서가 없는 도시는 표시하지 않습니다.
(27건)     
*/

select 	l.location_id,
		l.city,
        d.department_name,
        d.department_id
from locations l,departments d
order by l.location_id asc
;
 