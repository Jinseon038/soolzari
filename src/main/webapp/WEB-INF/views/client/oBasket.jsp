<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<jsp:include page="/views/client/orderFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/oBasket.css">
<div class="wrap2">
	<div class="blankDiv">
		<div class="content">
			<table class="table">
				<thead class="thead-light">
				   	<tr>
				     	<th scope="col" class="th1"><input type="checkbox" name="allChk"></th>
					    <th scope="col" class="td1">상품정보</th>
					    <th scope="col" class="td2">상품금액</th>
					    <th scope="col" class="td3">배송비</th>
				    </tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${list=='[]' }">
							<tr>
								<th colspan="4">장바구니에 담긴 상품이 없습니다</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="bl">
								<tr>
									<th scope="row"><input type="checkbox" class="oneChk" id="${bl.basket.basNo }"></th>
									<td>
										<p>${bl.goods.gdsName}</p>
										<p> - 가격 : <span class="comma">${bl.goods.gdsPri}</span></p>
										<p> - 개수 : <button type="button" class="btn btn-outline-secondary btn-sm mi" onclick="plusMinusBtn(this,${bl.basket.basNo},${bl.goods.gdsPri },0);">-</button> 
										<span class="basCnt">${bl.basket.basCnt}</span>
										<button type="button" class="btn btn-outline-secondary btn-sm pl"  onclick="plusMinusBtn(this,${bl.basket.basNo},${bl.goods.gdsPri },1);">+</button></p>
										<%-- <input type="hidden" readonly="readonly" value="${bl.basCnt}"> --%>
									</td>
									<td class="textRight"><p class="eachPrice comma eachGoodsPrice">${bl.goods.gdsPri*bl.basket.basCnt }</p><span>원</span></td>
									<td class="textRight"><p class="eachPrice comma eachDeliPrice">2500</p><span>원</span></td>
								</tr>
							</c:forEach>
						</c:otherwise>
				</c:choose>
					
				    <tr>
				      	<td colspan="4"><button type="button" class="btn btn-outline-secondary btn-sm goodsRemove">선택삭제</button></td>
				    </tr>
				    <tr>
				      	<th scope="row" colspan="2" rowspan="2" class="th2">결제 예정 금액</th>
				      	<td>
				      		<p style="text-indent: 15px; margin-top: 16px" class="goodsPriceP"> 상품금액</p>
				      		<p class="goodsPriceP">+ 배송비</p>
				      	</td>
				      	<td style="text-align: right;">
				      		<p style="margin-top: 16px" class="goodsPrice comma">0</p> 원<br>
				      		<p class="deliPay comma">0</p> 원
				      	</td>
				    </tr>
				    <tr>
				      	<td colspan="2" class="totalTd">
				      		<p class="totalPrice comma">0</p> 원
				      	</td>
				    </tr>
				    <tr>
				      	<td colspan="4" class="btnTd">
				      		<button type="button" class="bt keepBtn" onclick="location.href='/'">쇼핑 계속하기</button>
				      		<button type="button" class="bt orderBtn" onclick="paymentLoad();">주문하기</button>
				      	</td>
				    </tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
	$(function(){
		$(".bannerTitle").html("장바구니");
		
		//처음 불러올때 금액 콤마로 구분
		$(".comma").each(function(){
			$(this).html(commaSet($(this).html()));
		});
		
		//처음에 체크박스 전체 선택
		$("input[name=allChk]").prop("checked",true);
		$(".oneChk").each(function(){
			$(this).prop("checked",true);
		});
		
		//처음에 총결제금액 보여주기
		changeTotalPrice();
	});
	
	//체크박스 선택
	$(document).on("click","input[name=allChk]", function(){
		if($(this).is(":checked")){
			$(".oneChk").each(function(){
				$(this).prop("checked",true);
			});
		}else{
			$(".oneChk").each(function(){
				$(this).prop("checked",false);
			});
		}
		changeTotalPrice();//총결제금액 변경 전체선택이던아니던 동작
	});
	$(document).on("click",".oneChk", function(){
		var chk = 0;
		$(".oneChk").each(function(){
			if(!$(this).is(":checked")){
				$("input[name=allChk]").prop("checked",false);
				chk = 1;
				return false;
			}
		});
		if(chk==0){
			$("input[name=allChk]").prop("checked",true);
		}
		changeTotalPrice();//총결제금액 변경 전체선택이던아니던 동작
	})
	
	//플러스 마이너스 버튼
	function plusMinusBtn(btnType,basNo,gdsPri,chk){
		//마이너스버튼을 눌렀는지 플러스버튼을 눌렀는지 체크
		var basCnt = null;
		if(chk==0){
			basCnt = $(btnType).next().html();
		}else{
			basCnt = $(btnType).prev().html();
		}
		if((basCnt>1 || chk==1) && (basCnt<99 || chk==0)){
			$.ajax({
				url:"/client/basketPlusMinusUpdate.sool",
				data: {basNo:basNo,
					chk:chk	
				},
				type:"post",
				success:function(data){
					if(data==0){//update가 정상이면 상품개수 1개 감소
						$(btnType).next().html(--basCnt);
						$(btnType).parent().parent().next().children(".eachPrice").html(commaSet(gdsPri*basCnt));
					}else{
						$(btnType).prev().html(++basCnt);
						$(btnType).parent().parent().next().children(".eachPrice").html(commaSet(gdsPri*basCnt));
					}
					changeTotalPrice();//결제예정금액 변경해줌
				}
			})
		}else if(basCnt<=1){
			alert("최소 1개 이상 구매가 가능합니다");
		}else if(basCnt>=99){
			alert("최대 99개까지 구매가 가능합니다");
		}
	}
	
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
	
	//장바구니 상품삭제
	$(document).on("click",".goodsRemove",function(){
		var chk = 0;
		var basNoStr = "";
		$(".oneChk").each(function(){
			if($(this).is(":checked")){
				basNoStr += $(this).attr("id")+",";//여러개선택시,를 기준으로 구분한 문자열로 한번에 전달
				chk = 1;
			}
		});
		if(chk==0){
			alert("상품을 선택해주세요");	
		}else {
			if(confirm("선택된 상품을 삭제하시겠습니까?")){
				location.href="/client/basketDelete.sool?basNoStr="+basNoStr;//선택한 상품만 삭제하기위해 basNoStr전달
			}
		}
	});
	
	
	//개수추가나 삭제로 결제 금액이 바뀔때마다 다시 처리
	//$(document).on("change",".eachPrice",changeTotalPrice);
	
	//상품금액 및 배송비 계산
	function changeTotalPrice(){
		var goodsPrice = 0;
		var deliPay = 0;
		$(".eachGoodsPrice").each(function(){
			if($(this).parent().prev().prev().children().is(":checked")){	//체크되어있을때만 금액을 더함
				goodsPrice += Number(commaReset($(this).html()));
				deliPay += 2500;	//배송비 미구현으로 2500원 고정
			}
		});
		$(".goodsPrice").html(commaSet(goodsPrice));
		$(".deliPay").html(commaSet(deliPay));
		
		$(".totalPrice").html(commaSet(goodsPrice+deliPay));
	}
	
	//주문/결제 페이지 호출
	function paymentLoad(){
		var temp = 0;//선택한 상품이있는지 없는지 체크
		var basNoStr = '';
		$(".oneChk").each(function(){
			if($(this).is(":checked")){//선택한 상품의 gdsNo을 String으로 한문장으로 주문페이지로 전달
				temp = 1;
				basNoStr += $(this).attr("id")+",";
			}
		});
		if(temp!=1){
			alert("주문할 상품을 선택해주세요");
		}else{
			console.log(basNoStr);
			location.href='/client/paymentShow.sool?basNoStr='+basNoStr;
		}
		
	}
	
	
</script>

</body>
</html>