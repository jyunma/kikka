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
   a{
   		cursor: pointer;
   }
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
   	
  <!-- Bootstrap core JavaScript -->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/js/clean-blog.min.js"></script>

</body>
</html>