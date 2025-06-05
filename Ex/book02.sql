
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
where author_id ;

