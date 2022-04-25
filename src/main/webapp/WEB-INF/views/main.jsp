<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<title>Happy House | 메인화면</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
</head> 

<body>
	<%@ include file="header.jsp"%>
	
<%-- 	<c:if test="${sessionScope.memberinfo == null}"> --%>
<!-- 			<div id="formlogin" style="display:none"> -->
<%-- 			<%@ include file="login.jsp"%> --%>
<!-- 			</div> -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${sessionScope.memberinfo != null}"> --%>
<!-- 			<div align="right" class="container"> -->
<%-- 				<strong>${memberinfo.name}(${memberinfo.id})</strong>님 환영합니다. --%>
<!-- 			</div> -->
<%-- 	</c:if> --%>
	<%@ include file="banner.jsp"%>
	
	<div class="where_togo_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3">
                    <div class="form_area">
                        <h3>Search Apartment</h3>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="search_wrap">
                        <form class="search_form" action="#">
                            <div class="input_field">
                                <select id="sido">
									<option value="0">선택</option>
								</select>
                            </div>
                            <div class="input_field">
                                <select id="gugun">
									<option value="0">선택</option>
								</select>
                            </div>
                            <div class="input_field">
                                <select id="dong">
									<option value="0">선택</option>
								</select>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
<!-- 	<div class="search_"style="text-align:center"> -->
<!-- 		시도 : <select id="sido"> -->
<!-- 			<option value="0">선택</option> -->
<!-- 			</select> -->
<!-- 		구군 : <select id="gugun"> -->
<!-- 			<option value="0">선택</option> -->
			
<!-- 			</select> -->
<!-- 		읍면동 : <select id="dong"> -->
<!-- 			<option value="0">선택</option> -->
<!-- 			</select> -->
<!-- 	</div> -->
		
<script>
let colorArr = ['table-primary','table-success','table-danger'];
$(document).ready(function(){
	
	// 군버튼 이벤트 핸들러
	$("body").on("click", "#gugun+div>ul>li", function () {
		console.log($(this).data("value"));
		$.get("/happyhouse/selectDong"
				,{command:"dong", gugun:$(this).data("value")}
				,function(data, status){
					$("#dong").empty();
					$("#dong").append('<option value="0">선택</option>');
					$("#dong+div>ul").empty();
					$("#dong+div>ul").append(`<li data-value="0" class="option selected focus">선택</li>`);
					$.each(data, function(index, vo) {
						$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
						$("#dong+div>ul").append(`<li data-value="\${vo.dong}" class="option">\${vo.dong}</li>`);
					});//each
				}//function
				, "json"
		);//get
	});
	
	// 시버튼 이벤트 핸들러
	$("body").on("click", "#sido+div>ul>li", function () {
		console.log($(this).data("value"));
		$.get("/happyhouse/selectGugun"
				,{command:"gugun", sido:$(this).data("value")}
				,function(data, status){
					$("#gugun").empty();
					$("#gugun").append('<option value="0">선택</option>');
					$("#gugun+div>ul").empty();
					$("#gugun+div>ul").append(`<li data-value="0" class="option selected focus">선택</li>`);
					$.each(data, function(index, vo) {
						$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
						$("#gugun+div>ul").append(`<li data-value="\${vo.gugun_code}" class="option">\${vo.gugun_name}</li>`);
					});//each
				}//function
				, "json"
		);//get
	});
	
	$("#sido").append("<option value='1'>1</option>");
	console.log($("#sido"));
	$.get("/happyhouse/selectSido"
		,{command:"sido"}
		,function(data, status){
			$.each(data, function(index, vo) {
				$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
				$("#sido+div>ul").append(`<li data-value="\${vo.sido_code}" class="option">\${vo.sido_name}</li>`);
			});//each
		}//function
		, "json"
	);//get
});//ready
$(document).ready(function(){
	$("#sido").change(function() {
		
		$.get("/happyhouse/selectGugun"
				,{command:"gugun", sido:$("#sido").val()}
				,function(data, status){
					$("#gugun").empty();
					$("#gugun").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
					});//each
				}//function
				, "json"
		);//get
	});//change
	$("#gugun").change(function() {
		$.get("/happyhouse/selectDong"
				,{command:"dong", gugun:$("#gugun").val()}
				,function(data, status){
					$("#dong").empty();
					$("#dong").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
					});//each
				}//function
				, "json"
		);//get
	});//change
	$("#dong").change(function() {
		$.get("/happyhouse/selectApt"
				,{command:"apt", dong:$("#dong").val()}
				,function(data, status){
					$("#searchResult").empty();
					$.each(data, function(index, vo) {
						let str = "<tr class="+colorArr[index%3]+">"
						+ "<td>" + vo.no + "</td>"
						+ "<td>" + vo.dong + "</td>"
						+ "<td>" + vo.AptName + "</td>"
						+ "<td>" + vo.jibun + "</td>"
						+ "<td>" + vo.code
						+ "</td><td id='lat_"+index+"'></td><td id='lng_"+index+"'></td></tr>";
						$("tbody").append(str);
						$("#searchResult").append(vo.dong+" "+vo.AptName+" "+vo.jibun+"<br>");
					});//each
					geocode(data);
				}//function
				, "json"
		);//get
	});//change
});//ready
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
					address = data.results[0].formatted_address;
					$("#lat_"+index).text(tmpLat);
					$("#lng_"+index).text(tmpLng);
					addMarker(tmpLat, tmpLng, vo.aptName);
				}
				, "json"
		);//get
	});//each
}
</script>

<!-- map start -->
<div id="map" style="width: 60%; height: 500px; margin: auto;"></div><br>
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAc1XmLhqMoQeJATOknHL_SNbNsXhMojVg&callback=initMap"></script>
<script>
	var multi = {lat: 37.5012743, lng: 127.039585};
	var map;
	var markers=[];
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: multi, zoom: 12
		});
	}
	function addMarker(tmpLat, tmpLng, aptName) {
		clearMarkers(markers);
		console.log(address);
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
			label: aptName,
			title: aptName
		});
		marker.addListener('click', function() {
			map.setZoom(17);
			map.setCenter(marker.getPosition());
			// callHouseDealInfo(aptName);
		});
		marker.setMap(map);
		markers.push(marker);
		moveToLocation(tmpLat, tmpLng);
		
	}
	function callHouseDealInfo(aptName) {
		alert(aptName);
	}
	function moveToLocation(lat, lng){
		var center = new google.maps.LatLng(lat, lng);
		map.panTo(center);
	}
	function clearMarkers(markers) {
		for (var i=0;i<markers.length;i++){
			markers[i].setMap(null);
		}
	}
</script>
<!-- map end -->
	<%@ include file="footer.jsp" %>
	
	  <!-- Modal -->
  <div class="modal fade custom_search_pop" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="serch_form">
            <input type="text" placeholder="Search" >
            <button type="submit">search</button>
        </div>
      </div>
    </div>
  </div>
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
