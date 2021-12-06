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

  <title>kikka - join user</title>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
	color: gray;
	padding: 10px 15px;
}

	button#idChk {
		padding : 5px 5px;
		border-radius: 2;
		
	}
 </style>
 
</head>

<script>


		function passwordChk() {
			if ($('#idChk').val() == "") {
				alert("ID중복체크를 해주세요.");
			}
		
			else {
				var idReg = /^[A-za-z0-9]{5,15}/g;
				if ($('#idChk').val() == "N" || !idReg.test( $("input[name=user_id]").val() )) {
					document.getElementById("idChk").focus();
					alert("ID를 확인해주세요.");
				} else {
					var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
					var pw = $("#password1").val(); 
					if (false === reg.test(pw)) {
						alert("비밀번호 형식을 다시 확인해주세요.");
						}
					
					else{
						if ($('#password1').val() != $('#password2').val()) {
							document.getElementById("password2").focus();
							alert("비밀번호가 일치하지 않습니다.");
						}
					}
				}
		
			}
		
		}
	
		
		function fn_idChk1() {
			if( $("#InputId").val().length>0){
			$.ajax({
				url : "/main/uIdChk",
				type : "get",
				dataType : "json",
				data : {
					"user_id" : $("#InputId").val()
				},
				success : function(data) {
					if (data == 1 ) {
						$("#idChk").attr("value", "N");
						alert("중복된 ID입니다.");
						
					} else if (data == 0) {
						$("#idChk").attr("value", "Y");
						alert("사용가능한 ID입니다.");
					}
				}
			})}else alert("ID를 입력해주세요.");
		}

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }


    
 //비밀번호 일치 확인
$(function(){
    $('#password1').keyup(function(){
      $('#chkNotice').html('');
    });

    $('#password2').keyup(function(){

        if($('#password1').val() != $('#password2').val()){
          $('#chkNotice2').html('비밀번호 일치하지 않음<br><br>');
          $('#chkNotice2').attr('color', '#f82a2aa3');
        } else{
          $('#chkNotice2').html('비밀번호 일치함<br><br>');
          $('#chkNotice2').attr('color', '#199894b3');
        }
        

    });
 
});
 



//아이디 정규식 확인
$(function(){
	$('#InputId').keyup(function(){
		var idReg = /^[A-za-z0-9]{5,15}/g;
        if( !idReg.test( $("input[name=user_id]").val() ) ) {
        	 $('#chkId').html('영문 대문자 또는 소문자 또는 숫자로 시작하는 아이디, 길이는 5~15자<br>');
             $('#chkId').attr('color', '#f82a2aa3');
             $('#idChk').attr('disabled', true);
        }else{
        	$('#chkId').html('');
        	$('#idChk').attr('disabled', false);
            }
    });
});


</script>

<body>
  <jsp:include page="header.jsp"></jsp:include>
		
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/image/joinUser.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>JOIN</h1>
            <span class="subheading" style="font-family: 'BBTreeGL';">welcome to kikka!</span>
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
             회원 가입
            </h1>
            <br><hr>
            <form role="form" action="joinUser" method="post" class="post-subtitle" style="font-family: 'Noto Sans KR', sans-serif; font-size: 85%; font-weight: bold;">
                    <div class="form-group">
                        <label for="InputName">이름</label>
                        <input type="text" class="form-control" id="InputName" placeholder="이름을 입력해주세요" name="user_name"  required="required">
                    </div>
                    <div class="form-group">
                        <label for="InputId">ID &nbsp;
							<button class="btn btn-light" type="button" id="idChk" onclick="fn_idChk1();" value="" disabled="disabled">중복확인</button>
							</label>
                        <input type="text" class="form-control" id="InputId" placeholder="사용하실 ID를 입력해주세요"  name="user_id" required="required">
                        <font id="chkId" size="2"></font>
                    </div>
                    <div class="form-group">
                        <label for="InputPassword">비밀번호</label>
                        <input type="password" class="form-control" id="password1" placeholder="비밀번호를 입력해주세요" name="user_password" required="required">
                    	<font id="chkNotice1" size="2" style="color:gray;"> &nbsp;&nbsp;비밀번호는 8자 이상이어야 하며, 숫자/대,소문자/특수문자를 모두 포함해야 합니다.</font>
                    </div>
                    <div class="form-group">
                        <label for="InputPassword">비밀번호 확인</label>
                        <input type="password" class="form-control" id="password2" placeholder="비밀번호를 다시 입력해주세요" required="required">
                        <font id="chkNotice2" size="2"></font>
                    </div>
                    <div class="form-group">
                        <label for="inputMobile">전화번호</label>
                        <input type="tel" class="form-control" id="inputMobile" placeholder="휴대폰번호를 입력해 주세요" name="user_phone" required="required">
                    </div>
                    <div class="form-group">
                        <label for="InputEmail">EMAIL</label>
                        <input type="email" class="form-control" id="InputEmail" placeholder="이메일 주소를 입력해주세요" name="user_email" required="required">
                    </div>
                    <div class="form-group">
                        <label for="postal_btn">우편번호</label><br>
                        <input type="button"  id="postal_btn"class="btn btn-light" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br><br>
                        <input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호" name="user_postal_code" >
                    </div>
                    <div class="form-group">
                        <label for="sample6_address">주소</label>
                        <input type="text" class="form-control" id="sample6_address" placeholder="주소" name="user_new_address" required="required"><br>
						<input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소" name="user_new_address2" ><br>
						<input type="text"  class="form-control" id="sample6_extraAddress" placeholder="참고항목" name="user_new_address3">
                        
                    </div>
                    <input type="hidden" name="user_level" value="캔디"  >
                    <input type="hidden" name="user_rv_count" value="0" >
                    <br><br>
                    <div class="form-group text-center">
                        <button type="submit" id="join-submit" onmousedown="passwordChk()" class="btn btn-primary">가입하기</button>
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
  <!-- 주소 api -->
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>

</html>
