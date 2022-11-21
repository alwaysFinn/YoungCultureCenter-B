<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>	  
<title>Young문화센터 - 통합검색</title>
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
      <select class="form-select form-select-sm" aria-label=".form-select-sm example"
        style="width: 90px; margin-right: 10px;">
        <option value="1">최신순</option>
        <option value="2">조회순</option>
        <option value="3">관련순</option>
      </select>
    	</div>
      
    </div>

    <table class="table table-hover">
      <h1>전체보기</h1>
    	 <button style="float: right;" type="button" name="moreBtn" class="btn btn-write">더보기</button>
	     <table class="table table-hover">
		      <c:forEach var="BoardDto" items="${allList }">
			      <tr>
			        <th scope="row">${BoardDto.article_title }</th>
			        <td>${BoardDto.user_id }</td>
			        <td>${BoardDto.article_date }</td>
			        <td>112</td>
			       <tr>
			  </c:forEach>
	   		</table>
    </table>

    <hr>
    <div>
      <h1>공지사항</h1>
      		<form action="<c:url value="/search/all?type=${noticeList[0].article_board_type }" />">
      		<input type="hidden" name="type" value="${noticeList[0].article_board_type }" />
	  		<input style="float: right;" class="btn btn-write" type="submit" value="더보기" />
	  		<table class="table table-hover">
<  		  		<c:forEach var="BoardDto" items="${noticeList }">
				      <tr>
				        <th scope="row">${BoardDto.article_title }</th>
				        <td>${BoardDto.user_id }</td>
				        <td>${BoardDto.article_date }</td>
				        <td>112</td>
				       <tr>
				</c:forEach>
	   		</table>
    		</form>
	</div>	
		
    <hr>
    <table class="table table-hover`">
      <h1>이벤트</h1>
      <button style="float: right;" type="button" name="moreBtn" class="btn btn-write">더보기</button>
      <c:forEach var="BoardDto" items="${eventList }">
	      <tr>
	        <th scope="row">${BoardDto.article_title }</th>
	        <td>${BoardDto.user_id }</td>
	        <td>${BoardDto.article_date }</td>
	        <td>112</td>
	       <tr>
	    </c:forEach>
    </table>
    <hr class="pb-5">
  </div>
  <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
  
</body>

</html>