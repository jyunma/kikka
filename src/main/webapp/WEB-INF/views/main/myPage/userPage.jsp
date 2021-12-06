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

 
  <title>welcome to user page!</title>

 
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
    span.info {
      color: grey;
      font-size: 22px;
    }
    
    button.btn-outline-secondary {
		padding: 10px 15px;
	}
	button.btn-outline-primary{
		padding: 10px 15px;
	}
	button.btn-outline-success{
		padding: 10px 20px;
	}
	button.btn-outline-danger{
		padding: 10px 20px;
	}
	#reviewMd {
    	font-family:'Noto Sans KR', sans-serif;
    	padding: 10px 57px;
    	text-align: left;
    	font-size: 80%;
    }
    input.form-control {
		margin: 10px 0px;
	}
	textarea.form-control {
		margin: 10px 0px;
		word-break: keep-all;
	}
	form > span {
		font-size: 80%;
	}
  </style>
</head>

<body>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <div >
          <h1 style="font-family: 'BBTreeGL'; font-weight: bold;">
              나의 정보
            </h1>
              <c:if test="${fail != null }">
              <input type="hidden" value="${fail}" id = "fail">
              </c:if>
            <br>
            <h3 style="font-family: 'ChosunSg'; word-break: keep-all;">
              ID &nbsp;<span class="info">${user.user_id}</span><br>
              LEVEL &nbsp;<span class="info">${user.user_level}</span>
              <img src="/image/${user.user_level}.png" style="width:35px; height: 35px;"><br>
              NAME &nbsp;<span class="info">${user.user_name}</span><br>
              EMAIL &nbsp;<span class="info">${user.user_email}</span><br>
              PHONE &nbsp;<span class="info">${user.user_phone}</span><br>
              ADDRESS &nbsp;<span class="info">(${user.user_postal_code}) ${user.user_new_address}</span><br>
            </h3>
        </div>
        <br>
        <!-- Pager -->
         <!-- Button to Open the Modal -->
       <div class="clearfix">
          <a class="btn btn-primary float-right" data-toggle="modal"
         data-target="#beforeUpadateUser">내 정보 수정하기 &rarr;</a>
        </div>
	      <!-- The Modal -->
	      <div class="modal fade" id="beforeUpadateUser">
	         <div class="modal-dialog">
	            <div class="modal-content">
	
	               <!-- Modal Header -->
	               <div class="modal-header">
	                  <h4 class="modal-title">비밀번호 확인</h4>
	                  <button type="button" class="close" data-dismiss="modal">×</button>
	               </div>
	
	               <!-- Modal body -->
	               <div class="modal-body" style="text-align: center;"> 
					  <form action="/main/myPage/user/update/loginChk" method="post">
	               		<br><input type = "password" name = "password">
	               		<input type = "hidden" name = "user_id" value="${user.user_id}">
	                  <button type="submit" style="font-family: '맑은 고딕'; " >확인</button>
	                  </form>
	               </div>
	           
		           <!-- Modal footer -->
				   <div class="modal-body" >
					  <p class="copyright text-muted" style="font-size: 70%; text-align: center;">Copyright &copy; OBN 2020 & 2021</p>
				   </div>
            
	            </div>
	         </div>
	       </div>
	      <br>
	      <hr>
	      <br>
            <h1 class="post-title" style="font-family: 'BBTreeGL'; font-weight: bold;">
             현재 예약
            </h1>
             <br>
            <table class="table" style="font-family: 'Noto Sans KR', sans-serif; font-size: 73%; text-align: center; vertical-align: middle;">
              <tr>
                <td style="vertical-align: middle;">RSV NUMBER</td>
                <td style="vertical-align: middle;">KIDSCAFE</td>
                <td style="vertical-align: middle;">RSV DATE</td>
                <td style="vertical-align: middle;">예약취소</td>
                <td style="vertical-align: middle;">방문확정</td>
              </tr>
               <c:forEach items="${userRsvList}" var="userRsv" varStatus="vs">
              <tr>
                <td style="vertical-align: middle;">${userRsv.rsv_id}</td>
                <td style="vertical-align: middle;"><a href="/search/kidscafeInfo?kc_id=${userRsv.kc_id}">${userRsv.kc_name}</a></td>
                <td style="vertical-align: middle;">${userRsv.rsv_time}</td>
                <td style="vertical-align: middle;"><button  class="btn btn-outline-secondary" data-toggle="modal" data-target="#cancelRSVModal${vs.index}"  >예약취소</button></td>
            	 
                <td style="vertical-align: middle;"><button  class="btn btn-outline-secondary" data-toggle="modal" data-target="#afterRSVModal${vs.index}"  >방문확정</button></td>
            	
              </tr>
              <!-- The Modal -->
				      <div class="modal fade" id="cancelRSVModal${vs.index}">
				         <div class="modal-dialog">
				            <div class="modal-content">
				
				               <!-- Modal Header -->
				               <div class="modal-header">
				                  <h4 class="modal-title">예약 취소</h4>
				                  <button type="button" class="close" data-dismiss="modal">×</button>
				               </div>
				
				               <!-- Modal body -->
				               <div class="modal-body" style="text-align: center; font-family: '맑은 고딕';">
				               		예약을 취소 하시겠습니까?
				               </div>
				
				               <!-- Modal footer -->
				               <div class="modal-footer">
				                  <button type="button" class="btn btn-outline-warning" onclick="location.href='/main/myPage/user/cancel?rsv_id=${userRsv.rsv_id}&user_id=${user.user_id}';" >확인</button>
				               </div>
				            </div>
				         </div>
				      </div>	
				       <!-- The Modal -->
				      <div class="modal fade" id="afterRSVModal${vs.index}">
				         <div class="modal-dialog">
				            <div class="modal-content">
				
				               <!-- Modal Header -->
				               <div class="modal-header">
				                  <h4 class="modal-title">방문 확정</h4>
				                  <button type="button" class="close" data-dismiss="modal">×</button>
				               </div>
				
				               <!-- Modal body -->
				               <div class="modal-body" style="text-align: center; font-family: '맑은 고딕';">
									<h3>${userRsv.rsv_time}에 방문하셨나요?</h3><br>
									방문 날짜 확인 후 방문 확정을 진행해주세요. <br>				               		
				               		리뷰를 작성은 업체에 큰 도움이 됩니다. <br>
				               </div>
				
				               <!-- Modal footer -->
				               <div class="modal-footer">
				                  <button type="button" class="btn btn-outline-success" onclick="location.href='/main/myPage/user/after?rsv_id=${userRsv.rsv_id}&user_id=${user.user_id}';" >확인</button>
				               </div>
				            </div>
				         </div>
				      </div>	
              </c:forEach>
            </table>
        <br><hr><br>
         <h1 class="post-title" style="font-family: 'BBTreeGL'; font-weight: bold;">
              지난 예약
            </h1>
            <br>
            <table class="table" style="font-family: 'Noto Sans KR', sans-serif; font-size: 73%;  text-align: center;">
              <tr>
                <td style="vertical-align: middle;">RSV NUMBER</td>
                <td style="vertical-align: middle;">KIDSCAFE</td>
                <td style="vertical-align: middle;">RSV DATE</td>
                <td style="vertical-align: middle;">리뷰작성</td>
              </tr>
              <c:forEach items="${userLastRsvList}" var="userLastRsv" varStatus="vs">
              <tr>
                <td style="vertical-align: middle;">${userLastRsv.rsv_id}</td>
                <td style="vertical-align: middle;"><a href="/search/kidscafeInfo?kc_id=${userLastRsv.kc_id}">${userLastRsv.kc_name}</a></td>
                <td style="vertical-align: middle;">${userLastRsv.rsv_time}</td>
                <c:if test="${userLastRsv.rv_content == null}">
                <td style="vertical-align: middle;"><button data-toggle="modal" data-target="#rvModal${vs.index}"  class="btn btn-outline-primary">리뷰작성</button></td>
              	</c:if>
              	<c:if test="${userLastRsv.rv_content != null}">
              	<td style="vertical-align: middle;"><button onclick="alert('이미 리뷰를 작성하셨습니다.')" class="btn btn-outline-secondary">리뷰작성</button></td>
              	</c:if>
              </tr>
              <!-- The Modal -->
				      <div class="modal fade" id="rvModal${vs.index}">
				         <div class="modal-dialog">
				            <div class="modal-content">
				
				               <!-- Modal Header -->
				               <div class="modal-header">
				                  <h5 class="modal-title">리뷰 작성</h5>
				                  <button type="button" class="close" data-dismiss="modal">×</button>
				               </div>
				
				               <!-- Modal body -->
				               <div class="modal-body" id="reviewMd">
									<div style="text-align: center;">
									<h4>리뷰를 작성해주세요</h4>
									여러분의 리뷰는 업체에 큰 도움이 됩니다.
									</div><br>		
										               		
				               		<form action="user/review" method="post" enctype="multipart/form-data">
										<input type="hidden"  name="kc_id"  value="${userLastRsv.kc_id}">
										<input type="hidden"  name="rsv_id"  value="${userLastRsv.rsv_id}">
										<input type="hidden"  name="user_id"  value="${user.user_id}">
										<input type="hidden"  name="rv_state"  value="0">
										<div style="color:gray; font-size: 95%;">
										예약번호 | ${userLastRsv.rsv_id}<br>
										방문 업체 | ${userLastRsv.kc_name}<br>				               		
				               			예약자 | ${user.user_name}<br>
				               			방문일 | ${userLastRsv.rsv_time}<br><br>
										</div>
										<span style="font-weight: bold;">리뷰 | </span>
										<textarea class="form-control"  name="rv_content" rows="6" cols="40" placeholder="리뷰는 삭제와 수정이 불가능하므로 신중하게 작성해주세요." required="required"></textarea>
										<span style="font-weight: bold;">사진 | &nbsp;</span><input name="file" type="file"  required="required"><br><br>
										<div style="text-align: center;">
				     	    	        <button type="submit" class="btn btn-outline-success" >작성</button>&nbsp;
				        	    	    <button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
				        	    	    </div>
									</form>
				               </div>
				
				               <!-- Modal footer -->
				               	<div class="modal-body" style="text-align: center;">
								  <p class="copyright text-muted" style="font-size: 70%;">Copyright &copy; OBN 2020 & 2021</p>
								</div>
				            </div>
				         </div>
				      </div>	
              </c:forEach>
            </table>
        <br><br><br>
        <hr>
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
  
  <script>
	var fail = document.getElementById("fail");
	if(fail != null){
		alert("비밀번호가 틀렸습니다.");
	}
  </script>
</body>

</html>
