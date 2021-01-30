<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약한 클래스</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/client/mypageFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mExperience.css">
<div class="wrap2">
	<div class="sideNavi"></div>
	<div class="content">
		<div class="mainContent">
			<div class="listDiv">
				<table class="listTable">
					<tr>
						<th class="th1">예약번호/결제일자</th>
						<th class="th2">클래스 정보</th>
						<th class="th3">담당자</th>
						<th class="th4">체험일자</th>
						<th class="th5">예약관리</th>
					</tr>
					<c:choose>
						<c:when test="${eList=='[]'}">
							<tr>
								<td colspan="5">
									<br><br><br>
									<p>지난 ${period }개월 동안 예약한 클래스가 없습니다.</p>
									<br><br><br>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${eList}" var="eld" >
								<tr>
									<td>
										<p class="clsLNo">${eld.clsLNo }</p>
										<p>${eld.classPayment }</p>
									</td>
									<td>
										<p>${eld.clsName }</p>
										<p class="indent">인원 : ${eld.classPerson }</p>
										<p class="indent">가격 : <span class="comma">${eld.clsPrice }</span></p>
									</td>
									<td>
										<p>${eld.selName }</p>
										<p>${eld.selTel }</p>
									</td>
									<td>
										<p>${eld.classEnroll }</p>
										<p>${eld.classStartTime }</p>
									</td>
									<td>
										<c:choose>
											<c:when test="${eld.classCheck==0}">
												<p>예약완료</p>
												<button type="button" class="btn btn-outline-secondary btn-sm cancelBtn">취소신청</button>
											</c:when>
											<c:when test="${eld.classCheck==2 }">
												<p>취소완료</p>
											</c:when>
											<c:when test="${eld.classCheck==3 }"><!-- 체험날짜가 지나면 자정에 자동으로 업데이트됨 -->
												<p>체험완료</p>
											</c:when>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5" style="text-align: center;" id="pageNavi">${pageNavi }</td>
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
		if(!$(this).is(".a2")){
			$(".a2").css("background-color","white");
			$(".a2").css("color","black");
		}
	},function(){
		$(".a2").css("background-color","rgb(77, 80, 117)");
		$(".a2").css("color","white");
	});
	
	$(function(){
		$(".subTitle").html("예약 내역");
		$(".giftSel").remove();//선물함 선택 안보이게
		//조회기간별 조회(1,3,6,12개월)
		$(".searchA").eq(0).attr("href","/client/mExperience.sool?reqPage=1&period=1");
		$(".searchA").eq(1).attr("href","/client/mExperience.sool?reqPage=1&period=3");
		$(".searchA").eq(2).attr("href","/client/mExperience.sool?reqPage=1&period=6");
		$(".searchA").eq(3).attr("href","/client/mExperience.sool?reqPage=1&period=12");
		$(".searchA").each(function(){
			console.log($(this).attr("id"));
			console.log("m${period}");
			if($(this).attr("id")==("m${period}")){
				
				$(this).addClass("sA1");
			}
		});
	})
	
	$(".cancelBtn").click(function(){
		if(confirm("취소신청 하시겠습니까?\n판매자가 취소승인이후 환불이 진행됩니다.")){
			var clsLNo = $(this).parent().parent().find(".clsLNo").html();
			location.href="/client/classCancel.sool?clsLNo="+clsLNo+"&reqPage="+${reqPage}+"&period="+${period};
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