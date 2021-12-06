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

  <title>kikka - about team OBN</title>

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
     @import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css);
      @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
  </style>
   <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
  
</head>

<body>

  <jsp:include page="../header.jsp"></jsp:include>
      
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/image/teamOBN.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>kikka</h1>
            <span class="subheading" style="font-family: 맑은 고딕;">team OBN</span>
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
              kikka가 태어나기까지
            </h1>
            <span style="font-family: 'BBTreeGL'; font-size: 110%;">
              한성대학교 일본취업 엔터프라이즈 자바개발자 양성과정, team OBN
            </span>
            <hr>
            <div  style="font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif'; font-size: 95%; color:gray;">
            <p style="text-align: justify;">
            Order by란 Data Base에서 select 문을 사용할 때 출력되는 결과물을 테이블에 입력된 순서대로 출력하는 키워드이다. OBN의 팀원들은 이름순으로 1~4번인 것이 k-move에서 order by name으로 정렬한 것과 같아서 팀명을 OBN으로 정하게 되었다.
            </p>
            <p style="text-align: justify;">Team OBN은 비전공자 네 명이 한 팀을 이뤄서 7월부터 한성대학교 엔터프라이즈 웹 개발자 양성 과정을 통해 배운 내용을 기반으로 프로젝트를 시작하게 되었다. 어떤 서비스를 구현할지 고민하던 중에 키즈카페 예약을 메인으로 하는 사이트가 없는 것을 알게 되었다. 그래서 프로젝트 주제로 적합하다고 생각해 키즈카페 예약 사이트를 주제로 정하게 되었다.</p>
            <p style="text-align: justify;">사이트의 이름인 『kikka』는 키즈카페를 줄인 말로 서울에 위치한 키즈카페를 예약할 수 있는 사이트이다.</p>
            <p style="text-align: justify;">요구 조건을 따져보면서 기본적인 스케치를 하였고, 네이버 예약 시스템을 벤치마킹해 디자인과 기능을 구성하였다. 그리고 각자 맡은 파트를 일차적으로 완성해 나갔다. 이 과정에서 수업이 코로나로 인해 비대면으로 진행됐지만, zoom과 slack을 통해 활발히 소통해가며 프로젝트를 한 단계씩 진행해나가 결과물을 만들어 낼 수 있었다.</p>
            <p style="text-align: justify;"> 『kikka』는 MVC 패턴으로 네이버 map api와 calendar를 사용하여 개발하였다. jQuery와 ajax 등을 통해 좀 더 많은 기능을 구현할 수 있었다.</p>
            <p style="text-align: justify;"> 프로젝트를 진행해 나가면서 코드를 잘 짜는 것이 어렵다는 것을 느꼈다. 추후를 생각하지 않고 그 순간 필요한 기능만 구현한 후에 수정사항이 생기면 많은 부분을 고쳐야 하는 것을 몸소 느꼈고 나중을 생각하고 조금 더 많은 부분을 고려하고 수정했다면 중요한 부분에 더욱 신경을 쓸 수 있었을 텐데 아쉬움이 남는다. 그리고 개발자들이 이름 짓기가 가장 어렵다고 하는지도 알 수 있었다.</p>
            <p style="text-align: justify;">힘들었던 점은 데이터베이스를 설계할 때 생각하지도 못한 부분에서 오류를 발견할 때가 많아서 데이터베이스 설계에 시간을 많이 할애했다. 그래서 다른 조들보다 개발을 늦게 시작하게 되어 조바심 때문에 초반에 좀 힘들었지만, 무사히 완성할 수 있어서 다행이다.</p>
            </div>  
            <br>
            <hr>
            <br>
            
            <span style="font-family: 'BBTreeGL'; font-size: 110%;">
              kikka의 귀여운 레벨
            </span><br><br>
            <div style="font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif'; font-size: 90%; color:gray;">
            <img src="/image/캔디.png" style="width:45px; height: 45px;">&nbsp;&nbsp;<span>캔디 | 신규 회원, 작성한 리뷰가 3개 미만인 회원</span><br>
            <img src="/image/푸딩.png" style="width:45px; height: 45px;">&nbsp;&nbsp;<span>푸딩 | 작성한 리뷰가 3개 이상인 회원</span><br>
            <img src="/image/쿠키.png" style="width:45px; height: 45px;">&nbsp;&nbsp;<span>쿠키 | 작성한 리뷰가 15개 이상인 회원</span><br>
            <img src="/image/케이크.png" style="width:45px; height: 45px;">&nbsp;&nbsp;<span>케이크 | kikka 마스터! 작성한 리뷰가 30개 이상인 회원</span><br>
            </div>
            
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