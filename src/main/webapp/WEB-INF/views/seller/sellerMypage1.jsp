<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/sellerMypage.css">
<style>
	.chart{
		width: 500px;
		height: 200px;
		float: left;
		border: 1px solid lightgray;
		margin-top : 50px;
		margin-left: 50px;
		text-align: center;
		margin-bottom: 50px;
	}
	
	.chartTitle{
	    margin: 0 auto;
	    width: 200px;
	    margin-top: 20px;
	    border-bottom: 3px solid #4d5075;
	    height: 50px;
	    line-height: 50px;
	    font-size: 20px;
	    margin-top: 20px;
	}
	.chart>h2{
	    color: #4d5075;
	}
	.highlight{
		margin:0 auto;
		margin-top: 20px;
		width: 200px;
		background: linear-gradient(to top, yellow 50%, transparent 50%);
	}
	.chartwrap{
		width: 1200px;
		margin: 0 auto;
		border-bottom: 1px solid lightgray;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/seller/sellerHeader.jsp"%>
	<div id="content_box">
        <div id="left_bar">
            <div class="wrapper">
                <ui class="mainMenu">
                    <li class="item" id="goods_con">
                        <a href="#goods_con" class="btn-left">상품 관리</a>
                        <div class="subMenu">
                            <a href="/seller/goodsAdd.sool">상품 등록</a>
                            <a href="/seller/goodsList.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">상품 보기</a>
                        </div>
                    </li>
                    <li class="item" id="class_con">
                        <a href="#class_con" class="btn-left">클래스 관리</a>
                        <div class="subMenu">
                            <a href="/seller/classAdd.sool">클래스 등록</a>
                            <a href="/seller/classList.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">클래스 확인</a>
                        </div>
                    </li>
                    <li class="item" id="funding_con">
                        <a href="#funding_con" class="btn-left">펀딩 관리</a>
                        <div class="subMenu">
                            <a href="/seller/fundingAdd.sool">펀딩 열기</a>
                            <a href="/seller/fundingList.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">펀딩 확인</a>
                        </div>
                    </li>
                    <li class="item" id="mypage_con">
                        <a href="#mypage_con" class="btn-left">마이페이지</a>
                        <div class="subMenu">
                            <a href="/seller/mypage1.sool">내 정보 보기</a>
                            <a href="/seller/mypage2.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">상품 배송 관리</a>
                            <a href="/seller/mypage3.sool?reqPage=1">펀딩 배송 관리</a>
                        </div>
                    </li>
                </ui>
            </div>
        </div>
        <div id="main_container">
            <div id="main_content">
            	<div class="infoDiv">
            	<h5 style="text-align: center;padding:20px;margin: 0 auto;background-color:#f7b8b4;"> 판매자 정보 보기 </h5>
            		<div class="chartwrap">
            			<div class="chart">
					    	<h1 class="chartTitle">총 판매량</h1>
					    	<h2 class="highlight">${totalGoods } 개</h2>
					    </div>
					    <div class="chart">
					    	<h1 class="chartTitle">총 판매 금액</h1>
					    	<h2 class="highlight">${totalSales } 원</h2>
					    </div>
            		</div>
            		
            		<form action="/seller/mypageSellerUpdate.sool" method="post">
						<table class="table">
						  <tbody>
						  <tr>
						  <th scope="row"></th>
						  <td></td>
						  </tr>
						    <tr>
						      <th scope="row">이름</th>
						      <td class="td2"><input type="text" name="selName" value="${sessionScope.sessionSeller.selName }"><span class='comment'></span></td>
						    </tr>
						    <tr>
						      <th scope="row">비밀번호</th>
						      <td class="td2"><p class="pwP" style="margin: 0;"></p> <button type="button" class="btn btn-outline-secondary btn-sm pwUpdate">수정</button></td>
						    </tr>
						    <tr>
						      <th scope="row">가입일자</th>
						      <td class="td2">${sessionScope.sessionSeller.selEnroll }</td>
						    </tr>
						    <tr>
						      <th scope="row">휴대폰 번호</th>
						      <td class="td2"><input type="text" name="selTel" value="${sessionScope.sessionSeller.selTel }"><span class='comment'></span></td>
						    </tr>
						    <tr>
						      <th scope="row">주소</th>
						      <td class="td2"><p class="addr">${sessionScope.sessionSeller.selAddr }</p> <button type="button" class="btn btn-outline-secondary btn-sm addrUpdate">수정</button></td>
						      <input type="hidden" class="newAddr" name="selAddr"><!-- 여기에 값이 들어가면 수정됐으니까 주소 업데이트해야함 -->
						    </tr>
						    <tr>
						      <th scope="row" class="btnDiv" colspan="2"><button type="submit" class="btn updateBtn">수정</button></th>
						    </tr>
						  </tbody>
						</table>
					</form>
				</div>
				<br>
            </div>
        </div>
    </div>
    <div id="seller_footer">
        © SoolZaRi 술자리
    </div>

    <script>
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
	                thisBtn.prev().html(addr);
	                thisBtn.parent().append("<p class='detailP'>상세주소 입력 : <input type='text' class='detailAddr'><span class='comment'></span></p>");
	                thisBtn.html("완료");
	            }
	        }).open();
		}else{
			if($(this).parent().prev().find('.detailAddr').val()==''){
				alert("상세주소를 입력해주세요");
			}else{
				//var cliNo = ${sessionScope.sessionClient.clientNo};
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
			$(this).prev().append("<input type='password' class='info' name='selPw' placeholder='새로운 비밀번호'><span class='comment'></span> <br><input type='password' class='info' name='selPwChk' placeholder='비밀번호 확인'><span class='comment'></span>");
			$(this).html("취소");
		}else{						//취소버튼이면 비번수정을 취소하고 input사라짐
			$(this).prev().html('');
			$(this).html("수정");
		}
	});
  
	//정규식검사
	$(document).on("click",".updateBtn",function(){
		var count=0;
	    var comments = $(".comment");
	    $(".comment").html("");
	    
	  //이름 확인 : 한글(최소 1 글자)
        var nameReg = /^[가-힣]{1,}$/;
        if (!nameReg.test($("input[name=selName]").val())) {
        	$("input[name=selName]").next().html('한글(최소 1 글자)');
         	console.log("1");
            count++;
        }
	    
		//비밀번호 검사 : 영어소문자, 대문자, 숫자를 사용하여 8~12 글자
	    var pwReg = /^[a-zA-Z0-9]{8,12}$/;
	    if (!pwReg.test($("input[name=selPw]").val())) {
	       $("input[name=selPw]").next().html('영어 대/소문자, 숫자로 8~12 글자');
	       console.log("2");
	        count++;
	    }
	    
	  	//비밀번호 확인: 비밀번호와 같은지 체크
        if ($("input[name=selPw]").val() != $("input[name=selPwChk]").val()) {
        	$("input[name=selPwChk]").next().html('비밀번호가 일치하지 않습니다');
        	console.log("3");
     
            count++;
        }
	    
      	//핸드폰 정규식
        var phoneReg = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    
         if(!phoneReg.test($("input[name=selTel]").val())){
        	 $("input[name=selTel]").next().html('휴대폰 번호를 확인해주세요');
        	 console.log("4");
               count++;
         }
         
         if($(".addrUpdate").html()=='완료'){
        	 $(".detailAddr").next().html("상세주소를 입력하고 완료버튼을 눌러주세요");
        	 console.log("5");
        	 count++;
         }
         console.log("count :"+count);
         
         if(count >0){
             event.preventDefault(); //폼을 자동으로 제출하는 이벤트를 삭제
         }
	    
	});


    </script>
</body>
</html>