-- START----------------------------------------------------	
-- create, drop table & add pk and fk & add column
DROP TABLE IF EXISTS admin_section CASCADE;
DROP TABLE IF EXISTS ARTICLE CASCADE;
DROP TABLE IF EXISTS attend CASCADE;
DROP TABLE IF EXISTS class_comment CASCADE;
DROP TABLE IF EXISTS classroom CASCADE;
DROP TABLE IF EXISTS CLUB CASCADE;
DROP TABLE IF EXISTS club_attach CASCADE;
DROP TABLE IF EXISTS CLUB_BOARD CASCADE;
DROP TABLE IF EXISTS club_board_comment CASCADE;
DROP TABLE IF EXISTS CLUB_member CASCADE;
DROP TABLE IF EXISTS course_type CASCADE;
DROP TABLE IF EXISTS inq_board CASCADE;
DROP TABLE IF EXISTS main_banner CASCADE;
DROP TABLE IF EXISTS main_modal CASCADE;
DROP TABLE IF EXISTS prental_info CASCADE;
DROP TABLE IF EXISTS studyroom CASCADE;
DROP TABLE IF EXISTS tb_attach CASCADE;
DROP TABLE IF EXISTS tb_course CASCADE;
DROP TABLE IF EXISTS tb_permission CASCADE;
DROP TABLE IF EXISTS tb_rental_locker CASCADE;
DROP TABLE IF EXISTS tb_user CASCADE;

CREATE TABLE admin_section (
    top_logo_img    character varying(255) NOT NULL,
    footer_logo_img    character varying(255) NOT NULL
);

CREATE TABLE ARTICLE (
    article_id    integer NOT NULL,
    article_date    timestamp without time zone NOT NULL,
    artilce_contents    character varying(5000) NOT NULL,
    article_Board_type    character(30) NOT NULL,
    user_id    character(16) NOT NULL,
    article_title    character varying(50) NOT NULL
);
ALTER TABLE ARTICLE ADD CONSTRAINT ARTICLE_PK PRIMARY KEY ( article_id );

CREATE TABLE attend (
    attend_code    character(10) NOT NULL,
    course_id    integer NOT NULL,
    user_id    character(16) NOT NULL,
    attend_datetime    timestamp without time zone NOT NULL,
    attend_status    character(6) NOT NULL
);
ALTER TABLE attend ADD CONSTRAINT attend_PK PRIMARY KEY ( attend_code );

CREATE TABLE class_comment (
    review_id    integer NOT NULL,
    review_content    character varying(1000) NOT NULL,
    review_datetime    timestamp without time zone NOT NULL,
    review_updated_datetime    timestamp without time zone NOT NULL,
    review_rating    numeric(3),
    course_id    integer NOT NULL,
    user_id    character(16) NOT NULL
);
ALTER TABLE class_comment ADD CONSTRAINT class_comment_PK PRIMARY KEY ( review_id );

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

CREATE TABLE club_attach (
    club_file_name    character varying(255) NOT NULL,
    club_reg_date    timestamp without time zone NOT NULL,
    club_article_id    integer
);
ALTER TABLE club_attach ADD CONSTRAINT club_attach_PK PRIMARY KEY ( club_file_name );

CREATE TABLE CLUB_BOARD (
    club_article_id    integer NOT NULL,
    club_article_title    character varying(100) NOT NULL,
    club_board_upload_time    timestamp without time zone NOT NULL,
    club_article_cnt    integer DEFAULT 0 NOT NULL,
    club_id    integer NOT NULL,
    user_id    character(16) NOT NULL
);
ALTER TABLE CLUB_BOARD ADD CONSTRAINT CLUB_BOARD_PK PRIMARY KEY ( club_article_id );

CREATE TABLE club_board_comment (
    club_comment_id    integer NOT NULL,
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
    inq_cate    character(30) NOT NULL,
    inq_YN    boolean NOT NULL,
    user_id    character(16) NOT NULL,
    inq_id    integer NOT NULL
);
ALTER TABLE inq_board ADD CONSTRAINT inq_board_PK PRIMARY KEY ( inq_id );

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

CREATE TABLE prental_info (
    prental_id    integer NOT NULL,
    prental_de    timestamp without time zone NOT NULL,
    prental_duration    integer NOT NULL,
    user_id    character(16) NOT NULL,
    croom_id    character(10) NOT NULL
);
ALTER TABLE prental_info ADD CONSTRAINT prental_info_PK PRIMARY KEY ( prental_id );

CREATE TABLE studyroom (
    sroom_seat_id    integer NOT NULL,
    sroom_entry_time    timestamp without time zone NOT NULL,
    sroom_checkout_time    timestamp without time zone NOT NULL,
    user_id    character(16) NOT NULL
);
ALTER TABLE studyroom ADD CONSTRAINT studyroom_PK PRIMARY KEY ( sroom_seat_id );
alter table studyroom add column use_yn boolean not null;

CREATE TABLE tb_attach (
    article_file_name   character varying(255) NOT NULL,
    article_id    		integer
);
ALTER TABLE tb_attach ADD CONSTRAINT tb_attach_PK PRIMARY KEY ( article_file_name );

CREATE TABLE tb_course (
    course_id    integer NOT NULL,
    course_nm    character varying(255) NOT NULL,
    course_image    character varying(255),
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
    course_cate_cd varchar(10) NOT NULL
);
ALTER TABLE tb_course ADD CONSTRAINT tb_course_PK PRIMARY KEY ( course_id );

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
    user_id    			varchar(16) NOT NULL,
    user_name    		varchar(25) NOT NULL,
    user_pw    			varchar(16) NOT NULL,
    user_gender    		character(1) NOT NULL,
    user_birth_date    	date NOT NULL,
    user_email    		varchar(50) NOT NULL,
    user_phone_number   character(11) NOT NULL,
    user_addr    		varchar(100),
    user_regdate    	date NOT NULL,
    user_grade    		varchar(10) DEFAULT '일반회원' NOT NULL,
    user_social_type    character(1) NOT NULL
);

ALTER TABLE tb_user ADD CONSTRAINT tb_user_PK PRIMARY KEY ( user_id );

--동아리
alter table club_board add FOREIGN KEY(club_id) REFERENCES club(club_id) ON DELETE CASCADE;
alter table club_board add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

alter table club_board_comment add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;
alter table club_board_comment add FOREIGN KEY(club_article_id) REFERENCES club_board(club_article_id) ON DELETE CASCADE;

alter table club_member add FOREIGN KEY(club_id) REFERENCES club(club_id) ON DELETE CASCADE;
alter table club_member add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

alter table club_attach add FOREIGN KEY(club_article_id) REFERENCES club_board(club_article_id) ON DELETE CASCADE;

--렌탈
alter table prental_info add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;
alter table prental_info add FOREIGN KEY(croom_id) REFERENCES classroom(croom_id) ON DELETE CASCADE;

alter table tb_rental_locker add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

alter table studyroom add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

--게시글, 첨부파일, 문의게시판 테이블 fk생성
alter table ARTICLE add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

alter table tb_attach add FOREIGN KEY(article_id) REFERENCES ARTICLE(article_id) ON DELETE CASCADE;

alter table inq_board add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

--강좌, 권한 fk생성 sql문
alter table tb_course add FOREIGN KEY(croom_id) REFERENCES classroom(croom_id) ON DELETE CASCADE;
alter table tb_course add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;
alter table tb_course add FOREIGN KEY(course_cate_cd) REFERENCES course_type(course_cate_cd) ON DELETE CASCADE;

alter table class_comment add FOREIGN KEY(course_id) REFERENCES tb_course(course_id) ON DELETE CASCADE; 
alter table class_comment  add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

alter table attend add FOREIGN KEY(course_id) REFERENCES tb_course(course_id) ON DELETE CASCADE;
alter table attend add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

alter table tb_permission add FOREIGN KEY(user_id) REFERENCES tb_user(user_id) ON DELETE CASCADE;

-- END------------------- create, drop table & add pk and fk & add column--------------------------------------
