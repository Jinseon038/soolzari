<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/bootstrap.min.js"></script>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mypageFrm.css">
<link rel="stylesheet" type="text/css" href="/resources/css/mInfo.css">

	<div class="wrap2" style="margin-top: 80px;">
		<div class="sideNavi">
			<ul class="sideNaviUl">
				<a class="sideNaviTop" href="/client/mOrderList.sool?reqPage=1&period=1">마이페이지</a>
				<li><a class="sideNaviA a1" href="/client/mOrderList.sool?reqPage=1&period=1">주문 내역</a></li>
				<li><a class="sideNaviA a2" href="/client/mExperience.sool?reqPage=1&period=1">예약한 클래스</a></li>
				<li><a class="sideNaviA a3" href="/client/mFunding.sool?reqPage=1&period=1">후원한 펀딩</a></li>
				<li><a class="sideNaviA a5" href="/client/mReview.sool?reqPage=1&period=1">내가 쓴 리뷰</a></li>
				<li><a class="sideNaviA a6" href="/client/mQuestion.sool?reqPage=1&period=1">1:1 문의</a></li>
				<li><a class="sideNaviA a7" href="/client/mInfo.sool">내 정보 수정</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="banner">
				<h1><a class="bannerTitle" href="#">마이페이지</a></h1>
			</div>
			<div class="mainContent">
				<form action="/client/mInfoUpdate.sool" method="post">
				<input type="hidden" name="cliNo" value="${sessionScope.sessionClient.clientNo }">
				<h3 class="contentTitle">회원정보 수정</h3>
				<hr class="hrMargin">
				<div class="allInfoDiv">
					<c:if test="${client.cliPw=='sns' }">
					<div class="infoDiv">
						<h3>SNS로 로그인한 회원입니다</h3>
					</div>
					</c:if>
					<c:if test="${client.cliPw!='sns' }">
					<div class="infoDiv">
						<h4>기본 정보</h4>
						<table class="table">
						  <tbody>
						    <tr>
						      <th scope="row">이름</th>
						      <td class="td2"><input type="text" name="cliName" value="${client.cliName }"><span class='comment'></span></td>
						    </tr>
						    <tr>
						      <th scope="row">비밀번호</th>
						      <td class="td2"><p class="pwP" style="margin: 0;"></p> <button type="button" class="btn btn-outline-secondary btn-sm pwUpdate">수정</button></td>
						    </tr>
						    <tr>
						      <th scope="row">이메일</th>
						      <td class="td2"><input type="text" name="cliEmail" value="${client.cliEmail }"><span class='comment'></span></td>
						    </tr>
						    <tr>
						      <th scope="row">휴대폰 번호</th>
						      <td class="td2"><input type="text" name="cliTel" value="${client.cliTel }"><span class='comment'></span></td>
						    </tr>
						    <tr>
						      <th scope="row">생년월일</th>
						      <td class="td2"><input type="text" name="cliAge" value="${client.cliAge }"><span class='comment'></span></td>
						    </tr>
						  </tbody>
						</table>
					</div>
					</c:if>
					<div class="addrDiv">
						<h4>배송지</h4>
						<div class="addrDiv2">
							<input type="hidden" class="newAddr" name="cliAddr" value="${client.cliAddr }"><!-- 여기에 값이 들어가면 수정됐으니까 주소 업데이트해야함 -->
							<table class="table">
								<tbody>
								   	<tr>
								      	<th scope="row" class="th1">기본 배송지</th>
								      	<td class="td2"><p class="addr">${client.cliAddr }</p></td>
								      	<td class="td3"><button type="button" class="btn btn-outline-secondary btn-sm addrUpdate">수정</button></td>
								    </tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="btnDiv">
					<button type="submit" class="btn updateBtn">수정</button>
				</div>
				</form>
			</div>
			
			
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	//사이드바 호버
	$(".sideNaviA").hover(function(){
		if(!$(this).is(".a7")){
			$(".a7").css("background-color","white");
			$(".a7").css("color","black");
		}
	},function(){
		$(".a7").css("background-color","rgb(77, 80, 117)");
		$(".a7").css("color","white");
	});
	
	//주소 수정
	$(document).on("click", ".addrUpdate", function(){
		if($(this).html()=="수정"){
			addr = '';
			thisBtn = $(this);
			new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                addr += "[" + data.zonecode + "]" + " ";
	                addr += roadAddr + " ";
	                $(".newAddr").val(data.zonecode+" "+roadAddr);
	                
	                //document.getElementById('sample4_postcode').value = data.zonecode;
	                //document.getElementById("sample4_roadAddress").value = roadAddr;
	                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    //document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	                    addr += extraRoadAddr + " ";
	                    $(".newAddr").val($(".newAddr").val()+" "+extraRoadAddr);
	                } /* else {
	                    document.getElementById("sample4_extraAddress").value = '';
	                } */
	                thisBtn.parent().prev().children('.addr').html(addr);
	                thisBtn.parent().prev().append("<p class='detailP'>상세주소 입력 : <input type='text' class='detailAddr'><span class='comment'></span></p>");
	                thisBtn.html("완료");
	            }
	        }).open();
		}else{
			if($(this).parent().prev().find('.detailAddr').val()==''){
				alert("상세주소를 입력해주세요");
			}else{
				var cliNo = ${sessionScope.sessionClient.clientNo};
				$(".newAddr").val($(".newAddr").val()+" "+$(".detailAddr").val());
				console.log($(".newAddr").val());
				
				var loadAddr = $('.addr').html();
				loadAddr += $('.detailAddr').val();
				$('.detailP').remove();
				$('.addr').html(loadAddr);
				$(".addrUpdate").html("수정");
			}
		}
	});
	//비밀번호 수정버튼
	$(".pwUpdate").click(function(event){
		if($(this).html()=='수정'){//수정버튼이면 비번수정할수있는 input2개 나타나게
			$(this).prev().append("<input type='password' class='info' name='cliPw' placeholder='새로운 비밀번호'><span class='comment'></span> <br><input type='password' class='info' name='pwCheck' placeholder='비밀번호 확인'><span class='comment'></span>");
			$(this).html("취소");
		}else{						//취소버튼이면 비번수정을 취소하고 input사라짐
			$(this).prev().html('');
			$(this).html("수정");
		}
	});
	
	$(document).on("click",".pwcancel",function(){
		
	});
	
	//정규식검사
	$(document).on("click",".updateBtn",function(){
		var count=0;
	    var comments = $(".comment");
	    
	  //이름 확인 : 한글(최소 1 글자)
        var nameReg = /^[가-힣]{1,}$/;
        if (!nameReg.test($("input[name=cliName]").val())) {
        	$("input[name=cliName]").next().html('한글(최소 1 글자)');
         
            count++;
        }
	    
		//비밀번호 검사 : 영어소문자, 대문자, 숫자를 사용하여 8~12 글자
	    var pwReg = /^[a-zA-Z0-9]{8,12}$/;
	    if (!pwReg.test($("input[name=cliPw]").val())) {
	       console.log("pw : "+$("input[name=cliPw]").val());
	       $("input[name=cliPw]").next().html('영어 대/소문자, 숫자로 8~12 글자');
	        count++;
	        console.log(count);
	    }
	    
	  	//비밀번호 확인: 비밀번호와 같은지 체크
        if ($("input[name=cliPw]").val() != $("input[name=pwCheck]").val()) {
        	$("input[name=pwCheck]").next().html('비밀번호가 일치하지 않습니다');
     
            count++;
        }
	    
      	//이메일확인 : 영어 + 숫자 4~12 글자뒤에 @ 뒤에 @포함
        var emailReg = /^[a-z0-9]{4,20}@/;
        if(!emailReg.test($("input[name=cliEmail]").val())){
        	$("input[name=cliEmail]").next().html('이메일을 확인해주세요');
         
            count++;
        }
	    
      	//핸드폰 정규식
        var phoneReg = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    
         if(!phoneReg.test($("input[name=cliTel]").val())){
        	 $("input[name=cliTel]").next().html('휴대폰 번호를 확인해주세요');
               count++;
         }
         
         //생년월일
         var today=new Date();
         var yearNow=today.getFullYear();
         var adultYear=yearNow-20;
         console.log($("input[name=cliAge]").val());
         var year=Number($("input[name=cliAge]").val().substr(0,4));
         
         var ageReg=/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
         
         if(year>adultYear){
         	console.log("year :"+year);
         	$("input[name=cliAge]").next().html('만 19세 이상부터 가입가능합니다');
            count++;
         }
         if(!ageReg.test($("input[name=cliAge]").val())){
        	 $("input[name=cliAge]").next().html('생년월일 형식이 다릅니다');
            count++;
         }
         
         if($(".addrUpdate").html()=='완료'){
        	 $(".detailAddr").next().html("상세주소를 입력하고 완료버튼을 눌러주세요");
        	 count++;
         }
         
         if(count >0){
             event.preventDefault(); //폼을 자동으로 제출하는 이벤트를 삭제
         }
	    
	});
	
</script>
</html>