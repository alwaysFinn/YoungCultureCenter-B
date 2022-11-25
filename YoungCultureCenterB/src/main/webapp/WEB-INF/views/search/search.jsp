<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>	  
<title>Young문화센터 - 통합검색</title>
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

<body>

<script type="text/javascript">

/* 	$(document).ready(function() {
		
		let article_board_type = $("input[name=type]").val(); 
		alert(article_board_type)
		
	}) */

</script>


  <div class="container">
    <div class="container">
      <form action="<c:url value="/search" />" class="search-form" method="get">
        <!-- <div class="row mt-5 mb-4"> -->
         <div class="col-10">
            <input name="keyword" type="text" class="form-control" value="${param.keyword }" placeholder="검색어 입력" aria-label="search"
              aria-describedby="button-addon2">
       	 </div>
         <div class="col-2">	
            <button class="btn btn-success m-1" type="submit" id="button-addon2" style="width: 100%;">검색</button>
         </div> 
          </form>
        </div>
    </div>

    <div class="row pb-4" style="text-align: center; justify-content: space-between;">
      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">전체보기</button>
      </div>
      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">공지사항</button>
      </div>
      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">이벤트</button>
      </div>
      <div class="col-4 col-md-2 pt-2">
        <button type="button" class="btn btn-primary">강좌</button>
      </div>
      <div class="col-4 col-md-2 pt-2">
        <button type="button" class="btn btn-primary">동아리</button>
      </div>
      <div class="col-4 col-md-2 pt-2">
        <button type="button" class="btn btn-primary">FAQ</button>
      </div>
      <div class="input-group ms-auto pt-2" style="width: 20%;">
      <form id="frm" action="<c:url value="/search" />" class="search-form" method="get">
      	<input name="keyword" type="hidden" value="${param.keyword }" />
 	      <select class="form-select form-select-sm" name="array" aria-label=".form-select-sm example"
	        style="width: 90px; margin-right: 10px;">
	        <option value="A" ${pr.sc.array=='A' || pr.sc.array=='' ? "selected" : ""} >정확도순</option>
	        <option value="V" ${pr.sc.array=='V' ? "selected" : ""}>조회순</option>
	        <option value="N" ${pr.sc.array=='N' ? "selected" : ""}>최신순</option>
	      </select>
	     <input type="submit" class="search-button" value="정렬" >	
      </form>
    	</div>
      
    </div>

	<div class="p-5	">
      <h1 class="text-start mt-5">전체 검색결과</h1>
 
      <h3 class="text-start mt-5">공지사항</h3>
      <hr>
      <div class="p-3">
      	<form action="<c:url value="/search/all?type=${noticeList[0].article_board_type }" />">
<%--       	<h1>${totalCnt }</h1> --%>
      		<input type="hidden" name="type" value="${noticeList[0].article_board_type }" />
		    <input type="hidden" name="keyword" value="${param.keyword }" /> 
<%--       		<c:choose>
				<c:when test="${totalCnt == null || totalCnt == 0 }">
					<div>검색결과가 없습니다.</div>
				</c:when>
				<c:otherwise> --%>
			  		<input style="float: right;" class="btn btn-write" type="submit" value="더보기" />
			  		<table class="table table-hover mt-3">
					<colgroup>
						<col width=46%>
						<col width=17%>
						<col width=15%>
						<col width=22%>
					</colgroup>
					<thead>
			          <tr>
			            <th scope="col">제목</th>
			            <th scope="col">작성자</th>
			            <th scope="col">작성일</th>
			            <th scope="col">조회수</th>
			          </tr>
			        </thead>
					<tbody>
					<c:forEach var="BoardDto" items="${noticeList }">
						<tr>
						<th scope="row"><a href="<c:url value="/board/post" />">
						${BoardDto.article_title } </a></th>
						<td>${BoardDto.user_id }</td>
						<td>${BoardDto.article_date }</td>
						<td>${BoardDto.article_viewcnt }</td>
						</tr>
					</c:forEach>
					</tbody>
					</table>
				<%-- </c:otherwise>
			</c:choose> --%>
    	</form>
    </div>	
    
      <h3 class="text-start mt-5">이벤트</h3>
      <hr>
      <div class="p-3">
      	<form action="<c:url value="/search/all?type=${eventList[0].article_board_type }" />">
      		<input type="hidden" name="type" value="${eventList[0].article_board_type }" />
		    <input type="hidden" name="keyword" value="${param.keyword }" />
<%--       		<c:choose>
				<c:when test="${totalCnt == null || totalCnt == 0 }">
					<div>검색결과가 없습니다.</div>
				</c:when>
				<c:otherwise> --%>
			  		<input style="float: right;" class="btn btn-write" type="submit" value="더보기" />
			  		<table class="table table-hover mt-3">
					<colgroup>
						<col width=46%>
						<col width=17%>
						<col width=15%>
						<col width=22%>
					</colgroup>
					<thead>
			          <tr>
			            <th scope="col">제목</th>
			            <th scope="col">작성자</th>
			            <th scope="col">작성일</th>
			            <th scope="col">조회수</th>
			          </tr>
			        </thead>
					<tbody>
					<c:forEach var="BoardDto" items="${eventList }">
						<tr>
						<th scope="row"><a href="<c:url value="/board/post" />">
						${BoardDto.article_title } </a></th>
						<td>${BoardDto.user_id }</td>
						<td>${BoardDto.article_date }</td>
						<td>${BoardDto.article_viewcnt }</td>
						<tr>
					</c:forEach>
					</tbody>
					</table>
<%-- 				</c:otherwise>
			</c:choose> --%>
    	</form>
    </div>	
    
          <h3 class="text-start mt-5">동아리</h3>
      <hr>
      <div class="p-3">
      	<c:set var="club" value ="동아리" />
      		<form action="<c:url value="/search/all?type=${club }" />">
      		<input type="hidden" name="type" value="${club }" />
      		<input type="hidden" name="keyword" value="${param.keyword }" />
<%--       		<c:choose>
				<c:when test="${totalCnt == null || totalCnt == 0 }">
					<div>검색결과가 없습니다.</div>
				</c:when>
				<c:otherwise> --%>
	  				<input style="float: right;" class="btn btn-write" type="submit" value="더보기" />
			  		<table class="table table-hover mt-3">
					<colgroup>
					<col width=40%>
					<col width=15%>
					<col width=15%>
					<col width=15%>
					<col width=15%>
				</colgroup>
				<thead>
		          <tr>
						<col width=46%>
						<col width=17%>
						<col width=15%>
						<col width=22%>
		          </tr>
		        </thead>
		        <tbody>
  		  		<c:forEach var="ClubDto" items="${clubList }">
				      <tr>
				        <th scope="row"><a href="<c:url value="/board/post" />">
							${ClubDto.club_title }
							</a>
						</th>
				        <td>${ClubDto.club_master_id }</td>
				        <td>${ClubDto.club_info }</td>
				        <td>${ClubDto.club_create_time }</td>
				       </tr>
				</c:forEach>
				</tbody>
				</table>
<%-- 				</c:otherwise>
			</c:choose> --%>
    	</form>
    </div>
    
              <h3 class="text-start mt-5">강좌</h3>
      <hr>
      <div class="p-3">
      	<c:set var="course" value ="강좌" />
      		<form action="<c:url value="/search/all?type=${course }" />">
      		<input type="hidden" name="type" value="${course }" />
      		<input type="hidden" name="keyword" value="${param.keyword }" />
<%--       		<c:choose>
				<c:when test="${totalCnt == null || totalCnt == 0 }">
					<div>검색결과가 없습니다.</div>
				</c:when>
				<c:otherwise> --%>
	  				<input style="float: right;" class="btn btn-write" type="submit" value="더보기" />
			  		<table class="table table-hover mt-3">
					<colgroup>
						<col width=46%>
						<col width=17%>
						<col width=15%>
						<col width=22%>
					</colgroup>
				<thead>
		          <tr>
		            <th scope="col">강좌명</th>
		            <th scope="col">강사명</th>
		            <th scope="col">수강일</th>
		            <th scope="col">수강료</th>
		          </tr>
		        </thead>
		        <tbody>
  		  		<c:forEach var="CourseDto" items="${courseList }">
				      <tr>
				        <th scope="row"><a href="<c:url value="/board/post" />">
							${CourseDto.course_nm }
							</a>
						</th>
				        <td>${CourseDto.user_id }</td>
				        <td>${CourseDto.course_day }</td>
				        <td>${CourseDto.course_cost }원</td>
				       <tr>
				</c:forEach>
				</tbody>
				</table>
<%-- 				</c:otherwise>
			</c:choose> --%>
    	</form>
    </div>

    		
      
	 </div>

<div class="paging-container">
		<div class="paging">
			<c:if test="${totalCnt == null || totalCnt == 0 }">
				<div>게시물이 없습니다.</div>
			</c:if>
		</div>
	</div>

	<hr class="pb-5">
  <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
  
</body>

</html>