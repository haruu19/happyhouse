<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<script type="text/javascript">
	function memberinfo() {
		$("memberinfo").action = "${root}/main.do?act=member";
		$("memberinfo").submit();
	}
</script>

<style>
.mainbar>a {
	margin-right: 10px;
	margin-bottom: 20px;
	margin-top: 5px;
	font-size: 15px;
	color: #000000;
}
.mainbar>button {
	margin-right: 4%;
	margin-bottom: 20px;
	margin-top: 5px;
	font-size: 15px;
	color: #000000;
}

</style>

</head>
<body>
<div class="container">
	<div align="right" class="mainbar">
		<a href="/happyhouse/notice/noticeList">공지사항</a>
		<a href="/happyhouse/news/newsList">오늘의 뉴스</a>
		<a href="/happyhouse/check/check">자가진단</a>
		<c:if test="${sessionScope.memberinfo != null}">
			<a href="/happyhouse/fav/favForm">관심 지역 설정</a>
			<a href="/happyhouse/fav/favList">관심 지역 둘러보기</a>
			<a href="/happyhouse/store/storeList">주변 탐방</a>
			<a href="/happyhouse/dictionary/dictionary">용어 사전</a>
			<a href="http://localhost:9999/happyhouse/index.html">QnA</a>
		</c:if>
		<form method="get" action="houseList" style="display: inline">
			<button>실거래가 검색</button>
		</form>
	</div>
</div>
</body>