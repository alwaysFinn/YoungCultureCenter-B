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
    <c:forEach var="name" items="${list}" varStatus="status">
    	<div hidden="hidden" value="${name.sroom_seat_id}" id="${name.sroom_seat_id}"></div>
    	좌석 : ${name.sroom_seat_id}
    	고객 : ${name.user_id }	
    </c:forEach>
    
    <div class="container w-100 pt-1" >
      <div class="container-lg" style="border: solid 1px gray; border-radius: 10px; overflow: scroll;">
        <ol class="rRoomTotal" style="margin-top:3 %">
          <ol class="rRoomUpper mb-5">
          <li class="row row--1">
            <ol class="seats" type="A">  
              <li class="seat">
                <input
                  type="checkbox"
                  id="1"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"                  
                  
                />
                <label for="1">1</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="2"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="2">2</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="3"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                     
                />
                <label for="3">3</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="4"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="4">4</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="5"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="5">5</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="6"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="6">6</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="7"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="7">7</label>
              </li>
              
              <li class="seat">
                <input
                  type="checkbox"
                  id="8"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
              <label for="8">8</label>
              </li>
              
              <li class="seat">
                <input
                  type="checkbox"
                  id="9"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="9">9</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="10"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="10">10</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="11"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="11">11</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="12"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="12">12</label>
              </li>
            </ol>
          </li>

          <li class="row row--2">
            <ol class="seats" type="A">
              <li class="seat">
                <input
                  type="checkbox"
                  id="13"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="13">13</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="14"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="14">14</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="15"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="15">15</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="16"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="16">16</label>
              </li>

              <li class="seat">
                <input
                  type="checkbox"
                  id="17"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="17">17</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="18"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="18">18</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="19"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="19">19</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="20"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="20">20</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="21"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="21">21</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="22"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="22">22</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="23"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="23">23</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="24"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                  
                />
                <label for="24">24</label>
              </li>
            </ol>
          </li>
          </ol>

          <ol class="rRoomUnder" style="margin-bottom: 2%">
            <li class="row row--3">
              <ol class="seats" type="A">
                <li class="seat">
                  <input
                    type="checkbox"
                    id="25"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="25">25</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="26"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="26">26</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="27"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="27">27</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="28"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="28">28</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="29"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="29">29</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="30"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="30">30</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="31"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="31">31</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="32"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="32">32</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="33"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="33">33</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="34"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="34">34</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="35"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="35">35</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="36"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="36">36</label>
                </li>
              </ol>
            </li>

            <li class="row row--4">
              <ol class="seats" type="A">
                <li class="seat">
                  <input
                    type="checkbox"
                    id="37"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="37">37</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="38"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="38">38</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="39"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="39">39</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="40"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                   
                  />
                  <label for="40">40</label>
                </li>

                <li class="seat">
                  <input
                    type="checkbox"
                    id="41"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="41">41</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="42"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="42">42</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="43"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="43">43</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="44"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="44">44</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="45"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="45">45</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="46"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="46">46</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="47"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="47">47</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="48"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                    
                  />
                  <label for="48">48</label>
                </li>
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
              style="display: inline">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
            </select>
            <label for="usetime" class="col-form-label"> 시간</label>
          </div>
        </div>
      </div>

      <br />
      <!-- 모달 버튼  -->
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
		
		test = []
		
		for(var i = 0; i<1; i++){
			test.push("${list.get(i).sroom_seat_id}"*1)
		}
		console.log(test)
		
		for(var j = 1; j<=48; j++){
			if(test[j]==j){
				console.log(j)
				console.log(test[j])
				$("#"+j).prop("disabled",true);
				$("#"+j).attr("disabled", true);
				document.getElementById(j).disabled = true;
			}
		} 
		
		/*  
		for (var i = 1; i<=48; i++){
			if(result[i].sroom_seat_id==i){
				id(i).attr(disabled,true)
			}	
		} */
		 
		$("#modalBtn").on('click', function(){
			
			//현재시간의 형식을 hh:mm:ss로 바꾸는 기능 
			function getFormatTime(date) {
				var hh = (date.getHours()*1)+(document.getElementById("usetime").value*1)
				hh = hh >= 10 ? hh : '0' + hh
				var mm = date.getMinutes()
				mm = mm >= 10 ? mm : '0' + mm
				var ss = date.getSeconds()
				ss = ss >= 10 ? ss : '0' + ss
				
				return hh+':'+mm+':'+ss;
			}
				
			var time = getFormatTime(new Date())
			var spantime = getFormatTime(new Date())
			
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