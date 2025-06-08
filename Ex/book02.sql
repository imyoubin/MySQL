
-- 데이터베이스 선택
use web_db;

-- 기존 테이블 삭제 
drop table author;
drop table book;


-- 전체 테이블 조회
select * from author;
select * from book;

-- 조인하여 책 + 작가 정보 보기
select  bo.book_id,
		bo.title,
		bo.pubs,
		date_format(bo.pub_date, '%y-%m-%d') AS pub_date,
		au.author_id,
		au.author_name,
		au.author_desc
from book bo
join author au 
on bo.author_id = au.author_id;

select	author_id, 
	    author_name,
        author_desc 
from author 
where author_id 
;
select author_id,
       author_name,
       author_desc
from author
where author_id = ?
;

create table author (
    author_id int auto_increment primary key,
    author_name varchar(100),
    author_desc text
);

create table book (
    book_id int auto_increment primary key,
    book_name varchar(200),
    book_desc text,
    author_id int,
    foreign key (author_id) references author(author_id)
);

select book_id,
       book_name,
       book_desc
from book
order by book_id
;

select 	bo.book_id, 
		bo.book_name, 
        bo.book_desc,
		au.author_id, 
		au.author_name, 
		au.author_desc
from book bo
join author au 
on bo.author_id = au.author_id
order by bo.book_id asc
;