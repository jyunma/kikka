<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>kikka - kidscafe list</title>
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
  <!-- 리스트 페이지 필수 -->
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=t3nlm386dg"></script>
  <style>
   div.left{
   		width: 30%;
   		float: left;
   }
   div.iw_inner{
   		padding : 20px;
   }
   .iw_inner > h3 {
   		font-family:'BBTreeGL';
   }
   .iw_inner > span {
   		font-family: 'Noto Sans KR', sans-serif;
   }
   .cafeInfo {
   		color : gray;
   		font-size: 70%;
   }
   .cafeAddress {
   		font-size: 90%;
   }
   td:hover {
   	background-color : lightgray;
   	cursor: pointer;
   }
   
  
  </style>
</head>

<body>
  <jsp:include page="../header.jsp"></jsp:include>
   <!-- Page Header -->
  <header class="masthead" style="background-color: yellow; height: 300px; margin-bottom: 100px;">
    <div class="overlay" ></div>
    <div class="container" style="height: 300px;">
      <div class="row" style="height: 300px;">
        <div class="col-lg-8 col-md-10 mx-auto" style="height: 300px;">
          <div class="site-heading" style="height: 300px;">
            <h1>kikka</h1>
          </div>
        </div>
      </div>
    </div>
  </header>
  
  <div class="container">
    	<div  id="map" style="width: 65%; height:720px; float: right;"></div>
	<div class="left">
		<h1 style="font-family:'BBTreeGL';">키즈카페 찾기</h1>
		<br>
		<table class="table" style="font-family: 'Noto Sans KR', sans-serif;">
			<c:forEach items="${cafelist}" var="cafe">
				<tr>
					<td id="${cafe.kc_id}">${cafe.kc_name}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
  </div>



  <!-- Footer -->
  <footer  style="clear : both;">
  <hr>
    <div class="container">
	<br><br><br>
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
var searchList =${jsonCafeList};
var firstCafe = new naver.maps.LatLng(searchList[0].y, searchList[0].x);

var map = new naver.maps.Map('map', {
        center: firstCafe,
        zoom: 11
    });
    
//var item = searchList[0];
searchList.forEach(function(item, index, list){
	

var kidscafe = new naver.maps.LatLng(item.y, item.x);
 var marker = new naver.maps.Marker({
        map: map,
        position: kidscafe
    });

var contentString = [
        `<div class="iw_inner">`,
        `   <h3>`+item.kc_name+`</h3>`,
        `	<span class="cafeInfo">`+ item.kc_phone+` | `,
        `       `+ item.kc_business_hours+`</span><hr>`,
        `   <span class ="cafeAddress">`+item.kc_new_address+`</span><br><br>`,
        `    <span><a href="/search/kidscafeInfo?kc_id=`+item.kc_id+`&date=`+item.date+`" target="_self" style="margin : auto 0;" class="btn btn-outline-success">예약하러 가기</a></span><br>`,
        `</div>`


        
    ].join('');

var infowindow = new naver.maps.InfoWindow({
    content: contentString,
    maxWidth: 500,
    backgroundColor: "white",
    padding : 20,
    anchorSize: new naver.maps.Size(30, 30),
    anchorSkew: true,
    anchorColor: "white",
    pixelOffset: new naver.maps.Point(20, -20)
});
/*
naver.maps.Event.addListener(marker, "mouseover", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});
 */

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
		location.href=`/search/kidscafeInfo?kc_id=`+item.kc_id+`&date=`+item.date;
		infowindow.open(map,marker);
        }
});
 
var searchedCafe = document.getElementById(item.kc_id);
/*
searchedCafe.onmouseover = function(){
	infowindow.open(map,marker);
};
 */
searchedCafe.onclick = function(){
	var coord = naver.maps.LatLng(item.y, item.x).destinationPoint(0, 50);
	
    if (infowindow.getMap()) {
    	location.href=`/search/kidscafeInfo?kc_id=`+item.kc_id+`&date=`+item.date;
    } else {
		infowindow.open(map,marker);
		map.morph(coord, 17);
    }
};

})

</script>

</body>
</html>