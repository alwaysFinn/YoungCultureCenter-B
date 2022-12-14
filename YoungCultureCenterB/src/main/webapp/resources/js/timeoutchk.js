   var iSecond; //초단위로 환산
   var timerchecker = null;
   window.onload = function() {
       fncClearTime();
       initTimer();
   }
    
   function fncClearTime() {
   //기준단위 : 초(second)
       iSecond = 15 * 60;
   }
    
   Lpad = function(str, len) {
       str = str + "";
       while (str.length < len) {
           str = "0" + str;
       }
       return str;
   }
    
   initTimer = function() {
       var timer = document.getElementById("timer");
       rHour = parseInt(iSecond / 3600);
       rHour = rHour % 60;
    
       rMinute = parseInt(iSecond / 60);
       rMinute = rMinute % 60;
    
       rSecond = iSecond % 60;
    
       if (iSecond > 0) {
           timer.innerHTML = Lpad(rMinute, 2)+ " : " + Lpad(rSecond, 2);
           iSecond--;
           timerchecker = setTimeout("initTimer()", 1000); // 1초 간격으로 체크
       } else {
           logoutUser();
       }
   }
    
   function refreshTimer() {
	   //ajax로 임의 주소에 post method 보내서 세션 갱신
       var xhr = initAjax();
	   xhr.open("POST", "/ycc/", false);
       xhr.send();
       fncClearTime();
   }
    
   function logoutUser() {
       clearTimeout(timerchecker);
       var xhr = initAjax();
       xhr.open("GET", "/ycc/logout", true);
       xhr.send();
       alert('세션이 만료되어 로그아웃 하였습니다.');
       location.reload();
   }
    
   function initAjax() { 						// 브라우저에 따른 AjaxObject 인스턴스 분기 처리
       var xmlhttp;
       if (window.XMLHttpRequest) {				// 지원브라우저 : IE7+, Firefox, Chrome, Opera, Safari
           xmlhttp = new XMLHttpRequest();
       } else {									// 구형브라우저 : IE6, IE5 => 엑티브X
           xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
       }
       return xmlhttp;
   }