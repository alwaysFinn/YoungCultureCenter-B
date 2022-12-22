<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="loginId" value="${sessionScope.id }" />

<!DOCTYPE html>
<html>
<head>	
  <!-- head & meta tag include -->
  <%@include file="/WEB-INF/views/metahead.jsp"%>
	
	<link href="/ycc/resources/css/locker.css" rel="stylesheet">
	
	<title>사물함 신청</title>
</head>
<body>
  <!-- header include -->
  <%@include file="/WEB-INF/views/header.jsp"%>
  
  <div class="container mt-5">
    <h2>사물함 신청</h2>
    <hr>
	  <div class="pt-5 d-grid" style="overflow-x:auto; border: 1px solid #4f565d;">
	    <ol>
	      <li class="row">
	        <ol class="lockers">
	          <c:forEach var="i" begin="0" end="9">
	        		<li class="locker">
		            <input class="locker_id" type="checkbox" id="${i+1 }" name="locker_id" onclick="checkOnlyOne(this)" 
		            	<c:forEach var="j" begin="0" end="9">
		            		${rsvList[j].locker_id == list[i].locker_id ? 'disabled' : ''}
		            	</c:forEach>
		             value="${list[i].locker_id }" /> 
		            <label for="${i+1 }">${list[i].locker_no }</label>
	          	</li>
	        	</c:forEach>
	        </ol> 
	      </li> 
	      <li class="row"> 
	        <ol class="lockers"> 
	          <c:forEach var="i" begin="10" end="19"> 
	        		<li class="locker"> 
		            <input type="checkbox" id="${i+1 }" name="locker_id" onclick="checkOnlyOne(this)" 
		            	<c:forEach var="j" begin="0" end="19">
		            		${rsvList[j].locker_id == list[i].locker_id ? 'disabled' : ''}
		            	</c:forEach> 
		            value="${list[i].locker_id }" /> 
		            <label for="${i+1 }">${list[i].locker_no }</label> 
	          	</li>
	        	</c:forEach>
	        </ol>
	      </li>
	      <li class="row">
	        <ol class="lockers">
	        	<c:forEach var="i" begin="20" end="29">
	        		<li class="locker">
		            <input type="checkbox" id="${i+1 }" name="locker_id" onclick="checkOnlyOne(this)" 
		            	<c:forEach var="j" begin="0" end="29">
		            		${rsvList[j].locker_id == list[i].locker_id ? 'disabled' : ''}
		            	</c:forEach> 
		            value="${list[i].locker_id }" /> 
		            <label for="${i+1 }">${list[i].locker_no }</label>
	          	</li>
	        	</c:forEach>
	        </ol>
	      </li>
	      <li class="row">
	        <ol class="lockers">
	        	<c:forEach var="i" begin="30" end="39">
	        		<li class="locker">
		            <input type="checkbox" id="${i+1 }" name="locker_id" onclick="checkOnlyOne(this)" 
		            	<c:forEach var="j" begin="0" end="39">
		            		${rsvList[j].locker_id == list[i].locker_id ? 'disabled' : ''}
		            	</c:forEach> 
		            value="${list[i].locker_id }" /> 
		            <label for="${i+1 }">${list[i].locker_no }</label>
	          	</li>
	        	</c:forEach>
	        </ol>
	      </li>
	    </ol>
	    
	    <!-- 좌석 선택 정보 이미지 -->
		  <div class="p-2 text-end">
		    <div>
	        사용가능
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" style="fill: #39adffed;" class="bi bi-square-fill" viewBox="0 0 16 16">
	          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z"></path>
	        </svg>
		    </div>
		    <div>
	        사용중
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" style="fill: #dddddd" class="bi bi-square-fill" viewBox="0 0 16 16">
	          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z"></path>
	        </svg>
		    </div>
		    <div>
	        선택
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" style="fill: #bada55;" class="bi bi-square-fill" viewBox="0 0 16 16">
	          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z"></path>
	        </svg>
		    </div>
		  </div>
	  </div>
    
    <div class="row mt-3 text-center g-2 align-middle">
	    <table class="col-lg-4">
	    	<colgroup>
	    		<col width=35%>
	    	</colgroup>
	    	<tr>
	    		<th>사물함 위치</th>
	    		<td class="text-start">
		    		<form id="locationForm">
		    			<select class="form-select w-auto d-inline" id="location" name="locker_location_id">
				      	<c:forEach var="i" begin="0" end="${locList.size()-1 }">
				      		<option class="d-grid d-md-block" id="loc_id" value="${locList[i].locker_location_id }" 
				      		${param.locker_location_id == locList[i].locker_location_id ? 'selected' : '' }>
				      			${locList[i].location_name }
				      		</option>
				      	</c:forEach>
					    </select>
					    <button class="btn btn-primary" id="selectLockerLoc">조회</button>
		    		</form>
				  </td>
				</tr>
			</table>
			<table class="col-lg-4">
				<colgroup>
	    		<col width=35%>
	    	</colgroup>
				<tr>
				  <th>시작일</th>
				  <td class="d-grid d-md-block"><input type="date" class="form-control w-auto" id="startDate1" onchange="selectSDate()" /></td>
				</tr>
			</table>
			<table class="col-lg-2">
				<colgroup>
	    		<col width=35% class="text-start">
	    	</colgroup>
				<tr>
				  <th>기간</th>
				  <td class="d-grid d-md-block">
				  	<select class="form-select w-auto" id="period">
			      	<option>선택</option>
			      	<option value="7">7일</option>
			      	<option value="15">15일</option>
			      	<option value="30">30일</option>
			      </select>
			    </td>
				</tr>
			</table>
			<table class="col-lg-2">
				<tr>
					<td><button type="button" id="sendBtn" class="btn btn-primary">확인</button></td>
				</tr>
			</table>
    </div>
    
    <c:if test="${loginId == rsvStat[0].user_id && loginId != null }">
	    <div class="mt-5">
		    <h4>나의 예약 현황</h4>
		    <hr>
		    <table class="table table-bordered text-center w-100">
		    	<thead class="bg-light">
		    		<tr class="align-middle">
		    			<th>사물함 번호</th>
		    			<th>사물함 위치</th>
		    			<th>예약자</th>
		    			<th>기간</th>
		    			<th>금액</th>
		    			<th>상태</th>
		    		</tr>
					</thead>
					<tbody>
						<c:forEach var="rsvStat" items="${rsvStat }">
							<tr class="align-middle">
								<td>${rsvStat.locker_no }</td>
								<td>${rsvStat.location_name }</td>
								<td>${rsvStat.user_id }</td>
								<td>${rsvStat.locker_start_date } <br/> ~ ${rsvStat.locker_end_date }</td>
								<td>${rsvStat.locker_cost }</td>
								<td>비고</td>
							</tr>
						</c:forEach>
					</tbody>
		    </table>
	    </div>
    </c:if>
	</div>
	
  
  <!-- Modal -->
  <form id="formM">
	  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" 
	  tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title " id="staticBackdropLabel">정보 확인 안내</h4>
	        </div>
	        <div class="modal-body text-center">
	          <div class="d-flex justify-content-center">
	            <table class="table table-bordered" style="vertical-align: middle">
	            	<colgroup>
	            		<col width=50%>
	            		<col width=50%>
	            		<col width=50%>
	            		<col width=50%>
	            		<col width=50%>
	            		<col width=50%>
	            	</colgroup>
	            	<tbody>
	                <tr>
	                  <th>이름</th>
	                  <td hidden><input name="user_id" value="${sessionScope.id }" readonly /></td>
	                  <td><input class="form-control-plaintext" value="${sessionScope.name }" readonly /></td>
	                </tr>
	                <tr>
	                  <th>사물함번호</th>
	                  <td hidden><input id="lockerId" name="locker_id" readonly /></td>
	                  <td><input class="form-control-plaintext" id="lockerNum" readonly /></td>
	                </tr>
	                <tr>
	                  <th>사물함 위치</th>
	                  <td hidden><input id="lockerLocationId" readonly /></td>
	                  <td><input class="form-control-plaintext" id="lockerLocation" readonly /></td>
	                </tr>
	                <tr>
	                  <th>시작일</th>
	                  <td><input class="form-control-plaintext" id="startDateM" name="locker_start_date" readonly /></td>
	                </tr>
	                <tr>
	                  <th>종료일</th>
	                  <td><input class="form-control-plaintext" id="endDateM" name="locker_end_date" readonly /></td>
	                </tr>
	                <tr>
	                  <th>결제금액</th>
	                  <td><input class="form-control-plaintext" id="lockerCostM" name="locker_cost" readonly /></td>
	                </tr>
	            	</tbody>
	            </table>
	          </div>
	          <p>해당 정보가 맞으십니까?</p>
	        </div>
	        <div class="modal-footer text-center">
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	          <button type="button" class="btn btn-primary" id="reservationBtn">결제</button>
	        </div>
	      </div>
	    </div>
	  </div>
  </form>
  
  <script type="text/javascript">
  	let msg = "${msg}"
		if(msg == "NO_DUPLICATE") alert("중복 예약은 불가합니다.\n나의 예약현황을 확인해주세요.")
  </script>
  
  <script type="text/javascript">
  	$("#selectLockerLoc").on("click", function() {
  		let form = $("#locationForm")
  		for(let i=0; i<${locList.size()}; i++) {
  			if($('#location').val() == '${locList[i].locker_location_id}') {
  				form.attr("action", "<c:url value='/rental/locker?${locList[i].locker_location_id}' />")
  				form.attr("method", "GET")
  				return form.submit()
  			}
  		}
		})
  
  	// checkbox 중복 체크 방지
    function checkOnlyOne(element) {
      const checkboxes = document.getElementsByName("locker_id")
      
      checkboxes.forEach((cb) => { cb.checked = false })
      element.checked = true
      
      $('#lockerNum').attr("value", element.getAttribute("id"))
      $("#lockerId").attr("value", element.getAttribute("value"))
    }
    
  	// modal창에 값 전달하기
  	// 장소 전달
		$("#location").on("click", function() {
			console.log(${param.locker_location_id})
			console.log($("#location option:selected").text().trim())
			$("#lockerLocation").attr("value", $("#location option:selected").text().trim())
		})
		
		// 시작일 전달
		function selectSDate() {
			console.log($("#startDate1").val())
			$("#startDateM").attr("value", $("#startDate1").val())
		}
  	
  	// 종료일 전달(시작일 + 기간) onchange로 변경할 것 or 
  	$("#sendBtn").click(function() {
  		let session = '${loginId }'
  		if(session == null || session == ''){
  			alert("로그인이 필요합니다.")
  			return false
  		}
  		
  		let startDe = new Date($("#startDate1").val())
  		var period = $("#period").val()
  		period = Number(period) 
  		let end_Date = new Date(startDe.setDate(startDe.getDate()+period))
  		let cost = Number(period * 1000)
  		
  		$("#lockerLocationId").attr("value", ${param.locker_location_id})
  		$("#lockerLocation").attr("value", $("#location option:selected").text().trim())
  		$("#endDateM").attr("value", dateFormat(end_Date))
  		$("#lockerCostM").attr("value", cost)
  		
  		$("#staticBackdrop").modal('show')
		})
		
		function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;

        return date.getFullYear() + '-' + month + '-' + day;
    }
  	
  	$("#reservationBtn").on("click", function() {
			let form = $("#formM")
			
			form.attr("action", "<c:url value='/rental/locker/reservation' />")
			form.attr("method", "POST")
			form.submit()
		})

	  // 클래스 변경
	  function changeClassName() {
	    document.getElementById("location").classList.replace("col-md-4", "col-md-2")
	  }
	
	  function changeClassName2() {
	    document.getElementById("location").classList.replace("col-md-2", "col-md-4")
	  }
	
	  window.onresize = function (event) {
	    var innerWidth = window.innerWidth
	    innerWidth <= "1280" ? changeClassName() : changeClassName2()
	  }
  </script>	
  	
	<!-- footer include -->
	<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>