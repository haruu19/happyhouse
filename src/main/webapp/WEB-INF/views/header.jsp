<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<script>
	$(window).scroll(function() {
		if ($(window).scrollTop() >= 1) {
			$('.header-area').addClass('fixed-header');
		} else {
			$('.header-area').removeClass('fixed-header');
		}
	});

	function loginbtn() {
		$("#formlogin").toggle();
	}
	
	//용어사전 띄우기
	function doPopupOpen(){
		window.open("/happyhouse/dictionary/dictionary","popup01", "width=350px, height=600");
	}
</script>
</head>
<body>
	<!-- header-start -->
	<header>
		<div class="header-area ">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid">
					<div class="header_bottom_border">
						<div class="row align-items-center">
							<div class="col-xl-2 col-lg-2">
								<div class="logo">
									<a href="/happyhouse/main"> <img
										src="/happyhouse/resources/img/logo.png" alt="">
									</a>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6">
								<div class="main-menu  d-none d-lg-block">
									<nav>
										<ul id="navigation">
											<li><a class="active" href="/happyhouse/main">home</a></li>
											<li><a href="#">알립니다 <i class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="/happyhouse/notice/noticeList">공지사항</a></li>
													<li><a href="/happyhouse/news/newsList">오늘의 뉴스</a></li>
													<li><a href="http://localhost:9999/happyhouse/index.html">QnA</a></li>
												</ul></li>
											<li><a href="#">관심지역 <i class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a href="/happyhouse/fav/favForm">관심지역 설정</a></li>
													<li><a href="/happyhouse/fav/favList">관심지역 둘러보기</a></li>
													<li><a href="/happyhouse/fav/gradeList">관심지역 평가</a></li>
												</ul></li>
											<li><a href="/happyhouse/store/storeList">주변탐방</a></li>
											<li><a href="/happyhouse/houseList">실거래가</a></li>
											<li><a href="/happyhouse/check/check">자가진단</a></li>
											<li><a onclick="doPopupOpen()">용어사전</a></li>
										</ul>
									</nav>
								</div>
							</div>
							<div class="col-xl-4 col-lg-4 d-none d-lg-block">
								<div
									class="social_wrap d-flex align-items-center justify-content-end">
									<div class="number">
										<p>
											<i class="fa fa-phone"></i> 1544-9001
										</p>
									</div>
									<div class="social_links d-none d-xl-block">
										<ul>
											<li><a href="#"> <i class="fa fa-instagram"></i>
											</a></li>
											<li><a href="#"> <i class="fa fa-facebook"></i>
											</a></li>
											<c:if test="${sessionScope.memberinfo == null}">
												<li><a href="/happyhouse/loginForm">
														Login </a></li>
												<li><a href="/happyhouse/registerForm"> Sign Up </a></li>
											</c:if>
											<c:if test="${sessionScope.memberinfo != null}">
												<li><a href="/happyhouse/logout"> Logout </a></li>
												<li><a href="/happyhouse/memberinfo"> 회원 정보 </a></li>
												<li><a href="/happyhouse/delete"> 회원 탈퇴 </a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
							<div class="seach_icon">
								<a data-toggle="modal" data-target="#exampleModalCenter"
									href="#"> <i class="fa fa-search"></i>
								</a>
							</div>
							<div class="col-12">
								<div class="mobile_menu d-block d-lg-none"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header-end -->
</body>