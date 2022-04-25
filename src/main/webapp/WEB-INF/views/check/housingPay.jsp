<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<title>Happy House | 주거급여</title>
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
	<script type="text/javascript">
	$(document).ready(function() {
		
		// 주거급여 계산을 위한 클릭 이벤트에 활용될 변수 설정
		var clicked_rent = false;
		var clicked_own = false;
		var clicked_method = new Array(false,false,false,false);
		var clicked_money = 0;
		var city;
		
		// click 체크를 위한 함수 선언
		function chk(index){
			clicked_method[index] = true;
			for(var i in clicked_method){
				if(i!=index){
					clicked_method[i] = false;
				}
			}
		} 
		// 결과 html
		var result = `
			<hr>
			<div>
				<button class="btn btn-default btn-lg" id="result">결과보기</button>
			</div>
		`;
		// 결과 함수
		var index;
		function sendFunc(){
			number = document.getElementById("number").value;
			income = document.getElementById("income").value;
			index;
			clicked_money;
			city;
			location.href="/happyhouse/check/housingPayResult?"+number+"?"+income+"?"+index+"?"+clicked_money+"?"+city;
		}
		function result2(){
				for(var i in clicked_method){
					if(clicked_method[i]==true)
						index = i;
				}
				sendFunc();
		}
		
		// 환산월임차료 계산 함수
		function calculate(){
			clicked_money = document.getElementById("moneyCal").value;
		}
		
		/* 클릭 시 버튼 색 변경 */
		$(".btn").click(function () {
			$(".btn").css('background-color', '#cccccc');
	        $(this).css('background-color', '#ffcccc');
	     });
		$("#rent").on("click", function(){
			clicked_rent = true;
			clicked_own = false;
			$("#dynamic").empty();
			$("#dynamic2").empty();
			$("#dynamic").append(`
					<div style="margin-bottom:3%;">
						<hr>
						<h4><strong>2. 현재 가구의 소득인정액을  입력하세요</strong></h4>
						<input type="text" id="income" name="income" placeholder="만 원 단위로 입력하세요"> 만원/월
						<br>
					</div>
					<hr>
					<div style="margin-bottom:3%;">
						<h4><strong>3. 본인의 가구원 수를 입력하세요</strong></h4>
						<input type="number" id="number" name="number"> 인
					</div>
					<div class='form-group' id="city">
					<hr>
			            <h4><strong>4. 살고있는 주택의 소재 지역을 선택하세요</strong></h4>
			            <button class="btn btn-default btn-lg" class='city' id='seoul'>서울</button>
			            <button class="btn btn-default btn-lg" class='city' id='incheon'>경기, 인천</button>
			            <button class="btn btn-default btn-lg" class='city' id='metropolitan'>광역시, 세종</button>
			            <button class="btn btn-default btn-lg" class='city' id='etc'>그 외</button>
		       		</div>
		        	<div class='form-group' id="contract">
					<hr>
			            <h4><strong>5. 임차계약 방식과 임차료를 입력하세요.</strong></h4>
			            <button class="btn btn-default btn-lg" id='one'>전세</button>
			            <button class="btn btn-default btn-lg" id='two'>월세</button>
			            <button class="btn btn-default btn-lg" id='three'>보증부월세</button>
			            <button class="btn btn-default btn-lg" id='four'>임차료없음</button>
			            <br>
		        	</div>
		        `);
			////////////////////////////////////////////
			//city값 넣기..
			$('#seoul').on("click", function(){
				city = 'seoul';
			})
			$('#incheon').on("click", function(){
				city = 'incheon';
			})
			$('#metropolitan').on("click", function(){
				city = 'metropolitan';
			})
			$('#etc').on("click", function(){
				city = 'etc';
			})
			/////////////////////////////////////////////
			
			
			$("#one").on("click",function(){
				chk(0);
				$("#dynamic2").empty();
				$("#dynamic2").append(`
						<hr>
						<h4><strong>보증금</strong></h4>
						<input type="num" id="money" name="money"> 만원/월
						<h4><strong>환산월임차료</strong></h4>
						<input type="num" id="moneyCal" name="moneyCal" value=""> 만원/월
						<hr>
						`);
				$("#dynamic2").append(result);
				$("#result").on("click", function(){
					result2();
				});
				//보증금의 값이 바뀔 떄
				$("#money").on("propertychange change keyup paste input", function(){
					var currentVal = $(this).val();
					var oldVal;
					if(currentVal != oldVal){
						$("#moneyCal").val(currentVal/300);
					}
					oldVal = currentVal;
					calculate();
				})
			});
			
			$("#two").on("click",function(){
				chk(1);
				$("#dynamic2").empty();
				$("#dynamic2").append(`
						<hr>
						<h4><strong>월임차료</strong></h4>
						<input type="num" id="moneyCal" name="moneyCal"> 만원/월
						`);
				$("#dynamic2").append(result);
				$("#result").on("click", function(){
					result2();
				});
				//보증금의 값이 바뀔 떄
				$("#moneyCal").on("propertychange change keyup paste input", function(){
					var currentVal = $(this).val();
					var oldVal;
					if(currentVal != oldVal){
						$("#moneyCal").val(currentVal);
					}
					oldVal = currentVal;
					calculate();
				})
			});
			
			$("#three").on("click",function(){
				chk(2);
				$("#dynamic2").empty();
				$("#dynamic2").append(`
						<hr>
						<h4><strong>보증금</strong></h4>
						<input type="num" id="money" name="money"> 만원/월
						<h4><strong>월임차료</h4></strong>
						<input type="num" id="money2" name="money"> 만원/월
						<h4><strong>환산월임차료</strong></h4>
						<input type="num" id="moneyCal" name="moneyCal" value=""> 만원/월
						`);
				$("#dynamic2").append(result);
				$("#result").on("click", function(){
					result2();
				});
				// 보증금의 값이 바뀔 때
				$("#money").on("propertychange change keyup paste input", function(){
					var currentVal = Number($(this).val());
					var oldVal;
					if(currentVal != oldVal){
						$("#moneyCal").val(currentVal/300+Number($('#money2').val()));
					}
					oldVal = currentVal;
					calculate();
				});
				$("#money2").on("propertychange change keyup paste input", function(){
					var currentVal = Number($(this).val());
					var oldVal;
					if(currentVal != oldVal){
						var money = Number($('#money').val()/300);
						currentVal +=money;
						$("#moneyCal").val(currentVal);
					}
					oldVal = currentVal;
					calculate();
				})
			});
			
			$("#four").on("click",function(){
				chk(3);
				$("#dynamic2").empty();
				$("#dynamic2").append(`
						<hr>
						<h4><strong>지급특례에 해당하는 경우 선택하세요.</strong></h4>
						<input type="radio"> 임차료 이외 별도의 대가를 지불하는 경우(사용대차 확인서 제출 필요) <br>: 기준임대료의 60%를 상한으로 지급<br>
						<input type="radio"> 개인운영시설(미신고시설 포함) 또는 개인운영 공동생활가정 등 거주시 <br>: 기준임대료의 60%를 상한으로 지급<br>
						`);
				$("#dynamic2").append(result);
				$("#result").on("click", function(){
					result2();
				});
			});
			
			/* 클릭 시 버튼 색 변경 */
			$("#city>button").click(function () {
				$("#city>button").css('background-color', '#cccccc');
			    $(this).css('background-color', '#ffcccc');
			 });
			
			$("#contract>button").click(function () {
				$("#contract>button").css('background-color', '#cccccc');
		        $(this).css('background-color', '#ffcccc');
		     });
		});
		$("#own").on("click", function(){
			clicked_rent = false;
			clicked_own = true;
				$("#dynamic").empty();
				$("#dynamic2").empty();
				$("#dynamic").append(`
						<div style="margin-bottom:3%;">
							<hr>
							<h4><strong>2. 현재 가구의 소득인정액을  입력하세요</strong></h4>
							<input type="text" id="income" name="income" placeholder="만 원 단위로 입력하세요"> 만원/월
							<br>
						</div>
						<hr>
							<div style="margin-bottom:3%;">
							<h4><strong>3. 본인의 가구원 수를 입력하세요</strong></h4>
							<input type="number" id="number" name="number"> 인
						</div>
						<hr>
						<div class='form-group' id="permission">
							 <h4><strong>4. 주택의 허가여부를 선택하세요</strong></h4>
				            <button class="btn btn-default btn-lg" id='perm'>허가주택</button>
				            <button class="btn btn-default btn-lg" id='non_perm'>무허가주택</button>
				            <button class="btn btn-default btn-lg" id='not_perm'>비닐하우스 등 비주택</button>
						</div>
						<hr>
						<div class='form-group' id="havenohave">
							 <h4><strong>5. 주택의 소유여부를 선택하세요.</strong></h4>
				            <button class="btn btn-default btn-lg" id='have'>가구 소유지분 일부 또는 전부 보유</button>
				            <button class="btn btn-default btn-lg" id='nohave'>가구 소유지분 전혀 없음</button>
						</div>
						`);
				$("#dynamic2").append(result);
				$("#result").on("click", function(){
					result2();
				});
			});
	});
</script>
</head>
<style>
	.btn:active:focus {
	  color: #ffffff; 
	  background-color: red; 
	  border-color: #494F57;
	}
	.panel{
  		width:70%;
  		height: 50%;
  		margin-left:15%;
  		margin-top:2%;
  		text-align:left;
  	}
	input {
		width:50%;
		height: 40px;
        border-style:none;
        border-bottom:solid 1px #cacaca;
        border-collapse:collapse;
    	margin-bottom:2%;
	}
</style>
<body>
	<%@ include file="../header.jsp"%>
	<%@ include file="../banner.jsp"%>
	<div class="container">
		<div class="panel panel-danger" id="type">
						<div class="panel-heading"><h3 style="color:black;">주거 급여 진단하기</h3></div>
						<div class="panel-body">
							<div>
								<h4><strong>1. 현재 주거형태를 선택하세요</strong></h4>
									<button class="btn btn-default btn-lg" id="rent">임차가구</button>
									<button class="btn btn-default btn-lg" id="own">자가가구</button>
							</div>
							<div id="dynamic"></div>
							<div id="dynamic2"></div>
							<div id="dynamic3"></div>
					</div>
				</div>
	</div>
	<footer style="clear:both;">			
	<%@ include file="../footer.jsp" %>
	</footer>
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