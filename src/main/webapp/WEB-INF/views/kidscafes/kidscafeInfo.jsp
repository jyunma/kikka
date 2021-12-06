<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>kikka - kidscafe info</title>
	<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
	
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
    div.info {
      color: grey;
      font-size: 100%;
      font-family: 'ChosunSg'; 
      word-break: keep-all;
    }
    table {
    	font-family:'Noto Sans KR', sans-serif;
    	
    }
    .btn-outline-dark {
    	padding : 15px 20px;
    	font-size: 105%;
    }
    .table {
    	text-align: center;
    	font-size: 85%;
    }
    #datePicker {
    	width: 300px;
    }
    .ui-datepicker-trigger{
    	width: 50px;
    }
    form {
    	font-family:'Noto Sans KR', sans-serif;
    	padding: 5px 20px;
    	text-align: left;
    	font-size: 80%;
    }
    input.form-control {
		margin: 10px 0px;
	}
	textarea.form-control {
		margin: 10px 0px;
	}
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

          <c:if test="${user == null }">
            <li class="nav-item" >
              <a class="nav-link" data-toggle="modal" data-target="#loginModal" >Join</a>
            </li>
          </c:if>
			              
          <c:if test="${user != null}"> 
            <li class="nav-item">
              <c:if test="${mem_info=='user'}">
              <a class="nav-link" href="/main/myPage/user">My Page</a>
              </c:if>
              <c:if test="${ mem_info=='cafe'}">
              <a class="nav-link" href="/main/myPage/kidscafe">My Page</a>
              </c:if>
            </li>
          </c:if>

          <c:if test="${user == null}">
            <li class="nav-item">
              <a class="nav-link" href="/main/login">Login</a>
            </li>
          </c:if>

          <c:if test="${user != null}">
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
	<script>
	
																									//예약모달에 값 전달하기
		function rsvChk(){
			loginChk();
			var s_id = $("#here input[name=s_id]").val();
			var date = $("#datePicker").val();
			var tc_idk = $("#here input[name=tc_idk]").val();
			var tc_ida = $("#here input[name=tc_ida]").val();
			var k_count = $("#here input[name=k_count]").val();
			var a_count = $("#here input[name=a_count]").val();
			var user_id = "${user.user_id}";
			var k_price = $("#here input[name=kprice]").val();
			var a_price = $("#here input[name=aprice]").val();
			var s_time = $("#here input[name=s_time]").val();
			var total_price = k_price*k_count + a_price*a_count;
																									//시간 받기
			let today = new Date();
			let year = today.getFullYear();
			let month = today.getMonth()+1;
			if(month<10) month="0"+month;
			let day = today.getDate();
			if(day<10) day="0"+day;
			let hour = today.getHours();
			if(hour<10) hour="0"+hour;
			let minutes = today.getMinutes();
			if(minutes<10) minutes="0"+minutes;
			let seconds = today.getSeconds();
			if(seconds<10) seconds="0"+seconds;
																									//시간 정리해서 변수에 저장
			var timeRsvForm = ""+year+month+day+hour+minutes+seconds;
			var timeCreateForm = year+"-"+month+"-"+day+" "+hour+":"+minutes+":"+seconds;
																									//폼에 각 변수 세팅
			$("#reservation input[name=k_count]").attr("value", k_count);
			$("#reservation input[name=a_count]").attr("value", a_count);
			$("#reservation input[name=rsv_time]").attr("value", date);
			$("#reservation input[name=rsv_day]").attr("value", date);
			$("#reservation input[name=s_time]").attr("value", s_time);
			$("#reservation input[name=total_price]").attr("value", total_price);
			$("#reservation input[name=rsv_id]").attr("value", user_id+timeRsvForm);
			$("#reservation input[name=rsv_create_time]").attr("value", timeCreateForm);
			$("#reservation input[name=s_id]").attr("value", s_id);
			$("#reservation input[name=tc_idk]").attr("value", tc_idk);
			$("#reservation input[name=tc_ida]").attr("value", tc_ida);
		}
	</script>


  
	
	  <!-- Page Header -->
	  <c:if test="${cafe.kc_photo != null}">
	  <header class="masthead" style="background-image: url('/uploadfiles/${cafe.kc_photo}')">
	  
	    <div class="overlay"></div>
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-10 col-md-10 mx-auto">
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
	        <div class="col-lg-10 col-md-10 mx-auto">
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
		            <br>
		           <!-- 정보 -->
		            <div class="info">
		              <span ><img src="/image/call.png" style="height: 25px; width: 25px;"> ${cafe.kc_phone} | </span>
		              <span><img src="/image/hour.png" style="height: 25px; width:25px;"> ${cafe.kc_business_hours} (휴무일 : ${cafe.kc_holiday})</span><br>
		              <span><img src="/image/location.png" style="height: 25px; width: 25px;"> (${cafe.kc_postal_code}) ${cafe.kc_new_address}</span><br>
		              <hr>
		              <span style="color :black; font-size: 22px;">${cafe.kc_introduction}</span>
		            </div>  
		        </div>
		      <br><br>
		      <c:if test="${rst != null }">
              <input type="hidden" value="${rst}" id = "rst">
              </c:if>
		   <!-- 예약 -->
	         <div class="post-preview" >
	            <h1  style="font-family: 'BBTreeGL'; font-weight: bold;">
	              예약하기
	            </h1>
	            <hr>
			 <br>
			 <div style="text-align: center;">
			<input type="text" value="${date}" name="date" id="datePicker" />
			<br><br>
			<div id="tt" style="display:none;">
				<c:set var="cnt" value="0"/>
				<c:forEach items="${schedule}" var="t_table">
					<c:set var="cnt" value="${cnt+1 }"/>
					<button onclick="call(${cnt});" class="btn btn-outline-dark" >${t_table.s_time}</button>
			
				<div id="w_tc${cnt}" style="display:none;"><br><br>
				
				<table class="table">
						<tr>
							<td style="vertical-align: middle;"><label>${ticket[0].tc_name}</label></td>
							<td style="vertical-align: middle;"><label>\ ${ticket[0].tc_price}</label></td>
							<td style="vertical-align: middle;"><label>${ticket[0].tc_comment}</label></td>
							<td style="vertical-align: middle;">남은 티켓 수<span></span>장</td>
							<td style="vertical-align: middle;"><input class="tcNum form-control"  type="number" name="k_count" id="wticket${cnt}" value="1" max="${t_table.s_wticket}"  min="1" style="width:100px;"></td>
						</tr>
						<tr>
							<td style="vertical-align: middle;"><label>${ticket[1].tc_name}</label></td>
							<td style="vertical-align: middle;"><label>\ ${ticket[1].tc_price}</label></td>
							<td style="vertical-align: middle;"><label>${ticket[1].tc_comment}</label></td>
							<td style="vertical-align: middle;"></td>
							<td style="vertical-align: middle;"><input type="number" class="form-control" name="a_count" id="a_wticket${cnt}" value="0" style="width:100px;" min="0"></td>
						</tr>
				</table>
				<!-- 모달로 연결하는 버튼 -->
				<button onclick="rsvChk()"  class="btn btn-light" data-toggle="modal" data-target="#rsvModal"  disabled="" style="cursor:pointer">예약하기
           		 </button>
           		 <!-- 변수들 -->
				<input type="hidden" name="s_id"  value="${t_table.s_id}">	
				<input type="hidden" name="tc_idk"  value="${ticket[0].tc_id}">
				<input type="hidden" name="tc_ida"  value="${ticket[1].tc_id}">
				<input type="hidden"  name="kprice" value="${ticket[0].tc_price}" >
				<input type="hidden"  name="aprice" value="${ticket[1].tc_price}" >
				<input type="hidden"  name="s_time" value="${t_table.s_time}" >
			</div>
				<div id="h_tc${cnt}" style="display:none;"><br><br>
					<table class="table">
						<tbody>
							<tr>
								<td style="vertical-align: middle;"><label>${ticket[2].tc_name}</label></td>
								<td style="vertical-align: middle;"><label>\ ${ticket[2].tc_price}</label></td>
								<td style="vertical-align: middle;"><label>${ticket[2].tc_comment}</label></td>
								<td style="vertical-align: middle;">남은 티켓 수<span></span>장</td>
								<td style="vertical-align: middle;"><input class="tcNum form-control" type="number" name="k_count" id="hticket${cnt}" value="1" max="${t_table.s_hticket}" min="1" style="width:100px;"></td>
							</tr>
							<tr>
								<td style="vertical-align: middle;"><label>${ticket[3].tc_name}</label></td>
								<td style="vertical-align: middle;"><label>\ ${ticket[3].tc_price}</label></td>
								<td style="vertical-align: middle;"><label>${ticket[3].tc_comment}</label></td>
								<td style="vertical-align: middle;"></td>
								<td style="vertical-align: middle;"><input type="number" class="form-control" name="a_count" id="a_hticket${cnt}" value="0" style="width:100px;" min="0"></td>
							</tr>
						</tbody>
					</table>
					<!-- 모달로 연결하는 버튼 -->
					<button onclick="rsvChk()"  class="btn btn-light" data-toggle="modal" data-target="#rsvModal" disabled="false" style="cursor:pointer">예약하기
           			 </button>
				<!-- 변수들 -->
				<input type="hidden" name="s_id"  value="${t_table.s_id}">	
				<input type="hidden" name="tc_idk"  value="${ticket[2].tc_id}">
				<input type="hidden" name="tc_ida"  value="${ticket[3].tc_id}">
				<input type="hidden"  name="kprice" value="${ticket[2].tc_price}" >
				<input type="hidden"  name="aprice" value="${ticket[3].tc_price}" >
				<input type="hidden"  name="s_time" value="${t_table.s_time}" >
				</div>
			</c:forEach>
			<div id="here"></div>
		  </div>
		</div>
		</div>
		
		<!-- 예약용 모달 -->	
		  <div class="modal fade" id="rsvModal">
		      <div class="modal-dialog">
		         <div class="modal-content">
		           	 <!-- Modal Header -->
		              <div class="modal-header">
		              <br>
		                 <h5 class="modal-title">예약 내용을 확인해 주세요.</h5>
		                 <button type="button" class="close" data-dismiss="modal">×</button>
		              <br>
		              </div>
		
		          		  <!-- Modal body -->
		               <div class="modal-body" style="text-align: center;">
						<form action="kidscafeInfo/reservation" id="reservation" method="post">
						<span>예약 업체</span>
						<input class="form-control" type="text"  name="kc_name" readonly="readonly" value="${cafe.kc_name}">
						<span>예약 인원 | 아이</span>
						<input  class="form-control" type="text"  name="k_count"  readonly="readonly" value="">
						<span>예약 인원 | 어른</span>
						<input  class="form-control" type="text"  name="a_count"  readonly="readonly" value="">
						<span>예약일</span>
						<input  class="form-control" type="text"  name="rsv_day"  readonly="readonly" value="">
						<span>예약시간</span>
						<input  class="form-control" type="text"  name="s_time"  readonly="readonly" value="">
						<span>이름</span>
						<input  class="form-control" type="text"  name="user_name"  readonly="readonly" value="${user.user_name}">
						<span>요청 사항</span>
						<textarea  class="form-control" cols="30" rows="3" name="rsv_comment" placeholder="요청사항을 입력해주세요"></textarea>
						<span>총 가격</span>
						<input  class="form-control" type = "text" name = "total_price" readonly="readonly" value=""><br>
						<!-- DB에 저장할 때 값이 필요하지만 굳이 보여줄 필요 없는 것들. -->
						<input type="hidden" name="kc_id" value="${cafe.kc_id}">
						<input type="hidden"  name="rsv_time"  value="">
						<input type="hidden"  name="user_id"  value="${user.user_id}">
						<input type="hidden"  name="rsv_id"  value="">
						<input type="hidden"  name="rsv_state"  value="0">
						<input type="hidden"  name="rsv_create_time"  value="">
						<input type="hidden"  name="s_id"  value="">
						<input type="hidden"  name="tc_idk"  value="">
						<input type="hidden"  name="tc_ida"  value="">
						<div style="text-align: center;">
		                 <button type="submit" class="btn btn-outline-success" >예약하기</button> &nbsp;
		                 <button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소하기</button>
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
		<br>
		<br>
		<!-- 리뷰 -->
		    <div class="post-preview" >
	            <h1  style="font-family: 'BBTreeGL'; font-weight: bold;">
	              고객 리뷰
	            </h1>
	            <hr>
	            <br>
           		<ul style= "list-style:none; font-family: 'ChosunSg'; padding: 0px; text-align: center;">
	            <c:forEach items="${reviewlist}" var="review">
 						<li style="width : 230px; height :350px; list-style:none; float:left; word-break:break-all; padding : 10px 10px;">
						<img alt="빈 이미지 입니다." src="/uploadfiles/${review.rv_photo}" style="width: 200px; height: 200px;">
						<br>
						<span style="font-size: 70%">작성일 | ${review.rv_create_time}</span><br>
						<span style="font-size: 85%">${review.rv_content}</span><br>
						<hr style="margin: 5px;">
						<span style="font-size: 75%">키즈카페 답변 | ${review.rv_comment}</span>
						</li>
	            </c:forEach>
           	</ul>
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
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/js/clean-blog.min.js"></script>
  
  <script>
	var rst = document.getElementById("rst");
	var msg = "${msg}";
	if(rst != null){
		alert(msg);
	}
  </script>
  <script>
		function loginChk() {
			var user = '${user}';
			if (user == '') {
				alert("로그인 후 예약해주세요.\n로그인 페이지로 이동하시겠습니까?");
				location.href = "/main/login";
				}
		}
	</script>
  	<script type="text/javascript">
		jQuery(function($) {
			$("#datePicker").datepicker(
					{
						changeMonth : true,
						changeYear : true,
						showOn : "both",
						dateFormat : 'yy-mm-dd',
						showOtherMonths : true,
						selectOtherMonths : true,
						showMonthAfterYear : true,
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						monthNamesShort : [ '1월', ', 2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNames : [ '년 1월', '년 2월', '년 3월', '년 4월', '년 5월',
								'년 6월', '년 7월', '년 8월', '년 9월', '년 10월',
								'년 11월', '년 12월' ],
						nextText : '다음 달',
						prevText : '이전 달',
						beforeShowDay : noSundays,
						minDate : 0,
						onSelect : showTicket 
					});
			
		});

		var day = "${cafe.kc_holiday}";
		// 일요일만 선택 막기
		function noSundays(date) {
			if (day == "일요일")
				return [ date.getDay() != 0, '' ];
			else if (day == "월요일")
				return [ date.getDay() != 1, '' ];
			return [ date.getDay() != 7, '' ];
		}

		
			function showTicket(date) {
				
				$("#wticket1").val(1);
				$("#wticket2").val(1);
				$("#wticket3").val(1);
				$("#wticket4").val(1);

				$("#hticket1").val(1);
				$("#hticket2").val(1);
				$("#hticket3").val(1);
				$("#hticket4").val(1);
				
				$("#a_wticket1").val(0);
				$("#a_wticket2").val(0);
				$("#a_wticket3").val(0);
				$("#a_wticket4").val(0);
				
				$("#a_hticket1").val(0);
				$("#a_hticket2").val(0);
				$("#a_hticket3").val(0);
				$("#a_hticket4").val(0);
				$("#tt").css("display", "block");
			}

		function call(cnt) {
			var day1 = $("#datePicker").datepicker('getDate');
			var dayOfWeek = day1.getUTCDay() + 1;
			if (dayOfWeek == 7 || dayOfWeek == 6){
				$("#here").html($("#h_tc"+cnt).html());
				$("#here>#h_tc"+cnt).attr("display", "block");
			}else{
				$("#here").html($("#w_tc"+cnt).html());
				$("#here>#w_tc"+cnt).attr("display", "block");
			}

			
			var s_id = $("#here input[name=s_id]").val();
			var date = $("#datePicker").val();
			var tcMax;
 
            	$.ajax( {
					url:"/search/kidscafeInfo/tcChk",
					data:{"s_id":s_id,
						"date":date,
						"dayOfWeek":dayOfWeek},
					type:"get",
					success:function(responseText){
						$("#here span").html(responseText);
						tcMax=$("#tcRst").text();
						$("#here .tcNum").attr("max", tcMax);
						if(tcMax>0){
							$(".btn-light").attr('disabled',false);
						}else{
							$(".btn-light").attr('disabled',true);
						}
					}
				});
				
		}
	</script>
</body>
</html>