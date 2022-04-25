<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<title>Happy House | 회원가입</title>
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
$(document).ready(function() {
	let flag = false;
	
	$("#registerBtn").click(function() {
		
		if($("#memberformId").val() == "") {
			alert("아이디를 입력하세요");
			return;
		} else if($("#name").val() == "") {
			alert("이름을 입력하세요");
			return;
		} else if($("#memberformPwd").val() == "") {
			alert("비밀번호를 입력하세요");
			return;
		} else if($("#email").val() == "") {
			alert("이메일을 입력하세요");
			return;
		} else if($("#phone").val() == "") {
			alert("전화번호를 입력하세요");
			return;
		} else if(!flag) {
			alert("이메일 인증을 완료하세요 :(");
		} else {
			alert("회원가입이 정상적으로 처리되었습니다. :)")
			$("#memberform").attr("action", "register").submit();
		}
	});
	
	$("#sendMailBtn").click(function() {
		alert("인증메일이 발송되었습니다 :)");
		$.get("/happyhouse/email"
				,{email:$("#email").val()}
				,function(data, status){
					$("#auth").val(data);
				}//function
				, "json"
		);//get
	});
	
	$("#authBtn").click(function() {
		if($("#auth").val()=="616617"){
			flag = true;
			alert("이메일 인증이 완료되었습니다.");
		} else {
			alert("인증번호를 잘못 입력하셨습니다.");
		}
	});
});

</script>
</head>
<body>
<%@ include file="header.jsp"%>
<%@ include file="banner.jsp"%>
<h2 align="center">회원 가입</h2>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="<c:url value="/main.do"/>">
		<input type="hidden" name="act" id="act" value="register">
			<div class="form-group" align="left">
				<label for="id">아이디 <font color="red">*</font></label>
				<input type="text" class="form-control" id="memberformId" name="id" placeholder="">
			</div>
			
			<div class="form-group" align="left">
				<label for="pwd">비밀번호 <font color="red">*</font></label>
				<input type="password" class="form-control" id="memberformPwd" name="pwd" placeholder="">
			</div>
			
			<div class="form-group" align="left">
				<label for="name">이름 <font color="red">*</font></label>
				<input type="text" class="form-control" id="name" name="name" placeholder="">
			</div>
			
			<div class="form-group" align="left">
				<label for="email">이메일<font color="red">*</font></label><br>
				<input type="text" class="form-control" id="email" name="email" placeholder="" size="25">
				<button type="button" class="btn btn-outline-secondary pull-right" id="sendMailBtn">인증메일 받기</button>
			</div>
			
			<div id="authForm" class="form-group" align="left">
				<label for="auth">인증번호 확인<font color="red">*</font></label><br>
				<input type="text" class="form-control" id="auth" name="auth" placeholder="" size="25">
				<button type="button" class="btn btn-outline-secondary pull-right" id="authBtn">인증하기</button>
			</div>
			
			<div class="form-group" align="left">
				<label for="phone">전화번호<font color="red">*</font></label>
				<input type="text" class="form-control" id="phone" name="phone" placeholder="">
			</div>
			
			<div class="form-group" align="center">
				<button type="button" class="btn btn-outline-secondary" id="registerBtn" style="background-color:#ffcccc">회원가입</button>
				<button type="reset" class="btn btn-outline-secondary">초기화</button>
			</div>
		</form>
	</div>
</div>
<%@ include file="footer.jsp" %>
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