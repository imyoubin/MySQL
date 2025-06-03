use hr_db;

-- 복습(select문은 select, from, where, order by 4개의 절로 구성된다)
-- 월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요
-- select 문의 기본구조(4개의 절)
-- *작동순서를 잘 알아야 한다
-- 정상작동
select 	first_name fname,
		salary s
from employees
where salary >= 10000    
order by salary desc
;

-- where절 X, order by절 O  -->작동순서를 알아야한다
select 	first_name fname,
		salary s
from employees
where s >= 10000    
order by s desc
;

/***************************************
* 단일행 함수
****************************************/
-- *단일행함수 > 숫자함수

-- *round() : 반올림
select	round(123.123, 2),     -- 123.123 소수점 2자리까지 표현    
		round(123.126, 2),     -- 소수점 3자리에서 반올림  
        round(234.567, 0),     -- 235
        round(123.456, 0),     -- 123
        round(123.124, -1),    -- 120   
        round(125.126, -1),    -- 130    
        round(125.126, -2)     -- 100
from dual;

-- *ceil() : 올림    0번째자리까지표현(소수점1자리에서 버림)
select	ceil(123.456),  	-- 124
		ceil(123.789),   	-- 124
        ceil(123.7892313), 	-- 124
        ceil(987.1234)     	-- 988
from dual;

-- *floor() : 내림    0번째자리까지표현(소수점1자리에서 버림)
select 	floor(123.456),		-- 123
		floor(123.789),		-- 123
        floor(123.7892313),	-- 123
        floor(987.1234)		-- 987
from dual;

-- *truncate(): 자리수 버림
select 	truncate(1234.34567, 2),  	-- 1234.34
		truncate(1234.34567, 3),  	-- 1234.345
        truncate(1234.34567, 0),	-- 1234
        truncate(1234.34567, -2)	-- 1200 
from dual;

-- *power(숫자, n),  pow(숫자, n): 숫자의 n승   
select 	power(12, 2),  	-- 12*12 -->144
		pow(12, 2)   	-- 12*12 -->144	
from dual;

-- *sqrt(숫자): 숫자의 제곱근  
select sqrt(144)		-- 144 --> 12*12 
from dual;

-- *sign(숫자): 숫자가 음수이면 -1, 0이면 0, 양수이면 1  
select 	sign(123),	-- 	1(양수)
		sign(0),	-- 	0
        sign(-123) 	-- -1(음수)
from dual;

-- *abs(숫자): 절대값  
select 	abs(123),	-- 123
		abs(0),		-- 0
        abs(-123)	-- 123
from dual;

-- greatest(x, y, z, ...): 괄호안의 값중 가장 큰값  
select	greatest(2, 0, -2),				-- 2
		greatest(4, 3.2, 5.25),			-- 5.25
        greatest('B', 'A', 'C', 'c'),	-- c
        greatest('ㄱ', 'ㅎ', 'ㅏ', 'ㅣ')-- ㅣ 
from dual;

-- least(x, y, z, ...): 괄호안의 값중 가장 작은값 
select 	least(2, 0, -2),   			-- -2
		least(4, 3.2, 5.25),		-- 3.2
		least('B', 'A', 'C', 'c')	-- A
from dual;

-- ---------------------------------------------------
-- *단일행함수 > 문자함수
-- *concat(str1, str2, ..., strn): str1, str2, ..., strn을 연결  
select concat('안녕', '하세요')
from dual;

select concat('안녕', '-', '하세요')
from dual;

select concat(first_name, last_name)
from employees;

-- concat_ws(s, str1, str2, ..., strn): str1, str2, ..., 
-- strN을 연결할때 사이에 s 로 연결
select concat_ws('-','abc','123','가나다')  -- abc-123-가나다
from dual;

select 	first_name, last_name,
		concat(first_name, last_name),
        concat(first_name,'-',last_name,'-', employee_id),
        concat_ws('-', first_name, last_name, employee_id)
from employees;

-- lcase(str) 또는 lower(str): str의 모든 대문자를 소문자로 변환
select 	first_name,
		lcase(first_name),
		lower(first_name),
        lower('ABCabc!#$%'),
        lower('가나다')
from employees;

-- ucase(str) 또는 upper(str): str의 모든 소문자를 대문자로 변환
select 	first_name,
		ucase(first_name),
		upper(first_name),
        upper('ABCabc!#$%'),
        upper('가나다')
from employees;

-- 문자갯수
-- length(str): str의 길이를 바이트로 반환
-- char_length(str) 또는 character_length(str): str의 문자열 길이를 반환
select	first_name,
		length(first_name),				-- 바이트수(조심)
        char_length(first_name),		-- 글자수
        character_length(first_name)	-- 글자수
from employees;

select 	length('a'),
		char_length('a'),
        character_length('a')
from dual;

select 	length('가'),
		char_length('가'),
        character_length('가')
from dual;

-- substring(str, pos, len) 또는 substr(str, pos, len): 
-- str의 pos 위치에서 시작하여 len 길이의 문자열 반환
select 	first_name,
		substr(first_name, 1, 3),    	-- 1번째, *3글자(오른쪽방향)
        substr(first_name, 2, 3),     	-- 1번째, *3글자(오른쪽방향)
        substr(first_name, -3, 2)     	-- 끝에서3번째, *3글자(오른쪽방향)
from employees;

select	substr('901112-2234567', 8, 1),		-- 성별  
		substr('901112-1234567', -7, 1),	-- 성별  
        substr('94166056', 1,2)				-- 입학년도
from dual;

-- lpad(str, len, padstr), rpad(str, len, padstr)
select 	first_name,
		lpad(first_name, 10, '*'),
		rpad(first_name, 10, '*')
from employees;

 -- TRIM(str) --> 문장의 중간의 공백은 적용되지않는다
 -- |________안녕하세요________|
 select concat('|', '        안녕하세요        ', '|'),
		concat('|', trim('        안녕하세요        '), '|'),
        concat('|', ltrim('        안녕하세요        '), '|'),
        concat('|', rtrim('        안녕하세요        '), '|'),
        concat('|', '        안녕하세요        ', '|'),
        trim(concat('|', '        안녕하세요        ', '|'))
 from dual;
 
 -- replace[(str, from_str, to_str): str에서 from_str을 to_str로 변경
 select	first_name,
		replace(first_name, 'a', '*')
 from employees;
 
 select	first_name,
		substr(first_name, 2, 3),
        replace(first_name, substr(first_name, 2, 3), '***' )  -- 이벤트당첨자
 from employees;
 

/* 
Steven     tev    ??? Steven  tev ***   -->St***en
Neena      een    ??? Neena   een ***   -->N***a
Lex        ex     ??? ex      ex  ***   -->L**
S***en
N***a
L***
A***ander
B***e
D***d
V***i
*/

-- *단일행함수 > 날짜함수
-- 날짜
select current_date() from dual;
select curdate() from dual;

-- 시간
select current_time() from dual;
select curtime() from dual;

-- 날짜+시간
select current_timestamp() from dual;
select now() from dual;

-- *날짜,시간 더하기 빼기
select	'2021-06-20 00:00:00',
		adddate('2021-06-20 00:00:00', interval 1 year),	-- +1년     
        adddate('2021-06-20 00:00:00', interval 1 month),   -- +1달
        adddate('2021-06-20 00:00:00', interval 1 week),   	-- +1주
        adddate('2021-06-20 00:00:00', interval 1 day),   	-- +1일
        adddate('2021-06-20 00:00:00', interval 1 hour),   	-- +1시간
        adddate('2021-06-20 00:00:00', interval 1 minute), 	-- +1분
        adddate('2021-06-20 00:00:00', interval 1 second) 	-- +1초
from dual;

select	'2021-06-20 00:00:00',
		subdate('2021-06-20 00:00:00', interval 1 year),	-- -1년     
        subdate('2021-06-20 00:00:00', interval 1 month),   -- -1달
        subdate('2021-06-20 00:00:00', interval 1 week),   	-- -1주
        subdate('2021-06-20 00:00:00', interval 1 day),   	-- -1일
        subdate('2021-06-20 00:00:00', interval 1 hour),   	-- -1시간
        subdate('2021-06-20 00:00:00', interval 1 minute), 	-- -1분
        subdate('2021-06-20 00:00:00', interval 1 second) 	-- -1초
from dual;

-- *datediff(): 두 날짜간 일수차,  timediff(): 두 날짜시간 간 시간차
select	datediff('2021-06-21 01:05:05','2021-06-20 01:00:00' ), -- 일
		timediff('2021-06-21 01:05:05','2021-06-20 01:00:00')   -- 초
from dual;

select	datediff('2025-09-05','2025-03-27' )    
from dual; -- 수업기간 몇일

select	first_name,
		datediff(now(), hire_date)/365,
		concat(ceil(datediff(now(), hire_date)/365), '년차') 
from employees;

-- -------------------------------------------
-- *단일행함수 > 변환함수
-- 날짜-->문자열
select	now(),
		date_format(now(), '%y-%m-%d %h:%i:%s'),
		date_format(now(), '%Y-%m-%d %h:%i:%s (%p)'),
        date_format(now(), '%Y-%m-%d %H:%i:%s'),
        date_format(now(), '%Y/%m/%d %H %i %s')
from dual;

select	first_name,
		date_format(hire_date, '%d.%m.%Y %H:%i:%s') as hire_date
from employees;


-- -------------------------------------------

-- 원래 문자열 --> 날짜형(자동으로 변환)
select datediff('2021-Jun-22', '2021-06-21')  
from dual;

-- 문자열 -->날짜형으로 변환 --> 계산
select  str_to_date('2021-Jun-22', '%Y-%b-%d' ),
		str_to_date('2021-06-21', '%Y-%m-%d'),
        datediff(str_to_date('2021-Jun-22', '%Y-%b-%d' ), str_to_date('2021-06-21', '%Y-%m-%d') )
from dual;

-- 숫자-->문자열
-- *format(숫자, p): 숫자에 콤마(,) 를 추가, 소수점 p자리까지 출력
select	format(1234567, 0),
		format(1234567.89128, 4),  -- 소수점자리수 반올림
		format(1234567.89128, -5)  -- 소수점자리수(-는 안됨) 반올림
from dual;

-- IFNULL(컬럼명, null일때값): 컬럼의 값이 null일때 정해진값을 출력
select	first_name,
		commission_pct,
		ifnull(commission_pct, '없음')
from employees;

select 	first_name
		manager_id,
        ifnull(manager_id, '매니저없음')
from employees;
 