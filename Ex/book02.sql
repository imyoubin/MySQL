-- web_db 접속
use web_db;

-- 테이블 리스트보기
show databases;

-- 테스트
select *
from book
;

-- select 데이터
select 	book_id,
		book_title,
		book_pubs,
		book_pubDate,
		book_authorId,
		book_name,
        book_desc
from book
;

-- 데이터 보기
insert into book
values(null, '우리들의 일그러진 영웅', '다림', '1988-02-22', 1)
;

-- 데이터 삭제
delete from book
where book_id=3
;

-- 데이터 업데이트
update  book
 set	book_title
		book_pubs
		book_pubDate
		book_authorId
		book_name
		book_desc
where	book_id
;