<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>kikka main page</title>
  <!-- Bootstrap core CSS -->
  <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template -->
  <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
  <!-- Custom styles for this template -->
  <link href="/css/clean-blog.min.css" rel="stylesheet">
  <!-- 템플릿 외 추가 글꼴 -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
  <style>
	  @font-face {
	    font-family: 'BBTreeGL';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGL.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	  }
      @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
  </style>
  <style>
  	.input-group {
		border-color: lightgray;  	
  	}
  	#regionid {
  		border-color: lightgray;
  		font-size:1rem;
  	}
    </style>
	<script>
		window.onload = function() {
			document.getElementById('datePicker').valueAsDate = new Date();
			
			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();
			 if(dd<10){
			        dd='0'+dd
			    }
			    if(mm<10){
			        mm='0'+mm
			    }
	
			today = yyyy+'-'+mm+'-'+dd;
			document.getElementById("datePicker").setAttribute("min", today);
	
		}
	</script>
</head>
<body>
  <jsp:include page="../header.jsp"></jsp:include>
    		
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/image/kidscafe.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>kikka</h1>
                <c:if test="${ user==null }">
                  <span class="subheading" style="font-family:'BBTreeGL';">키즈카페예약 플랫폼 kikka !</span>
               </c:if>
                <c:if test="${ user!=null }">
                  <span class="subheading" style="font-family:'BBTreeGL';">Lv.<img src="/image/${user.user_level}white.png" style="width:35px; height: 35px;">&nbsp;${user.user_name}님 환영합니다.</span>
                </c:if>
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <div class="post-preview">
            <h1 class="post-title" style="font-family: 'BBTreeGL'; font-weight: bold;">
              키즈카페 찾기
            </h1>
            <h4 class="post-subtitle" style="font-family: 'BBTreeGL';">
              원하시는 조건을 입력해주세요
            </h4>
            <hr>
            <form action="/search/kidscafeList" method="get" style="text-align: center; font-family: 'Noto Sans KR', sans-serif;">
            <br>
            <div class="input-group mb-3" style="height: 70px;">
		      <div class="input-group-prepend">
		        <span class="input-group-text">날짜</span>
		      </div>
		      <input type="date" class="form-control" value="date" id="datePicker" name="date" style="height: 70px;">
		      <div class="input-group-prepend">
		        <span class="input-group-text">지역</span>
		      </div>
              <select name="location" id="regionid" style="width: 150px;">
                <c:forEach items="${gulist}" var="gu">
                  <option>${gu}</option>
                </c:forEach>
              </select>
              <div class="input-group-prepend">
		        <span class="input-group-text">인원</span>
		      </div>
		      <input type="number" class="form-control" name="count" min="1" max="15" value="1" style="height: 70px;">
		    </div>
            <br><br>
              <input type="submit" value="검색하기 &rarr;" class="btn btn-primary float-right" >
              </form>
        </div>
      </div>
    </div>
  </div>
<br>
  <hr>
  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <ul class="list-inline text-center">
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <span class="fa-stack fa-lg">
                  <i class="fas fa-circle fa-stack-2x"></i>
                  <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                </span>
              </a>
            </li>
          </ul>
          <p class="copyright text-muted">Copyright &copy; OBN 2020 & 2021</p>
        </div>
      </div>
    </div>
  </footer>
  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Custom scripts for this template -->
  <script src="/js/clean-blog.min.js"></script>
</body>
</html>