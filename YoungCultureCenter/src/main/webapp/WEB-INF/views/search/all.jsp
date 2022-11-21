<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>	
<title>Young문화센터 - 전체보기</title>
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

    <div class="row pt-3" style="text-align: center; justify-content: space-between;">
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
            <h1 class="pb-5" style="margin-top:30px">전체보기</h1>
            
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
	            <%-- <input type="hidden" name="type" value="${param.type}" /> --%>
				     <c:forEach var="BoardDto" items="${noticeListAll }">
					      <tr>
					        <th scope="row">${BoardDto.article_title }</th>
					        <td>${BoardDto.user_id }</td>
					        <td>${BoardDto.article_date }</td>
					        <td>112</td>
					       <tr>
					 </c:forEach>
	            </tbody>
           
        </table>
        
        <div id="commentList"></div>
        
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">다음</a>
                    </li>
                </ul>
            </nav>

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