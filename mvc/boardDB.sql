create table board (
	no number primary key, -- 게시글 번호 프라이머리키
	subject varchar2(500) not null, -- 게시글 제목
	content varchar2(4000) not null, -- 게시글내용
	readcount number default 0, -- 읽은 횟수
	ip varchar2(20) not null, -- 작성자 ip
	reg_date date default sysdate, -- 게시글 등록일
	up_date date, --게시글 수정일
	del_yn char(1) default 'n' check (del_yn in ('y','n')), -- 게시글 삭제여부
	m_no number not null -- m_no과 참조된 외래키
);

create table board_reply (
	re_no number primary key,
	re_content varchar2(2000) not null,
	re_reg_date date default sysdate,
	re_update_date date,
	re_del_yn char(1) default 'n' check (re_del_yn in ('y','n')),
	no number not null,
	m_no number not null
);

create table board_file (
	f_no number primary key,
	f_original_name varchar2(1000 byte) not null,
	f_stored_name varchar2(1000 byte) not null,
	f_size number,
	no number not null
);

-- 게시판에 m_no 외래키 설정
alter table board add constraint fk_m_no
foreign key(m_no) references member(m_no);

-- 게시판 제약조건 삭제
alter table board drop constraint fk_m_no;


--oracle Date 형식 조회 시 시/분/초도 보이게끔 oracle 설정.
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
