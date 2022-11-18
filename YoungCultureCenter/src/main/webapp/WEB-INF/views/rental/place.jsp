<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>

<title>Young문화센터 - 대관신청</title>
<style>
	td{
		text-align:center;
	}
</style>
</head>
<body>
<!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp"%>


  <div class="container">
    <div class="rentalnotice  border border-dark" style="margin: 20px auto 30px auto">
      <ol class="fs-7">
        <h3>대관 신청 시 주의사항</h3>
        <li>수험표를 교부</li>
        <li>시험당일 수험표와 주민등록증 또는 본인임을 입증할 수 있는 신분증을 반드시 지참</li>
        <li>모든 수험생은 시험 당일 시험장 내에서 마스크 착용 등 시험장 방역 지침을 반드시 준수</li>
        <li>모든 수험생은 모든 물품에 대한 관리 절차 및 감독관의 지시에 따라야 함.</li>
        <li>시험장 반입 금지 물품 → 시험장에 가지고 올 수 없는 물품(시험시간, 쉬는 시간 불문하고 적발시 부정행위 처리)</li>
      </ol>
    </div>

    <div class="row mb-3">
      <div class="col-12 col-md-6 " id="change">
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
          <div class="embed-responsive embed-responsive-4by3">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="<%=request.getContextPath()%>/resources/img/rental/1f.jpg" class="d-block w-100 embed-responsive-item" alt="1층 시설 안내">
              </div>
              <div class="carousel-item">
                <img src="<%=request.getContextPath()%>/resources/img/rental/2f.jpg" class="d-block w-100 embed-responsive-item" alt="2층 시설 안내">
              </div>
              <div class="carousel-item">
                <img src="<%=request.getContextPath()%>/resources/img/rental/3f.jpg" class="d-block w-100 embed-responsive-item" alt="3층 시설 안내">
              </div>
              <div class="carousel-item">
                <img src="<%=request.getContextPath()%>/resources/img/rental/4f.jpg" class="d-block w-100 embed-responsive-item" alt="4층 시설 안내">
              </div>
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">이전</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">다음</span>
          </button>
        </div>
      </div>
      <div class="col-12 col-md-6" style="text-align:center;">
      <h3 style="margin-bottom:50px;"><strong>[조건 설정]</strong></h3>
        <p>
            <h5>대관 장소 선택</h5>
   
          <select id="selectplace" onchange="changeValue(this)">
            <option value="">장소 선택</option>
            <optgroup label="외부"> <!-- 외부 location code = 0 -->
            <c:forEach var="result" items="${placelist }">
              <option value="${result.croom_id}">${result.croom_location eq 0 ? result.croom_name : ""}<c:if test='${result.croom_name eq "" }' >hidden</c:if></option>
            </c:forEach>
            </optgroup>
            <optgroup label="1층"> <!-- 1층 location code = 1 -->
            <c:forEach var="result" items="${placelist }">
              <option value="${result.croom_id }" <c:if test="${result.croom_location == 1}">hidden</c:if> >${result.croom_location == 1 ? result.croom_name : ""}</option>
            </c:forEach>
              <option value=""></option>
              <option value=""></option>
              <option value=""></option>
            </optgroup>
            <optgroup label="2층"> <!-- 2층 location code = 2 -->
            <c:forEach var="result" items="${placelist }">
              <option value="${result.croom_id }"><%-- <c:if test="${result.croom_location == 2>"result.croom_name</c:if> --%></option>
            </c:forEach>
              <option value=""></option>
              <option value=""></option>
              <option value=""></option>
            </optgroup>
            <optgroup label="3층"> <!-- 3층 location code = 3 -->
            <c:forEach var="result" items="${placelist }">
              <option value="${result.croom_id }">${result.croom_location == 3 ? result.croom_name : ""}</option>
            </c:forEach>
              <option value=""></option>
              <option value=""></option>
              <option value=""></option>
            </optgroup>
          </select>
        </p>


        <!--추후 개발 시 수정할 부분(yyyy-mm-dd 에서 '-'제거 , T~ 제거)-->
        <p>
          <label for="datetime-local">
            <h5>대여 일자 지정</h5>
          </label>
          <input type="date" id="datetime-local" name="rday" onchange="printDate(), setMinValue()">
          
        </p>
        
          
        <!--대관 장소 선택 끝-->
      </div>
    </div>
  </div>

  <div class="container">
    <!--대관 장소 선택 시작-->

    <br><hr><br>

    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col" style="text-align:center;">대관 장소</th>
          <th scope="col" style="text-align:center;">시간</th>
          <th scope="col" style="text-align:center;">예약일</th>
          <th scope="col" style="text-align:center;">예약</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td></td>
          <td>08:00 ~ 10:10</td>
          <td><div name="rsdate"></div></td>
          <td><input type="checkbox"></td>
        </tr>
        <tr>
          <td></td>
          <td>10:20 ~ 12:10</td>
          <td><div name="rsdate"></div></td>
          <td><input type="checkbox"></td>
        </tr>
        <tr>
          <td></td>
          <td>12:20 ~ 14:10</td>
          <td><div name="rsdate"></div></td>
          <td><input type="checkbox"></td>
        </tr>
        <tr>
          <td></td>
          <td>14:20 ~ 16:10</td>
          <td><div name="rsdate"></div></td>
          <td><input type="checkbox"></td>
        </tr>
        <tr>
          <td></td>
          <td>16:20 ~ 18:10</td>
          <td><div name="rsdate"></div></td>
          <td><input type="checkbox"></td>
        </tr>
        <tr>
          <td></td>
          <td>18:20 ~ 20:00</td>
          <td><div name="rsdate"></div></td>
          <td><input type="checkbox"></td>
        </tr>
      </tbody>
    </table>
    <!-- Button trigger modal -->
          <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#exampleModal">
            신청하기
          </button>
  </div>
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">정보확인 안내</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <table class="table">
              <tr>
                <h4>대여 장소</h4>
                <img src="<%=request.getContextPath()%>/resources/img/rental/auditorium.jpg" class="img-fluid">
              </tr>
              <tr>
                <th>이름</th>
                <td colspan="3">김지호</td>
              </tr>
              <tr>
                <th>시설명</th>
                <td colspan="3">강당</td>
              </tr>
              <tr>
                <th>예약 날짜</th>
                <td colspan="3" onchange="printDate()">
                  <div id="rsdate"></div>
                </td>
              </tr>
              <tr>
                <th>예약 시간</th>
                <td colspan="3" onchange="printDate()">
                  <div name="rtime"></div>
                </td>
              </tr>
             </table>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary">확인</button>
        </div>
      </div>
    </div>
  </div>

<script>//현재 시간보다 이전의 시간은 선택할 수 없는 기능
    let dateElement = document.getElementById('datetime-local');
    let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -5);
    dateElement.value = date;
    dateElement.setAttribute("min", date);

    function setMinValue() {
      if (dateElement.value < date) {
        alert('현재 시간보다 이전의 날짜는 설정할 수 없습니다.');
        dateElement.value = date;
      }
    }
    function printDate() { const date = document.getElementById('datetime-local').value; document.getElementById("rsdate").innerText = date; }
  </script>
  <script>
    function handleOnChange(e) {
      // 선택된 데이터의 텍스트값 가져오기
      const text = e.options[e.selectedIndex].text;

      console.log(e.options);

      // 선택한 텍스트 출력
      document.getElementByName('rtime').innerText
        = text;
    }
  </script>
  
  <script>
  	//select 에서 값 가져오기 
	  const showValue = (target) => {
		  const value = target.value;
		  const text =  target.options[target.selectedIndex].text;
		  
		  document.querySelector(`div`).innerHTML = `text: ${text} value: ${value}`;
		}
  </script>
<!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>