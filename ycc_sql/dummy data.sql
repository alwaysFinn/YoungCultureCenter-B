------------------------------------------------------공통------------------------------------------------------
-- tb_user dummy data
INSERT INTO public.tb_user
(user_id, user_name, user_pw, user_gender, user_birth_date, user_email, user_phone_number, user_addr, user_regdate, user_grade, user_social_type)
VALUES('admin', '이젠', '0111', 'm', '2022-11-09', 'ezen@gmail.com', '01012345678', '강남', '2022-11-09', '관리자'::bpchar, '');

INSERT INTO public.tb_user
(user_id, user_name, user_pw, user_gender, user_birth_date, user_email, user_phone_number, user_addr, user_regdate, user_grade, user_social_type)
VALUES('ezen', '이젠', '0111', 'm', '2022-11-12', 'ezenT@gmail.com', '01012345678', '강남', 'now()', '강사', '');



------------------------------------------------------지호------------------------------------------------------
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



------------------------------------------------------성호------------------------------------------------------
-- course_type dummy data
INSERT INTO public.course_type (course_cate_cd, course_cate_name) VALUES('Spo', '운동');
INSERT INTO public.course_type (course_cate_cd, course_cate_name) VALUES('Cul', '문화');
INSERT INTO public.course_type (course_cate_cd, course_cate_name) VALUES('Edu', '교육');


-- tb_course dummy data
INSERT INTO public.tb_course
(course_id, course_nm, course_image, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES(1, '차범근축구교실', '', '2022-11-01', '2022-11-15', '2022-12-01', '2022-12-15'
, '월화수목금', '14:00~17:00', '청소년', 100000, '드리블에 대해서', 'ezen', '201', 'Spo');

INSERT INTO public.tb_course
(course_id, course_nm, course_image, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES(2, '한국사바로알기', '', '2022-11-02', '2022-11-16', '2022-12-02', '2022-12-16'
, '월수금', '18:00~21:00', '성인', 50000, '자바앱개발과정', 'ezen', '201', 'Cul');

INSERT INTO public.tb_course
(course_id, course_nm, course_image, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES(3, '이젠웹개발1', '', '2022-01-03', '2022-05-17', '2022-06-03', '2022-12-17'
, '월목', '09:00~12:00', '성인', 30000, '자바웹개발과정', 'ezen', '201', 'Edu');

INSERT INTO public.tb_course
(course_id, course_nm, course_image, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES(4, '박지성축구교실', '', '2022-11-04', '2022-11-28', '2022-12-04', '2023-02-28'
, '월화수목금', '18:00~22:00', '청소년', 80000, '미드필더란', 'ezen', '201', 'Spo');

INSERT INTO public.tb_course
(course_id, course_nm, course_image, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES(5, '공예교실', '', '2022-11-05', '2022-11-19', '2022-12-05', '2022-12-19'
, '토일', '09:00~18:00', '노인', 80000, '치매예방', 'ezen', '201', 'Cul');

INSERT INTO public.tb_course
(course_id, course_nm, course_image, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES(6, '이젠앱개발1', '', '2022-01-06', '2022-06-20', '2022-07-01', '2022-12-20'
, '월수금', '10:00~13:00', '성인', 50000, '안드로이드앱개발과정', 'ezen', '201', 'Edu');

INSERT INTO public.tb_course
(course_id, course_nm, course_image, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES(7, '우생순', '', '2022-11-07', '2022-11-21', '2022-12-07', '2022-12-21'
, '월화수목금', '14:00~15:00', '노인', 30000, '우리 생의 최고의 순간', 'ezen', '201', 'Spo');

INSERT INTO public.tb_course
(course_id, course_nm, course_image, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES(8, 'NBA로 가자', '', '2022-11-08', '2022-11-22', '2022-12-08', '2022-12-22'
, '월수금', '10:00~13:00', '청소년', 30000, 'NBA와 KBA의 차이', 'ezen', '201', 'Spo');

INSERT INTO public.tb_course
(course_id, course_nm, course_image, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES(9, '이젠웹개발2', '', '2022-05-09', '2022-11-23', '2022-12-09', '2023-06-23'
, '월화수목금', '09:00~18:00', '성인', 100000, '자바웹개발과정', 'ezen', '201', 'Edu');

INSERT INTO public.tb_course
(course_id, course_nm, course_image, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES(10, '이젠앱개발2', '', '2022-05-10', '2022-11-24', '2022-12-10', '2023-06-24'
, '월수금', '10:00~13:00', '청소년', 20000, '안드로이드앱개발과정', 'ezen', '201', 'Edu');

INSERT INTO public.tb_course
(course_id, course_nm, course_image, course_reg_start_date, course_reg_end_date, course_start_date, course_end_date
, course_day, course_time, course_target, course_cost, course_info, user_id, croom_id, course_cate_cd)
VALUES(11, '크리스마스', '', '2022-12-01', '2023-12-31', '2023-01-01', '2023-01-31'
, '금', '18:00~21:00', '성인', 20000, '크리스마스시즌', 'ezen', '201', 'Cul');




------------------------------------------------------연희------------------------------------------------------
-- article dummy data 
INSERT INTO public.article (article_id, article_date, artilce_contents, article_board_type, user_id, article_title) 
VALUES(1, now(), '공지사항입니다', 'notice', 'admin', '23년 수영장 일정 공지');  

INSERT INTO public.article (article_id, article_date, artilce_contents, article_board_type, user_id, article_title) 
VALUES(2, now(), '이벤트입니다', 'event', 'admin', '헬스장 이벤트 안내');




















