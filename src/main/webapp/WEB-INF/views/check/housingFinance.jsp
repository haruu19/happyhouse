<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<title>Happy House | 주택금융</title>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="/happyhouse/resources/img/logo.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="/happyhouse/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/happyhouse/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/happyhouse/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/happyhouse/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="/happyhouse/resources/css/themify-icons.css">
    <link rel="stylesheet" href="/happyhouse/resources/css/nice-select.css">
    <link rel="stylesheet" href="/happyhouse/resources/css/flaticon.css">
    <link rel="stylesheet" href="/happyhouse/resources/css/gijgo.css">
    <link rel="stylesheet" href="/happyhouse/resources/css/animate.css">
    <link rel="stylesheet" href="/happyhouse/resources/css/slick.css">
    <link rel="stylesheet" href="/happyhouse/resources/css/slicknav.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">

    <link rel="stylesheet" href="/happyhouse/resources/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

//중복체크 방지
function doSelectNoLoop(chk){
    var obj = document.getElementsByName("rentFee");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
//중복 되지만 '해당사항 없음'일때 clear하기
function doSelectLoopClear(chk){
    var obj = document.getElementsByName("houseInfo");
    if(obj[0] == chk){
    	for(var i=1; i<obj.length; i++){
                obj[i].checked = false;
            }
    }else{
    	obj[0].checked = false;
    }
}	
	$(document).ready(function() {
		/* 클릭 시 버튼 색 변경 */
		$("#type>button").click(function () {
			$("#type>button").css('background-color', '#cccccc');
	        $(this).css('background-color', '#ffcccc');
	     });
		//--------------------------------------------------------------------------------------------------------------------------------------------------
		//전체 코드 길이 줄이기 위해서 html문 변수로 등록!------------------------------------------------------------------------------------------------------------------
		//--------------------------------------------------------------------------------------------------------------------------------------------------
		
		//div
		var div_start = `<div class=start>`;
		var div_start2 = `<div class=start2>`;
		var div_start3 = `<div class=start3>`;
		var div_start4 = `<div class=start4>`;
		var div_start5 = `<div class=start5>`;
		var div_start6 = `<div class=start6>`;
		var div_start7 = `<div class=start7>`;
		var div_start8 = `<div class=start8>`;
		
		//무주택 여부
		var house_have = `
			<hr>
			<h4>무주택 여부를 선택하세요.</h4>
			<button class="btn btn-outline-secondary" id="all">본인 및 세대원 <br>전원 무주택</button>
			<button class="btn btn-outline-secondary" id="me">신청자 본인<br>무주택</button>	
			<button class="btn btn-outline-secondary" id="family_have">세대원 중<br>주택 소유자 있음</button>	
		`
		//세대주 
		var householder = `
			<hr>
			<h4>세대주이신가요?</h4>
        	<button class="btn btn-outline-secondary" id='householder_yes'>예</button>
        	<button class="btn btn-outline-secondary" id='householder_no'>아니요</button>
			`;
		//주거급여
		var benefit = `
			<hr>
			<h4>주거급여 수급자이신가요?</h4>
        	<button class="btn btn-outline-secondary" id='benefit_yes'>예</button>
        	<button class="btn btn-outline-secondary" id='benefit_no'>아니요</button>
			`;
		
		//자격
		var houseFundForm =`
			<hr>
			<h4>해당되는 자격을 모두 선택하세요.</h4>
			<form id="houseFundForm" method="post" action="">
				<input type="checkbox" name="houseInfo" id="no" onclick="doSelectLoopClear(this)"> 해당사항 없음 <br>
				<input type="checkbox" name="houseInfo" id="new" onclick="doSelectLoopClear(this)"> 신혼가구 또는 혁신도시이전종사자 또는 타 지역으로 이주하는 재개발 구역내 세입자 <br>
				<input type="checkbox" name="houseInfo" id="jobApplicant" onclick="doSelectLoopClear(this)"> 취업준비생(만35세 이하/부모소득 6천만원 이하) <br>
				<input type="checkbox" name="houseInfo" id="join" onclick="doSelectLoopClear(this)"> 희망키움통장가입자 <br>
				<input type="checkbox" name="houseInfo" id="workIncentive" onclick="doSelectLoopClear(this)"> 근로장려금수급자 <br>
				<input type="checkbox" name="houseInfo" id="beginner" onclick="doSelectLoopClear(this)"> 사회초년생(취업 5년 이내/만35세 이하) <br>
			</form>
		`
		
		//부부합산 연간 총소득
		var money_sum=`
			<hr>
			<h4>부부합산 연간 총소득을 선택하세요.</h4>
	        <button class="btn btn-outline-secondary" id='money_under4000'>~4,000만원<br>이하</button>
	        <button class="btn btn-outline-secondary" id='money_under5000'>~5,000만원<br>이하</button>
	        <button class="btn btn-outline-secondary" id='money_under6000'>~6,000만원<br>이하</button>
	        <button class="btn btn-outline-secondary" id='money_under7000'>~7,000만원<br>이하</button>
	        <button class="btn btn-outline-secondary" id='money_over7000'>7,000만원<br>초과</button>
   		 `
    	//총 면적
    	var area=`
    		<hr>
			<h4>대출희망주택의 면적을 선택하세요.</h4>
	        <button class="btn btn-outline-secondary" id='area_under85'>85m^이하</button>
	        <button class="btn btn-outline-secondary" id='area_over85'>85m^초과</button>
	        <button class="btn btn-outline-secondary" id='area_under100'>읍면지역 100m^이하</button>
	        <button class="btn btn-outline-secondary" id='area_over100'>읍면지역 100m^초과</button>
            `;
        // 자격2
        var houseFundForm2= `
        	<hr>
			<h4>대출희망주택의 임차료 현황을 선택하세요.</h4>
			<form id="houseFundForm2" method="post" action="">
				<input type="checkbox" name="rentFee" value="1" onclick="doSelectNoLoop(this)"> 해당사항 없음 <br>
				<input type="checkbox" name="rentFee" value="2" onclick="doSelectNoLoop(this)"> 임차보증금2억원 이하(수도권(서울,경기,인천)은 3억원 이하) <br>
				<input type="checkbox" name="rentFee" value="3" onclick="doSelectNoLoop(this)"> 임차보증금 1억원 이하 및 월세 60만원 이하 <br>
			</form>
        `
        
		// 무주택 기간
		var period = `
			<hr>
			<h4>무주택 기간을 선택하세요.</h4>
	        <button class="btn btn-outline-secondary" id='period_month'>0~6개월</button>
	        <button class="btn btn-outline-secondary" id='period_year'>6개월~5년</button>
	        <button class="btn btn-outline-secondary" id='period_over'>5년이상</button>
		`
		//최초
		var first=`
			<hr>
			<h4>무주택 기간을 선택하세요.</h4>
	        <button class="btn btn-outline-secondary" id='first'>0~6개월</button>
	        <button class="btn btn-outline-secondary" id='not_first'>6개월~5년</button>
		`
		
		//주택 유형
		var type=`
			<hr>
			<h4>주택유형을 선택하세요.</h4>
	        <button class="btn btn-outline-secondary" id='apart'>아파트</button>
	        <button class="btn btn-outline-secondary" id='office'>오피스텔</button>
	        <button class="btn btn-outline-secondary" id='etc'>그 외 주택</button>
		`
		
		//주택 가격
		var house_price=`
			<hr>
			<h4>대출희망주택의 가격을 선택하세요.</h4>
	        <button class="btn btn-outline-secondary" id='house_price_one'>1.5억원 이하</button>
	        <button class="btn btn-outline-secondary" id='house_price_two'>6억원 이하</button>
	        <button class="btn btn-outline-secondary" id='house_price_three'>9억원 이하</button>
	        <button class="btn btn-outline-secondary" id='house_price_four'>9억원 초과</button>
		`
		//대출대상 주택 해당사항
		var house_info = `
			<hr>
			<h4>대출대상주택에 대한 해당사항을 선택하세요.</h4>
			<form id="houseInfo" method="post" action="">
				<input type="checkbox" name="houseInfo" id="houseInfo_one" onclick="doSelectLoopClear(this)"> 해당사항 없음 <br>
				<input type="checkbox" name="houseInfo" id="houseInfo_two" onclick="doSelectLoopClear(this)"> 수도권 및 지방 5대 광역시, 인구 50만 이상 도시 및 세종특별자치시 소재 주택 <br>
				<input type="checkbox" name="houseInfo" id="houseInfo_three" onclick="doSelectLoopClear(this)">  담보인정비율 70% 이상 주택(주택가격X70%≤주택담보대출) <br>
				<input type="checkbox" name="houseInfo" id="houseInfo_four" onclick="doSelectLoopClear(this)"> 1년이상 임차 거주중인 주택 <br>
			</form>
		`
		//주택 소유 여부
		var own = `
			<hr>
			<h4>주택소유여부(부부기준)를 선택하세요.</h4>
	        <button class="btn btn-outline-secondary" id='own'>무주택자</button>
	        <button class="btn btn-outline-secondary" id='not_own'>유주택자</button>
		`
		//만 60세 이상여부
		var age=`
			<hr>
			<h4>만60세 이상여부를 선택하세요.</h4>
	        <button class="btn btn-outline-secondary" id='age_yes'>예</button>
	        <button class="btn btn-outline-secondary" id='age_no'>아니요</button>
		`
		//해당사항 선택
		var select=`
			<hr>
			<h4>해당사항을 선택하세요</h4>
	        <button class="btn btn-outline-secondary" id='select_no'>해당사항<br>없음</button>
	        <button class="btn btn-outline-secondary" id='select_9'>보유주택 합산 가격이<br>시가 9억원 이하</button>
	        <button class="btn btn-outline-secondary" id='select_senior'>지방자치단체에 신고된<br>노인복지주택</button>
		`
		/* 클릭 시 버튼 색 변경 */
		$("#type>button").click(function () {
			$("#type>button").css('background-color', '#cccccc');
	        $(this).css('background-color', '#ffcccc');
	     });
		
		$(".start>button").click(function () {
			$(".start>button").css('background-color', '#cccccc');
	        $(this).css('background-color', '#ffcccc');
	     });
		//전월세자금 이면?
		$("#rent").on("click", function(){
			$("#dynamic2").empty();
			$("#dynamic2").append(div_start+house_have);
			$(".start>button").click(function () {
				$(".start>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start2+householder);
			$(".start2>button").click(function () {
				$(".start2>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start3+benefit);
			$(".start3>button").click(function () {
				$(".start3>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(houseFundForm);
			$("#dynamic2").append(div_start4+money_sum);
			$(".start4>button").click(function () {
				$(".start4>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start5+area);
			$(".start5>button").click(function () {
				$(".start5>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(houseFundForm2);	
		});
		
		//구입자금 이면?
		$("#purchase").on("click", function(){
			$("#dynamic2").empty();
			$("#dynamic2").append(div_start+house_have);
			$(".start>button").click(function () {
				$(".start>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start2+period);
			$(".start2>button").click(function () {
				$(".start2>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start3+first);
			$(".start3>button").click(function () {
				$(".start3>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start4+householder);
			$(".start4>button").click(function () {
				$(".start4>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start5+money_sum);
			$(".start5>button").click(function () {
				$(".start5>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start6+area);
			$(".start6>button").click(function () {
				$(".start6>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start7+type);
			$(".start7>button").click(function () {
				$(".start7>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start8+house_price);
			$(".start8>button").click(function () {
				$(".start8>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(house_info);
		});
		
		//주택연금 이면?
		$("#housingPension").on("click", function(){
			$("#dynamic2").empty();
			$("#dynamic2").append(div_start+own);
			$(".start>button").click(function () {
				$(".start>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start2+age);
			$(".start2>button").click(function () {
				$(".start2>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
			$("#dynamic2").append(div_start3+select);
			$(".start3>button").click(function () {
				$(".start3>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
		});
});
</script>
</head>

<style>
	div {
		margin-bottom:2%;
	}
	h4 {
		margin-bottom:2%;
	}
	.btn btn-outline-secondary:active:focus {
	  color: #ffffff; 
	  background-color: red; 
	  border-color: #494F57;
	  }
	.content {
  		width:52%;
  		text-align:left;
  	}
</style>
<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../banner.jsp"%>
	<div style="width:1200px; margin-top:2%; margin-left:33%;">
			<div class="content">
				<div id="type">
				<h4>원하시는 대출형태를 선택하세요.</h4>
					<button class="btn btn-outline-secondary" id="rent">전월세자금</button>
					<button class="btn btn-outline-secondary" id="purchase">구입자금</button>	
					<button class="btn btn-outline-secondary" id="housingPension">주택연금</button>	
				</div>
				<div id="dynamic"></div>
				<div id="dynamic2"></div>
				<hr>
				<button class="btn btn-outline-secondary" id="result">결과보기</button>
			</div>			
		</div>
			<div align="center" >
				<form method="get" action="/happyhouse/main" style="display: inline">
					<button class="btn btn-dark">메인페이지</button>
				</form>
			</div>
	
	<%@ include file="../footer.jsp" %>
	    <!-- link that opens popup -->
	<!--     
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

    <script src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script> -->
    <!-- JS here -->
    <script src="/happyhouse/resources/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="/happyhouse/resources/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="/happyhouse/resources/js/popper.min.js"></script>
    <script src="/happyhouse/resources/js/bootstrap.min.js"></script>
    <script src="/happyhouse/resources/js/owl.carousel.min.js"></script>
    <script src="/happyhouse/resources/js/isotope.pkgd.min.js"></script>
    <script src="/happyhouse/resources/js/ajax-form.js"></script>
    <script src="/happyhouse/resources/js/waypoints.min.js"></script>
    <script src="/happyhouse/resources/js/jquery.counterup.min.js"></script>
    <script src="/happyhouse/resources/js/imagesloaded.pkgd.min.js"></script>
    <script src="/happyhouse/resources/js/scrollIt.js"></script>
    <script src="/happyhouse/resources/js/jquery.scrollUp.min.js"></script>
    <script src="/happyhouse/resources/js/wow.min.js"></script>
    <script src="/happyhouse/resources/js/nice-select.min.js"></script>
    <script src="/happyhouse/resources/js/jquery.slicknav.min.js"></script>
    <script src="/happyhouse/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="/happyhouse/resources/js/plugins.js"></script>
    <script src="/happyhouse/resources/js/gijgo.min.js"></script>
    <script src="/happyhouse/resources/js/slick.min.js"></script>
   

    
    <!--contact js-->
    <script src="/happyhouse/resources/js/contact.js"></script>
    <script src="/happyhouse/resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="/happyhouse/resources/js/jquery.form.js"></script>
    <script src="/happyhouse/resources/js/jquery.validate.min.js"></script>
    <script src="/happyhouse/resources/js/mail-script.js"></script>


    <script src="/happyhouse/resources/js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }
        });
    </script>
</body>
</html>