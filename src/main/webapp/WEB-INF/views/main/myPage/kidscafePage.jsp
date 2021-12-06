<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@page import="java.util.Calendar"%>

<%
  // 오늘 날짜로 달력 취득
  Calendar currentCal = Calendar.getInstance();
  Calendar todayCheck_currentCal = Calendar.getInstance();
  
  
  // request 객체로 부터 넘어온 값이 있으면 처리
  if(request.getParameter("year") != null){
   currentCal.set(Calendar.YEAR, Integer.parseInt(request.getParameter("year")));
  }
  if(request.getParameter("month") != null){
   currentCal.set(Calendar.MONTH, Integer.parseInt(request.getParameter("month")));
  }
    
  // 날을 1일로 셋팅
  currentCal.set(Calendar.DATE, 1);
  
  // 1일의 '요일'을 취득
  int oneDayNum = currentCal.get(Calendar.DAY_OF_WEEK);
  // 현재달의 최대 일 수
  int monthMaxNum = currentCal.getActualMaximum(Calendar.DAY_OF_MONTH);
  // 현재달의 주 수
  int weekSize = currentCal.getActualMaximum(Calendar.WEEK_OF_MONTH);
  // 현재 '년'을 취득
  int year = currentCal.get(Calendar.YEAR);
  // 현재 '월'을 취득(0월 부터 11월 까지)
  int month = currentCal.get(Calendar.MONTH);
  // 현재 '일'을 취득
  int day = currentCal.get(Calendar.DATE);
  //int day = currentCal.get(Calendar.DAY_OF_MONTH);

%>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 
  <title>welcome to kidscafe page!</title>

 
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
  *{
  	word-break: keep-all;
  }
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
	textarea.form-control {
		margin: 10px 0px;
	}
	.kikkaRsvCal:focus {
		font-size: 120% ;
		font-weight: bold;
}
	
  </style>
  <script lang="javascript">

  year =  <%=year%> ;
  month = <%=month%>;
  

 function goMonth(month){
  var form = document.calendarHiddenForm;

  if( (<%=year%> <= 1970) && (month == -1) ){
	   alert("1970년 1월 1일 이후로 검색해 주세요.");
	   return;
	  }
  if(month==-1){
   form.year.value = <%=year-1%>;
   form.month.value = 11;
  }else if(month==12) {
   form.year.value = <%=year+1%>;
   form.month.value = 0;
  }else{
   form.year.value = <%=year%>;
   form.month.value = month;
  }

  form.action="kidscafe"; // 여기 주소 수정하기
  form.target = "_self";
  form.submit();
 }


</script>

</head>

<body>

  <jsp:include page="../../header.jsp"></jsp:include>

  <!-- Page Header -->
	  <!-- Page Header -->
	  <c:if test="${cafe.kc_photo != null}">
	  <header class="masthead" style="background-image: url('/uploadfiles/${kidscafe.kc_photo}')">
	  
	    <div class="overlay"></div>
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-8 col-md-10 mx-auto">
	          <div class="page-heading">
	            <h1>${cafe.kc_name}</h1>
	            <p class="subheading" style="font-family: 'BBTreeGL';" >welcome to kikka!</p>
	          </div>
	        </div>
	      </div>
	    </div>
	  </header>
	  </c:if>
	  <c:if test="${cafe.kc_photo == null}">
	  <header class="masthead" style="background-image: url('/image/bear.jpg')">
	  
	    <div class="overlay"></div>
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-8 col-md-10 mx-auto">
	          <div class="page-heading">
	            <h1>${cafe.kc_name}</h1>
	            <p class="subheading" style="font-family: 'BBTreeGL';" >welcome to kikka!</p>
	          </div>
	        </div>
	      </div>
	    </div>
	  </header>
	</c:if>
	
  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <div class="post-preview">
            <h1  style="font-family: 'BBTreeGL'; font-weight: bold;">
              업체 정보
            </h1>
            <c:if test="${fail != null }">
              <input type="hidden" value="${fail}" id = "fail">
              </c:if>
            <br>
            <h3  style="font-family: 'ChosunSg'; word-break: keep-all;">
              ID &nbsp;<span class="info">${kidscafe.kc_id}</span><br>
              NAME &nbsp;<span class="info">${kidscafe.kc_name}</span><br>
              PHONE &nbsp;<span class="info">${kidscafe.kc_phone}</span><br>
              ADDRESS &nbsp;<span class="info">(${kidscafe.kc_postal_code}) ${kidscafe.kc_new_address}</span><br>
              BUSINESS HOURS &nbsp;<span class="info">${kidscafe.kc_business_hours} (휴무일 : ${kidscafe.kc_holiday})</span><br>
              INTRODUCTION &nbsp;<span class="info">${kidscafe.kc_introduction}</span><br>
            </h3>
        </div>
        <br><br>
         <!-- Pager -->
         <!-- Button to Open the Modal -->
       <div class="clearfix">
          <a class="btn btn-primary float-right" href="/main/myPage/kidscafe/update" data-toggle="modal"
         data-target="#myModalKidscafe">내 정보 수정하기 &rarr;</a>
        </div>
      <!-- The Modal -->
      <div class="modal fade" id="myModalKidscafe">
         <div class="modal-dialog">
            <div class="modal-content">

               <!-- Modal Header -->
               <div class="modal-header">
                  <h4 class="modal-title">비밀번호 확인</h4>
                  <button type="button" class="close" data-dismiss="modal">×</button>
               </div>

               <!-- Modal body -->
               <div class="modal-body" style="text-align: center;">
               	<form action="/main/myPage/kidscafe/update/loginChk" method="post">
               		<br><input type = "password" name = "password">
               		<input type = "hidden" name = "kc_id" value="${kidscafe.kc_id}">
                  <button type="submit" style="font-family: '맑은 고딕';" >확인</button>
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
 	<div class="container">
	  	<h1  style="font-family: 'BBTreeGL'; font-weight: bold;">
         예약 현황
        </h1>
        <br>
		<table class="table table-bordered" style="font-family: 'ChosunSg';"> 
		 <tr height="30">
		  <td width="30" align="center"> <a href="javascript:goMonth(<%=month-1%>);">◀</a> </td>
		  <td width="150" align="center"> <%=year %> 년 <%=month+1 %> 월 </td>
		  <td width="30" align="center"> <a href="javascript:goMonth(<%=month+1%>);">▶</a></td>
		 </tr> 
		</table>
					 
				
		<table class="table table-bordered" style="font-family: 'ChosunSg';">
		 <tr height="30" bgcolor="#dcdcdc">
		  <td width="30" align="center">일</td>
		  <td width="30" align="center">월</td>
		  <td width="30" align="center">화</td>
		  <td width="30" align="center">수</td>
		  <td width="30" align="center">목</td>
		  <td width="30" align="center">금</td>
		  <td width="30" align="center">토</td>
		 </tr>
		 
		 <%
		
		  //int dayNum = 1;
		  boolean dayCheck = false;
		
		  // 현재 달의 주 수만큰 반복
		  for(int i=0; weekSize > i;i++){
		   out.println("<tr height='25'>");
		   
		   // 일주일이 7일 이니 7번 반복
		   for(int j=0; (7 > j); j++){
		    out.println("<td align='center' class='lookDay'><a class='kikkaRsvCal' href='#'>" );
		    
		    // 현재 달의 1을의 요일에 해당하는 곳부터 출력하기위함
		    if(oneDayNum == j+1 || dayCheck){
		     // 현재 달의 최대 일수일경우
		     if(monthMaxNum >= day ){
		      /// 일요일의 경우 글자색 '빨강'
		      if(currentCal.get(Calendar.DAY_OF_WEEK) == 1){
		       // 일요일이면서 오늘일 경우 글자색은 '빨강', 글자 진하게 아니면 글자색만 '빨강'
		       if(todayCheck_currentCal.equals(currentCal)){
		        out.println("<font color='red'><b>" + day + "</b></font>");
		       }else{
		        out.println("<font color='red'>" + day + "</font>");
		       }
		       currentCal.set(Calendar.DATE, ++day);
		       dayCheck = true;
		      // 토요일의 경우 글자색 '파랑'
		      }else if(currentCal.get(Calendar.DAY_OF_WEEK) == 7){
		       // 토요일이면서 오늘일 경우 글자색은 '파랑', 글자 진하게 아니면 글자색만 '파랑'
		       if(todayCheck_currentCal.equals(currentCal)){
		        out.println("<font color='blue'><b>" + day + "</b></font>");
		       }else{
		        out.println("<font color='blue'>" + day + "</font>");
		       }
		       currentCal.set(Calendar.DATE, ++day);
		       dayCheck = true;
		      // 일요일도 아니고 토요일도 아니면 기본속성 글자출력 
		      }else {
		       //  일요일도 아니고 토요일도 아닌데 오늘이면 글자진하게
		       if(todayCheck_currentCal.equals(currentCal)){
		       out.println("<b>" + day + "</b>");
		       }else{
		        out.println(day);
		       }
		       currentCal.set(Calendar.DATE, ++day);
		       dayCheck = true;
		      }
		       
		     }else{
		      out.println("&nbsp;");
		     }
		    }else{
		     out.println("&nbsp;");
		    }
		    
		    out.println("</a></td>");
		    
		   }
		   out.println("</tr>");
		  }
		
		 %>
		 
		</table>
		
		<!-- ◀ / ▶ 에 해당하는 폼 -->
		<form name="calendarHiddenForm" method="post">
		 <input type="hidden" name="year" value="" />
		 <input type="hidden" name="month" value="" />
		</form>
  	</div>
  	
  	<div id="here"></div>
  	
  	
 	 <!-- 여기부터 후기관리 변경사항 -->   
   <div>
  
        <br><hr><br>
            <h1 class="post-title" style="font-family: 'BBTreeGL'; font-weight: bold;">
              후기 관리
            </h1>
            <br>
            <table class="table" style="font-family: 'Noto Sans KR', sans-serif; font-size: 73%;  text-align: center;">
              <tr>
                <td style="vertical-align: middle;">RSV NUMBER</td>
                <td style="vertical-align: middle;">USER</td>
                <td style="vertical-align: middle;">CONTENT</td>
                <td style="vertical-align: middle;">예약상세</td>
                <td style="vertical-align: middle;">답글작성</td>
              </tr>
              <c:forEach items="${cafeRvList}" var="crv" varStatus="vs">
              <tr>
                <td style="vertical-align: middle;">${crv.rsv_id}</td>
                <td style="vertical-align: middle;">${crv.user_name}</td>
                <td style="vertical-align: middle;">${crv.rv_content}</td>
                <td style="vertical-align: middle;"><button data-toggle="modal" data-target="#rsvChkModal${vs.index}"  class="btn btn-outline-primary">예약상세</button></td>
                <c:if test="${crv.rv_comment == null}">
                <td style="vertical-align: middle;"><button data-toggle="modal" data-target="#rvModal${vs.index}"  class="btn btn-outline-primary">답글작성</button></td>
              	</c:if>
              	<c:if test="${crv.rv_comment != null}">
              	<td style="vertical-align: middle;"><button onclick="alert('이미 답글을 작성하셨습니다.')" class="btn btn-outline-secondary">답글작성</button></td>
              	</c:if>
              </tr>
               <!-- The Modal -->
				      <div class="modal fade" id="rsvChkModal${vs.index}">
				         <div class="modal-dialog">
				            <div class="modal-content">
				
				               <!-- Modal Header -->
				               <div class="modal-header">
				                  <h4 class="modal-title">예약 정보</h4>
				                  <button type="button" class="close" data-dismiss="modal">×</button>
				               </div>
				
				               <!-- Modal body -->
				               <div class="modal-body" style="text-align: center; font-family: '맑은 고딕'; padding: 20px 30px;">
									<h3>예약 상세</h3>
									<br>
									<div style="text-align: left; font-family: 'Noto Sans KR', sans-serif; font-size: 80%; padding: 10px 50px;">
									예약번호 | ${crv.rsv_id}<br>				               		
				               		예약자 | ${crv.user_name}<br>
				               		예약일 | ${crv.rsv_time}<br>
				               		예약시간 | ${crv.s_time}<br>
				               		요청사항 | ${crv.rsv_comment}<br>
				               		아이 수 | ${crv.count}<br>
				               		</div>				               		
				               </div>
				
				               <!-- Modal footer -->
				               	<div class="modal-body" style="text-align: center;">
			        	    	    <button type="button" class="btn btn-outline-danger" data-dismiss="modal">닫기</button>
								  <p class="copyright text-muted" style="font-size: 70%;">Copyright &copy; OBN 2020 & 2021</p>
								</div>
				            </div>
				         </div>
				      </div>	
				      
				      <!-- The Modal -->
				      <div class="modal fade" id="rvModal${vs.index}">
				         <div class="modal-dialog">
				            <div class="modal-content">
				
				               <!-- Modal Header -->
				               <div class="modal-header">
				                  <h4 class="modal-title">답글 작성</h4>
				                  <button type="button" class="close" data-dismiss="modal">×</button>
				               </div>
				
				               <!-- Modal body -->
				               
				               <div class="modal-body" style="padding : 20px 30px;">
									<div style="text-align: center; font-family: '맑은 고딕';">
									<h3>리뷰에 답글을 남겨주세요!</h3>
									답글창은 가게의 이미지입니다. <br>				               		
				               		</div>
				               		<div style="font-family: 'Noto Sans KR', sans-serif; font-size: 80%;">
				               		<form action="kidscafe/reviewComment" method="post">
										<input type="hidden" name = "rsv_id" value = "${crv.rsv_id}"><br>
										후기 | ${crv.rv_content} <br>
										<hr>
										답글 | <br>
										<textarea class="form-control" cols="30" rows="3" placeholder="답글을 입력해주세요" name="rv_comment" placeholder="답글 입력해주세요."></textarea><br>
				     	    	        <div style="text-align: center; font-family: '맑은 고딕';">
				     	    	        <button type="submit" class="btn btn-outline-success" >작성</button>&nbsp;
				        	    	    <button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
										</div>
									</form>
									</div>
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
   <!-- 요기까지 후기관리 변경사항 -->     
        
      </div>
    </div>
  </div>
  <hr>
  <br>
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
  function lpad(str, padLen, padStr) {
	    if (padStr.length > padLen) {
	        console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
	        return str;
	    }
	    str += ""; // 문자로
	    padStr += ""; // 문자로
	    while (str.length < padLen)
	        str = padStr + str;
	    str = str.length >= padLen ? str.substring(0, padLen) : str;
	    return str;
	}
		

  </script>
  <script>
	var fail = document.getElementById("fail");
	console.log(fail);
	if(fail != null){
		alert("비밀번호가 틀렸습니다.");
	}
	
	  $(function(){

         $("a.kikkaRsvCal").click(function(event){
                event.preventDefault();

                month = lpad((month+1), 2, '0');
                day09 = this.innerText.trim();
                rsvDate = lpad(day09,2,'0');

                //alert(month);
                //alert(rsvDate);
				
				// 이게 파람으로 받을 수 있는 특정 날짜(달력에서 누르는 n일)
                dayForRsv = year+"-"+month+"-"+rsvDate;
                //alert(dayForRsv);
            	$.ajax( {
					url:"/main/myPage/kidscafe/RsvByDate",
					data:{"rsv_time":dayForRsv},
					type:"get",
					success:function(responseText){
						$("#here").html(responseText);
						}

					});
             });


		  });

	
 </script> 
 
</body>

</html>
