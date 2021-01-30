<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 리뷰</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/client/mypageFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mReview.css">

<div class="wrap2">
	<div class="sideNavi"></div>
	<div class="content">
		<div class="mainContent">
			<div class="listDiv">
				<table class="listTable">
					<tr>
						<th class="th1">번호</th>
						<th class="th2">구분</th>
						<th class="th3">리뷰 내용</th>
						<th class="th4">작성일자</th>
					</tr>
					<c:choose>
						<c:when test="${fn:length(rList) eq 0}">
							<tr>
								<td colspan="4">
									<br><br><br>
									<h4>지난 ${period }개월 동안 작성한 리뷰가 없습니다.</h4>
									<br><br><br>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${rList }" var="re">
								<tr>
									<td>
										<p>${re.reviewNo }</p>
									</td>
									<td>
										<c:if test="${re.goodNo!=0 }">
											<p>상품</p>
										</c:if>
										<c:if test="${re.fundNo!=0 }">
											<p>펀딩</p>
										</c:if>
									</td>
									<td>
										<c:if test="${re.goodNo!=0 }">
											<a href="/client/oGoodsDetail.sool?gdsNo=${re.goodNo }">
												<p>${re.commentContent }</p>
											</a>
										</c:if>
										<c:if test="${re.fundNo!=0 }">
											<a href="/client/oFundingDetail.sool?fundNo=${re.fundNo }">
												<p>${re.commentContent }</p>
											</a>
										</c:if>
									</td>
									<td>
										<p>${re.reviewDate }</p>
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
<script>
	//사이드바 호버
	$(".sideNaviA").hover(function(){
		if(!$(this).is(".a5")){
			$(".a5").css("background-color","white");
			$(".a5").css("color","black");
		}
	},function(){
		$(".a5").css("background-color","rgb(77, 80, 117)");
		$(".a5").css("color","white");
	});
	
	$(function(){
		$(".subTitle").html("리뷰 내역");
		$(".giftSel").remove();//선물함 선택 안보이게
		//조회기간별 조회(1,3,6,12개월)
		$(".searchA").eq(0).attr("href","/client/mReview.sool?reqPage=1&period=1");
		$(".searchA").eq(1).attr("href","/client/mReview.sool?reqPage=1&period=3");
		$(".searchA").eq(2).attr("href","/client/mReview.sool?reqPage=1&period=6");
		$(".searchA").eq(3).attr("href","/client/mReview.sool?reqPage=1&period=12");
		$(".searchA").each(function(){
			console.log($(this).attr("id"));
			console.log("m${period}");
			if($(this).attr("id")==("m${period}")){
				
				$(this).addClass("sA1");
			}
		});
	})
	
	
</script>
</body>

</html>