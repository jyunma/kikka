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
  <title>kikka - login</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
	   a{
   		cursor: pointer;
  		 }
  </style>
  
  
  <!-- 재인 로그인-->
  <style>
/*
 #cafe{
     display: none;
     border : 1px solid red;
 } */
 .myVisual{
      display : block !important;
 }
 #beforeLogin {
  font-family:'BBTreeGL';
 }
</style>
<script>
window.onload = function(){
  document.getElementById("user").classList.add("myVisual");
}
function call(value){
  if(value == "user"){
    document.getElementById("user").classList.add("myVisual");
    document.getElementById("cafe").classList.remove("myVisual");
  }else{
    document.getElementById("user").classList.remove("myVisual");
    document.getElementById("cafe").classList.add("myVisual");
  }
}
</script>
  <!-- font link -->
  <style>
  @import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@1,300;1,400&display=swap');
  </style>
</head>
<body>

    <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="/main"><img src="/image/kikka.png" style="width: 120px; height: 80px;"></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        
          <li class="nav-item">
            <a class="nav-link" href="/main">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/main/aboutOBN">About</a>
          </li>

          <c:if test="${user == null && cafe==null}">
            <li class="nav-item" >
              <a class="nav-link" data-toggle="modal" data-target="#loginModal">Join</a>
            </li>
          </c:if>
			              
          <c:if test="${user != null || cafe!=null}"> 
            <li class="nav-item">
              <c:if test="${mem_info=='user'}">
              <a class="nav-link" href="/main/myPage/user">My Page</a>
              </c:if>
              <c:if test="${ mem_info=='cafe'}">
              <a class="nav-link" href="/main/myPage/kidscafe">My Page</a>
              </c:if>
            </li>
          </c:if>

          <c:if test="${user == null && cafe == null}">
            <li class="nav-item">
              <a class="nav-link" href="/main/login">Login</a>
            </li>
          </c:if>

          <c:if test="${user != null || cafe!=null}">
            <li class="nav-item">
              <a class="nav-link" href="/main/logout">Logout</a>
            </li>
          </c:if>
        </ul>
        
      </div>
    </div>
  </nav>
  <!-- 로그인 용 모달 -->	
  <div class="modal fade" id="loginModal">
      <div class="modal-dialog">
         <div class="modal-content">

            <!-- Modal Header -->
              <div class="modal-header">
              <br>
                 <h5 class="modal-title">원하시는 회원가입 유형을 선택해주세요.</h5>
                 <button type="button" class="close" data-dismiss="modal">×</button>
              <br>
              </div>

            <!-- Modal body -->
               <div class="modal-body" style="text-align: center;">
               <br>
                 <button type="button" class="btn btn-outline-success" onclick="location.href='/main/joinKidscafe'">카페회원가입</button> &nbsp;
                 <button type="button" class="btn btn-outline-success" onclick="location.href='/main/joinUser'">고객회원가입</button>
               
               </div>
           <!-- Modal footer -->
				<div class="modal-body" style="text-align: center;">
				  <p class="copyright text-muted" style="font-size: 70%;">Copyright &copy; OBN 2020 & 2021</p>
				</div>
            

            </div>
        </div>
   </div>	
   	
   
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/image/login.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>Login</h1>
            <span class="subheading" style="font-family:'BBTreeGL';">welcome back!</span>
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-10 mx-auto">
        <div class="post-preview">
          	<h1 class="post-title" style="font-family: 'BBTreeGL'; font-weight: bold;">
              로그인
            </h1>
            <!-- 회원가입 및 로그인 오류 체크 -->
            <c:if test="${join != null }">
              <input type="hidden" value="${join}" id = "joinMsg">
              </c:if>
            <c:if test="${idpass != null }">
              <input type="hidden" value="${idpass}" id = "idpass">
              </c:if>
            <span style="font-family: 'BBTreeGL'; font-size: 120%;">
              회원 유형에 따라 로그인 해주세요.
            </span><br>
             &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id ="mem_info" name="mem_info" value="user" checked="checked" onchange = "call(this.value);" class="form-check-input">
             <span style="font-family: 'Noto Sans KR', sans-serif; font-size: 90%;">일반회원</span> &nbsp;&nbsp;&nbsp;&nbsp; 
             <input type="radio" id="mem_info" name="mem_info" value="cafe" onchange="call(this.value);" class="form-check-input">
             <span style="font-family: 'Noto Sans KR', sans-serif; font-size: 90%;">카페회원</span>
            </div>
              <hr>
              <div id="loginDisplay">
              <!--카페로그인  -->
              <div id="cafe" style="display:none;">
               <form action="klogin" method="post">
                <input type="hidden" name="kind" value="cafe">
                <div class="form-group">
                  <label>ID:</label>
                  <input type="text" name="kc_id" placeholder="kidscafe"  class="form-control" >
                </div>
                <div class="form-group">
                  <label>PASSWORD:</label>
                  <input type="password" name="kc_password"  class="form-control" >
                </div>
                <br>
                <div style="text-align: center;">
                  <input type="submit" class="btn btn-primary" value="로그인" >
              	</div>
              </form>
              <br>
            </div>
              <!--고객로그인  -->
              <div id="user" style="display:none;">
                <form action="ulogin" method="post">
                <input type="hidden" name="kind" value="user" >
                <div class="form-group">
                  <label>ID:</label>
                  <input type="text" name="user_id" placeholder="user" class="form-control" >
                </div>
                <div class="form-group">
                  <label>PASSWORD:</label>
                  <input type="password" name=user_password class="form-control" >
                </div>
                <br>
                <div style="text-align: center;">
                  <input type="submit" class="btn btn-primary" value="로그인" >
				</div>
                </form>
                <br>
              </div>
            </div>
        </div>
        <br><br><br>
      </div>
    </div>
 
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
  <script>
	var joinMsg = document.getElementById("joinMsg");
	if(joinMsg != null){
		alert("회원가입이 완료되었습니다.");
	}
	var idpass = document.getElementById("idpass");
	if(idpass != null){
		alert("아이디와 비밀번호를 확인해주세요.");
	}
  </script>
</body>
</html>