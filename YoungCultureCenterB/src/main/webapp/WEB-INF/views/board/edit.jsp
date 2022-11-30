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
<!--summernote-->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css"> <!-- header-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<style type="text/css">
@media(min-width:387px) {
	#d-none {
		display: none;
	}
}
</style>
    
<title>Young문화센터 - 게시글 수정</title>
</head>
<body>
 <!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp"%>
  
	<div class="container mt-5">
	    <!-- 제목 -->
		<h2 class="writing-header">공지사항</h2>
		<form id="form" class="frm" action="" method="post"> 
			<div class="card mb-4">
				<div class="card-body">
					<!-- 게시글 정보 -->
	    			<input type="hidden" name="article_id"  value="${boardDto.article_id }"> 		<!--값 받아오는 곳 -->
					<input type="text" class="title" name="article_title" value="${boardDto.article_title }" />
					<p class="writingInfo">작성자 : ${boardDto.user_id} |
						게시일 : <fmt:formatDate value="${boardDto.article_date }" pattern="yyyy-MM-dd" type="date"/> 
						| 조회수 : ${boardDto.article_viewcnt }
					</p>
					<!-- 내용 -->
					<textarea class="summernote mb-3" id="article_contents" name="article_contents" >
                	${boardDto.article_contents}</textarea>   					
				</div>
			 </div>                       
	         <div class="mt-2 text-end">
	         	<button type="button" class="btn btn-outline-secondary" id="noticeBtn" name="noticeBtn">목록</button>
	            <button type="button" class="btn btn-outline-success" id="regBtn" name="regBtn">등록</button>
	            <input type="hidden" name="boardDto" value="${boardDto}"> 
	         </div>
	    </form>
    </div>

<script type="text/javascript">
	$('.summernote').summernote({
	    height: 400,
	    lang: "ko-KR"
	});

	$(document).ready(function(){
	    
		 $("#noticeBtn").on("click", function() { 
				let form = $("#form")
				form.attr("action","<c:url value='/board/notice'/>")
				form.attr("method", "get")
				form.submit()
			})	
		
	    $("#regBtn").on("click", function() { <!-- 목록 및 등록 버튼 js추가 -->
			if(!confirm("정말로 등록하시겠습니까?")) return;
			
			let form = $("#form")
			form.attr("action","<c:url value='/board/edit1${searchItem.queryString}' />")
			form.attr("method", "post")
			form.submit()
		})	
	})
</script>    

    <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>