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

  <title>update kidscafe info</title>

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
	  
	  @font-face {
	    font-family: 'ChosunSg';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunSg.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	  }
     
      @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

  </style>  
  <style>
		#postal_btn {
		      color: grey;
		}
	    #InputFile {
	      
	      color: grey;
	      font-size: 15px;
	    }
  </style>
</head>
<body>

  <jsp:include page="../header.jsp"></jsp:include>
 
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/image/userUpdate.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>My Page</h1>
            <span class="subheading" style="font-family: 'BBTreeGL';">update info</span>
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
            <h2 class="post-title" style="font-family: 'BBTreeGL'; font-weight: bold;">
             ${kidscafe.kc_name} 님의 정보 수정
            </h2>
            <br><br>
            <form role="form" action="update" method="post" class="post-subtitle" enctype="multipart/form-data"
            style="font-family: 'Noto Sans KR', sans-serif; font-size: 85%; font-weight: bold;">
                    <input type="hidden" name="kc_id" value="${kidscafe.kc_id}">
                    <div class="form-group">
                        <label for="InputName">NAME</label>
                        <input type="text" class="form-control" id="InputName" placeholder="변경하실 상호명을 입력해 주세요" name="kc_name" value="${kidscafe.kc_name}">
                    </div>
                     <div class="form-group">
                        <label for="inputMobile">PHONE</label>
                        <input type="tel" class="form-control" id="inputMobile" placeholder="전화번호를 입력해 주세요" name="kc_phone" value="${kidscafe.kc_phone}">
                    </div>
                    <div class="form-group">
                        <label for="InputName">BUSINESS HOURS</label>
                        <input type="text" class="form-control" id="InputName" placeholder="영업시간을 입력해 주세요" name="kc_business_hours" value="${kidscafe.kc_business_hours}">
                    </div>
                    <div class="form-group">
                        <label for="InputName">INTRODUCTION</label>
                        <input type="text" class="form-control" id="InputName" placeholder="업체의 소개글을 입력해 주세요" name="kc_introduction" value="${kidscafe.kc_introduction}">
                    </div>
                     <label for="InputName">PHOTO</label><br>
                     <input type="file" id="InputFile" name="file"  required="required">
                    <br><br>
                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" class="btn btn-primary">수정</button>
                       
                    </div>
                </form>
            
            
        </div>
        <br><br><br>
        
      </div>
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

</body>

</html>