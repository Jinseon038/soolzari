<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <script src="/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/join.css">

    <!-- Bootstrap cdn 설정 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">



    <!--font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


    <!-- icon 사용-->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <!-- script -->


    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">
</head>
<body>
  <!-- 헤더 -->
   <%@include file="/WEB-INF/views/common/header.jsp" %>

    <div class="content">

        <div class="title">술자리에 오신것을 환영합니다! <br><br></div>
        <div class="join">

            <form action="/register.sool" method="post" class="joinTable" id="registerForm">
                <table>
                    <tr>
                        <td><label for="userid">아이디 *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                        <td><input type="text" id="userid"  name="clientId" placeholder="4글자에서 12글자" required></td>
                       <td style="width:45px;">
                       <button type="button" id="idchk"  >중복확인</button>  
                       <span class="comment1"></span></td>
                       
                    </tr>
                    <tr>
                        <td><label for="userpw">비밀번호 *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                        <td><input type="password" id="userpw" name="clientPw" placeholder="영/숫자  8자 이상" required>
                            <span class="input-eye">
                                <i class="fa fa-eye" aria-hidden="true" type="button" id="eye" ></i>
                            </span>
                            
                        </td>
                             <td> <span class="comment"></span></td>
                    </tr>
                    <tr>
                        <td><label for="userpwre">비밀번호확인 *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                        <td><input type="password" id="userpwre" name="userPwre" required>
                            <span class="input-eye1">
                                <i class="fa fa-eye" aria-hidden="true" type="button" id="eye" ></i>
                            </span>
                        </td>
                            <td> <span class="comment">&nbsp;</span></td>
                    </tr>
                    <tr>
                        <td><label for="username">이름 *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                        <td><input type="text" id="username" name="clientName" required></td>
                           <td><span class="comment">&nbsp;</span></td>
                    </tr>
                      <tr>
                        <td><label for="userage">생년월일 *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                        <td><input type="text" id="userage" name="clientAge" placeholder="예시)19950904" required></td>
                            <td> <span class="comment">&nbsp;</span></td>
                    </tr>
                    <tr>
                        <td><label for="userphone">전화번호 *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                        <td><input type="text" id="userphone" name="clientTel" placeholder="예시)000-0000-0000" required></td>
                            <td> <span class="comment">&nbsp;</span></td>
                    </tr>
                    <tr>
                        <td><label for="useraddr">주소 *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                        <td><input type="text" id="addrsearch" name="clientAddr" readonly><button type="button" id="addrchk" onclick="execDaumPostcode()">주소검색</button></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" id="useraddr" name="clientAddr1" readonly></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" id="useraddr2" name="clientAddr2" readonly></td>
                    </tr>
                    <tr>
                        <td><label for="useraddrdtl"></label></td>
                        <td><input type="text" id="useraddrdtl" name="clientAddr3" placeholder="상세 주소 입력"></td>
                           <td> <span class="comment">&nbsp;</span></td>
                    </tr>

                    <tr>
                        <td><label for="useremail">이메일 *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                        <td><input type="text" id="useremail" name="clientEmail"></td>
                            <td><span class="comment"></span></td>
                    </tr>
                    <tr>
                        <td><label for="agreement">이용약관 *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                        <td><textarea id="agreement" style="resize:none">개인정보 보유 및 이용기간
회사는 회원으로서 제공되는 서비스를 받는 동안 회원님의 개인정보를 보유 및 이용할 수 있으며, 회원탈퇴를 요청하거나 위에서 설명한 개인정보를 수집한 목적이 완료된 경우에는 수집된 개인정보가 열람 또는 이용될 수 없도록 처리됩니다.단, 관계법령의 규정에 의해 보존할 필요가 있는 경우 관계법령에서 정한 일정한 기간 동안 최소한의 회원정보를 보유합니다.
 • 계약 또는 청약철회 등에 관한 기록 : 5년
 • 대금결제 및 재화 등의 공급에 관한 기록 : 5년
• 회원의 불만 또는 분쟁처리에 관한 기록 : 3년
• 기타 회원의 동의를 득한 경우 : 동의를 득한 기간까지
단, 온라인 홈페이지의 경우, 관련법령에 따라 유효기간(최종 로그인 후 12개월) 내 재로그인 하지 않은 회원의 개인정보는 유효기간 경과 후 즉시 파기하거나, 분리하여 보관합니다.
개인정보 주체에게는 30일 전에 해당 사실을 통지하고, 명시한 기한 내에 로그인 하지 않을 경우에는 회원자격을 상실시킬 수 있습니다.
이 경우, 회원 아이디를 포함한 회원의 개인정보 및 서비스 이용 정보는 파기, 삭제됩니다.
                                    </textarea></td>
                        <td><input type="checkbox" id="check">동의<br></td>
                    </tr>
                </table>
                <br><br>
                <div class="btnBox">
                       <input class="botton" id="submit-1" type="submit" value="회원가입">
                <input class="botton" type="reset" value="취소">
                </div><br><br><br>

            </form>


        </div>

    </div>
     <%@include file="/WEB-INF/views/common/footer.jsp" %>
   
</body>
</html>


<script>
   /* 유효성*/
    var idCheck=0;
  $(function(){
	
	  
	
		   
		      $("input[type=reset]").click(function(){
      $(location).attr('href','/');
   })
	//회원가입 버튼눌리면 유효성 검사
	$("input[type=submit]").click(function(event){
		if(idCheck==0){
			alert('아이디 중복체크 해주세요');
		}
		console.log("hihi");
		var count=0;
		var inputs=$("input");
		console.log("inputs : "+inputs);
		var comments = $(".comment");
		
	
          comments.html(' '); // 제출후 다시 조건을 입력하기 위해 초기화  
          
          //id검사 : 영어소문자로 시작하여 영문 + 숫자 4 글자~12 글자
          var idReg = /^[a-z][a-z0-9]{3,11}$/;
          if (!idReg.test(inputs.eq(1).val())) { // ! => 조건을 만족하지 못했을때 
        	  console.log("idCheck11");
       		
              $(".comment1").html('소문자, 숫자로 4~12글자');
        
              count++;
          }else{
        	  console.log("idCheck");
        	  $(".comment1").html('');
       
          }

          //비밀번호 검사 : 영어소문자, 대문자, 숫자를 사용하여 8~12 글자
          var pwReg = /^[a-zA-Z0-9]{8,12}$/;
          if (!pwReg.test(inputs.eq(2).val())) {
        	  console.log("pw : "+inputs.eq(1).val());
              comments.eq(0).html('영어 대/소문자, 숫자로 8~12 글자');
   
              count++;
          }

          //비밀번호 확인: 비밀번호와 같은지 체크
          if (inputs.eq(2).val() != inputs.eq(3).val()) {
              comments.eq(1).html('비밀번호가 일치하지 않습니다');
       
              count++;
          }

          //이름 확인 : 한글(최소 1 글자)
          var nameReg = /^[가-힣]{1,}$/;
          if (!nameReg.test(inputs.eq(4).val())) {
              comments.eq(2).html('한글(최소 1 글자)');
           
              count++;
          }
          var today=new Date();
			var yearNow=today.getFullYear();
			var adultYear=yearNow-20;
			var year=Number(inputs.eq(5).val().substr(0,4));
			
			var ageReg=/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

			
			
          if(year>adultYear){
        	  console.log("year :"+year);
        	  comments.eq(3).html('만 19세 이상부터 가입가능합니다');
        	  count++;
          }
          if(!ageReg.test(inputs.eq(5).val())){
        	  comments.eq(3).html('생년월일 형식이 다릅니다');
        	  count++;
          }
          //주소: 영어 및 공백사용불가
          var addrReg = /^[a-zA-Z]+$/;
          if (addrReg.test(inputs.eq(10).val()) || inputs.eq(10).val() == '') {
              comments.eq(5).html('영어 및 공백사용불가');
        
              count++;
          }

          //핸드폰 정규식
    	var phoneReg = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	
		  if(!phoneReg.test(inputs.eq(6).val())){
			  comments.eq(4).html('휴대폰 번호를 확인해주세요');
        
              count++;
		  }
        

          //이메일확인 : 영어 + 숫자 4~12 글자뒤에 @ 뒤에 @포함
          var emailReg = /^[a-z0-9]{4,20}@/;
          if(!emailReg.test(inputs.eq(11).val())){
              comments.eq(6).html('이메일을 확인해주세요');
           
              count++;
          }

   		   var submit1 = $("#submit-1");
   		      if($("#check").is(":checked")==false){
   		 	  alert("체크박스 선택해주세요");
   		    	count++;
   		   
   		      }
   		 
       
          if(count >0){
              event.preventDefault(); //폼을 자동으로 제출하는 이벤트를 삭제
          }
          


      });
		
	});
	
   /* 아이디 중복체크*/
   
      
      $("#idchk").click(function(){
    	  idCheck=1;
    	  var clientId=$(this).parent().prev().children().val();
    	  console.log(clientId);
    	  var idReg = /^[a-z][a-z0-9]{3,11}$/;
          if (!idReg.test($("input").eq(1).val())) { // ! => 조건을 만족하지 못했을때 
              $(".comment1").html('소문자, 숫자로 4~12글자');
      
             alert('아이디 형식을 확인해주세요');
          }else{
        	  var userId = $(this).val();
              $.ajax({
                 url : "/ajaxCheckId.sool",
                 type : "get",
                 data : {clientId : clientId},
                 success : function(data){
               
                    if(data == 1) {
                      alert('사용가능한 아이디 입니다.');
                 
                    }else{
                      alert('이미 사용중인 아이디 입니다.');
                    
                    }
                 }
              });
          }
     
   });

   
  
   
   /* 비밀번호 password 형식에서 보이도록*/
function show() {
    var p = document.getElementById('userpw');

      p.setAttribute('type', 'text');
  
  }

  function hide() {
      var p = document.getElementById('userpw');

      p.setAttribute('type', 'password');
  
  }
function show1() {
    var p = document.getElementById('userpwre');

      p.setAttribute('type', 'text');
  
  }

  function hide1() {
      var p = document.getElementById('userpwre');

      p.setAttribute('type', 'password');
  
  }
  var pwShown = 0;
  var pwShown1=0;

      $(function(){
          $(".input-eye").click(function(){
      console.log("hihi");
              
       if (pwShown == 0) {
          pwShown = 1;
          show();
      } else {
          pwShown = 0;
          hide();
      }
  })
      });

$(function(){
          $(".input-eye1").click(function(){
      console.log("hihi");

       if (pwShown1 == 0) {
          pwShown1 = 1;
          show1();
      } else {
          pwShown1 = 0;
          hide1();
      }
  })
      });


</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
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
                    document.getElementById("useraddr2").value = extraAddr;
                
                } else {
                    document.getElementById("useraddr2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addrsearch').value = data.zonecode;
                document.getElementById("useraddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("useraddrdtl").focus();
            }
        }).open();
    }
</script>