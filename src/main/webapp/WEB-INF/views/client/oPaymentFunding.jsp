<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<!-- 다음주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 결제모듈api -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<jsp:include page="/views/client/orderFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/oPayment.css">

<div class="wrap2">
	<div class="blankDiv">
		<div class="content">
			<form action="/client/oCompleteFunding.sool" method="post">
			<div class="addrInfoDiv info">
				<h4 class="subTitle">배송지 정보</h4>
				<table class="table">
					<tbody>
						<tr>
							<th scope="row">이름</th>
							<td class="atd2">${client.cliName }</td>
						</tr>
						<tr>
							<th scope="row">연락처</th>
							<td class="atd2">${client.cliTel }</td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td class="atd2">${client.cliEmail }</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td class="atd2">
								<p class="addrDiv">
									<span class="addr">${client.cliAddr }</span>
								</p> 
								<button type="button" class="btn btn-outline-secondary btn-sm addrUpdate">수정</button>
								<input type="hidden" class="newAddr" name="fndDCliaddr" value="${client.cliAddr }">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="productListDiv info">
				<h4 class="subTitle">주문펀딩 정보</h4>
				<table class="table productListTable">
					<thead class="thead-light">
					   	<tr>
						    <th scope="col" class="th1">펀딩정보</th>
						    <th scope="col" class="th2">후원금액</th>
						    <!-- <th scope="col" class="th3">배송비</th> -->
					    </tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<p>${fd.fundName}</p>
								<p class="indent">${fd.fndGName}</p>
								<p class="indent">${fd.fndGCon}</p>
								<p class="indent"> - 가격 : <span class="comma">${fd.fndGPri}</span></p>
								<p class="indent"> - 후원한 금액 : <span class="comma">${fd.fndDPrice-fd.fndGPri}</span>
							</td>
							<td class="textRight"><p class="eachPrice comma eachGoodsPrice bold">${fd.fndDPrice }</p><span>원</span></td>
							<!-- <td class="textRight"><p class="eachPrice comma eachDeliPrice">2500</p><span>원</span></td> -->
						</tr>
					</tbody>
				</table>
			</div>
			<div class="discountDIv info">
				<h4 class="subTitle">포인트</h4>
				<table class="table">
					<tbody>
						<tr>
							<th scope="row">보유 포인트</th>
							<td class="atd2"><p class="myPoint">${client.cliPoint }</p> P</td>
						</tr>
						<tr>
							<th scope="row">포인트 사용</th>
							<td class="atd2"><input type="text" name="usePoint" value="0"> P <button type="button" class="btn btn-outline-secondary btn-sm usePointSet">적용</button> <button type="button" class="btn btn-outline-secondary btn-sm pointAllUse">전액 사용</button> <span style="color: lightgrey">100원 이상 결제가능합니다.</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="paymentInfoDiv info">
				<h4 class="subTitle">결제 정보</h4>
				<table class="table">
					<tbody>
						<tr>
					      	<th scope="row" colspan="2" rowspan="2" class="price">결제 금액</th>
					      	<td>
					      		<p style="text-indent: 15px; margin-top: 16px" class="goodsPriceP"> 상품금액</p>
					      		<!-- <p class="goodsPriceP">+ 배송비</p> -->
					      		<p class="goodsPriceP">- 포인트 사용</p>
					      	</td>
					      	<td style="text-align: right;">
					      		<p style="margin-top: 16px" class="goodsPrice comma">0</p> 원<br>
					      		<!-- <p class="deliPay comma">0</p> 원<br> -->
					      		<p class="point comma">0</p> 원
					      		<input type="hidden" name="cliPoint"><!-- 사용포인트 전달 -->
					      	</td>
					    </tr>
					    <tr>
					      	<td colspan="2" class="totalTd">
					      		<p class="totalPrice comma">0</p> 원
					      		<input type="hidden" name="fndDTotalp"><!-- 총결제금액전달 -->
					      		<input type="hidden" name="fndDPaydate"><!-- 결제일자전달 -->
					      		<input type="hidden" name="fndDNo" value="${fd.fndDNo }"><!-- fndDNo전달 -->
					      	</td>
					    </tr>
					</tbody>
				</table>
			</div>
			<div class="btnDiv">
				<button type="button" class="bt keepBtn" onclick="location.href='/client/basketList.sool'">취소하기</button>
				<button type="button" class="bt orderBtn">결제하기</button>
				<button type="submit" class="paymentBtn" style="display: none;"></button>
			</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
	$(function(){
		$(".bannerTitle").html("주문/결제");
		
		$(document).on("change", "input[name=usePoint]", function(){
			$(".point").html($(this).val());
		});
		
		//처음 불러올때 금액 콤마로 구분
		$(".comma").each(function(){
			$(this).html(commaSet($(this).html()));
		});
		
		//결제 금액 계산(상품금액, 배송비만 포인트는 기본0원으로)
		var goodsPrice = 0;
		var deliPay = 0;
		$(".eachGoodsPrice").each(function(){
			goodsPrice += Number(commaReset($(this).html()));
			deliPay += 2500;
		});
		$(".goodsPrice").html(commaSet(goodsPrice));
		$(".deliPay").html(commaSet(deliPay));
		
		//총결제금액
		totalPriceSet();
		
		//상품번호(gdsNo)를 문자열로 넘김
		var gdsNoStr = '';
		$(".gdsNoStr").each(function(){
			gdsNoStr += $(this).attr("id")+",";
		});
		$("input[name=gdsNoStr]").val(gdsNoStr);
		
		//상품개수 문자열로 넘기기
		var gdsLCntStr = '';
		$(".gdsLCntStr").each(function(){
			gdsLCntStr += $(this).attr("id")+",";
		});
		$("input[name=gdsLCntStr]").val(gdsLCntStr);
		
		//포인트 콤마
		$(".myPoint").html(commaSet($(".myPoint").html()));
	});
	
	//총결제금액(상품금액+배송비만 포인트는 기본0원이니까 처음엔 더할필요x)
	function totalPriceSet(){
		var goodsPrice = Number(commaReset($(".goodsPrice").html()));
		var deliPay = Number(commaReset($(".deliPay").html()));
		var point = Number(commaReset($(".point").html()));
		$(".totalPrice").html(commaSet(goodsPrice+deliPay-point));
		//controller에 전달할 값
		$("input[name=cliPoint]").val(point);
		$("input[name=fndDTotalp]").val(goodsPrice+deliPay-point);
		
	};
	
	//포인트 전액 사용
	$(".pointAllUse").click(function(){
		var myPoint = Number(commaReset($(".myPoint").html()));//보유포인트
		var goodsPrice = Number(commaReset($(".goodsPrice").html()));//상품금액
		if(myPoint>goodsPrice){//보유포인트가 상품금액보다 큰경우
			$("input[name=usePoint]").val(commaSet(goodsPrice-100));
			$(".point").html(commaSet(goodsPrice-100));
		}else{
			$("input[name=usePoint]").val($(".myPoint").html());
			$(".point").html(commaSet($("input[name=usePoint]").val()));
		}
		totalPriceSet();
	});
	
	//포인트사용 input 직접입력
	//직접입력 시 내용초기화해줌
	$("input[name=usePoint]").focusin(function(){
		$(this).val('');
	});
	//포인트 적용버튼
	$(".usePointSet").click(function(){
		var goodsPrice = Number(commaReset($(".goodsPrice").html()));
		var deliPay = Number(commaReset($(".deliPay").html()));
		if(Number($("input[name=usePoint]").val())>goodsPrice){//상품금액보다 적용할 포인트가 더 크면 상품금액으로 맞춰줌
			alert("주문할 상품의 가격보다 포인트사용이 많습니다");
			$(".point").html(commaSet(goodsPrice-100));
			$("input[name=usePoint]").val(commaSet(goodsPrice-100));
		}else{
			$(".point").html(($("input[name=usePoint]").val()));
			$(".point").html(commaSet($("input[name=usePoint]").val()));
		}
		totalPriceSet();
	});
	
	//포인트 입력 시 숫자만 가능하게 정규표현식
	$("input[name=usePoint]").keyup(function(event){
		var point = $(this).val();
		var pointReg = /^[0-9]{1,}$/;
        if (!pointReg.test($(this).val())) {
        	$(this).val($(this).val().substring(0,$(this).val().length-1));
        }
	});
	
	$(document).on("click", ".addrUpdate", function(){
		thisBtn = $(this);
		if($(this).html()=="수정"){//수정버튼일 경우
			addr = '';
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

	                thisBtn.prev().children().html(addr);
	                thisBtn.prev().append("<p class='detailP'>상세주소 입력 : <input type='text' class='detailAddr'></input></p>");
	                thisBtn.html("완료");
	            }
	        }).open();
		}else{//완료버튼일 경우
			if($(this).prev().find('.detailAddr').val()==''){
				alert("상세주소를 입력해주세요");
			}else{
				var cliNo = ${sessionScope.sessionClient.clientNo};
				$(".newAddr").val($(".newAddr").val()+" "+$(".detailAddr").val());
				var cliAddr = $(".newAddr").val();//새로운주소
				$.ajax({
					url:"/client/ClientAddrUpdate.sool",
					data: {cliNo:cliNo,
						cliAddr:cliAddr},
					type:"post",
					success:function(data){
						if(data>0){//update가 정상이면 주소변경
							var loadAddr = $(thisBtn).prev().find('.addr').html();
							loadAddr += $(thisBtn).prev().find('.detailAddr').val();
							$(thisBtn).prev().find('.detailP').remove();
							$(thisBtn).prev().find('.addr').html(loadAddr);
							$(".addrUpdate").html("수정");
						}else{
							alert("주소 수정에 실패하였습니다. 다시 시도해주세요");
						}
					}
				})
			}
		}
	});
	
	
	//금액단위 콤마 구분
	function commaSet(price) {
		var str = String(price);
		let price1 = str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return price1;
	}
	//콤마 제거
	function commaReset(price){
		var str = String(price);
		let price1 = str.replace(/[^\d]+/g, "");
		return price1;
	}
	
	/* 
	$(".orderBtn").click(function(event){
		
	}); */
	
	//결제하기
	$(document).on("click",".orderBtn",function(event){
		var temp = 0;
		var price = commaReset($(".totalPrice").html());
		var d = new Date();
		function az(n){//9월이면 9로 저장되니까 09로 되게 만듦
			if(n<10){
				return "0"+n;
			}
			return n;
		}
		var date=d.getFullYear()+''+az(d.getMonth()+1)+''+az(d.getDate())+''+az(d.getHours())+''+az(d.getMinutes())+''+az(d.getSeconds());

		 IMP.init("imp54844867");
		IMP.request_pay({//결제를 위해 전달해주는 정보
			merchant_uid : "${client.cliId}"+date,//상점거래ID(필수)
			name : "결제테스트",			//결제이름
			amount : 100,				//결제금액(필수)
			buyer_email : "${client.cliEmail}",//구매자 email
			buyer_name : "${client.cliName}",		//구매자이름
			buyer_tel : "${client.cliTel}",//구매자전화번호(필수)
			buyer_addr : "${client.cliAddr}",	//구매자 주소
		},function(rsp){//위의 값을 가지고 결제모듈을 진행
			if(rsp.success){	//결제가 성공한 경우(결제정보를 디비에 저장해놔야지)
				//$("input[name=purDate]").val(rsp.merchant_uid);//성공시 상점거래아이디 넘기기
				$("input[name=fndDPaydate]").val(date);//결제일자
				$("form").submit();//포인트 결제일자 총결제금액 fndDNo 4개를 넘김
			}else{				//결제 실패한 경우
				//$("input[name=resultMsg]").val(rsp.error_msg);//실패할경우 에러메세지
				alert("결제에 실패했습니다\n결제 실패사유 : "+rsp.error_msg);
				location.href="/client/mFunding.sool?reqPage=1&period=1";//실패 후 장바구니페이지로 이동
			}
		}) 
	});
	
</script>
</body>
</html>