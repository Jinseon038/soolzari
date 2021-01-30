<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원한 펀딩</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/client/mypageFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mFunding.css">

<div class="wrap2">
	<div class="sideNavi"></div>
	<div class="content">
		<div class="mainContent">
			<div>
				<span style="color: lightgray">*결제 금액은 포인트사용 후 금액입니다.</span>
			</div>
			<div class="listDiv">
				<table class="listTable">
					<tr>
						<th class="th1">예약번호/예약일자</th>
						<th class="th2">펀딩 정보</th>
						<th class="th3">결제 금액/일자</th>
						<th class="th4">후원관리</th>
					</tr>
					<c:choose>
					<c:when test="${fn:length(list) eq 0}">
						<tr>
							<td colspan="4">
								<br><br><br>
								<h4>지난 ${period }개월 동안 후원한 내역이 없습니다.</h4>
								<br><br><br>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="fund">
							<tr>
								<td>
									<p class="fndDNo">${fund.fndDNo }</p>
									<p>${fund.fndDReserdate }</p>
								</td>
								<td>
									<c:choose>
										<c:when test="${fund.fndDStatus==5}">
											<a class="linkGo" href="/client/oFundingDetail.sool?fundNo=${fund.fundNo }">
												<p><h6><span>${fund.fundName }</span></h6></p>
												<%-- <p>상세 : <span>${fund.fundDet }</span></p> --%>
												<p class="indent">후원한 상품 : <span>${fund.fndGName }</span></p>
												<p class="indent">상품 구성 : <span>${fund.fndGCon }</span></p>
												<p class="indent">가격 : <span class="comma">${fund.fndGPri }</span></p>
												<p class="indent">추가 후원한 금액 : <span class="comma">${fund.fndDPrice-fund.fndGPri }</span></p>
												<p class="indent textRight">총 후원 금액 : <span class="comma red">${fund.fndDPrice }</span></p>
											</a>
										</c:when>
										<c:otherwise>
											<a class="linkGo" href="/client/oFundingDetail1.sool?fundNo=${fund.fundNo }">
												<p><h6><span>${fund.fundName }</span></h6></p>
												<%-- <p>상세 : <span>${fund.fundDet }</span></p> --%>
												<p class="indent">후원한 상품 : <span>${fund.fndGName }</span></p>
												<p class="indent">상품 구성 : <span>${fund.fndGCon }</span></p>
												<p class="indent">가격 : <span class="comma">${fund.fndGPri }</span></p>
												<p class="indent">추가 후원한 금액 : <span class="comma">${fund.fndDPrice-fund.fndGPri }</span></p>
												<p class="indent textRight">총 후원 금액 : <span class="comma red">${fund.fndDPrice }</span></p>
											</a>
										</c:otherwise>
									</c:choose>
									
								</td>
								<td>
									<c:if test="${fund.fndDStatus<=1 || fund.fndDStatus>=6}">
										<p>-</p>
									</c:if>
									<c:if test="${1<fund.fndDStatus && fund.fndDStatus<=5}">
										<span class="comma">${fund.fndDTotalp }</span>원
										<p>${fund.fndDPaydate }</p>
									</c:if>
								</td>
								<td>
									<c:if test="${fund.fndDStatus==0 }">
										<p>후원예약중</p>
									</c:if>
									<c:if test="${fund.fndDStatus==1 }">
										<p>목표금액 달성</p>
										<button type="button" class="btn btn-outline-secondary btn-sm paymentBtn">결제하기</button>
									</c:if>
									<c:if test="${fund.fndDStatus==2 }">
										<p>결제완료</p>
									</c:if>
									<c:if test="${fund.fndDStatus==3 }">
										<p>배송중</p>
									</c:if>
									<c:if test="${fund.fndDStatus==4 }">
										<p>배송완료</p>
										<button type="button" class="btn btn-outline-secondary btn-sm completeBtn">수취확인</button>
									</c:if>
									<c:if test="${fund.fndDStatus==5 }">
										<p>수취확인<br>완료</p>
										<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='/client/oFundingDetail.sool?fundNo=${fund.fundNo }'">리뷰쓰기</button>
									</c:if>
									<c:if test="${fund.fndDStatus==6 }">
										<p>미결제취소</p><!-- 메일로 결제알림을 줬으나 일주일안에 결제하지 않은 경우 -->
									</c:if>
									<c:if test="${fund.fndDStatus==7 }">
										<p>펀딩목표<br>미달성취소</p>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					<tr>
						<td colspan="4" style="text-align: center;" id="pageNavi">${pageNavi }</td>
					</tr>
					</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	//사이드바 호버
	$(".sideNaviA").hover(function(){
		if(!$(this).is(".a3")){
			$(".a3").css("background-color","white");
			$(".a3").css("color","black");
		}
	},function(){
		$(".a3").css("background-color","rgb(77, 80, 117)");
		$(".a3").css("color","white");
	});
	
	//기간별 조회
	$(function(){
		$(".subTitle").html("펀딩 내역");
		$(".giftSel").remove();//선물함 선택 안보이게
		//조회기간별 조회(1,3,6,12개월)
		$(".searchA").eq(0).attr("href","/client/mFunding.sool?reqPage=1&period=1");
		$(".searchA").eq(1).attr("href","/client/mFunding.sool?reqPage=1&period=3");
		$(".searchA").eq(2).attr("href","/client/mFunding.sool?reqPage=1&period=6");
		$(".searchA").eq(3).attr("href","/client/mFunding.sool?reqPage=1&period=12");
		$(".searchA").each(function(){
			console.log($(this).attr("id"));
			console.log("m${period}");
			if($(this).attr("id")==("m${period}")){
				$(this).addClass("sA1");
			}
		});
		
		//가격에 콤마
		$(".comma").each(function(){
			$(this).html(commaSet($(this).html()));
		})
	})
	
	//결제페이지로 이동
	$(".paymentBtn").click(function(){
		var fndDNo = $(this).parent().prev().prev().prev().children(".fndDNo").html();
		location.href="/client/paymentFundingShow.sool?fndDNo="+fndDNo;
	});
	
	//수취확인
	$(".completeBtn").click(function(){
		if(confirm("상품을 확인하셨습니까?\n수취확인이후 환불이 불가능합니다.")){
			var fndDNo = $(this).parent().prev().prev().prev().find(".fndDNo").html();
			location.href="/client/fundDeliveryStatus.sool?fndDNo="+fndDNo+"&reqPage="+${reqPage}+"&period="+${period};
		}
	})
	
	
	//금액단위 콤마 구분
	function commaSet(price) {
		var str = String(price);
		let price1 = str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return price1;
	}
</script>
</html>