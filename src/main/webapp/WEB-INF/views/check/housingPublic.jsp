<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<title>Happy House | 공공주택</title>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		
		//--------------------------------------------------------------------------------------------------------------------------------------------------
		//전체 코드 길이 줄이기 위해서 html문 변수로 등록!------------------------------------------------------------------------------------------------------------------
		//--------------------------------------------------------------------------------------------------------------------------------------------------
		
		// div
		var div_start = `<div class='start'>`;
		var div_start2 = `<div class='start2'>`;
		var div_start3 = `<div class='start3'>`;

		//입주 대상이 아닐때 html문
		var not_move_in = `<hr>
			<h3><strong>국민주택 입주대상이 아닙니다.</strong></h3>
			`;
		//입주 대상일 때 html문
		var move_in = `
			<hr>
			<h3>국민임대주택 신청가능합니다.</h3>
			<button class="btn btn-default btn-lg">
			<a href="https://www.myhome.go.kr/hws/portal/dgn/moveSelfDiagnosisResultView.do?selfDiagDivId=6&res=1%3A1%3A%3B3%3A1%3A%3B4%3A1%3A%3B5%3A1%3A%3B2%3A1%3A1%EC%9D%B8%3B2%3A9%3A1851603%3B">
			모집공고 바로가기</a></button>
			`;
		
		//자산 html
		var asset =`
			<hr>
			<h4><strong>3. 신청자 본인 총 자산이 288,000,000원 이하입니까?</strong></h4>
        	<button class="btn btn-default btn-lg" id='asset_yes'>예</button>
        	<button class="btn btn-default btn-lg" id='asset_no'>아니요</button>
		`
		
		//자동차 html
		var car=`
			<hr>
			<h4><strong>4. 자동차를 보유하고 계십니까?</strong></h4>
            <button class="btn btn-default btn-lg" id='car_yes'>예</button>
            <button class="btn btn-default btn-lg" id='car_no'>아니요</button>
    `
    	//차량 금액 html
    	var car_price=`
    		<hr>
			<h4><strong>5. 차량기준가액이 24,680,000원 이하 입니까?</strong></h4>
            <button class="btn btn-default btn-lg" id='price_yes'>예</button>
            <button class="btn btn-default btn-lg" id='price_no'>아니요</button>
            `;
        
		
		/* 클릭 시 버튼 색 변경 */
		$("#type>button").click(function () {
			$("#type>button").css('background-color', '#cccccc');
	        $(this).css('background-color', '#ffcccc');
	     });
		
		//무주택자 이면?
		$("#yes").on("click", function(){
			$("#dynamic2").empty();
			$("#dynamic3").empty();
			$("#dynamic4").empty();
			$("#dynamic5").empty();
			$("#dynamic2").append(`
					<h4><strong>2. 가구원 수와 월 평균 소득을 선택하세요</strong></h4>
					<table class="table">
 					<tr class="danger">
 						<td>가구원수</td>
 						<td>월평균 소득</td>
 					</tr>
 					<tr>
 						<td class="valAss">1인 <input type="radio" name="housAlowTd_2_1" id="housAlowTd_2_1" value="1"/></td>
 						<td class="valChange">1,851,603원 이하 <input type="radio" name="housAlowTd_2_2" id="housAlowTd_2_9" value="9" /></td>
 					</tr>
 					<tr>
 						<td class="valAss">2인 <input type="radio" name="housAlowTd_2_1" id="housAlowTd_2_2" value="2" /></td>
 						<td class="valChange">3,065,866원 이하 <input type="radio" name="housAlowTd_2_2" id="housAlowTd_2_10" value="10" /></td>
 					</tr>
 					<tr>
 						<td class="valAss">3인 <input type="radio" name="housAlowTd_2_1" id="housAlowTd_2_3" value="3" /></td>
 						<td class="valChange">3,938,828원 이하 <input type="radio" name="housAlowTd_2_2" id="housAlowTd_2_11" value="11"/></td>
 					</tr>
 					<tr>
 						<td class="valAss">4인 <input type="radio" name="housAlowTd_2_1" id="housAlowTd_2_4" value="4"/></td>
 						<td class="valChange">4,358,439원 이하 <input type="radio" name="housAlowTd_2_2" id="housAlowTd_2_12" value="12" /></td>
 					</tr>
 					<tr>
 						<td class="valAss">5인 <input type="radio" name="housAlowTd_2_1" id="housAlowTd_2_5" value="5"/></td>
 						<td class="valChange">4,856,848원 이하 <input type="radio" name="housAlowTd_2_2" id="housAlowTd_2_13" value="13"/></td>
 					</tr>
 					<tr>
 						<td class="valAss">6인 <input type="radio" name="housAlowTd_2_1" id="housAlowTd_2_6" value="6"/></td>
 						<td class="valChange">5,315,858원 이하 <input type="radio" name="housAlowTd_2_2" id="housAlowTd_2_14" value="14"/></td>
 					</tr>
 					<tr>
 						<td class="valAss">7인 <input type="radio" name="housAlowTd_2_1" id="housAlowTd_2_7" value="7"/></td>
 						<td class="valChange">5,774,868원 이하 <input type="radio" name="housAlowTd_2_2" id="housAlowTd_2_15" value="15"/></td>
 					</tr>
 					<tr>
 						<td class="valAss">8인 <input type="radio" name="housAlowTd_2_1" id="housAlowTd_2_8" value="8"/></td>
 						<td class="valChange">6,233,878원 이하 <input type="radio" name="housAlowTd_2_2" id="housAlowTd_2_16" value="16"/></td>
 					</tr>
 				</table>
		        `);
			$('input:radio[name="housAlowTd_2_1"]').on("click", function(){
				$('input:radio[name="housAlowTd_2_2"]').on("click", function(){
						//둘 다 체크 되었을 때 경우
			
		    console.log($('input:radio[name=housAlowTd_2_1]:checked').val());
			
			var count = $('input:radio[name=housAlowTd_2_1]:checked').val();
			var income = $('input:radio[name=housAlowTd_2_2]:checked').val();
					//	console.log(count);
					//	console.log(income);
					
			//--------------------------------------------------------------------------
			//-----------------------가족구성원과 소득에 따른 조건 반복문----------------------------
			//--------------------------------------------------------------------------
						if(count=="1"){
							if(income=="9"){
								$.Condition();
							}else{
								$.NotCondition();
							}
						}
						if(count=="2"){
							if(income=="9" || income=="10"){
								$.Condition();
							}else{
								$.NotCondition();
							}
						}
						if(count=="3"){
							if(income=="9" || income=="10" || income=="11"){
								$.Condition();
							}else{
								$.NotCondition();
							}
						}
						if(count=="4"){
							if(income=="9" || income=="10" || income=="11" || income=="12"){
								$.Condition();
							}else{
								$.NotCondition();
							}
						}
						if(count=="5"){
							if(income=="14" || income=="15" || income=="16"){
								$.NotCondition();
							}else{
								$.Condition();
							}
						}
						
						if(count=="6"){
							if(income=="15" || income=="16"){
								$.NotCondition();
							}else{
								$.Condition();
							}
						}
						if(count=="7"){
							if(income=="16"){
								$.NotCondition();
							}else{
								$.Condition();
							}
						}
						if(count=="8"){
							$.Condition();
						}
				});
			});
		});
		//무주택자가 아니면?
	$("#no").on("click", function(){
		$("#dynamic2").empty();
		$("#dynamic3").empty();
		$("#dynamic4").empty();
		$("#dynamic5").empty();
		$("#dynamic6").empty();
		$("#dynamic3").append(not_move_in)
	});
	
	//조건이 맞을 때 함수 설정
	$.Condition = function(){
		
		/* 클릭 시 버튼 색 변경 */
		$("#dynamic3").empty();
			$("#dynamic4").empty();
			$("#dynamic5").empty();
			$("#dynamic6").empty();
			$("#dynamic3").append(div_start+asset);
            $("#asset_yes").on("click",function(){
				$("#dynamic4").empty();
				$("#dynamic5").empty();
				$("#dynamic6").empty();
				$("#dynamic4").append(div_start2+car);
				/* 클릭 시 버튼 색 변경 */
				$(".start2>button").on("click", function() {
					$(".start2>button").css('background-color', '#cccccc');
			        $(this).css('background-color', '#ffcccc');
			     });
			    $("#car_yes").on("click",function(){
					$("#dynamic5").empty();
					$("#dynamic6").empty();
					$("#dynamic5").append(div_start3+car_price)
						$(".start3>button").on("click", function() {
						$(".start3>button").css('background-color', '#cccccc');
	        			$(this).css('background-color', '#ffcccc');
	     				});
				      $("#price_yes").on("click",function(){
						$("#dynamic6").empty();
						$("#dynamic6").append(move_in);
					});
					$("#price_no").on("click",function(){
						$("#dynamic6").empty();
						$("#dynamic6").append(not_move_in);
					});
				});
				$("#car_no").on("click",function(){
				$("#dynamic4").empty();
				$("#dynamic5").empty();
				$("#dynamic6").empty();
				$("#dynamic4").append(move_in);
			});
		});
		$("#asset_no").on("click",function(){
		$("#dynamic4").empty();
		$("#dynamic5").empty();
		$("#dynamic6").empty();
		$("#dynamic4").append(not_move_in);
		});
		
		/* 클릭 시 버튼 색 변경 */
		$(".btn").on("click", function() {
			$(".start>button").css('background-color', '#cccccc');
	        $(this).css('background-color', '#ffcccc');
	     });
	}
	
	/* 클릭 시 버튼 색 변경 */
	$(".btn").on("click", function() {
		$(".start>button").css('background-color', '#cccccc');
        $(this).css('background-color', '#ffcccc');
     });
	
	//조건이 맞지 않을 때 함수
	$.NotCondition = function(){
		$("#dynamic3").empty();
		$("#dynamic4").empty();
		$("#dynamic5").empty();
		$("#dynamic6").empty();
		$("#dynamic4").append(not_move_in);
	}
	
});
</script>
</head>
<style>
	.btn:active:focus {
	  color: #ffffff; 
	  background-color: red; 
	  border-color: #494F57;
	}
	.panel{
  		width:70%;
  		height: 50%;
  		margin-left:15%;
  		margin-top:2%;
  		text-align:left;
  	}
	h4 {
		margin-bottom:2%;
	}
	.table{
		text-align:center;
	}
</style>
<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../banner.jsp"%>
	<div class="container">
		<div class="panel panel-danger" id="type">
			<div class="panel-heading"><h3 style="color:black;">공공 주택 진단하기</h3></div>
			<div class="panel-body">
				<div id="type">
				<h4><strong>1. 무주택자 입니까?<strong></h4>
					<button class="btn btn-default btn-lg" id="yes">예</button>
					<button class="btn btn-default btn-lg" id="no">아니요</button>	
				</div>
				<br>
				<div id="dynamic"></div>
				<div id="dynamic2"></div>
				<div id="dynamic3"></div>
				<div id="dynamic4"></div>
				<div id="dynamic5"></div>
				<div id="dynamic6"></div>
			</div>
		</div>
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