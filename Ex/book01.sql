-- 데이터베이스(스키마) 리스트 보기
show databases;

-- web_db 접속
use web_db;

-- 테이블 삭제
drop table author;
drop table book;

-- 테이블 리스트보기
show tables;
-- 테스트
select *
from author;

-- #작가 테이블 만들기
create table author(
	author_id 	int 		 primary key,  
    author_name varchar(100) not null,
    author_desc varchar(500)
);

select 	author_id,
		author_name,
        author_desc
from author
;

-- 데이터 보기
insert into author
values(null,'정우성','서울')
;
 
 -- 데이터 삭제
delete from author
where author_id=2
;
-- 데이터 업데이트
update author
set author_name = '이효리',
	author_desc = '제주도'
where author_id = 2
;

create table author (
    author_id int primary key auto_increment,
    author_name varchar(100) not null,
    author_desc varchar(500)
);