<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
</head>
<body>
<jsp:include page="/views/client/orderFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/oSuccess.css">

<div class="wrap2">
	<div class="blankDiv">
		<div class="content">
			<div class="comment">
				<h2>결제가 <span style="color: red">완료</span>되었습니다.</h2>
			</div>
			<div class="mainContent">
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
								<th scope="row">주소</th>
								<td class="atd2"><p class="addr">${client.cliAddr }</p></td>
							</tr>
							<tr>
								<th scope="row">결제 금액</th>
								<td class="payTd"><p class="totalPrice">${pur.purTtp }${fd.fndDTotalp }</p> 원</td><!-- 결제완료페이지를 펀딩이랑 상품이랑 같이쓰고 있어서 이렇게 사용함 -->
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btnDiv">
				<button type="button" class="bt keepBtn" onclick="location.href='/'">쇼핑 계속하기</button>
				<button type="button" class="bt orderBtn" onclick="location.href='/client/mOrderList.sool?reqPage=1&period=1'">구매내역 확인</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
	$(function(){
		$(".bannerTitle").html("주문완료");
		
		$(document).on("change", "input[name=usePoint]", function(){
			$(".point").html($(this).val());
		});
		
		$(".totalPrice").html(commaSet($(".totalPrice").html()));
		
	});
	//금액단위 콤마 구분
	function commaSet(price) {
		var str = String(price);
		let price1 = str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return price1;
	}
</script>
</body>
</html>