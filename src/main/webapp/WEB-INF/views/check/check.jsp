<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js" lang="zxx">
  <head>
    <title>Happy House | 자가 진단</title>
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
    <script>
    $(".hover").mouseleave(
    		  function () {
    		    $(this).removeClass("hover");
    		  }
    );
    </script>
  <style>
	@import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800);
	figure.snip1200 {
	  display: block;
	  float: left;
	  position: relative;
	  overflow: hidden;
	  margin-top: 1%;
	  min-width: 220px;
	  max-width: 310px;
	  max-height: 310px;
	  width: 100%;
	  background: #000000;
	  color: #black;
	  text-align: center;
	  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
	  font-size: 16px;
	}
	figure.snip1200 * {
	  -webkit-box-sizing: border-box;
	  box-sizing: border-box;
	  -webkit-transition: all 0.45s ease-in-out;
	  transition: all 0.45s ease-in-out;
	}
	figure#housingPay.snip1200{
		margin-left:10%;
		margin-right:7%;
	}
	figure#housingFinance.snip1200{
		margin-left:7%;
		margin-right:10%;
	}
	figure.snip1200 img {
	  max-width: 100%;
	  position: relative;
	  opacity: 0.9;
	}
	figure.snip1200 figcaption {
	  position: absolute;
	  top: 45%;
	  left: 7%;
	  right: 7%;
	  bottom: 45%;
	  border: 1px solid white;
	  border-width: 1px 1px 0;
	}
	figure.snip1200 .heading {
	  overflow: hidden;
	  -webkit-transform: translateY(50%);
	  transform: translateY(50%);
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	}
	figure.snip1200 h2 {
	  display: table;
	  margin: 0 auto;
	  padding: 0 10px;
	  position: relative;
	  text-align: center;
	  width: auto;
	  text-transform: uppercase;
	  font-weight: 400;
	}
	figure.snip1200 h2 span {
	  font-weight: 800;
	}
	figure.snip1200 h2:before,
	figure.snip1200 h2:after {
	  position: absolute;
	  display: block;
	  width: 1000%;
	  height: 1px;
	  content: '';
	  background: white;
	  top: 50%;
	}
	figure.snip1200 h2:before {
	  left: -1000%;
	}
	figure.snip1200 h2:after {
	  right: -1000%;
	}
	figure.snip1200 p {
	  top: 45%;
	  position: absolute;
	  width: 100%;
	  padding: 0 20px;
	  margin: 0;
	  opacity: 0;
	  line-height: 1.6em;
	  font-size: 30px;
	  color: white;
	}
	figure.snip1200 a {
	  left: 0;
	  right: 0;
	  top: 0;
	  bottom: 0;
	  position: absolute;
	  z-index: 1;
	}
	figure.snip1200:hover img,
	figure.snip1200.hover img {
	  opacity: 0.25;
	  -webkit-transform: scale(1.1);
	  transform: scale(1.1);
	}
	figure.snip1200:hover figcaption,
	figure.snip1200.hover figcaption {
	  top: 7%;
	  bottom: 7%;
	}
	figure.snip1200:hover p,
	figure.snip1200.hover p {
	  opacity: 1;
	  -webkit-transition-delay: 0.35s;
	  transition-delay: 0.35s;
	}
	.container{
		margin-top:2%;
		margin-right: 0;
		margin-left: 5%;
		margin-bottom: 5%;
		padding-right: 0px;
		padding-left: 0px;
		width:100%;
		max-width:90%;
	}
	.panel{
  		width:100%;
  		margin: 0;
  		height: 70%;
  	}
  </style>
  </head>
  <body>
    <%@ include file="../header.jsp"%>
    <%@ include file="../banner.jsp"%>
    <!-- ///////////////////     자가진단 버튼 시작            /////////////////////////////// -->
      <div class="container">
	      <div class="panel panel-default">
		      <div class="panel-heading" style="text-align:center">
		        <h4>주거복지 혜택 관련 자가진단 서비스입니다.</h4>
		   		<h2>주거복지 지원이 필요한 분야를 선택하세요.</h2>
		      </div>
		      <div class="panel-body">
		       <div id="title">
		   		</div>
				<figure class="snip1200" id="housingPay">
				<img src="/happyhouse/resources/img/house1.png">
				  <figcaption>
				    <p>주거급여</p>
				    <div class="heading">
				      <h3><span>전월세/집수리<br>비용 지원이 필요할 때</span></h3>
				    </div>
				  </figcaption>
				  <a href="/happyhouse/check/housingPay"></a>
				</figure>
				<figure class="snip1200" id="housingPublic">
					<img src="/happyhouse/resources/img/house2.png">
				  <figcaption>
				    <p>공공주택</p>
				    <div class="heading">
				      <h3><span>저렴하게 거주할<br>집이 필요할 때</span></h3>
				    </div>
				  </figcaption>
				  <a href="/happyhouse/check/housingPublic"></a>
				</figure>
				<figure class="snip1200" id="housingFinance">
					<img src="/happyhouse/resources/img/house3.png">
				  <figcaption>
				    <p>주택금융</p>
				    <div class="heading">
				      <h3><span>집 구매/세를 얻을 경우<br>대출이 필요할 때</span></h3>
				    </div>
				  </figcaption>
				  <a href="/happyhouse/check/housingFinance"></a>
				</figure>
				</div>
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
