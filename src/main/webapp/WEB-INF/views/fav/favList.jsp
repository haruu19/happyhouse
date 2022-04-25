<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<title>Happy House | 관심지역</title>
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
function toEnvSearch(){
	document.getElementById("checkform").action = "toEnv";
	document.getElementById("checkform").submit();
}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../banner.jsp"%>
	<div align="left">
		<br>
<!-- 		<h3 class="title"> 관심 지역 목록</h3> -->
<!-- 		<form id="checkform" method="get" class="form_inline" action="toEnv"> -->
<!-- 			<input type="hidden" name="act" id="act" value="toEnv"> -->
<!-- 			<label><input type="checkbox" name="checked" value="green">녹지 </label> -->
<!-- 	      	<label><input type="checkbox" name="checked" value="water">폐수 배출 </label>	 -->
<!-- 	      	<label><input type="checkbox" name="checked" value="air">대기 배출 </label>	 -->
<!-- 			<button type="button" class="btn btn-link" onclick="javascript:toEnvSearch();">확인</button> -->
<!-- 		</form> -->
		<div style="width:20%; float:left; margin:auto">
			<c:forEach varStatus="status" var="fav" items="${list}">
				<div class="favList" style="text-align:center">
					<h4>${fav.dong} / ${fav.cityName}</h4>
					<button id="'btn_'+${status.index}" class="btn btn-outline-secondary" value="${fav.dong}" style="background-color:#b2ddef">메인으로 변경</button>
					<form method="post" action="deleteFav" style="display: inline">
						<input type="hidden" name="id" value="${memberinfo.id}">
						<input type="hidden" name="dong" value="${fav.dong}">
						<input type="hidden" name="city" value="${fav.city}">
						<button class="btn btn-outline-secondary" style="background-color:#cccccc">삭제</button>
					</form>
				</div>
				<hr>
			</c:forEach>
		</div>
		<div id="map" style="width: 70%; height: 500px; margin: auto;"></div>
		<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAc1XmLhqMoQeJATOknHL_SNbNsXhMojVg&callback=initMap"></script>
	</div>
	<!-- 
	<h2>관심지역 환경 목록</h2>
			<c:if test="${greens!=null}">
			<h3>녹지대 정보</h3>
			<c:forEach var="green" items="${greens}">
			<table class="table table-hover ">
				<tr>
					<th>녹지대명</th>
					<td>${green.name}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${green.address}</td>
				</tr>
				<tr>
					<th>동코드</th>
					<td>${green.dongcode}</td>
				</tr>
				<tr>
					<th>동</th>
					<td>${green.dong}</td>
				</tr>
				<tr>
					<th>lng</th>
					<td>${green.lng}</td>
				</tr>
				<tr>
					<th>lat</th>
					<td>${green.lat}</td>
				</tr>
				<tr>
					<th>bizcode</th>
					<td>${green.bizcode}</td>
				</tr>
			</table>
			</c:forEach>
			</c:if>
			
			<c:if test="${waters!=null}">
			<h3>폐수배출업소</h3>
			<c:forEach var="water" items="${waters}">
				<table class="table table-hover ">
					<tr>
						<th>업체명</th>
						<td>${water.buildingname}</td>
					</tr>
					<tr>
						<th>인허가번호</th>
						<td>${water.num}</td>
					</tr>
					<tr>
						<th>업종코드</th>
						<td>${water.code}</td>
					</tr>
					<tr>
						<th>업종명</th>
						<td>${water.type}</td>
					</tr>
					<tr>
						<th>점검기관</th>
						<td>${water.inspectioninstitution}</td>
					</tr>
					<tr>
						<th>점검사항</th>
						<td>${water.inspeciton}</td>
					</tr>
					<tr>
						<th>소재지주소</th>
						<td>${water.address}</td>
					</tr>
				</table>
			</c:forEach>
			
			</c:if>
			
			<c:if test="${airs!=null}">
			<h3>대기배출업소</h3>
			<c:forEach var="air" items="${airs}">
				<table class="table table-hover ">
					<tr>
						<th>업체명</th>
						<td>${air.buildingname}</td>
					</tr>
					<tr>
						<th>인허가번호</th>
						<td>${air.num}</td>
					</tr>
					<tr>
						<th>업종코드</th>
						<td>${air.code}</td>
					</tr>
					<tr>
						<th>업종명</th>
						<td>${air.type}</td>
					</tr>
					<tr>
						<th>점검기관</th>
						<td>${air.inspectioninstitution}</td>
					</tr>
					<tr>
						<th>점검사항</th>
						<td>${air.inspeciton}</td>
					</tr>
					<tr>
						<th>소재지주소</th>
						<td>${air.address}</td>
					</tr>
				</table>
			</c:forEach>
			</c:if>
 	-->
	<a href="<c:url value="/main.do" />">메인 페이지</a>
	<script>
		$(".favList>.btn").click(function () {
			$(".favList>.btn").css('background-color', '#b2ddef');
			$(this).css('background-color', '#76c7e4');
		});
		$(".favList>.btn").click(function () {
			clearMarkers(markers);
			console.log($(this).val());
			
			$.get("/happyhouse/selectSchool"
					,{dong:$(this).val()}
					,function(data, status){
						schoolGeocode(data);
					}//function
					, "json"
			);
			
			$.get("/happyhouse/selectStore"
					,{dong:$(this).val()}
					,function(data, status){
						storeGeocode(data);
					}//function
					, "json"
			);
			
			$.get("/happyhouse/selectEnv"
					,{dong:$(this).val()}
					,function(data, status){
						envGeocode(data);
					}//function
					, "json"
			);
			
			$.get("/happyhouse/selectApt"
					,{command:"apt", dong:$(this).val()}
					,function(data, status){
						geocode(data);
					}//function
					, "json"
			);
			
			
		})
		
		function schoolGeocode(jsonData) {
			$.each(jsonData, function(index, vo) {
				addSchoolMarker(vo.lat, vo.lng, vo.schoolname, vo.jibun);
			});//each
		}
		
		function storeGeocode(jsonData) {
			$.each(jsonData, function(index, vo) {
				console.log("store의 vo 출력테스트");
				console.log(vo);
				addStoreMarker(vo.lat, vo.lng, vo.shopname, vo.address);
			});//each
		}
		
		function envGeocode(jsonData) {
			$.each(jsonData, function(index, vo) {
				console.log(vo);
				addEnvMarker(vo.lat, vo.lng, vo.name, vo.address);
			});//each
		}
		
		function geocode(jsonData) {
			let idx = 0;
			$.each(jsonData, function(index, vo) {
				console.log(vo);
				let tmpLat;
				let tmpLng;
				$.get("https://maps.googleapis.com/maps/api/geocode/json"
						,{	key:'AIzaSyAc1XmLhqMoQeJATOknHL_SNbNsXhMojVg'
							, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
						}
						, function(data, status) {
							console.log(data);
							tmpLat = data.results[0].geometry.location.lat;
							tmpLng = data.results[0].geometry.location.lng;
							$("#lat_"+index).text(tmpLat);
							$("#lxng_"+index).text(tmpLng);
							let detail = vo.dong + " " + vo.jibun;
							addMarker(tmpLat, tmpLng, vo.aptName, detail);
						}
						, "json"
				);//get
			});//each
		}

		
		
		var multi = {lat: 37.5012743, lng: 127.039585};
		var map;
		var markers = [];
		
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center: multi, zoom: 12
			});
		}
		
		function addMarker(tmpLat, tmpLng, aptName, detail) {
			var house = new google.maps.MarkerImage("/happyhouse/resources/img/house.png", null, null, null, new google.maps.Size(30,30));
			
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
				// label: aptName,
				title: aptName,
				icon: house,
				snippet: detail
			});
			marker.addListener('click', function() {
				
				var infoWindow = new google.maps.InfoWindow({
	                content:
	                    "<h4>"+ marker.title +"</h4>"
	                    + "<p>"+ marker.snippet +"</p>"
	                    + "<a href='/happyhouse/houseInfo?aptName="+marker.title+"'>아파트 정보</a>"
	            });
				
				map.setZoom(16);
				map.setCenter(marker.getPosition());
				infoWindow.open(map, marker);
			});
			marker.setMap(map);
			markers.push(marker);
			moveToLocation(tmpLat, tmpLng);
			map.setZoom(14);
		}

		function addSchoolMarker(lat, lng, name, address) {
			var school = new google.maps.MarkerImage("/happyhouse/resources/img/school.png", null, null, null, new google.maps.Size(30,30));
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(parseFloat(lat),parseFloat(lng)),
				// label: name,
				title: name,
				icon: school,
				snippet: address
			});
			marker.addListener('click', function() {
				
				var infoWindow = new google.maps.InfoWindow({
	                content:
	                    "<h4>"+ marker.title +"</h4>"
	                    + "<p>"+ marker.snippet +"</p>"
	                    + "<a href='#'>학교 정보</a>"
	            });
				
				map.setZoom(16);
				map.setCenter(marker.getPosition());
				infoWindow.open(map, marker);
			});
			marker.setMap(map);
			markers.push(marker);
			moveToLocation(lat, lng);
		}
		
		function addStoreMarker(lat, lng, name, address) {
			console.log("addStoreMarker 실행됨");
			lat = lat.substring(1,lat.length-1);
			lng = lng.substring(1,lng.length-1);
			var store = new google.maps.MarkerImage("/happyhouse/resources/img/store.png", null, null, null, new google.maps.Size(30,30));
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(parseFloat(lat),parseFloat(lng)),
				// label: name,
				title: name,
				icon: store,
				snippet: address
			});
			marker.addListener('click', function() {
				
				var infoWindow = new google.maps.InfoWindow({
	                content:
	                    "<h4>"+ marker.title +"</h4>"
	                    + "<p>"+ marker.snippet +"</p>"
	                    + "<a href='/happyhouse/store/storeInfo?shopname="+marker.title+"'>상권 정보</a>"
	            });
				
				map.setZoom(16);
				map.setCenter(marker.getPosition());
				infoWindow.open(map, marker);
			});
			marker.setMap(map);
			markers.push(marker);
			moveToLocation(lat, lng);
		}
		
		function addEnvMarker(lat, lng, name, address) {
			var env = new google.maps.MarkerImage("/happyhouse/resources/img/env.png", null, null, null, new google.maps.Size(30,30));
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(parseFloat(lat),parseFloat(lng)),
				// label: name,
				title: name,
				icon: env,
				snippet: address
			});
			marker.addListener('click', function() {
				
				var infoWindow = new google.maps.InfoWindow({
	                content:
	                    "<h4>"+ marker.title +"</h4>"
	                    + "<p>"+ marker.snippet +"</p>"
	                    + "<a href='#'>녹지대 정보</a>"
	            });
				
				map.setZoom(16);
				map.setCenter(marker.getPosition());
				infoWindow.open(map, marker);
			});
			marker.setMap(map);
			markers.push(marker);
			moveToLocation(lat, lng);
		}
		
		function callHouseDealInfo(aptName) {
			alert(aptName);
		}
		
		function moveToLocation(lat, lng) {
			var center = new google.maps.LatLng(lat, lng);
			map.panTo(center);
		}
		
		function clearMarkers(markers) {
			for (var i=0;i<markers.length;i++){
				markers[i].setMap(null);
			}
		}
	</script>	
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