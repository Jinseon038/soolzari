<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/client/mypageFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mOrderList.css">

<div class="wrap2">
	<div class="sideNavi"></div>
	<div class="content">
		<div class="mainContent">
			<div>
				<span style="color: lightgray">*총 결제 금액은 포인트사용 후 금액입니다.</span>
			</div>
			<div class="listDiv">
				<table class="listTable">
					<tr>
						<th class="th1">주문번호/주문일자</th>
						<th class="th2">상품 정보</th>
						<th class="th3">총 결제 금액</th>
						<th class="th4">배송관리</th>
					</tr>
					<c:choose>
					<c:when test="${fn:length(pList) eq 0}">
						<tr>
							<td colspan="4">
								<br><br><br>
								<h4>지난 ${period }개월 동안 구매한 내역이 없습니다.</h4>
								<br><br><br>
							</td>
						</tr>
					</c:when>
					<c:otherwise>					
					<c:forEach items="${pList }" var="purchase">
						<c:set var="count" value="0"/>														
							<c:choose>								
								<c:when test="${count == 0 }">
									<c:forEach items="${olDataList }" var="olData" varStatus="i">
									<c:if test="${purchase.purNo eq olData.purNo}">
										<c:choose>
											<c:when test="${i.index == 0 or count == 0}">
												<tr class="rowSpan">
													<td>
														<span class="gdsLNo" style="display: none;">${olData.gdsLNo }</span><!-- 배송관리 update할때전달해줄값 -->
														<p class="purNo">${purchase.purNo }</p>
														<p>${purchase.purDate }</p>
													</td>
													<td>
														<c:choose>
															<c:when test="${olData.gdsDStatus==5}"><!-- 수취확인완료됐을때만 리뷰쓸수있는 페이지로 안내 -->
																<a href="/client/oGoodsDetail.sool?gdsNo=${olData.gdsNo }">
																	<p>${olData.gdsName }</p>
																	<p class="indent">개수 : ${olData.gdsLCnt }</p>
																	<p class="indent">가격 : <span class="comma">${olData.gdsLPrice}</span>*${olData.gdsLCnt }=<span class="comma">${olData.gdsLPrice*olData.gdsLCnt }</span></p>
																	<p class="indent">배송지 : ${purchase.purGet }</p>
																</a>
															</c:when>
															<c:otherwise>
																<a href="/client/oGoodsDetail1.sool?gdsNo=${olData.gdsNo }">
																	<p>${olData.gdsName }</p>
																	<p class="indent">개수 : ${olData.gdsLCnt }</p>
																	<p class="indent">가격 : <span class="comma">${olData.gdsLPrice}</span>*${olData.gdsLCnt }=<span class="comma">${olData.gdsLPrice*olData.gdsLCnt }</span></p>
																	<p class="indent">배송지 : ${purchase.purGet }</p>
																</a>
															</c:otherwise>
														</c:choose>
														
													</td>
													<td>
														<p><span class="comma">${purchase.purTtp }</span></p>
														<c:choose>
															<c:when test="${olData.gdsDStatus==0}">
																<button type="button" class="btn btn-outline-secondary btn-sm cancelBtn">취소신청</button>
															</c:when>
															<c:when test="${olData.gdsDStatus==2}">
																<p>취소완료</p>
															</c:when>
														</c:choose>
													</td>
													<td>
														<c:if test="${olData.gdsDStatus==0}">
															<p>결제완료</p>
														</c:if>
														<c:if test="${olData.gdsDStatus==2}">
															<p>-</p>
														</c:if>
														<c:if test="${olData.gdsDStatus==3}">
															<p>배송중</p>
														</c:if>
														<c:if test="${olData.gdsDStatus==4}">
															<p>배송완료</p>
															<button type="button" class="btn btn-outline-secondary btn-sm completeBtn">수취확인</button>
														</c:if>
														<c:if test="${olData.gdsDStatus==5}">
															<p>수취확인완료</p>
															<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='/client/oGoodsDetail.sool?gdsNo=${olData.gdsNo }'">리뷰쓰기</button>
														</c:if>
													</td>
												</tr>
												<c:set var="count" value="1"/>
											</c:when>
											<c:otherwise>
												<tr>
													<td>
														<span class="gdsLNo" style="display: none;">${olData.gdsLNo }</span><!-- 배송관리 update할때전달해줄값 -->
														<p class="purNo">${purchase.purNo }</p> / ${count }
														<p>${purchase.purDate }</p>
													</td>
													<td>
														<c:choose>
															<c:when test="${olData.gdsDStatus==5}"><!-- 수취확인완료됐을때만 리뷰쓸수있는 페이지로 안내 -->
																<a href="/client/oGoodsDetail.sool?gdsNo=${olData.gdsNo }">
																	<p>${olData.gdsName }</p>
																	<p class="indent">개수 : ${olData.gdsLCnt }</p>
																	<p class="indent">가격 : <span class="comma">${olData.gdsLPrice}</span>*${olData.gdsLCnt }=<span class="comma">${olData.gdsLPrice*olData.gdsLCnt }</span></p>
																	<p class="indent">배송지 : ${purchase.purGet }</p>
																</a>
															</c:when>
															<c:otherwise>
																<a href="/client/oGoodsDetail1.sool?gdsNo=${olData.gdsNo }">
																	<p>${olData.gdsName }</p>
																	<p class="indent">개수 : ${olData.gdsLCnt }</p>
																	<p class="indent">가격 : <span class="comma">${olData.gdsLPrice}</span>*${olData.gdsLCnt }=<span class="comma">${olData.gdsLPrice*olData.gdsLCnt }</span></p>
																	<p class="indent">배송지 : ${purchase.purGet }</p>
																</a>
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<p><span class="comma">${purchase.purTtp }</span></p>
														<c:choose>
															<c:when test="${olData.gdsDStatus==0}">
																<button type="button" class="btn btn-outline-secondary btn-sm cancelBtn">취소신청</button>
															</c:when>
															<c:when test="${olData.gdsDStatus==2}">
																<p>취소완료</p>
															</c:when>
														</c:choose>
													</td>
													<td>
														<c:if test="${olData.gdsDStatus==0}">
															<p>결제완료</p>
														</c:if>
														<c:if test="${olData.gdsDStatus==2}">
															<p>-</p>
														</c:if>
														<c:if test="${olData.gdsDStatus==3}">
															<p>배송중</p>
														</c:if>
														<c:if test="${olData.gdsDStatus==4}">
															<p>배송완료</p>
															<button type="button" class="btn btn-outline-secondary btn-sm completeBtn">수취확인</button>
														</c:if>
														<c:if test="${olData.gdsDStatus==5}">
															<p>수취확인완료</p>
															<button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='/client/oGoodsDetail.sool?gdsNo=${olData.gdsNo }'">리뷰쓰기</button>
														</c:if>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>		
									</c:if>		
									</c:forEach>						
								</c:when>								
							</c:choose>			
					</c:forEach>
					
					</c:otherwise>
					</c:choose>
					<tr>
						
					</tr>
				</table>
				<br>
				<div style="text-align: center;" id="pageNavi">${pageNavi }</div>
			</div>
			<%-- <div class="listDiv">
				<table class="listTable">
					<tr>
						<th class="th1">주문번호/주문일자</th>
						<th class="th2">상품 정보</th>
						<th class="th3">총 결제 금액</th>
						<th class="th4">배송관리</th>
					</tr>
					<c:choose>
					<c:when test="${fn:length(pList) eq 0}">
						<tr>
							<td colspan="4">
								<br><br><br>
								<h4>지난 ${period }개월 동안 구매한 내역이 없습니다.</h4>
								<br><br><br>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
					<c:forEach items="${pList }" var="purchase" varStatus="status">
						<c:forEach items="${olDataList }" var="olData">
						<c:if test="${purchase.purNo eq olData.purNo}">
						<tr>
							<td class="rowSpan">
								<span class="gdsLNo" style="display: none;">${olData.gdsLNo }</span><!-- 배송관리 update할때전달해줄값 -->
								<p class="purNo">${purchase.purNo }</p>
								<p>${purchase.purDate }</p>
							</td>
							<td>
								<p>${olData.gdsName }</p>
								<p class="indent">개수 : ${olData.gdsLCnt }</p>
								<p class="indent">가격 : <span class="comma">${olData.gdsLPrice}</span>*${olData.gdsLCnt }=<span class="comma">${olData.gdsLPrice*olData.gdsLCnt }</span></p>
								<p class="indent">배송지 : ${purchase.purGet }</p>
							</td>
							<td>
								<p><span class="comma">${purchase.purTtp }</span></p>
							</td>
							<td>
								<c:if test="${olData.gdsDStatus==0}">
									<p>결제완료</p>
									<button type="button" class="btn btn-outline-secondary btn-sm cancelBtn">취소신청</button>
								</c:if>
								<c:if test="${olData.gdsDStatus==2}">
									<p>취소완료</p>
								</c:if>
								<c:if test="${olData.gdsDStatus==3}">
									<p>배송중</p>
								</c:if>
								<c:if test="${olData.gdsDStatus==4}">
									<p>배송완료</p>
									<button type="button" class="btn btn-outline-secondary btn-sm completeBtn">수취확인</button>
								</c:if>
								<c:if test="${olData.gdsDStatus==5}">
									<p>수취확인완료</p>
								</c:if>
							</td>
						</tr>
						</c:if>
						</c:forEach>
					</c:forEach>
					<tr>
						<td colspan="4" style="text-align: center;" id="pageNavi">${pageNavi }</td>
					</tr>
					</c:otherwise>
					</c:choose>
				</table>
			</div> --%>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	//사이드바 호버
	$(".sideNaviA").hover(function(){
		if(!$(this).is(".a1")){
			$(".a1").css("background-color","white");
			$(".a1").css("color","black");
		}
	},function(){
		$(".a1").css("background-color","rgb(77, 80, 117)");
		$(".a1").css("color","white");
	});
	
	
	$(function(){
		$(".giftSel").remove();//선물함 선택 안보이게
		//조회기간별 조회(1,3,6,12개월)
		$(".searchA").eq(0).attr("href","/client/mOrderList.sool?reqPage=1&period=1");
		$(".searchA").eq(1).attr("href","/client/mOrderList.sool?reqPage=1&period=3");
		$(".searchA").eq(2).attr("href","/client/mOrderList.sool?reqPage=1&period=6");
		$(".searchA").eq(3).attr("href","/client/mOrderList.sool?reqPage=1&period=12");
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
	});
	
	//취소신청
	$(".cancelBtn").click(function(){
		if(confirm("취소신청 하시겠습니까?\n판매자가 취소승인이후 환불이 진행됩니다.\n이미 배송이 진행됐을 경우 환불이 불가능할 수 있습니다.")){
			var gdsLNo = $(this).parent().parent().find(".gdsLNo").html();
			var purNo = $(this).parent().parent().find(".purNo").html();
			location.href="/client/orderDeliveryStatus.sool?purNo="+purNo+"&gdsLNo="+gdsLNo+"&deliveryStatus="+2+"&reqPage="+${reqPage}+"&period="+${period};
		}
	})
	//수취확인
	$(".completeBtn").click(function(){
		if(confirm("상품을 확인하셨습니까?\n수취확인이후 환불이 불가능합니다.")){
			var gdsLNo = $(this).parent().parent().find(".gdsLNo").html();
			var purNo = $(this).parent().parent().find(".purNo").html();
			location.href="/client/orderDeliveryStatus.sool?purNo="+purNo+"&gdsLNo="+gdsLNo+"&deliveryStatus="+5+"&reqPage="+${reqPage}+"&period="+${period};
		}
	})
	
	//금액단위 콤마 구분
	function commaSet(price) {
		var str = String(price);
		let price1 = str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return price1;
	}
	
	
	
	//주문번호가 같으면 rowspan으로 행합치게
	$(function(){
		var arr = $(".rowSpan");
		arr.each(function(idx,item){
			var arr2 = $(item).nextUntil(".rowSpan");
			$(item).children().eq(0).attr("rowspan",arr2.length+1);
			$(item).children().eq(2).attr("rowspan",arr2.length+1);
			arr2.each(function(index,item2){
				$(item2).children().eq(0).hide();
				$(item2).children().eq(2).hide();
			});
		});
		$("tr").last().children().show();
	}); 
	
	
	//리뷰 줄 수 제한
	$("textarea[name=qnaCon]").keyup(function(){
		 var rows = $(this).val().split('\n').length;
	        var maxRows = 5;
	        if( rows > maxRows){
	            modifiedText = $(this).val().split("\n").slice(0, maxRows);
	            $(this).val(modifiedText.join("\n"));
	        }
	});
	
	
	
</script>
</html>