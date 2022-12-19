<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
  <head>
    <!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>

	<link rel="stylesheet" href="/ycc/resources/css/studyRoom.css" type="text/css"/>	
	<script type="text/javascript" src="/ycc/resources/js/studyRoom.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <title>독서실 예약</title>

    <style>
      th {
        background-color: bisque !important;
      }
    </style>
</head>

<body>
    <!-- include header -->
<%@include file="/WEB-INF/views/header.jsp"%>

        
 
<div class="container mt-3">
  <h4 class= "fw-bold">독서실 예약</h4>
  <hr>
</div>
    <!-- 좌석 선택 폼 -->
     <div class="container w-100 pt-1" >
      <div class="container-lg" style="border: solid 1px gray; border-radius: 10px; overflow: scroll;">
        <ol class="rRoomTotal" style="margin-top:3 %">
          <ol class="rRoomUpper mb-5">
          <li class="row row--1">
            <ol class="seats" type="A">
	            <c:forEach var="i" begin="0" end="11">
	            	<li class="seat">
	            		<input
	            			type="checkbox"
	            			id="${i+1 }"
	            			name="indvSeat"
	            			onclick="checkOnlyOne(this)"
	            			
	            		/>
	            		<label for="${i+1 }">${i+1 }</label>
	            	</li>
	        	</c:forEach>
            </ol>
          </li>

          <li class="row row--2">
            <ol class="seats" type="A">
              <c:forEach var="i" begin="12" end="23">
	            	<li class="seat">
	            		<input
	            			type="checkbox"
	            			id="${i+1 }"
	            			name="indvSeat"
	            			onclick="checkOnlyOne(this)"
	            		/>
	            		<label for="${i+1 }">${i+1 }</label>
	            	</li>
	        	</c:forEach>
            </ol>
          </li>
          </ol>

          <ol class="rRoomUnder" style="margin-bottom: 2%">
            <li class="row row--3">
              <ol class="seats" type="A">
                <c:forEach var="i" begin="24" end="35">
	            	<li class="seat">
	            		<input
	            			type="checkbox"
	            			id="${i+1 }"
	            			name="indvSeat"
	            			onclick="checkOnlyOne(this)"
	            		/>
	            		<label for="${i+1 }">${i+1 }</label>
	            	</li>
	        	</c:forEach>
              </ol>
            </li>

            <li class="row row--4">
              <ol class="seats" type="A">
                <c:forEach var="i" begin="36" end="47">
	            	<li class="seat">
	            		<input
	            			type="checkbox"
	            			id="${i+1 }"
	            			name="indvSeat"
	            			onclick="checkOnlyOne(this)"
	            		/>
	            		<label for="${i+1 }">${i+1 }</label>
	            	</li>
	        	</c:forEach>
              </ol>
            </li>
          </ol>
        </ol>
      </div>
<!-- 좌석 선택 정보 이미지 -->
	<div class="row">
    <div class="col-md-2">
      <div class="fs-6 pt-3 mb-4">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" style="fill: #39adffed;"
          class="bi bi-square-fill" viewBox="0 0 16 16">
          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z"></path>
        </svg>
        사용가능
      </div>
    </div>
    <div class="col-md-2">
      <div class="fs-6 pt-3  mb-3">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" style="fill: #dddddd" class="bi bi-square-fill"
          viewBox="0 0 16 16">
          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z"></path>
        </svg>
        사용중
      </div>
    </div>
    <div class="col-md-2">
      <div class="fs-6 pt-3  mb-3">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" style="fill: #bada55;"
          class="bi bi-square-fill" viewBox="0 0 16 16">
          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z"></path>
        </svg>
        선택
      </div>
    </div>
  </div>
	
    </div>

    <!-- 예약 정보 폼 -->
      <div class="container mt-5">
        <div class="row text-center" >
          <div class="col-md-6">
            <label for="time" >입실 예정 시간은 '현재시각' 기준입니다. </label>
          </div>
          <div class="col-md-6">
            <label for="usetime" class=" col-form-label">
              이용시간 :
            </label>
            <select
              id="usetime"
              class="form-control w-auto"
              style="display: inline"
              onchange="alert(this.value)">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
            </select>
            <label for="usetime" class="col-form-label"> 시간</label>
            <div id="timealert"></div>
          </div>
        </div>
      </div>

      <br />
      <!-- 모달 버튼  -->
      <div id="foralert"></div>
      <div class="text-center">
        <button
          id="modalBtn"
          type="button"
          class="btn btn-primary m-5"
          data-bs-toggle="modal"
          data-bs-target="#staticBackdrop">
          확인
        </button>
      </div>
    <!-- 결제 전 예약정보 확인 모달창 -->
    <form id="form" method="post" action="" >
    <div
      class="modal fade"
      id="staticBackdrop"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5 fw-bold" id="staticBackdropLabel">
              정보 확인 안내
            </h1>
          </div>
          <div class="modal-body text-center">
            <div class="justify-content-center">
	           	<div id="yn">
	           	</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </form>


	<script type="text/javascript">
	$(document).ready(function () {

		function checkOnlyOne(element) {  
		      const checkboxes = document.getElementsByName("indvSeat");	
		      checkboxes.forEach((cb) => {
		        cb.checked = false;
		      })
		      element.checked = true;	 
		      $("#sroom_seat_id").html(element.getAttribute("id"))*1 
		    }


		var arr = new Array()	
		<c:forEach items="${list}" var="test">
			arr.push({user_id:"${test.user_id}"
				,sroom_seat_id:"${test.sroom_seat_id}"})	
		</c:forEach>
			
		for(var i = 0; i<arr.length; i++){
			if(arr[i].user_id=="${sessionScope.id }"){
				$("#modalBtn").attr("disabled", true);
				$("#foralert").append(
					'<span class="text-primary">'
				   +'<p class="text-center fw-bold fs-3">'
				   +'이미 예약된 좌석이 있습니다.'
				   +'<br>'
				   +'예약 좌석 : '
				   +arr[i].sroom_seat_id+'번'
				   +'</p>'
				   +'</span>'
				)
				
			}
			for(var j = 1; j <= 48; j++){
				if(arr[i].sroom_seat_id==j){
					document.getElementById(j).disabled = true;
				}
			}
		}
		
		$("#usetime").on('click', function(){
		        var vv = $(this).val()*1
		        var nh = new Date().getHours()*1
		        console.log(vv)
		        console.log(nh)
		        	if(vv+nh>24 || vv+nh<6){
						$(this).attr("disabled", true)
						$("#timealert").append(
							'<p class="text-center text-danger fw-bold">'
						   +'현재 이용 가능한 시간이 아닙니다.'
						   +'</p>'
						)
					}	
				
	    });
 

		$("#modalBtn").on('click', function(){
			
			//현재시간의 형식을 hh:mm:ss로 바꾸는 기능 
			function getFormatTime(date) {
				var yy = date.getFullYear()
				var MM = date.getMonth()+1
				var dd = date.getDate()
				var hh = (date.getHours()*1)+(document.getElementById("usetime").value*1)
				hh = hh >= 10 ? hh : '0' + hh
				var mm = date.getMinutes()
				mm = mm >= 10 ? mm : '0' + mm
				var ss = date.getSeconds()
				ss = ss >= 10 ? ss : '0' + ss
				var ms = date.getMilliseconds()
				
				return yy+"-"+MM+"-"+dd+" "+hh+':'+mm+':'+ss+"."+ms;
			}
			
			function getFT(date){
				var hh = (date.getHours()*1)+(document.getElementById("usetime").value*1)
				hh = hh >= 10 ? hh : '0' + hh
				var mm = date.getMinutes()
				mm = mm >= 10 ? mm : '0' + mm
				var ss = date.getSeconds()
				ss = ss >= 10 ? ss : '0' + ss
						
				return hh+':'+mm+':'+ss
			}
				
			var time = getFormatTime(new Date())
			var spantime = getFT(new Date())
			
			//선택한 좌석 번호 받아오는 변수
			let selected = $("input[name='indvSeat']:checked").attr('id')*1
			let showselected = $("input[name='indvSeat']:checked").attr('id')

			let rentime = document.getElementById("usetime").value*1
		
			let pay = rentime * 1000
			let spanpay = rentime * 1000

			if($("input[name='indvSeat']").is(":checked") == true){
				$("#yn").append(
					'<table class="table container-fluid border">'
		            +'<tbody>'
		            +'<tr>'
		            +'<th scope="row" class="col-sm-4">이름</th>'
		            +'<td>'
		            +'<div class="col-sm-12">${sessionScope.name }</div>'
		            +'</td>'
		            +'</tr>'
		            +'<tr>'
		            +'<th scope="row">시설명</th>'
		            +'<td>'
		            +'<div class="col-sm-12"></div>'
		            +'YOUNG문화센터 독서실​'
		            +'</td>'
		            +'</tr>'
		            +'<tr>'
		            +'<th scope="row">좌석번호</th>'
		            +'<td>'
		            +'<textarea class="col-sm-12 visually-hidden" id="sroom_seat_id" name="sroom_seat_id"></textarea>'
		            +'<span id="show_sroom_seat_id"></span>'
		            +'</td>'
		            +'</tr>'
		            +'<tr>'
		            +'<th scope="row">이용시간</th>'
		            +'<td>'
		            +'<textarea class="col-sm-12 visually-hidden" id="sroom_rental_etime" name="sroom_rental_etime"></textarea>'
		            +'<span id="show_sroom_rental_etime"></span>'
		            +'</td>'
		            +'</tr>'
		            +'<tr>'
		            +'<th scope="row">결제금액</th>'
		                +'<td>'
		                +'<textarea class="col-sm-12 visually-hidden" id="sroompay" name="sroompay"></textarea>'
		                +'<span id="show_sroompay"></span>'
		                +'</td>'
		                +'</tr>'
		                +'</tbody>'
		                +'</table>'
		                +'</div>'
		                +'<p>해당 정보가 맞으십니까?</p>'
		                +'</div>'
		                +'<div class="modal-footer" style="justify-content: center;">'
		                +'<button type="button" class="btn btn-secondary " data-bs-dismiss="modal" id="cencelBtn">취소'
              			+'</button>'
              			+'<button id="submitBtn" type="submit" class="btn btn-primary">결제</button>'
				);

				//이용 시간에 따른 가격 (이용시간 * 1,000원)
				document.getElementById("sroompay").innerHTML = pay
				//-->span안에 for 보여주기식
				document.getElementById("show_sroompay").innerHTML = spanpay

	        	//클릭 시 장소값 넘겨주는 기능 type을 int로 바꾸기 위해 *1 --> input안에
	        	document.getElementById("sroom_seat_id").innerHTML = selected
	        	//-->span 안에 for 보여주기식
	        	document.getElementById("show_sroom_seat_id").innerHTML = showselected
	        	
	        	//클릭 시 종료시간 넘겨주는 기능
	        	document.getElementById("sroom_rental_etime").innerHTML = time
	        	//-->span 안에 for 보여주기식
	        	document.getElementById("show_sroom_rental_etime").innerHTML = spantime
			}else if($("input[name='indvSeat']").is(":checked") == false){
				$("#yn").append(
					'<div">선택되지 않은 값이 있습니다.</div>'
					+'<div class="modal-footer" style="justify-content: center;">'
	                +'<button type="button" class="btn btn-secondary " data-bs-dismiss="modal" id="cencelBtn">돌아가기'
	      			+'</button>'
      			);
			}
			
			
	             
		})
        
        $("#submitBtn").on("click", function(){
	        	let form = $("#form")
				form.attr("action", "<c:url value='/rental/studyroom' />")
				form.attr("method", "post")
				form.submit()
        	
		})
		
		//취소 버튼 클릭 시 새로고침을 주기 위한 부분
		//cencleBtn에 바로 접근하면 읽지 못하기에 id에 선 접근 후 그 안에 있는 cencleBtn으로 접근
		$("#yn").on("click", "#cencelBtn", function(){
			location.href = "<c:url value='/rental/studyroom' />"
		})

		
		
		
	})
	</script>
	
	<!-- footer include -->
<%@include file="/WEB-INF/views/footer.jsp"%>

  </body>
</html>