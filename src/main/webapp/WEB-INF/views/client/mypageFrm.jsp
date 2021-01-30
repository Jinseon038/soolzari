<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mypageFrm.css">

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="wrap2" style="margin-top: 80px;">
		<div class="sideNavi">
			<ul class="sideNaviUl">
				<a class="sideNaviTop" href="/client/mOrderList.sool?reqPage=1&period=1">마이페이지</a>
				<li><a class="sideNaviA a1" href="/client/mOrderList.sool?reqPage=1&period=1">주문 내역</a></li>
				<li><a class="sideNaviA a2" href="/client/mExperience.sool?reqPage=1&period=1">예약한 클래스</a></li>
				<li><a class="sideNaviA a3" href="/client/mFunding.sool?reqPage=1&period=1">후원한 펀딩</a></li>
				<li><a class="sideNaviA a5" href="/client/mReview.sool?reqPage=1&period=1">내가 쓴 리뷰</a></li>
				<li><a class="sideNaviA a6" href="/client/mQuestion.sool?reqPage=1&period=1">1:1 문의</a></li>
				<li><a class="sideNaviA a7" href="/client/mchkPw.sool">내 정보 수정</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="banner">
				<h3><a class="bannerTitle" href="#">마이페이지</a></h3>
			</div>
			<div class="topContent"><!-- 구독상품/포인트/쿠폰 -->
				<h5 class="topUser contentTitle">${sessionScope.sessionClient.clientName }<span>님 환영합니다.</span></h5>
				<hr>
				<div class="fixContent">
					<div class="subscribeDiv">
						<p class="fixT">구독상품</p>
						<c:choose>
							<c:when test="${sessionScope.sessionClient.clientRank==0 }">
								<div class="fixC nonSubcribe"><!-- 구독하지않은 사용자일경우 -->
									<p>현재 구독중인 상품이 없습니다.</p>
									<p class="subGo"><a href="/subscribe.sool">구독하러 가기 ></a><p>
								</div>
							</c:when>
							<c:otherwise>
								<div class="fixC Subscribing"><!-- 구독중일경우 -->
									<p>[ ${sub.subscribeName } ] 상품을 구독중입니다!</p>
									<p> - 구성 : ${sub.subscribeDept } </p>
									<p class="mid"> - 가격 : <span class="comma">${sub.subscribePrice }</span> </p><p class="mid" style="text-align: right; margin-right: 50px;"><a href="/client/subscribeUpdate.sool">구독 취소하기></a></p>
									
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="pointDiv">
						<p class="fixT">포인트</p>
						<p class="fixC userPoint comma">${sessionScope.sessionClient.clientPoint} <span>P</span></p>
					</div>
				</div>
			</div>
			
			<div class="mainContent"><!-- 주문내역,예약,펀딩 등등 -->
				<div class="searchWrap">
					<h5 class="contentTitle subTitle">주문 내역</h5><!-- 사이브네비 클릭할때 값가져와서 넣기 -->
					<hr class="hrMargin">
					<!-- 내 선물함이 아니면 안보이게 -->
					<!-- <div class="giftSel">
						<a href="#">받은 선물함</a><a href="#">보낸 선물함</a>
					</div> -->
					
					<div class="searchDiv">
						<div class="searchName sd">
						조회기간
						</div>
						<div class="searchADiv sd">
							<a class="searchA" id="m1" href="#">1개월</a>
							<a class="searchA" id="m3" href="#">3개월</a>
							<a class="searchA" id="m6" href="#">6개월</a>
							<a class="searchA" id="m12" href="#">1년</a>
						</div><!-- 
						<div class="searchDateDiv sd">
							<input type="date" name="startDate" style="line-height: 20px;"> ~ <input type="date" name="endDate" style="line-height: 20px;"> 
							<button class="searchBtn" type="button" style="line-height: 20px;">조회</button>
						</div> -->
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</body>
<script>
$(function(){
	//가격에 콤마
	$(".comma").each(function(){
		$(this).html(commaSet($(this).html()));
	})
})
//금액단위 콤마 구분
function commaSet(price) {
	var str = String(price);
	let price1 = str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	return price1;
}

</script>
</html>