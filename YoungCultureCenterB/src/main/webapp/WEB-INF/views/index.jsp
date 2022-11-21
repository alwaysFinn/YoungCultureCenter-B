<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>	
  <!-- head & meta tag include -->
  <%@include file="/WEB-INF/views/metahead.jsp"%>
  <style type="text/css">
  
	.img_size01 {
	/* 슬라이드에 들어가는 이미지 크기 조절*/
	height: 450px;
	width: 100%;
	}
	
  	.boardlist > li
	{
		list-style: none;
		overflow: hidden;
		text-overflow: ellipsis;
		margin-top: 0.25em;
		margin-bottom: 0.25em;
	}
	
	.boardlist > li > a, .more
	{
		text-decoration: none;
		color: graytext;
	}
	
  	.quickIcon
	{
		width: 50px;
		height: 50px;
	}
	
	#quickMenu > li
	{
		display : inline-block;
		position: relative;
	}
	
	#quickMenu > li > a
	{
	display:block;
	position:relative;
	padding-bottom:30px;
	margin: 50px;
	}
	
	#quickMenu > li > a > span
	{
		position:absolute;
		bottom:0;
		left:50%;
		color:#666;
		line-height:1.462em;
		white-space:nowrap;
		transform:translate(-50%, 0);
	}
  </style>
  

<title>YOUNG문화체육센터</title>
</head>
<body>
	<!-- header inlcude -->
	<%@include file="/WEB-INF/views/header.jsp"%>
	
	<div class="container">
		<!-- 슬라이드 배너 캐러셀1 -->
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
					aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
					aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
					aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="resources\img\slide\Youngculturecenter.png" class="img_size01" alt="Youngculture바로가기">
				</div>
				<div class="carousel-item">
					<img src="resources\img\slide\baking.jpg" class="img_size01" alt="베이킹 수업 바로가기">
				</div>
				<div class="carousel-item">
					<img src="resources\img\slide\coingclass.png" class="img_size01" alt="코딩수업 바로가기">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>



		<!-- 중단 퀵메뉴 -->
		<div class="text-center" style="list-style-type: none;">
			<ul id="quickMenu" name="quickMenu">
				<li><a href="/ycc/course/courseinfo"><img class="quickIcon"  src="resources\img\main_img\application_icon.png"
							alt="수강신청" /><span>수강신청</span></a></li>
				<li><a href="/ycc/rental/place"><img class="quickIcon" src="resources\img\main_img\rental_icon.png"
							alt="대관신청" /><span>대관 신청</span></a></li>
				<li><a href="/ycc/rental/locker"><img class="quickIcon" src="resources\img\main_img\studyroom_icon.png"
							alt="독서실예약" /><span>독서실 예약</span></a></li>
				<li><a href="/ycc/rental/locker"><img class="quickIcon" src="resources\img\main_img\Locker_icon.png"
							alt="사물함신청" /><span>사물함 신청</span></a></li>
				<li><a href="/ycc/club"><img class="quickIcon" src="resources\img\main_img\club_icon.png"
							alt="동아리" /><span>동아리</span></a></li>
				<li><a href="/ycc/map"><img class="quickIcon" src="resources\img\main_img\map_icon.png"
							alt="찾아오시는 길" /><span>찾아오시는 길</span></a></li>
			</ul>
		</div><!-- // banner_list -->
	
		<div class="row">
			<div class="col-lg-6 p-1 mb-2">
				<div class="border border-opacity-25 shadow p-4">
					<div class="d-flex align-items-center">
					<div>
						<span class="fs-4">공지사항</span>
					</div>
					<div class="ms-auto">
						<span><a href="/ycc/board/notice" class="more">더보기</a></span>
					</div>
				</div>
				<hr class="my-2">
				<ul class="ms-0 text-truncate ps-0 boardlist">
					<li><a href="/ycc/board/post">
						저 오늘 치과갑니다
					</a></li>
					<li><a href="/office/gfac/board/gfac_notice/482/view.do">
						2022 강남페스티벌 별마당패션쇼 운영업체 선정 공고
					</a></li>
					<li><a href="/office/gfac/board/gfac_notice/480/view.do">
						2022년 강남예술단 찾아가는 공연 『톡톡! 음악배달부』 7월 선정결과 안내
					</a></li>
					<li><a href="/office/gfac/board/gfac_notice/479/view.do">
						렌티큘러와 홀로그램으로 본 세상 - 기술입은 문화교육 프로그램 참가 어린이/청소년 모집(기간연장 ~7/20까지)
					</a></li>
					<li><a href="/office/gfac/board/gfac_notice/479/view.do">
						서울 강남도 DMZ로...강남문화재단 문화체험 프로그램
					</a></li>
				</ul>
			</div>
			</div>
			<div class="col-lg-6 p-1 mb-2">
				<div class="border border-opacity-25 shadow p-4">
					<div class="d-flex align-items-center">
						<div>
							<span class="fs-4">행사/이벤트</span>
						</div>
						<div class="ms-auto">
							<span><a href="/ycc/board/event" class="more">더보기</a></span>
						</div>
					</div>
					<hr class="my-2">
					<ul class="ms-0 text-truncate ps-0 boardlist">
						<li><a href="/ycc/board/post">
							저 오늘 치과갑니다
						</a></li>
						<li><a href="/office/gfac/board/gfac_notice/482/view.do">
							2022 강남페스티벌 별마당패션쇼 운영업체 선정 공고
						</a></li>
						<li><a href="/office/gfac/board/gfac_notice/480/view.do">
							2022년 강남예술단 찾아가는 공연 『톡톡! 음악배달부』 7월 선정결과 안내
						</a></li>
						<li><a href="/office/gfac/board/gfac_notice/479/view.do">
							렌티큘러와 홀로그램으로 본 세상 - 기술입은 문화교육 프로그램 참가 어린이/청소년 모집(기간연장 ~7/20까지)
						</a></li>
						<li><a href="/office/gfac/board/gfac_notice/479/view.do">
							서울 강남도 DMZ로...강남문화재단 문화체험 프로그램
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	<!-- container END -->
	</div> 
	
	<!-- footer inlcude -->
	<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>