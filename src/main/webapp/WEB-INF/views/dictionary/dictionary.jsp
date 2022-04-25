<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<title>Happy House | 용어사전</title>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="/happyhouse/resources/js/hangul.js" type="text/javascript"></script>
<script>
	var array = new Array('','ㄱ', 'ㄴ', 'ㄷ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅅ', 'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ');
    var dic_word_array;
    var div_content_array;
    var totalData;    // 총 데이터 수
	var dataPerPage = 7;    // 한 페이지에 나타낼 데이터 수
	var pageCount = 5;        // 한 화면에 나타낼 페이지 수
	
	var currnetPage;
	
	function findHangul(num){
		console.log("num = "+num);
		dic_word_array = new Array();
		dic_content_array = new Array();
		var i=0;
		$("#search").empty();
		$("#detail_dictionary").empty();
		$("#find_dictionary").empty();
		<c:forEach var="dictionary" items="${dictionary}">
		var dictionary_word = '${dictionary.word}';
		var dictionary_content = '${dictionary.content}';
			if(Hangul.disassemble(dictionary_word)[0]==array[num]){
				dic_word_array[i] = dictionary_word;
				dic_content_array[i++] = dictionary_content;
				}
		</c:forEach>
		totalData = dic_word_array.length;
		console.log("totalData= "+totalData);
		if(totalData<10){
			dataPerPage = totalData;
		}
		if(totalData/10 < 5){
			pageCount = Math.floor(totalData/10)+1;
		}
		paging(totalData, dataPerPage, pageCount, 1);
		
	}
	
	function detail(num){
		console.log(num);
		$("#search").empty();
		$("#detail_dictionary").empty();
		$("#detail_dictionary").append(dic_content_array[num]);
	}
	 function paging(totalData, dataPerPage, pageCount, currentPage){
	        
		 console.log(totalData);
		 console.log(dataPerPage);
		 console.log(pageCount);
		 console.log(currentPage);
		 	
	        var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
	        var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹
	        var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
	        if(last > totalPage)
	            last = totalPage;
	        var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
	        var next = last+1;
	        var prev = first-1;
	        var html = "";
	 
	        var $pingingView = $("#paging");
	        
	        if(prev > 0)
	            html += "<li><a href=# id='prev'><</a></li>";
	        
	        for(var i=first; i <= last; i++){
	            html += "<li><a href='#' id=" + i + ">" + i + "</a></li>";
	        }
	        
	        if(last < totalPage)
	            html += "<li><a href=# id='next'>></a></li>";
	        
	        $("#paging").html(html);   // 페이지 목록 생성
	        $("#paging a").css("color", "black");
	        $("#paging a").click(function(){
	            
	            var $item = $(this);
	            console.log($item);
	            console.log($(this));
	            
	            var $id = $item.attr("id");
	            var selectedPage = $item.text();
	            
	            // 페이지마다 내용 추가하기
	        	$("#find_dictionary").empty();
	        	for(var i=0+(selectedPage-1)*dataPerPage; i<dataPerPage+(selectedPage-1)*dataPerPage; i++){
	        		$("#find_dictionary").append('<li><a href="#" onclick="detail('+i+')">· '+dic_word_array[i]+'</a></li>');
	        		if(i==totalData-1) break;
	        	}
	            if($id == "next")    selectedPage = next;
	            if($id == "prev")    selectedPage = prev;
	            
	            paging(totalData, dataPerPage, pageCount, selectedPage);
	        });                               
	    }
</script>
</head> 
<style>
h2{
	margin-top: 5%;
	margin-bottom: 5%;
}

.form-control{
	width: 60%;
	height: 11%;
	margin-left:13%;
	margin-right:1%;
}
UL#word{
	background-color:#fff0e6;
	margin-bottom:2%;
}
UL.btn LI{
		float: left;
		margin-top: 2%;		
		border-left: 1px solid #e5e5e5;
	}
UL.btn LI A{
		display: block;
		padding: 7px 15px 11px;
		font-size: 14px;
	}
UL.btn LI A:hover{
		background: #f56946;
		color: #fff;		
	}
UL.find_dictionary{
	text-align: left;
	margin-top: 3%;
	margin-left: 5%;
	margin-right: 5%;
	background-color: #fff0e6;
}

UL.find_dictionary li{
	margin-left: 3%;
	margin-bottom:2%;
}

UL.detail_dictionary{
	margin-left: 5%;
	margin-right: 5%;
}

</style>
<body>
	<div style="text-align:center">
		<div id="title">
			<h2>부동산 용어 사전</h2>	
		</div>
		<form id="searchDictionary" method="get" action="searchDictionary" class="form-horizontal">
			<div class="form-inline form-group">
			<input type="text" class="form-control" name="Word" id="Word" placeholder="">
			<button class="btn btn-default">검색</button>
			</div>
		</form>
		
		<!-- 자음 버튼 -->
		<ul id="word" class="btn">
			<li id="li_1"><a href="#" onclick="findHangul(1)"><strong>ㄱ</strong></a></li>
			<li id="li_2"><a href="#" onclick="findHangul(2)"><strong>ㄴ</strong></a></li>
			<li id="li_3"><a href="#" onclick="findHangul(3)"><strong>ㄷ</strong></a></li>
			<li id="li_4"><a href="#" onclick="findHangul(4)"><strong>ㄹ</strong></a></li>
			<li id="li_5"><a href="#" onclick="findHangul(5)"><strong>ㅁ</strong></a></li>
			<li id="li_6"><a href="#" onclick="findHangul(6)"><strong>ㅂ</strong></a></li>
			<li id="li_7"><a href="#" onclick="findHangul(7)"><strong>ㅅ</strong></a></li>
			<li id="li_8"><a href="#" onclick="findHangul(8)"><strong>ㅇ</strong></a></li>
			<li id="li_9"><a href="#" onclick="findHangul(9)"><strong>ㅈ</strong></a></li>
			<li id="li_10"><a href="#" onclick="findHangul(10)"><strong>ㅊ</strong></a></li>
			<li id="li_11"><a href="#" onclick="findHangul(11)"><strong>ㅋ</strong></a></li>
			<li id="li_12"><a href="#" onclick="findHangul(12)"><strong>ㅌ</strong></a></li>
			<li id="li_13"><a href="#" onclick="findHangul(13)"><strong>ㅎ</strong></a></li>
		</ul>
		
		<!-- 검색했을 떄 -->
		<c:if test='${!empty search_dictionary}'>
		<script>
			$('#search').empty();
		</script>
		<div id="search">
			단어 : ${search_dictionary.word}<br>
			뜻 : ${search_dictionary.content}
		</div>
		</c:if>
		
		<!-- 용어 목록 -->
		<h4><strong>용어목록</strong></h4>
		<ul class="btn" id="paging"></ul>
		<ul class="find_dictionary" id="find_dictionary">
		</ul>
		
		<!-- 설명 목록 -->
		<h4><strong>용어해석</strong></h4>
		<ul class="detail_dictionary" id="detail_dictionary">
		</ul>
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
