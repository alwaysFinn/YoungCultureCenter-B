------------------------------------------------------공통------------------------------------------------------
-- tb_user dummy data
--관리자
INSERT INTO public.tb_user
(user_id, user_name, user_pw, user_gender, user_birth_date, user_email, user_phone_number, user_postcode, user_rnameaddr, user_detailaddr, user_regdate, user_grade, user_social_type)
VALUES('admin', '어드민', '0111', 'F', '960305', 'admin@gmail.com', '01012345678', '06035', '강남구 도산대로34길', '상세주소입니당', now(), '관리자', 'N');
--강사
INSERT INTO public.tb_user
(user_id, user_name, user_pw, user_gender, user_birth_date, user_email, user_phone_number, user_postcode, user_rnameaddr, user_detailaddr, user_regdate, user_grade, user_social_type)
VALUES('inst', '최강사', '0111', 'M', '960305', 'instructor@gmail.com', '01012345678', '06035', '강남구 도산대로34길', '상세주소입니당', now(), '강사', 'G');
--일반회원(2)
INSERT INTO public.tb_user
(user_id, user_name, user_pw, user_gender, user_birth_date, user_email, user_phone_number, user_postcode, user_rnameaddr, user_detailaddr, user_regdate, user_grade, user_social_type)
VALUES('ezen', '김이젠', '0111', 'M', '960305', 'ezenkim@gmail.com', '01012345678', '06035', '강남구 도산대로34길', '상세주소입니당', now(), '일반회원', 'K');
INSERT INTO public.tb_user
(user_id, user_name, user_pw, user_gender, user_birth_date, user_email, user_phone_number, user_postcode, user_rnameaddr, user_detailaddr, user_regdate, user_grade, user_social_type)
VALUES('ezen1', '전이젠', '0111', 'F', '960305', 'ezenjeon@gmail.com', '01012345678', '06035', '강남구 도산대로34길', '상세주소입니당', now(), '일반회원', 'N');



------------------------------------------------------지호------------------------------------------------------
-- studyroom dummy data
insert into studyroom 
(sroom_seat_id, sroom_rental_stime, sroom_rental_etime, user_id)
values(3, '2022-12-01 12:26:00', '2023-12-26 12:26:00', 'admin');



------------------------------------------------------연희------------------------------------------------------
-- article dummy data 
INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES('2022-11-15', '공지사항', 'admin', '23년 수영장 일정 공지', '공지사항입니다', 13);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES('2022-11-17', '공지사항', 'admin', '23년 수영장 일정', '공지사항입니다', 21);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES('2022-11-15', '공지사항', 'admin', '수영장', '공지사항입니다', 16);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES('2022-11-27', '공지사항', 'admin', '23년 수영장', '공지사항입니다', 32);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES('2022-11-21', '공지사항', 'admin', '23년 수영장 일정 공지', '공지사항입니다', 41);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES('2022-11-08', '공지사항', 'admin', '수영', '공지사항입니다', 41);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES('2022-11-13', '공지사항', 'admin', '23년 수영장 일정 공지', '공지사항입니다', 41);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES('2022-11-01', '이벤트', 'admin', '헬스장 이벤트 안내', '이벤트입니다', 41);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES('2022-11-15', '이벤트', 'admin', '헬스장 이벤트 안내', '이벤트입니다', 14);


-- classroom dummy data
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values(101, '1층', '30', '101호');
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values(201, '2층', '30', '201호');
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values(301, '3층', '30', '301호');
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values('수영장', '외부', '60', '수영장');
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values(102, '1층', '30', '102호');
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values(202, '2층', '30', '202호');
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values(302, '3층', '30', '302호');
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values('축구장', '외부', '60', '축구장');
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values(103, '1층', '30', '103호');
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values(203, '2층', '30', '203호');
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values(303, '3층', '30', '303호');
insert INTO classroom (croom_id, croom_location, croom_mpop, croom_name)
values('풋살장', '외부', '20', '풋살장');


INSERT INTO public.prental_info
(prental_de, user_id, croom_id, time1, time2, time3, time4, time5, time6)
VALUES('2022-12-25', 'admin', '101', true, false, false, false ,false, false);
INSERT INTO public.prental_info
(prental_de, user_id, croom_id, time1, time2, time3, time4, time5, time6)
VALUES('2022-12-25', 'admin', '101', false, true, false, false ,false, false);
INSERT INTO public.prental_info
(prental_de, user_id, croom_id, time1, time2, time3, time4, time5, time6)
VALUES('2022-12-14', 'admin', '수영장', false, false, false, false ,false, true);




------------------------------------------------------성호------------------------------------------------------
-- locker_location dummy data
INSERT INTO locker_location (location_name) VALUES('본관 1층');
INSERT INTO locker_location (location_name) VALUES('본관 2층');
INSERT INTO locker_location (location_name) VALUES('수영장 로비');
INSERT INTO locker_location (location_name) VALUES('강당 입구');


-- tb_locker dummy data
do $$
begin 
	for i in 1..4 loop
		for j in 1..40 loop
			INSERT INTO tb_locker (locker_no, locker_location_id) VALUES(j, i);
		end loop;
	end loop;
end;
$$;


-- course_type dummy data
INSERT INTO public.course_type (course_cate_cd, course_cate_name) VALUES('Spo', '운동');
INSERT INTO public.course_type (course_cate_cd, course_cate_name) VALUES('Cul', '문화');
INSERT INTO public.course_type (course_cate_cd, course_cate_name) VALUES('Edu', '교육');


-- tb_course dummy data
INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('축구교실1', '2022-12-01', '2022-12-15', '2023-01-15', '2023-01-30'
, '월화수목금', '14:00~17:00', '청소년', 100000, '드리블1', 'ezen', '축구장', 'Spo');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('한국사1', '2022-12-02', '2022-12-16', '2023-01-16', '2023-01-31'
, '월수금', '18:00~21:00', '성인', 50000, '한국사1', 'ezen', '101', 'Cul');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('이젠웹개발1', '2022-12-03', '2022-12-17', '2023-01-17', '2023-02-01'
, '월목', '09:00~12:00', '성인', 30000, '자바웹개발과정', 'ezen', '301', 'Edu');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('축구교실2', '2022-12-04', '2022-12-18', '2023-01-18', '2023-02-02'
, '월화수목금', '18:00~22:00', '청소년', 80000, '미드필더1', 'ezen', '축구장', 'Spo');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('공예교실1', '2022-12-05', '2022-12-19', '2023-01-19', '2023-02-03'
, '토일', '09:00~18:00', '노인', 80000, '공예교실1', 'ezen', '201', 'Cul');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('이젠앱개발1', '2022-01-06', '2022-06-20', '2022-07-01', '2022-12-20'
, '월수금', '10:00~13:00', '성인', 50000, '안드로이드앱개발과정', 'ezen', '302', 'Edu');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('핸드볼교실1', '2022-12-06', '2022-12-20', '2023-01-20', '2023-02-04'
, '월화수목금', '14:00~15:00', '노인', 30000, '핸드볼교실1', 'ezen', '풋살장', 'Spo');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('농구교실1', '2022-12-07', '2022-12-21', '2023-01-21', '2023-02-05'
, '월수금', '10:00~13:00', '청소년', 30000, 'NBA와 KBO의 차이', 'ezen', '풋살장', 'Spo');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('이젠웹개발2', '2022-05-09', '2022-12-23', '2023-01-09', '2023-06-23'
, '월화수목금', '09:00~18:00', '성인', 100000, '자바웹개발과정', 'ezen', '303', 'Edu');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('이젠앱개발2', '2022-05-10', '2022-12-24', '2023-01-10', '2023-06-24'
, '월수금', '10:00~13:00', '청소년', 20000, '안드로이드앱개발과정', 'ezen', '301', 'Edu');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('크리스마스1', '2022-12-01', '2023-12-31', '2023-01-01', '2023-01-31'
, '금', '18:00~21:00', '성인', 20000, '크리스마스시즌1', 'ezen', '102', 'Cul');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('당일시작 당일마감하는 강좌', '2022-12-08', '2022-12-08', '2023-01-08', '2023-01-08'
, '일', '18:00~21:00', '성인', 20000, 'mapper확인용', 'ezen', '103', 'Cul');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('당일시작 당일마감하는 강좌2', '2022-12-09', '2022-12-09', '2023-01-09', '2023-01-09'
, '월', '18:00~21:00', '성인', 20000, 'mapper확인용', 'ezen', '202', 'Cul');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES('안드로이드 앱 개발', '2022-11-28', '2023-02-20', '2023-03-05', '2023-08-25'
, '월화수목금', '14:00~21:00', '성인', 6800000, '안드로이드 앱 개발을 할 수 있다.', 'ezen', '301', 'Edu');

INSERT INTO public.tb_course
(course_nm, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd, review_cnt)
VALUES('sqld 개발자 과정', '2022-12-10', '2022-12-24', '2023-01-24', '2023-02-06'
, '월수금', '18:00~21:00', '성인', 80000, 'DB 마스터 과정', 'ezen', '302', 'Edu', 10);

-- 수강후기 dummydata
INSERT INTO course_review (review_content, review_datetime, review_updated_datetime, review_rating, course_id, user_id)
VALUES('후기1', now(), now(), 2, 15, 'ezen');
INSERT INTO course_review (review_content, review_datetime, review_updated_datetime, review_rating, course_id, user_id)
VALUES('후기2', now(), now(), 3, 15, 'ezen1');
INSERT INTO course_review (review_content, review_datetime, review_updated_datetime, review_rating, course_id, user_id)
VALUES('후기3', now(), now(), 1, 15, 'ezen1');
INSERT INTO course_review (review_content, review_datetime, review_updated_datetime, review_rating, course_id, user_id)
VALUES('후기4', now(), now(), 4, 15, 'ezen');
INSERT INTO course_review (review_content, review_datetime, review_updated_datetime, review_rating, course_id, user_id)
VALUES('후기5', now(), now(), 4, 15, 'ezen');
INSERT INTO course_review (review_content, review_datetime, review_updated_datetime, review_rating, course_id, user_id)
VALUES('후기6', now(), now(), 5, 15, 'ezen');
INSERT INTO course_review (review_content, review_datetime, review_updated_datetime, review_rating, course_id, user_id)
VALUES('후기7', now(), now(), 5, 15, 'ezen');
INSERT INTO course_review (review_content, review_datetime, review_updated_datetime, review_rating, course_id, user_id)
VALUES('후기8', now(), now(), 3, 15, 'ezen');
INSERT INTO course_review (review_content, review_datetime, review_updated_datetime, review_rating, course_id, user_id)
VALUES('후기9', now(), now(), 3, 15, 'ezen');
INSERT INTO course_review (review_content, review_datetime, review_updated_datetime, review_rating, course_id, user_id)
VALUES('후기10', now(), now(), 1, 15, 'ezen');



-----------------------------------------------------나리-----------------------------------------------------------
-- 1개월
INSERT INTO public.inq_board	
(inq_cate, user_id, inq_title, inq_content, inq_date)
VALUES('교육강좌', 'ezen',  '수강 관련 문의', '수강 관련 문의 내용', '2022-11-12');
-- 같은 날짜
INSERT INTO public.inq_board	
(inq_cate, user_id,  inq_title, inq_content, inq_date)
VALUES('교육강좌', 'ezen',  '수강 관련 문의', '수강 관련 문의 내용', '2022-11-01');
-- 3개월
INSERT INTO public.inq_board
(inq_cate, user_id,  inq_title, inq_content, inq_date)
VALUES('결제', 'ezen',  '결제 관련 문의', '결제 관련 문의 내용', '2022-09-15');
-- 6개월
INSERT INTO public.inq_board
(inq_cate, user_id,  inq_title, inq_content, inq_date)
VALUES('결제', 'ezen',  '결제 관련 문의', '결제 관련 문의 내용', '2022-07-21');
-- 1년
INSERT INTO public.inq_board	
(inq_cate, user_id,  inq_title, inq_content, inq_date)
VALUES('교육강좌', 'ezen',  '수강 관련 문의', '수강 관련 문의 내용', '2021-10-15');
-- 1년 이상 이전
INSERT INTO public.inq_board
(inq_cate, user_id,  inq_title, inq_content, inq_date)
VALUES('결제', 'ezen',  '결제 관련 문의', '결제 관련 문의 내용', '2020-07-11');



INSERT INTO public.inq_board
(inq_cate, user_id,  inq_title, inq_content, inq_date)
VALUES('결제', 'ezen1',  '영수증 문의', '현금영수증 추후발급 되나요?', '2022-10-15');

INSERT INTO public.inq_board
(inq_cate, user_id,  inq_title, inq_content, inq_date)
VALUES('교육강좌', 'ezen1',  '수강 신청 변경 문의', '수강 신청 변경 문의 내용', '2022-10-15');

-----------------------------------------------------선혜-----------------------------------------------------------
INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '공지사항', 'admin', '대관신청안내', 'YOUNG문화센터 대관신청안내', 0);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '공지사항', 'admin', '12월 휴관일 안내', 'YOUNG문화센터 12월 휴관일 안내', 0);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '공지사항', 'admin', 'YOUNG문화센터 12월 2일 오픈', 'YOUNG문화센터 12월 12월 2일 GRAND OPEN', 0);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '공지사항', 'admin', 'YOUNG문화센터운영안내', 'YOUNG문화센터 운영안내', 0);


INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '이벤트', 'admin', '대관신청안내1', 'YOUNG문화센터 대관신청안내', 0);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '공지사항', 'admin', '12월 크리스마스 이벤트', '12월 크리스마스 이벤트', 0);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '공지사항', 'admin', 'YOUNG문화센터 12월 이벤트', 'YOUNG문화센터 12월 이벤트', 0);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '공지사항', 'admin', 'YOUNG문화센터 이벤트 안내', 'YOUNG문화센터 이벤트 안내', 0);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '이벤트', 'admin', '어린이를 위한 수영 이벤트', 'YOUNG문화센터 이벤트 안내', 0);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '이벤트', 'admin', '12월 크리스마스 행사 안내', '12월 크리스마스 이벤트', 0);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '이벤트', 'admin', 'YOUNG문화센터 12월 이벤트', 'YOUNG문화센터 12월 이벤트', 0);

INSERT INTO public.article
(article_date, article_board_type, user_id, article_title, article_contents, article_viewcnt)
VALUES(now(), '이벤트', 'admin', 'YOUNG문화센터 이벤트 안내', 'YOUNG문화센터 이벤트 안내', 0);
