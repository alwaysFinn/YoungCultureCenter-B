<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head & meta tag include -->
	<%@include file="/WEB-INF/views/metahead.jsp" %>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" href="/ycc/resources/css/datepicker.css">
	<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="/ycc/resources/js/jquery-ui.js"></script>
	
	<!-- <script src="/ycc/resources/js/bootstrap-datepicker.js"></script> -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->

    
    <title>Young문화센터 - 대관신청</title>
    <style>
	    td { text-align: center; }
	    .ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight {background: #ffc107;}
	    .wrap-slider > h4 {
	        margin: 0 0em;
		    line-height: 16px;
		    font-size: 14px;
		    padding: 0px;
		    font-weight: bold;
	    }
	    
    </style>
</head>

<body>
<!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp" %>

<div class="container">
	<div class="rentalnotice  border border-dark" style="margin: 20px auto 30px auto">
		<ol class="fs-7">
			<h3>대관 신청 시 주의사항</h3>
			<li>대관 현황 메뉴에서 사용하시고자 하는 시간과 공간의 예약 현황을 먼저 확인하신 후 대관 신청해주십시오.</li>
			<li>사용자가 사용예정일포함 4일 전에 계약 해지를 서면으로 통보하여 승인을 얻은 경우 납부액의 100% 환불이 가능합니다.</li>
			<li>회비 및 참가비가 있는 수익성 사업이나 공연(1~2인 소규모 공연도 해당)이 포함된 행사 및 정치ㆍ종교성 행사는 대관할 수 없습니다.</li>
			<li>대관료는 대관 희망일 포함 4일 전까지 입금 해주셔야 하며, 입금하지 않은 행사는 대관 취소 처리되어 사용이 불가능합니다.</li>
			<li>행사 시 음식물이 포함된 케이터링은 불가합니다. (김밥, 샌드위치, 햄버거 등 냄새가 많이 나는 음식물 반입 불가)</li>
		</ol>
	</div>

	<div>
		<h5>대관 장소 선택</h5>
		<select id="pickplace" name="croom_id" onchange="placeSelect()">
									<option value="">장소 선택</option>
									<optgroup label="외부">
										<!-- 외부 location code = 0 -->
										<c:forEach var="result" items="${placelist }">
											<option value="${result.croom_id}" <c:if
												test="${result.croom_location ne '외부'}">hidden</c:if>
												>${result.croom_name}</option>
										</c:forEach>
									</optgroup>
									<optgroup label="1층">
										<!-- 1층 location code = 1 -->
										<c:forEach var="result" items="${placelist }">
											<option value="${result.croom_id}" <c:if
												test="${result.croom_location ne '1층'}">hidden</c:if>
												>${result.croom_name}</option>
										</c:forEach>
									</optgroup>
									<optgroup label="2층">
										<!-- 2층 location code = 2 -->
										<c:forEach var="result" items="${placelist }">
											<option value="${result.croom_id}" <c:if
												test="${result.croom_location ne '2층'}">hidden</c:if>
												>${result.croom_name}</option>
										</c:forEach>
									</optgroup>
									<optgroup label="3층">
										<!-- 3층 location code = 3 -->
										<c:forEach var="result" items="${placelist }">
											<option value="${result.croom_id}" <c:if
												test="${result.croom_location ne '3층'}">hidden</c:if>
												>${result.croom_name}</option>
										</c:forEach>
									</optgroup>
		</select>                 
			<label for="datetime-local">
				<h5>대여 일자 지정</h5>
			</label> 
			<input type="text" id="datetime-local" name="prental_de">   
			<button id="viewBtn" >조회하기</button>
	</div>

	<div class="row mb-3">
		<div class="col-12 col-md-6 " id="change">
			<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
				<div class="embed-responsive embed-responsive-4by3">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="<%=request.getContextPath()%>/resources/img/rental/1f.jpg"
								class="d-block w-100 embed-responsive-item" alt="1층 시설 안내">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/resources/img/rental/2f.jpg"
								class="d-block w-100 embed-responsive-item" alt="2층 시설 안내">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/resources/img/rental/3f.jpg"
								class="d-block w-100 embed-responsive-item" alt="3층 시설 안내">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/resources/img/rental/4f.jpg"
								class="d-block w-100 embed-responsive-item" alt="4층 시설 안내">
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">이전</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">다음</span>
				</button>
			</div>
		</div>

		<!-- 시간 테이블 -->
		<div id="timeTable" class="col-12 col-md-6" style="text-align: center;">
		</div>

	</div>

	<div class="container">
		<!--대관 장소 선택 시작-->
		<br>
		<hr>
		<br>
		<!-- Button trigger modal -->
		<button type="button" id="modalBtn" class="btn btn-primary " data-bs-toggle="modal"
			data-bs-target="#exampleModal">예약하기</button>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">정보확인 안내</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
					<form>
						<table class="table">
							<tr>
								<h4>대여 장소</h4>
								<img src="<%=request.getContextPath()%>/resources/img/rental/auditorium.jpg"
									class="img-fluid">
							</tr>
							<tr>
								<th>이름</th><!-- user_id = sessionScope.id -->
								<td id="customer" colspan="3">${sessionScope.name }</td>
							</tr>
							<tr>
								<th>시설명</th> <!-- =croom_name -->
								<td id="Chkplace" colspan="3">
								</td>
							</tr>
							<tr>
								<th>예약 날짜</th><!-- = prental_de -->
								<td id="Chkdate" colspan="3" onchange="printDate()">
								</td>
							</tr>
							<tr>
								<th>예약 시간</th><!-- = prental_time_info -->
								<td id="Chktime" colspan="3" onchange="">
									<!-- onchange 안에 새로운 함수 넣을 것 -->
									<!-- 대관 테이블(하단)에서 체크박스로 체크한 시간들(1,2,...) -->
								</td>
							</tr>
							<tr>
								<th>결제 금액</th>
								<td colspan="3" onchange="">
									10000원
								</td>
							</tr>
						</table>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="renBtn">확인</button>
					<!-- 확인 버튼 누를 시 모달에서 보여준 값들 DB로 넘어감 -->
				</div>
			</div>
		</div>
	</div>
					
<script type="text/javascript">
/* const url = new URL(window.location.href)	//현재 페이지의 url 객체 생성
const urlOrigin = url.origin;		//url의 파라미터를 가져옴 */
//let cookieCroomID = ${cookie.croom_id.value }
/* let cookieDate = ${cookie.date.value }
console.log(cookieDate) */

var referrer = document.referrer
console.log(referrer)	
let closedDate = []

/* var url = window.location.href
console.log(url) */
if (referrer == "http://localhost:8080/ycc/login?toURL=http://localhost:8080/ycc/rental/place") {
	alert("referrer") 
	//$("#pickplace").val(cookieCroomID).prop("selected", true);
	//$("#datetime-local").val(cookieCroomID).prop("selected", true);
}

function nullCheck() {
	const date = document.getElementById("datetime-local").value
	const croom_id = document.getElementById("pickplace").value
	
	if(date == null || croom_id == null) {
		alert("값을 선택해주세요")
	}
}




$("#datetime-local").datepicker({
	
	//$('.ui-datepicker-calendar').html(toPrintTest)
	 		beforeShowDay: function(date){
			       var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
			       return [ closedDate.indexOf(string) == -1 ]
			},
			daysOfWeekDisabled: [0],   //Disable sunday
/* 			onSelect: function(e) {
				 e.preventDefault();
			} */
			dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear: true,
			yearSuffix: '년',
			minDate: 0
})


//$('#datetime-local').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

function placeSelect() {
	var croom_id = document.getElementById("pickplace").value
	console.log(croom_id)
	
	// 배열 초기화
	filteredList.length = 0
	closedDate.length = 0
	
	$.ajax({
		type: 'get',			//요청 메서드
		url: '/ycc/rental/place.select',		//요청 URI
		headers: { "content-type" : "application/json" },		//요청 헤더
		dataType: 'json',	//전송받을 데이터의 타입(서버에서 반환되는 데이터 형식)
		data: {croom_id:croom_id},		//서버로 전송할 데이터. stringify()로 직렬화 필요
		success : function(data) {		//서버로부터 응답이 도착하면 호출될 함수
			console.log(data)
 			for(var i=0; i<data.placeList.length; i++) {
				infoDate.push(data.placeList[i].prental_de)
			}
			let infoDateSet = new Set(infoDate);
			const infoDateList = [...infoDateSet];
			
			for( var i = 0; i< data.placeList.length; i++ ) {
			function find(element) {
				if(element.prental_de === infoDateList[i]) {
					return true
				}
			}
			let filteredDate = data.placeList.filter(find)
			filteredList.push(filteredDate)
			}

			// filteredList의 빈 값 제거
			for(var i = 0; i < filteredList.length; i++){ 
				  if (filteredList[i].length === 0) { 
				    filteredList.splice(i, 1); 
				    i--; 
				  }
			}
			
			// filteredList의 배열 길이가 6이면 closedDate 리스트에 추가
 			for(var i = 0; i < filteredList.length; i++){ 
				  if (filteredList[i].length === 6) { 
					  closedDate.push(filteredList[i][0].prental_de)
				  }
			}
			console.log(filteredList)
			console.log(closedDate)
		},
		error : function(data) { 
			alert("error") 
			console.log(data) 
		}	//에러가 발생했을 때 호출될 함수
	}) 
}


// 로그인되어 있는지 체크
function loginCheck(){ 
		var id = '<%=(String)session.getAttribute("id")%>';
		var toURL = window.location.href
		/* var toURL = "http://localhost:8080/ycc/rental/place.send?croom_id=101&date=2022-12-15" */
		//var toURL = "http://localhost:8080/ycc/rental/place?croom_id=101&date=2022-12-15"
		//const date = document.getElementById("datetime-local").value
/* 			const date = toStringByFormatting(date1);
		console.log(date) */
		//const croom_id = document.getElementById("pickplace").value
		//console.log(croom_id)
		if(id=="null") { 
			window.location.replace("http://localhost:8080/ycc/login?toURL=" + toURL);
			return false
/*           	window.location.replace("http://localhost:8080/ycc/login?toURL="
				+ toURL + ".send?croom_id=" + croom_id + "&date=" + date); */
		}
		return true
} //loginCheck()

const area = document.getElementById('Chkplace')
area.innerHTML = document.getElementById("pickplace").value
const date = document.getElementById('Chkdate')
date.innerHTML = document.getElementById("datetime-local").value

let mergeInfo = []
let infoTimeList = []
let infoTimeObj = {}
let infoDate = []
let infoCroom = []
let filteredList = []
let total = []
/* infoTime.time1 = true
console.log(infoTime) */

// 시간테이블 출력
let toTimeList = function(data) {
	let tmp = ''
		tmp += '<table class="table table-striped">'
		tmp += '<thead>'
		tmp += '<tr>'
		tmp += '<th scope="col" style="text-align: center;">시간</th>'
		tmp += '<th scope="col" style="text-align: center;">예약</th>'
		tmp += '</tr>'
		tmp += '</thead>'
		tmp += '<tbody>'
		tmp += '<div>'
		tmp += '<tr id="time1"><td>08:10 ~ 10:00</td><td><input type="radio" name="time"></td></tr>'
		tmp += '<tr id="time2"><td>10:10 ~ 12:00</td><td><input type="radio" name="time"></td></tr>'
		tmp += '<tr id="time3"><td>12:10 ~ 14:00</td><td><input type="radio" name="time"></td></tr>'
		tmp += '<tr id="time4"><td>14:10 ~ 16:00</td><td><input type="radio" name="time"></td></tr>'
		tmp += '<tr id="time5"><td>16:10 ~ 18:00</td><td><input type="radio" name="time"></td></tr>'
		tmp += '<tr id="time6"><td>18:10 ~ 20:00</td><td><input type="radio" name="time"></td></tr>'
		tmp += '</div>'
	return tmp += ''
} 


$(document).ready(function(){
	
	nullCheck()
	//$('.ui-datepicker-calendar').html(divTag)
/* 	$.ajax({
		type: 'GET',
		url: '/ycc/rental/place.total', //수정요망
		headers: { 'content-type': 'application/json' },
		dataType: 'json',
		success : function(data) {
			console.log(data)	
		},
		error : function(data) { 
			alert("error") 
			
		}	
	}) */
	
	// 예약하기 버튼 눌렀을 때
	$("#renBtn").click(function(){
		
		const user_id = '<%=(String)session.getAttribute("id")%>';
		const date = document.getElementById("datetime-local").value
		const croom_id = document.getElementById("pickplace").value
		
		var timeList = {
			time1: $('#time1').children().first().text(),
			time2: $('#time2').children().first().text(),
			time3: $('#time3').children().first().text(),
			time4: $('#time4').children().first().text(),
			time5: $('#time5').children().first().text(),
			time6: $('#time6').children().first().text()
		};
		
		$('input:radio').each(function (index) {
			if($(this).is(":checked")==true){
				const checkedTime = $(this).parent().prev().text()
				console.log(checkedTime)
				for(var key in timeList) {
					console.log("key: ", key)
					console.log("value: ", timeList[key])
					if(checkedTime == timeList[key]) {
						timeList[key] = "true"
					} else {
						timeList[key] = "false"
					}
				}
			}
		})
		
		if (!confirm("예약하시겠습니까?")) {
			$('#exampleModal').modal('hide')
		} else {
			$.ajax({
				type: 'post',			//요청 메서드
				url: '/ycc/rental/place.do',		//요청 URI
				//headers: { "content-type" : "application/json" },		//요청 헤더
				//dataType: 'text',	//전송받을 데이터의 타입(서버에서 반환되는 데이터 형식)
				data: {user_id:user_id, date:date, croom_id:croom_id, timeList:JSON.stringify(timeList)},		//서버로 전송할 데이터. stringify()로 직렬화 필요
				success : function(data) {		//서버로부터 응답이 도착하면 호출될 함수
				},
				error : function(data) { 
					alert("error") 
					console.log(data) 
				}	//에러가 발생했을 때 호출될 함수
			}) 
			alert("예약이 완료되었습니다.")
			$('#exampleModal').modal('hide')
			window.location.reload() 
		}
	})
                        	
    // 조회하기 버튼 눌렀을 때                    	
	$("#viewBtn").click(function(){
		alert("viewBtn")
		var date = document.getElementById("datetime-local").value
		var croom_id = document.getElementById("pickplace").value
		const area = document.getElementById('Chkplace')
		$.ajax({
			type: 'GET',
			url: '/ycc/rental/place.send', //수정요망
			headers: { 'content-type': 'application/json' },
			data: {croom_id:croom_id , date:date},
			dataType: 'json',
			success: function(data){
				console.log(date)
				console.log(croom_id)
				area.innerHTML = $('option[value='+croom_id+']').first().text()
				console.log("option tag", $('option[value='+croom_id+']').first().text())
				if(closedDate.includes(date)) {
					alert("예약 가능한 시간이 없습니다.")
				}
				
				$("#timeTable").html(toTimeList(data))
				console.log(data.infoList)
				for(i in data.infoList) {
					if(data.infoList[i].time1 == true) {
						$("#time1").hide()
					} else if(data.infoList[i].time2 == true) {
						$("#time2").hide()
					} else if(data.infoList[i].time3 == true) {
						$("#time3").hide()
					} else if(data.infoList[i].time4 == true) {
						$("#time4").hide()
					} else if(data.infoList[i].time5 == true) {
						$("#time5").hide()
					} else {
						$("#time6").hide()
					}
				}
				
				/* area.innerHTML = document.getElementById("pickplace").value */
				const chkDate = document.getElementById('Chkdate')
				chkDate.innerHTML = document.getElementById("datetime-local").value
				console.log(closedDate)
			}	//success
		})       
	}) //viewBtn
    
	$("#exampleModal").on('show.bs.modal', function(e){
		loginCheck();
		if (loginCheck() == false) {
			e.preventDefault();
		}
	})
	$("#modalBtn").on("click", function(){
		$('input:radio').each(function (index) {
			if($(this).is(":checked")==true){
				const checkedTime = $(this).parent().prev().text()
				const time = document.getElementById('Chktime')
				time.innerHTML = checkedTime
			}
		})
	})                       	
	//현재 시간보다 이전의 시간은 선택할 수 없는 기능
	/* let dateElement = document.getElementById('datetime-local');	//datetime-local의 값 가져옴
	let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -5);
	let maxdate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -5) + n일 이후 설정 할 부분
	dateElement.value = date;	//현재 날짜로 date 설정
	dateElement.setAttribute("min", date); 
	//만약 선택 날짜가 오늘 날짜보다 예전일 경우 알람을 띄워주는 기능
	function setMinValue() {
		if (dateElement.value < date) {//선택한 날짜 < 현 날짜
			alert('현재 시간보다 이전의 날짜는 설정할 수 없습니다.');
			dateElement.value = date;
		}
	} */
	/*
	//만약 선택 날짜가 오늘 날짜 + n일 이후(maxdate)이면 알람을 띄워주는 기능
	function setMaxValue() {
		if(deteElement.value > maxdate) {
			alert('예약은 최대 n일 이후까지 가능합니다.');
			dateElement.value = date;
		}
	}
	*/
                            
	let msg = "${msg}"
	if (msg == "REN_OK") alert("예약신청을 완료했습니다.")
	if (msg == "REN_ERR") alert("예약신청에 실패했습니다.")
})
</script>

	<!-- footer inlcude -->
	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>

</html>