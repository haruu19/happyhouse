<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
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
</head>
<title>실거래가 검색 결과</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="banner.jsp"%>
	<div class="container">
		<div>
		<h1>실거래가 검색 결과</h1>
			<form id="searchform" method="get" action="houseList" class="form-horizontal">
				<div class="form-inline form-group">
					<select class="form-control" name="searchType">
						<option value="all">전체</option>
						<option value="dong">법정동</option>
						<option value="aptname">아파트명</option>
					</select> 
					<input type="text" class="form-control" name="searchWord"
						placeholder="">
					<button class="btn btn-primary">검색</button>
				</div>
			</form>
		</div>
	
		<div>
			<table class="table table-hover ">
				<tr>
					<th>번호</th>
					<th>동</th>
					<th>아파트이름</th>
					<th>거래금액</th>
					<th>거래종류</th>
				</tr>
				<c:set var="listmax" value="30" />
				<c:forEach var="house" items="${list}" begin="${listmax*bean.pageNo}"
					end="${listmax*(bean.pageNo+1)-1}">
					<tr>
						<td>${house.no}</td>
						<td>${house.dong}</td>
						<td><a
							href="<c:url value="houseDetail?no=${house.no}"/>">${house.aptName}</a></td>
						<td>${house.dealAmount}</td>
						<td>${house.type}</td>
					</tr>
				</c:forEach>
			</table>
			
			<table align="center">
				<tr>
					<td>
						<ul class="pagination">
							<c:forEach var="pagenum" begin="${bean.start}" end="${bean.end}">
								<c:choose>
									<c:when test="${pagenum == bean.pageNo}">
										<li class="page-item active">
											<a class="page-link" href="houseList?page=${pagenum}&searchType=${bean.key}&searchWord=${bean.word}">${pagenum+1}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="houseList?page=${pagenum}&searchType=${bean.key}&searchWord=${bean.word}">${pagenum+1}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</td>
				</tr>
			</table>
			
<!-- 			<div> -->
<%-- 				<c:forEach var="pagenum" begin="${bean.start}" end="${bean.end}"> --%>
<%-- 					<a href="${root}/main.do?act=houselist&page=${pagenum}&searchType=${bean.key}&searchWord=${bean.word}">${pagenum+1}</a> --%>
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
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