<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<title>Happy House | 공지사항</title>
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
</head>
<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../banner.jsp"%>
	<div style="width:800px; margin: 0 auto">
		<br>
		<h3>공지사항 목록</h3>
		<br>
		<table class="table">
			<tr class="danger" style="text-align:center">
				<th>번 호</th>		
				<th>제 목</th>		
				<th><a href="<c:url value="noticeSort"/>">조 회 수</a></td>
				<th></td>
				<c:if test="${sessionScope.memberinfo.id == 'root'}">
					<td></th>
					<td></th>
				</c:if>
			</tr>
			<c:forEach var="notice" items="${list}">
				<tr>
					<td>${notice.isbn}</td>		
					<td>${notice.title}</td>		
					<td>${notice.views}</td>
					<form method="get" action="noticeDetail">
						<input type="hidden" id="act" name="isbn" value="${notice.isbn}"/>
						<td style="width:83px"><button class="btn btn-outline-secondary" style="background-color:#ffcccc">조회</button></td>
					</form>
					<c:if test="${sessionScope.memberinfo.id == 'root'}">
						<form method="get" action="noticeUpdateForm">
							<input type="hidden" id="act" name="isbn" value="${notice.isbn}"/>
							<td style="width:83px"><button class="btn btn-outline-secondary">수정</button></td>
						</form>
						<form method="get" action="deleteNotice"/>
							<input type="hidden" id="act" name="isbn" value="${notice.isbn}"/>
							<td style="width:83px"><button class="btn btn-outline-secondary" style="background-color:#cccccc">삭제</button></td>
						</form>
					</c:if>		
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div align="center" >
	<c:if test="${sessionScope.memberinfo.id == 'root'}">
		<form method="get" action="noticeForm" style="display: inline">
			<button class="btn btn-outline-secondary" style="background-color:#ffcccc">글 쓰기</button>
		</form>
	</c:if>
		<form method="get" action="/happyhouse/main" style="display: inline">
			<button class="btn btn-outline-secondary" style="background-color:#cccccc">메인페이지</button>

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