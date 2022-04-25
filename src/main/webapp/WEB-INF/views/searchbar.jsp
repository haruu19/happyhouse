<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="right">
			<select class="form-control" name="city" id="city">
				<option value="all">도/광역시</option>
				<option value="서울특별시">서울시</option>
				<option value="부산광역시">부산시</option>
			</select>
			<select class="form-control" name="dongcode" id="gu">
				<option value="all">시/구/군</option>
			</select>
			<select class="form-control" name="dong" id="dong">
				<option value="all">동</option>
			</select>
	</div>
</body>
</html>