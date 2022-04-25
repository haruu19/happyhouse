<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

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
$(document).ready(function() {
	let city;
	let dong;
	$("#registerBtn").click(function() {
			city = $("#city").find("option:selected").data("city");	
			// alert(city);
			$("#city option:eq(0)").before("<option value='"+city+"'></option>");
			$("#city option:eq(0)").attr("selected","selected");
			// alert($("#city").val());
			$("#favform").submit();
	});
	$("#closeBtn").click(function() {
			$("#favform").attr("act", "").submit();
	});
});
</script>
</head>
<body>

	<%@ include file="../header.jsp"%>
	<%@ include file="../banner.jsp"%>
	
	<div class="where_togo_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3">
                    <div class="form_area">
                        <h3>관심지역 등록</h3>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="search_wrap">
                        <form class="search_form" method="post" action="setFav">
                        	<input type="hidden" name="id" id="id" value="${memberinfo.id}">
                            <div class="input_field">
                                <select id="local" name="local">
									<option value="0">선택</option>
								</select>
                            </div>
                            <div class="input_field">
                                <select id="city" name="city">
									<option value="0">선택</option>
								</select>
                            </div>
                            <div class="input_field">
                                <select id="dong" name="dong">
									<option value="0">선택</option>
								</select>
                            </div>
                            <div class="search_btn">
                                <button class="boxed-btn4 " type="submit" >등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- 
	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<form id="favform" method="post" action="setFav">
				<input type="hidden" name="act" id="act" value="favset">
				<input type="hidden" name="id" id="id" value="${memberinfo.id}">
				<div class="form-group" align="left">
					<label for="title">관심 지역 설정 <font color="red">*</font></label>
					<select id="local" name="local">
						<option value="0">선택</option>
					</select>
					<select id="city" name="city">
						<option value="0">선택</option>
					</select>
					<select id="dong" name="dong">
						<option value="0">선택</option>
					</select>              
				</div>                     
				<div class="form-group" align="center">
					<form method="post" action="/main.do">
						<button type="button" class="btn btn-warning" id="closeBtn">닫기</button>
					</form>
					<button type="button" class="btn btn-primary" id="registerBtn">등록</button>
				</div>                     
			</form>                        
		</div>                             
	</div>    
	 -->                             
	<script>
		$(document).ready(function(){
			// 동버튼 이벤트 핸들러
			$("body").on("click", "#dong+div>ul>li", function () {
				console.log($(this).data("value"));
				dong = $(this).data("value");
				$("#dong option:eq(0)").before("<option value='"+dong+"'></option>");
				$("#dong option:eq(0)").attr("selected","selected");
			});
			
			// 군버튼 이벤트 핸들러
			$("body").on("click", "#city+div>ul>li", function () {
				console.log($(this).data("city"));	
				city = $(this).data("city");
				$("#city option:eq(0)").before("<option value='"+city+"' data-city='"+city+"'></option>");
				$("#city option:eq(0)").attr("selected","selected");
				
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
			$("body").on("click", "#local+div>ul>li", function () {
				console.log($(this).data("value"));
				$.get("/happyhouse/selectGugun"
						,{command:"gugun", sido:$(this).data("value")}
						,function(data, status){
							$("#city").empty();
							$("#city").append('<option value="0">선택</option>');
							$("#city+div>ul").empty();
							$("#city+div>ul").append(`<li data-value="0" class="option selected focus">선택</li>`);
							$.each(data, function(index, vo) {
								$("#city").append("<option value='"+vo.gugun_code+ "' data-city='"+vo.gugun_name+ "'>"+vo.gugun_name+"</option>");
								$("#city+div>ul").append(`<li data-value="\${vo.gugun_code}" data-city="\${vo.gugun_name}" class="option">\${vo.gugun_name}</li>`);
							});//each
						}//function
						, "json"
				);//get
			});
			
			$("#sido").append("<option value='1'>1</option>");
			console.log($("#local"));
			$.get("/happyhouse/selectSido"
				,{command:"sido"}
				,function(data, status){
					$.each(data, function(index, vo) {
						$("#local").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
						$("#local+div>ul").append(`<li data-value="\${vo.sido_code}" class="option">\${vo.sido_name}</li>`);
					});//each
				}//function
				, "json"
			);//get
		});//ready
		/*$(document).ready(function(){
			$("#local").change(function() {
				$.get("/happyhouse/selectGugun"
						,{command:"gugun", sido:$("#local+div>ul>li").val()}
						,function(data, status){
							$("#city").empty();
							$("#city").append('<option value="0">선택</option>');
							$.each(data, function(index, vo) {
								$("#city").append("<option value='"+vo.gugun_code+ "' data-city='"+vo.gugun_name+ "'>"+vo.gugun_name+"</option>");
							});//each
						}//function
						, "json"
				);//get
			});//change
			$("#city").change(function() {
				console.log($("#city+div>ul>li").val());
				$.get("/happyhouse/selectDong"
						,{command:"dong", gugun:$("#city+div>ul>li").val()}
						,function(data, status){
							console.log(data);
							$("#dong").empty();
							$("#dong").append('<option value="0">선택</option>');
							$.each(data, function(index, vo) {
								$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
							});//each
						}//function
						, "json"
				);//get
			});//change
		});//ready*/
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