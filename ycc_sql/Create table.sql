-- START----------------------------------------------------	
-- create, drop table & add pk and fk & add column
DROP TABLE IF EXISTS admin_section CASCADE;
DROP TABLE IF EXISTS ARTICLE CASCADE;
DROP TABLE IF EXISTS attend CASCADE;
DROP TABLE IF EXISTS course_review CASCADE;
DROP TABLE IF EXISTS class_comment CASCADE;
DROP TABLE IF EXISTS classroom CASCADE;
DROP TABLE IF EXISTS CLUB CASCADE;
DROP TABLE IF EXISTS CLUB_BOARD CASCADE;
DROP TABLE IF EXISTS club_board_comment CASCADE;
DROP TABLE IF EXISTS CLUB_member CASCADE;
DROP TABLE IF EXISTS course_type CASCADE;
DROP TABLE IF EXISTS inq_board CASCADE;
DROP TABLE IF EXISTS main_banner CASCADE;
DROP TABLE IF EXISTS main_modal CASCADE;
DROP TABLE IF EXISTS prental_info CASCADE;
DROP TABLE IF EXISTS studyroom CASCADE;
DROP TABLE IF EXISTS tb_course CASCADE;
DROP TABLE IF EXISTS course_image CASCADE;
DROP TABLE IF EXISTS tb_permission CASCADE;
DROP TABLE IF EXISTS tb_rental_locker CASCADE;
DROP TABLE IF EXISTS tb_user CASCADE;
DROP TABLE IF EXISTS club_attach CASCADE;
DROP TABLE IF EXISTS tb_attach CASCADE;
DROP TABLE IF EXISTS tb_terms CASCADE;
DROP TABLE IF EXISTS sroom_rental_info CASCADE;


CREATE TABLE admin_section (
    top_logo_img    character varying(255) NOT NULL,
    footer_logo_img    character varying(255) NOT NULL
);
-- article_user_id : character -> varchar 타입 변경
-- article_id : serial로 변경 
-- article_title : character -> varchar 타입 변경
-- article_viewcnt : integer -> int 타입변경, notnull 
CREATE TABLE ARTICLE (
    article_id   serial,
    article_date    timestamp without time zone ,
    article_Board_type    varchar(10) NOT NULL,
    user_id    varchar(16) NOT NULL,
    article_title    varchar NOT null,
    article_contents    text NOT NULL,
    article_viewcnt int
);

ALTER TABLE ARTICLE ADD CONSTRAINT ARTICLE_PK PRIMARY KEY ( article_id );

-- 2022-11-28 KimSeongho
-- attend_code serial로 타입변경
-- ateend_status 삭제 
-- user_id varchar로 타입변경
CREATE TABLE attend (
    attend_code    serial NOT NULL,
    course_id    integer NOT NULL,
    user_id    varchar(16) NOT NULL,
    attend_datetime    timestamp without time zone NOT NULL
);
ALTER TABLE attend ADD CONSTRAINT attend_PK PRIMARY KEY ( attend_code );

-- class_comment -> course_review 테이블 이름 변경
-- review_id type변경 Integer-> serial
-- starrating 타입변경 numeric -> Integer
-- user_id 타입변경 char -> varchar
-- review_updated_datetime : not null 삭제
CREATE TABLE course_review (
    review_id    serial NOT NULL, -- cno
    review_content    character varying(1000) NOT NULL, -- review
    review_datetime    timestamp without time zone NOT NULL, -- reg_date
    review_updated_datetime    timestamp without time zone, -- up_date
    review_rating    integer NOT NULL, -- starrating
    course_id    integer NOT NULL, -- bno
    user_id    varchar(16) NOT null -- reviewer
);
ALTER TABLE course_review ADD CONSTRAINT course_review_PK PRIMARY KEY ( review_id );

CREATE TABLE classroom (
    croom_id    varchar(10) NOT NULL,
    croom_location    varchar(50) NOT NULL, /*김지호가 바꿀 예정*/
    croom_mpop    integer NOT NULL,
    croom_name    varchar(30) NOT NULL
);
ALTER TABLE classroom ADD CONSTRAINT classroom_PK PRIMARY KEY ( croom_id );

CREATE TABLE CLUB (
    club_id    integer NOT NULL,
    club_title    character varying(50) NOT NULL,
    club_create_time    timestamp without time zone NOT NULL,
    club_info    character varying(3000) NOT NULL,
    club_master_id    character(16) NOT NULL
);

ALTER TABLE CLUB ADD CONSTRAINT CLUB_PK PRIMARY KEY ( club_id );

CREATE TABLE CLUB_BOARD (
    club_article_id    integer NOT NULL,
    club_article_title    character varying(100) NOT NULL,
    club_article_content text  not null,
    club_board_upload_time    timestamp without time zone NOT NULL,
    club_article_viewcnt    integer DEFAULT 0 NOT NULL,
    club_id    integer NOT NULL,
    user_id    character(16) NOT NULL
);
ALTER TABLE CLUB_BOARD ADD CONSTRAINT CLUB_BOARD_PK PRIMARY KEY ( club_article_id );

CREATE TABLE club_board_comment (
    club_comment_id    integer NOT NULL,
    club_comment	character varying(1000) NOT NULL,
    club_comment_time    timestamp without time zone NOT NULL,
    user_id    character(16) NOT NULL,
    club_article_id    integer NOT NULL
);
ALTER TABLE club_board_comment ADD CONSTRAINT club_board_comment_PK PRIMARY KEY ( club_comment_id );

CREATE TABLE CLUB_member (
    club_in_time    timestamp without time zone NOT NULL,
    user_id    character(16) NOT NULL,
    club_id    integer
);
ALTER TABLE CLUB_member ADD CONSTRAINT CLUB_member_PK PRIMARY KEY ( user_id );

CREATE TABLE course_type (
    course_cate_cd    varchar(10) NOT NULL,
    course_cate_name    varchar(50) NOT NULL
);
ALTER TABLE course_type ADD CONSTRAINT course_type_PK PRIMARY KEY ( course_cate_cd );

CREATE TABLE inq_board (
    inq_cate    varchar(30) NOT NULL,
    user_id    varchar(16) NOT NULL,
    inq_id    serial NOT null,
    inq_title varchar(100) not null,
    inq_content text not null,
    inq_date date not null,
    inq_YN    boolean NOT null  --답변 내용 null여부로 판단으로 변경(컬럼삭제)
    
);
ALTER TABLE inq_board ADD CONSTRAINT inq_board_PK PRIMARY KEY ( inq_id );
alter table inq_board add column inq_ans text;
alter table inq_board drop column inq_yn;

CREATE TABLE main_banner (
    banner_id    integer NOT NULL,
    banner_img    character varying(255) NOT NULL,
    banner_url    character varying(500)
);
ALTER TABLE main_banner ADD CONSTRAINT main_banner_PK PRIMARY KEY ( banner_id );

CREATE TABLE main_modal (
    modal_id    integer NOT NULL,
    modal_img    character varying(255) NOT NULL,
    modal_url    character varying(500)
);
ALTER TABLE main_modal ADD CONSTRAINT main_modal_PK PRIMARY KEY ( modal_id );
--user_id, croom_id -> varchar로 수정
--prental_id 타입 변경 = integer -> serial
--이름 변경 ->  prental_time_info --> prtime_schdule 
--prtime_schedule 컬럼 삭제 , rental_time 테이블 삭제 --> time1 ~ time6로 대체
CREATE TABLE prental_info (
    prental_id    serial,
    prental_de    Date NOT NULL,
    user_id    varchar(16) NOT NULL,
    croom_id    varchar(10) NOT NULL,
    time1		boolean NOT NULL,
    time2		boolean NOT NULL,
    time3		boolean NOT NULL,
    time4		boolean NOT NULL,
    time5		boolean NOT NULL,
    time6		boolean NOT NULL
);
ALTER TABLE prental_info ADD CONSTRAINT prental_info_PK PRIMARY KEY ( prental_id );

CREATE TABLE studyroom (
    sroom_seat_id    integer NOT NULL,
    sroom_rental_yn  character(1) not null
);
ALTER TABLE studyroom ADD CONSTRAINT studyroom_PK PRIMARY KEY ( sroom_seat_id );

-- course_id 타입 변경 Integer -> serial 
-- course_image 컬럼 삭제(2022-12-08 KimSeongho)
CREATE TABLE tb_course (
    course_id    serial NOT NULL,
    course_nm    character varying(255) NOT NULL,
    course_reg_start_date    date NOT NULL,
    course_reg_end_date    date NOT NULL,
    course_start_date    date NOT NULL,
    course_end_date    date NOT NULL,
    course_day    character(30) NOT NULL,
    course_time    character(14) NOT NULL,
    course_target    character(10) NOT NULL,
    course_cost    integer NOT NULL,
    course_info    character varying(5000) NOT NULL,
    user_id    varchar(16) NOT NULL,
    croom_id    varchar(10) NOT null,
    course_cate_cd varchar(10) NOT null,
    course_applicants integer default 0,
    course_rating numeric(3, 2) default 0,
    review_cnt integer default 0
);
ALTER TABLE tb_course ADD CONSTRAINT tb_course_PK PRIMARY KEY ( course_id );

-- course_image 테이블 추가 (course에서 course_image 컬럼 대신 생성)(2022-12-08 KimSeongho)
create table course_image(
	uuid 	varchar(100) not null ,
	fileName 	varchar(100) not null,
	uploadPath 	varchar(200) not null,
	course_id 	integer not null
);
ALTER TABLE course_image ADD CONSTRAINT course_image_PK PRIMARY KEY ( uuid );

CREATE TABLE tb_permission (
    user_id    character(16) NOT NULL,
    permission    character varying(200)
);
ALTER TABLE tb_permission ADD CONSTRAINT tb_permission_PK PRIMARY KEY ( user_id );

CREATE TABLE tb_rental_locker (
    locker_id    character(6) NOT NULL,
    locker_location    character(30) NOT NULL,
    locker_start_date    timestamp without time zone NOT NULL,
    locker_cost    integer NOT NULL,
    user_id    character(16) NOT NULL,
    locker_end_date    timestamp without time zone NOT NULL
);
ALTER TABLE tb_rental_locker ADD CONSTRAINT tb_rental_locker_PK PRIMARY KEY ( locker_id );

CREATE TABLE tb_user
(
    user_id    varchar(16) NOT null ,
    user_name    varchar(25) NOT NULL,
    user_pw    varchar(16) NOT NULL,
    user_gender    character(1) NOT NULL,
    user_birth_date date not null,
    user_email    varchar(50) NOT NULL,
    user_phone_number    character(11) NOT NULL,
    user_postcode    character(5)    not null,
    user_rNameAddr    varchar(100)    not null,
    user_detailAddr    varchar (100),
    user_regdate    date NOT NULL,
    user_grade    varchar(10) DEFAULT '일반회원' NOT NULL,
    user_social_type    character(1)
);

ALTER TABLE tb_user ADD CONSTRAINT tb_user_PK PRIMARY KEY ( user_id );

create table tb_terms 
(
	join_terms	   text	--이용약관
,	join_privacy_terms text --개인정보취급방침
);

create table sroom_rental_info 
(
	srental_no				serial not null
,	sroom_rental_stime		time without time zone not null
,	sroom_rental_etime		time without time zone not null
,	user_id					varchar(16) not null
,	sroom_seat_id			integer NOT NULL
);
alter table sroom_rental_info add constraint sroom_rental_info_PK primary key (srental_no); 



--FK============================================================================================================
--동아리
alter table club_board add FOREIGN KEY(club_id) REFERENCES club(club_id) ON DELETE CASCADE;
alter table club_board add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

alter table club_board_comment add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;
alter table club_board_comment add FOREIGN KEY(club_article_id) REFERENCES club_board(club_article_id) ON DELETE CASCADE;

alter table club_member add FOREIGN KEY(club_id) REFERENCES club(club_id) ON DELETE CASCADE;
alter table club_member add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

--렌탈
alter table prental_info add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;
alter table prental_info add FOREIGN KEY(croom_id) REFERENCES classroom(croom_id) ON DELETE CASCADE;

alter table tb_rental_locker add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

alter table sroom_rental_info add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;
alter table sroom_rental_info add FOREIGN KEY(sroom_seat_id) REFERENCES studyroom(sroom_seat_id) ON DELETE CASCADE;

--게시글, 첨부파일, 문의게시판 테이블 fk생성
alter table ARTICLE add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

alter table inq_board add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

--강좌, 권한 fk생성 sql문
alter table tb_course add FOREIGN KEY(croom_id) REFERENCES classroom(croom_id) ON DELETE CASCADE;
alter table tb_course add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;
alter table tb_course add FOREIGN KEY(course_cate_cd) REFERENCES course_type(course_cate_cd) ON DELETE CASCADE;

alter table course_image add FOREIGN KEY(course_id) REFERENCES tb_course(course_id) ON DELETE CASCADE;

alter table course_review add FOREIGN KEY(course_id) REFERENCES tb_course(course_id) ON DELETE CASCADE; 
alter table course_review  add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

alter table attend add FOREIGN KEY(course_id) REFERENCES tb_course(course_id) ON DELETE CASCADE;
alter table attend add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

alter table tb_permission add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

-- END------------------- create, drop table & add pk and fk & add column--------------------------------------
