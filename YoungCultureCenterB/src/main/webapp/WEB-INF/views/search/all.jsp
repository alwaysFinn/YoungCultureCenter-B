<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>	
<title>Young문화센터 - 전체보기</title>
<style type="text/css">
	.paging {
		color: black;
		width: 100%;
		align-items: center;
	}
	
	.page {
		color: black;
		padding: 6px;
		margin-right: 10px;
	}
	
	.paging-container {
		width: 100%;
		height: 70px;
		display: flex;
		margin-top: 50px;
		margin: auto;
		text-align: center;
	}
</style>
</head>
<body>



<!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp"%>

  <div class="container">
      <form action="https://search.naver.com/search.naver" method="GET">
        <div class="row mt-5 mb-4">
          <div class="col-10">
            <input name="query" type="text" class="form-control" placeholder="검색어 입력" aria-label="search"
              aria-describedby="button-addon2">
          </div>
          <div class="col-2">
            <button class="btn btn-success m-1" type="submit" id="button-addon2" style="width: 100%;">검색</button>
          </div>
        </div>
      </form>

      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">전체보기</button>
      </div>
      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">공지사항</button>
      </div>
      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">이벤트</button>
      </div>
      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">강좌</button>
      </div>
      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">동아리</button>
      </div>
      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">FAQ</button>
      </div>
        
    </div>
  
        <table class="table table-hover">
            <h1 class="pb-5" style="margin-top:30px">${param.type }</h1>
            
            <select class="form-select mt-1" aria-label="Default select example"
	          style="width: 10%; float: right;">
	          <option selected>정렬기준</option>
	          <option value="1">최신순</option>
	          <option value="2">조회순</option>
	          <option value="3">인기순</option>
        	</select>

			
	            <thead>
	                <tr>
	                    <th colspan="4" scope="col">전체보기</th>
	                </tr>
	            </thead>
	            <tbody>
	            <c:set var ="type" value ="${param.type}"/>
	            	<input type="hidden" name="type" value="${param.type}" />
 	            		<c:choose>
	            			<c:when test="${fn:contains(type, '공지사항')}" >
					     		<c:forEach var="BoardDto" items="${noticeList }">
							     	<tr>
							        <th scope="row">
							        	<a href="<c:url value="/board/post" />">${BoardDto.article_title }</a>
									</th>
							        <td>${BoardDto.user_id }</td>
							        <td>${BoardDto.article_date }</td>
							        <td>${BoardDto.article_viewcnt }</td>
							        <tr>
						 		</c:forEach>
							</c:when>
							<c:when test="${fn:contains(type, '이벤트')}" >
							    <c:forEach var="BoardDto" items="${eventList }">
							      	<tr>
							        <th scope="row">
							        	<a href="<c:url value="/board/post" />">${BoardDto.article_title }</a>
									</th>
							        <td>${BoardDto.user_id }</td>
							        <td>${BoardDto.article_date }</td>
							        <td>${BoardDto.article_viewcnt }</td>
							        <tr>
						 		</c:forEach>
						 	</c:when>
						 	<c:when test="${fn:contains(type, '동아리')}" >
							    <c:forEach var="ClubDto" items="${clubList }">
							      	<tr>
							        <th scope="row">
							        	<a href="<c:url value="/board/post" />">${ClubDto.club_title }</a>
									</th>
							        <td>${ClubDto.club_master_id }</td>
							        <td>${ClubDto.club_info }</td>
							        <td>${ClubDto.club_create_time }</td>
							        <tr>
						 		</c:forEach>
						 	</c:when>
						 	<c:when test="${fn:contains(type, '강좌')}" >
							    <c:forEach var="CourseDto" items="${courseList }">
									<tr>
									<th scope="row">
										<a href="<c:url value="/board/post" />">${CourseDto.course_nm } </a>
									</th>
									<td>${CourseDto.user_id }</td>
									<td>${CourseDto.course_day }</td>
									<td>${CourseDto.course_cost }원</td>
									<tr>
								</c:forEach>
						 	</c:when>
						 </c:choose>
	            </tbody>
           
        </table>


 	<div class="paging-container">
		<div class="paging">
			<c:if test="${totalCnt == null || totalCnt == 0 }">
				<div>게시물이 없습니다.</div>
			</c:if>
			<c:if test="${totalCnt != null || totalCnt != 0 }">
				<c:if test="${pr.showPrev }">
					<a class="page"
						href="<c:url value="/search/all${pr.sc.getQueryString(pr.beginPage-1) }" />">
						&lt; </a>
				</c:if>
				<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
					<a class="page"
						href="<c:url value="/search/all${pr.sc.getQueryString(i)}" />">${i }</a>
				</c:forEach>
				<c:if test="${pr.showNext }">
					<a class="page"
						href="<c:url value="/search/all${pr.sc.getQueryString(pr.endPage+1) }" />">
						&gt; </a>
				</c:if>
			</c:if>
		</div>
	</div>

	<div class="bottomsearch d-flex" style="margin-left: 20%; margin-top:50px";">
                <select class="form-select form-select-sm" aria-label=".form-select-sm example"
                    style=" width: 90px; margin-right: 10px;">
                    <option value="1">제목</option>
                    <option value="2">작성자</option>
                </select>
                <input type="text" class="form-control" aria-label="title" aria-describedby="basic-addon1" style="width:500px;">
                <button type="button" class="btn btn-primary" style="margin-left: 10px;">검색</button>
            </div>
        </div>
  <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
  
</body>

</html>