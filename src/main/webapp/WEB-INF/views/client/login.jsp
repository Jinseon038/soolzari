
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>술자리 로그인</title>
<link rel="stylesheet" href="/resources/css/login.css">

      <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

    <!--font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">



    <!-- icon 사용-->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">



    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">
</head>
<body>
<div class="wrapper">
   
    <div class="overlay">
<!-- LOGN IN FORM by Omar Dsoky -->


<form action="/loginCheck.sool" name="loginFrm">
   <!--   con = Container  for items in the form-->
   <div class="con">
   <!--     Start  header Content  -->
   <div class="head-form">
        <a href="/index.jsp" class="logo" ><img src="/resources/image/loginLogo.png"></a>
      <!--     A welcome message or an explanation of the login form -->

   </div>
   <!--     End  header Content  -->
   <br>
   <div class="field-set">
     
      <!--   user name -->
         <span class="input-item">
           <i class="fa fa-user-circle"></i>
         </span>
        <!--   user name Input-->
        
         <input class="form-input" id="txt-input" type="text"  name="clientId" placeholder="아이디" required>
     
      <br>
     
           <!--   Password -->
     
      <span class="input-item">
        <i class="fa fa-key"></i>
       </span>
      <!--   Password Input-->
      <input class="form-input" type="password" placeholder="비밀번호" id="pwd"  name="clientPw" required>
     
<!--      Show/hide password  -->
     <span class="input-eye">
        <i class="fa fa-eye" aria-hidden="true"  type="button" id="eye"></i>
     </span>
     
     
      <br>
<!--        buttons -->
<!--      button LogIn -->
      <button class="log-in"> 로그인</button>
      <button class="btn submits sign-up" >회원가입
<!--         Sign Up font icon -->
      <i class="fa fa-user-plus" aria-hidden="true"></i>
      </button>
   </div>
  
<!--   other buttons -->
   <div class="other">
<!--      Forgot Password button-->
 
      <ul class="sns">
                <li><a href="/loginNaver.sool"><img src="/resources/image/naver.png" alt="" width="35px;" height="35px;"></a></li>
                <li><a href="#"><img src="/resources/image/facebook.png" alt="" width="20px;" height="30px;"></a></li>
                <li><a href="https://kauth.kakao.com/oauth/authorize?client_id=0c76ad817787e78834bb9cae58d232f0&redirect_uri=http://localhost:8000/kakaologin.sool&response_type=code

"  ><img src="/resources/image/kakao.png" alt="" width="35px;" height="35px;"></a></li>
                <li><a href="#"><img src="/resources/image/blog.png" alt="" width="40px;" height="30px;"></a></li>
            </ul>
<!--     Sign Up button -->
      
      
          <ul class="find">
              <li><a href="#" onclick="window.open('/views/client/searchId.jsp', '아이디 찾기', 'width=500px,height=350px'); return false;">아이디찾기</a></li>
              <li><a href="#" onclick="window.open('/views/client/searchPw.jsp', '비밀번호 재설정', 'width=500px,height=350px'); return false;">비밀번호 재설정</a></li>
          </ul>

<!--      End Other the Division -->
   </div>
     
<!--   End Conrainer  -->
  </div>
  
  <!-- End Form -->
</form>




</div>
</div>
   
</body>
</html>

<script>
$(function(){
	
	$(".sign-up").click(function(){
		$(location).attr('href','/views/client/join.jsp');
	})
})




function show() {
    var p = document.getElementById('pwd');
    p.setAttribute('type', 'text');
}

function hide() {
    var p = document.getElementById('pwd');
    p.setAttribute('type', 'password');
}

var pwShown = 0;
    $(function(){
        $("#eye").click(function(){
    console.log("hihi");
     if (pwShown == 0) {
        pwShown = 1;
        show();
    } else {
        pwShown = 0;
        hide();
    }
})
    })



</script>
