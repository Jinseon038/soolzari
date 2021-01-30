<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/sellerRegist.css">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <div class="regist_box">
        <form action="/seller/registChk.sool" method="post">
            <h2 id="regist_box_title">회원가입</h2>
            <label for="selId">아이디</label><input type="text" id="selId" name="selId" value="" placeholder="아이디를 입력해주세요" required>
            <input type="button" id="idchk" value="중복확인"><span class="comment1"></span><br>
            <label for="selPw">비밀번호</label><input type="password" id="selPw" name="selPw" value="" placeholder="비밀번호를 입력해주세요" required>
            <span class="comment"></span><br>
            <label for="selPwRe">비밀번호 확인</label><input type="password" id="selPwRe" name="selPwRe" value="" placeholder="비밀번호를 한번 더 입력해주세요" required>
            <span class="comment"></span><br>
            <label for="selName">판매자 이름</label><input type="text" id="selName" name="selName" placeholder="판매자 이름을 입력해주세요" required>
            <span class="comment"></span><br>
            <label for="selTel">판매자 전화번호</label><input type="text" id="selTel" name="selTel" placeholder="000-0000-000" required>
            <span class="comment"></span><br>
            <label for="selAddr">판매자 주소</label><input type="text" id="selAddr" name="selAddr" placeholder="판매자 주소를 입력해주세요" required>
            <span class="comment"></span><br>
            <input type="submit" class="submit-btn" id="submitBtn" value="회원가입"></input>
        </form>
    </div>
</body>
<script>
/* 유효성*/
    var idCheck=0;
  $(function(){
	
	//회원가입 버튼눌리면 유효성 검사
	$("#submitBtn").click(function(event){
		if(idCheck==0){
			alert('아이디 중복체크 해주세요');
		}
		var count=0;
		var comments = $(".comment");
		
	
          comments.html(' '); // 제출후 다시 조건을 입력하기 위해 초기화  
          
          //id검사 : 영어소문자로 시작하여 영문 + 숫자 4 글자~12 글자
          var idReg = /^[a-z][a-z0-9]{3,11}$/;
          if (!idReg.test($("#selId").val())) { // ! => 조건을 만족하지 못했을때 
        	  console.log("idCheck");
          		console.log($("#selId").val());
       		
              $(".comment1").html('소문자, 숫자로 4~12글자');
        
              count++;
          }else{
        	  console.log(idCheck);
        	  $(".comment1").html('');
       
          }

          //비밀번호 검사 : 영어소문자, 대문자, 숫자를 사용하여 8~12 글자
          var pwReg = /^[a-zA-Z0-9]{8,12}$/;
          if (!pwReg.test($("#selPw").val())) {
        	  console.log("pw : "+$("#selPw").val());
              comments.eq(0).html('영어 대/소문자, 숫자로 8~12 글자');
   
              count++;
          }

          //비밀번호 확인: 비밀번호와 같은지 체크
          if ($("#selPw").val() != $("#selPwRe").val()) {
              comments.eq(1).html('비밀번호가 일치하지 않습니다');
       
              count++;
          }

          //이름 확인 : 한글(최소 1 글자)
          var nameReg = /^[가-힣]{1,}$/;
          if (!nameReg.test($("#selName").val())) {
              comments.eq(2).html('한글(최소 1 글자)');
           
              count++;
          }
         
          //주소: 영어 및 공백사용불가
          var addrReg = /^[a-zA-Z]+$/;
          if (addrReg.test($("#selAddr").val()) || $("#selAddr").val() == '') {
              comments.eq(4).html('영어 및 공백사용불가');
        
              count++;
          }

          //핸드폰 정규식
    	var phoneReg = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	
		  if(!phoneReg.test($("#selTel").val())){
			  comments.eq(3).html('휴대폰 번호를 확인해주세요');
        
              count++;
		  }
        
          if(count >0){
        	  event.preventDefault();
          }
          


      });
		
	});
	
   /* 아이디 중복체크*/
   
      
      $("#idchk").click(function(){
    	  var selId=$("#selId").val();
    	  console.log(selId);
    	  var idReg = /^[a-z][a-z0-9]{3,11}$/;
          if (!idReg.test(selId)) { // ! => 조건을 만족하지 못했을때 
              $(".comment1").html('소문자, 숫자로 4~12글자');
      
             alert('아이디 형식을 확인해주세요');
          }else{
        	  var selId = $("#selId").val();
              $.ajax({
                 url : "/seller/ajaxCheckId.sool",
                 type : "get",
                 data : {selId : selId},
                 success : function(data){
               
                    if(data == 1) {
                      alert('사용가능한 아이디 입니다.');
                      idCheck=1;
                 
                    }else{
                      alert('이미 사용중인 아이디 입니다.');
                    	idCheck=0;
                    }
                 }
              });
          }
     
   });

   
  
</script>
</html>