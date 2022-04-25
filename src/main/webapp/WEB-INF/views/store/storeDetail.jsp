<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
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
<title>상권정보 상세검색 결과</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../banner.jsp"%>
	<div class="container">
		<h1>상권 정보</h1>
		<table class="table table-hover ">
			<tr>
				<th colspan="2">상권 상세 정보</th>
			</tr>
			<tr>
				<th>상가명</th>
				<td>${store.shopname}</td>
			</tr>
			<tr>
				<th>지역명</th>
				<td>${store.localname}</td>
			</tr>
			<tr>
				<th>대분류 코드</th>
				<td>${store.code1}</td>
			</tr>
			<tr>
				<th>대분류명</th>
				<td>${store.codename}</td>
			</tr>
			<tr>
				<th>중분류코드</th>
				<td>${store.code2}</td>
			</tr>
			<tr>
				<th>중분류명</th>
				<td>${store.codename2}</td>
			</tr>
			<tr>
				<th>소분류코드</th>
				<td>${store.code3}</td>
			</tr>
			<tr>
				<th>소분류명</th>
				<td>${store.codename3}</td>
			</tr>
			<tr>
				<th>표준산업분류코드</th>
				<td>${store.code4}</td>
			</tr>
			<tr>
				<th>표준산업분류명</th>
				<td>${store.codename4}</td>
			</tr>
			<tr>
				<th>시도명</th>
				<td>${store.city}</td>
			</tr>
			<tr>
				<th>시도코드</th>
				<td>${store.citycode}</td>
			</tr>
			<tr>
				<th>시군구코드</th>
				<td>${store.gucode}</td>
			</tr>
			<tr>
				<th>시군구명</th>
				<td>${store.gu}</td>
			</tr>
			<tr>
				<th>동코드</th>
				<td>${store.dongcode}</td>
			</tr>
			<tr>
				<th>동명</th>
				<td>${store.dong}</td>
			</tr>
			<tr>
				<th>지번주소</th>
				<td>${store.jibuaddress}</td>
			</tr>
			<tr>
				<th>도로명주소</th>
				<td>${store.address}</td>
			</tr>
			<tr>
				<th>구우편번호</th>
				<td>${store.oldpostcode}</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>${store.postcode}</td>
			</tr>
		</table>
		<div>
			<a class="btn btn-primary" href="storeList">상권 목록</a>
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