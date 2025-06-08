-- web 계정복습
-- web 계정으로 로그인
-- web 사용가능한 데이터베이스 조회
show data
bases;

-- web_db 선택
use web_db;

-- 테이블 조회
show tables;

-- 테이블 삭제
drop table author;
drop table book;

-- 작가 테이블 생성
create table author (
    author_id int auto_increment primary key,
    author_name varchar(100) not null,
    author_desc varchar(255)
);

-- 책 테이블 생성
create table book (
    book_id int auto_increment primary key,
    title varchar(200) not null,
    pubs varchar(100),
    pub_date date,
    author_id int,
    foreign key (author_id) references author(author_id)
);

-- 작가 데이터
insert into author (author_name, author_desc) values ('이문열', '전쟁과 사랑');
insert into author (author_name, author_desc) values ('박경리', '토지 작가');
insert into author (author_name, author_desc) values ('기안84', '웹툰 작가');
insert into author (author_name, author_desc) values ('강풀', '감성 웹툰 작가');
insert into author (author_name, author_desc) values ('김영하', '현대 소설 작가');

select * from author;
-- 책 데이터
insert into book (title, pubs, pub_date, author_id) values ('우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
insert into book (title, pubs, pub_date, author_id) values ('삼국지', '민음사', '2002-03-01', 1);
insert into book (title, pubs, pub_date, author_id) values ('토지', '마로니에북스', '2012-08-15', 2);
insert into book (title, pubs, pub_date, author_id) values ('자바프로그래밍 입문', '위키북스', '2015-04-01', null);
insert into book (title, pubs, pub_date, author_id) values ('패션왕', '중앙북스(books)', '2012-02-22', 3);
insert into book (title, pubs, pub_date, author_id) values ('순정만화', '재미주의', '2011-08-03', 4);
insert into book (title, pubs, pub_date, author_id) values ('오직두사람', '문학동네', '2017-05-04', 5);
insert into book (title, pubs, pub_date, author_id) values ('26년', '재미주의', '2012-02-04', 4);

select * from book;

select * from author,book;

-- 책 추가 삽입 예시
insert into book
values (null, '우리들의 일그러진 영웅', '다림', '1988-02-22', 1);

-- 특정 책 삭제 예시
delete from book
where book_id = 3;

-- 특정 책 업데이트 예시
update book
set title = '토지 (개정판)', pubs = '창작과비평사'
where book_id = 3;
