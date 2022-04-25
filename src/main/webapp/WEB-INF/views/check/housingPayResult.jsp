<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<title>Happy House | 결과</title>
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
	var data_number1 = new Array(0, 527158, 897594, 1161173, 1424752, 1688331, 1951910);
	var data_number2 = new Array(0, 790737, 1346391, 1741760, 2137128, 2532497, 2927866);

	var seoul = new Array(0, 26.6, 30.2, 35.9, 41.5, 42.9, 42.9);
	var incheon = new Array(0, 22.5, 25.2, 30.2, 35.1, 36.5, 43.0);
	var metropolitan = new Array(0, 17.9, 19.8, 23.6, 27.4, 28.5, 33.1);
	var etc = new Array(0, 15.8, 17.4, 20.9, 23.9, 24.9, 29.1);
	
	var temp = location.href.split("?");
	var number = temp[1];
	var income = temp[2]*10000;
	var index = temp[3];
	var clicked_money = temp[4]*10000;
	var clicked_money_html = '<strong style="color:#ff6600;">'+clicked_money+'</strong>';
	
	var city = '';
	// 최대 금액 설정하기
	if(temp[5]=='seoul') {
		city='<strong style="color:#ff6600;">서울</strong>';
		one_max_money_html = '<strong style="color:#ff6600;">'+seoul[number]*10000+'</strong>';
		two_max_money_html = '<strong style="color:#ff6600;">'+seoul[number]*0.6*10000+'</strong>';
	}
	else if(temp[5]=='incheon') {
		city='<strong style="color:#ff6600;">경기, 인천</strong>';
		one_max_money_html = '<strong style="color:#ff6600;">'+incheon[number]*10000+'</strong>';
		two_max_money_html = '<strong style="color:#ff6600;">'+incheon[number]*0.6*10000+'</strong>';
	}
	else if(temp[5]=='metropolitan') {
		city='<strong style="color:#ff6600;">광역시, 세종</strong>';
		one_max_money_html = '<strong style="color:#ff6600;">'+metropolitan[number]*10000+'</strong>';
		two_max_money_html = '<strong style="color:#ff6600;">'+metropolitan[number]*0.6*10000+'</strong>';
	}
	else if(temp[5]=='etc') {
		city='<strong style="color:#ff6600;">기타</strong>';
		one_max_money_html = '<strong style="color:#ff6600;">'+etc[number]*10000+'</strong>';
		two_max_money_html = '<strong style="color:#ff6600;">'+etc[number]*0.6*10000+'</strong>';
	}
	
	//함수 설정~
	function income_down(){
		$('#dynamic').append(`
				<h3>임차급여 지원 신청이 가능합니다.</h3>
				<hr>
				예상 주거급여액:
			`)
		$('#dynamic').append(clicked_money_html);
		$('#dynamic').append(`
				원<br>
				<br>
		`);
		$('#dynamic').append(city);
		$('#dynamic').append(`
				기준 임대료 : 최대 
				`);
		$('#dynamic').append(one_max_money_html);
		$('#dynamic').append(`
				원<br>
		`);
	}
	
  	function income_down2(){
		$('#dynamic').append(`
				<h4>임차급여 지원 신청이 가능합니다.</h4>
				<hr>
				예상 주거급여액:
			`)
		// ※ 자기부담분 = (소득인정액 - 생계급여 선정기준) × 30%
		var tmp = (income - data_number1[number])*0.3;
		if((clicked_money - tmp) <=10000){ $('#dynamic').append(clicked_money_html);}
		else {
			clicked_money_html = '<strong style="color:#ff6600;">'+clicked_money*10000-tmp+'</strong>';
			$('#dynamic').append(clicked_money_html);
			} 
		$('#dynamic').append(`
				원<br>
				<br>
		`);
		$('#dynamic').append(city);
		$('#dynamic').append(`
				기준 임대료 : 최대 
				`);
		$('#dynamic').append(one_max_money_html);
		$('#dynamic').append(`
				원<br>
		`);
	} 
	if(income <= data_number1[number]){
		
		if(index == 0){
			income_down();
		}
		if(index == 1){
			income_down();
		}
		if(index == 2){
			income_down();
		}
		if(index == 3){
			$('#dynamic').append(`
					<h3>임차급여 지원 신청이 가능합니다.</h3>
					<hr>
					예상 주거급여액:
				`)
			$('#dynamic').append(city);
			$('#dynamic').append(`
					기준 임대료 : 최대 
					`);
			$('#dynamic').append(two_max_money_html)
			$('#dynamic').append(`
					원<br>
			`);
		}
	}else if(income <= data_number2[number]){
	 	if(index == 0){
	 		income_down2();
		}
		if(index == 1){
			income_down2();
		}
		if(index == 2){
			income_down2();
		}
		if(index == 3){
			$('#dynamic').append(`
					<h4>임차급여 지원 신청이 가능합니다.</h4>
					<hr>
					예상 주거급여액:
				`)
			$('#dynamic').append(city);
			$('#dynamic').append(two_max_money_html)
			$('#dynamic').append(`
					원<br>
			`);
		}
	}else{
		$('#dynamic').append(`
			<h3>소득인정액 초과로 주거급여 대상자가 아닙니다.</h3>
		`)
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
	input {
		width:50%;
		height: 40px;
        border-style:none;
        border-bottom:solid 1px #cacaca;
        border-collapse:collapse;
    	margin-bottom:2%;
	}
	#dynamic{
		font-size: 20px;
	}
</style>
<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../banner.jsp"%>
	<div class="container">
		<div class="panel panel-danger" id="type">
						<div class="panel-heading"><h3 style="color:black;">자가진단결과</h3></div>
						<div class="panel-body">
							<div id="dynamic"></div>
							<div id="dynamic2"></div>
							<div id="dynamic3"></div>
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