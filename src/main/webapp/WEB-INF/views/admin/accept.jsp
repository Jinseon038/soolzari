<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인 페이지</title>
<link href="/resources/css/accept.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/navi.jsp"/>
	<section>
        <h1 class="accepttitle">승인 관리</h1>
        <div class="navi">
            <ul>
                <li><a href="javascript:void(0)">상품</a></li>
                <li><a href="javascript:void(0)">펀딩</a></li>
                <li><a href="javascript:void(0)">클래스</a></li>
            </ul>
        </div>
        <div class="mid">
        	<form action="/searchAccept.sool" method="post">
            	<table class="searchbox">
	                <tr>
	                    <th>기간</th>
	                    <td><input type="date" name="startDate"> ~ <input type="date" name="endDate"></td>
	                </tr>
	                <tr>
	                	<c:choose>
	                		<c:when test="${type eq 1 }">
	                			<th>상품명</th>
	                		</c:when>
	                		<c:when test="${type eq 2 }">
	                			<th>펀딩 이름</th>
	                		</c:when>
	                		<c:when test="${type eq 3 }">
	                			<th>클래스명</th>
	                		</c:when>
	                	</c:choose>
	                    <td>
	                    	<input type="hidden" name="type" value="${type }">
	                    	<input type="hidden" name="reqPage" value=1>
	                        <input type="text" name="search">
	                        <button type="submit">검색</button>
	                    </td>
	                </tr>
            	</table>
            </form>
            <div>
                <button id="allac">모두 승인</button>
                <button id="allre">모두 거절</button>
            </div>
            <c:choose>
	            <c:when test="${type eq 1 }">
		            <table class="goods">
		                <tr>
		                    <th>선택</th>
		                    <th>상품명</th>
		                    <th>판매자</th>
		                    <th>가격</th>
		                    <th>신청일</th>
		                    <th colspan="2">승인</th>
		                </tr>
		                <c:forEach items="${list }" var="a">
		                	<tr>
			                    <td><input type="checkbox" name="chk"></td>
			                    <td>${a.acceptName }</td>
			                    <td>${a.seller }</td>
			                    <td>${a.acceptPrice }</td>
			                    <td>${a.acceptDate }</td>
			                    <input type="hidden" value="${a.acceptNo }">
			                    <td>
			                        <button class="accept">승인</button>
			                        <button class="reject">거절</button>
			                    </td>
			                </tr>
		                </c:forEach>
		            </table>
	            </c:when>
	            <c:when test="${type eq 2 }">
		            <table class="funding">
		                <tr>
		                    <th>선택</th>
		                    <th>펀딩 이름</th>
		                    <th>신청자</th>
		                    <th>펀딩 설명</th>
		                    <th>펀딩 상품</th>
		                    <th>목표 금액</th>
		                    <th>신청일</th>
		                    <th colspan="2">승인</th>
		                </tr>
		                <c:forEach items="${list }" var="a">
		                	<tr>
			                    <td><input type="checkbox" name="chk"></td>
			                    <td>${a.acceptName }</td>
			                    <td>${a.seller }</td>
			                    <td>${a.acceptDet }</td>
			                    <td>
			                    	<c:forEach items="${a.fundingGoods }" var="f" varStatus="i">
			                    		<c:out value="${i.count }"/> - ${f.fndGName }<br>
			                    	</c:forEach>
			                    </td>
			                    <td>${a.acceptPrice }</td>
			                    <td>${a.acceptDate }</td>
			                    <input type="hidden" value="${a.acceptNo }">
			                    <td>
			                        <button class="accept">승인</button>
			                        <button class="reject">거절</button>
			                    </td>
			                </tr>
		                </c:forEach>
		            </table>
	            </c:when>
	            <c:when test="${type eq 3 }">
		            <table class="class">
		                <tr>
		                    <th>선택</th>
		                    <th>클래스명</th>
		                    <th>개설자</th>
		                    <th>클래스 설명</th>
		                    <th>참가비</th>
		                    <th>신청일</th>
		                    <th colspan="2">승인</th>
		                </tr>
		                <c:forEach items="${list }" var="a">
		                	<tr>
			                    <td><input type="checkbox" name="chk"></td>
			                    <td>${a.acceptName }</td>
			                    <td>${a.seller }</td>
			                    <td>${a.acceptDet }</td>
			                    <td>${a.acceptPrice }</td>
			                    <td>${a.acceptDate }</td>
			                    <input type="hidden" value="${a.acceptNo }">
			                    <td>
			                        <button class="accept">승인</button>
			                        <button class="reject">거절</button>
			                    </td>
			                </tr>
		                </c:forEach>
		            </table>
	            </c:when>
            </c:choose>
            <div>
                <button id="partac">선택 승인</button>
                <button id="partre">선택 거절</button>
            </div>
            <div class="page">
            	${page }
            </div>
        </div>
    </section>
    
    <script>
    	var type = ${type};
        $(function(){
            $("[type=date]").val(new Date().toISOString().substring(0, 10));
            $(".navi a").click(function(){
                var index = $(".navi a").index(this);
                location.href="/accept.sool?type="+(index+1)+"&reqPage=1";
            });
            $(".navi a").eq(type-1).addClass('select');
            $("#allac").click(function(event){//모두 승인
            	var inputs = $("[type=checkbox]");
            	if(inputs.length == 0){
            		event.preventDefault();
            	}else{
            		location.href="/acceptAll.sool?type="+type;
            	}
            });
            $("#allre").click(function(event){//모두 거절
            	var inputs = $("[type=checkbox]");
            	if(inputs.length == 0){
            		event.preventDefault();
            	}else{
            		location.href="/rejectAll.sool?type="+type;
            	}
            });
            $("#partac").click(function(){//선택 승인
            	var inputs = $("[type=checkbox]:checked");
            	if(inputs.length == 0){
            		alert("선택해주세요");
            	}else{
            		var acceptNo = new Array();
                	inputs.each(function(index, item){
                		acceptNo.push($(item).parent().parent().find("[type=hidden]").val());
                	});
                	location.href="/acceptPart.sool?type="+type+"&acceptNo="+acceptNo.join("/");
            	}
            });
            $("#partre").click(function(){//선택 거절
            	var inputs = $("[type=checkbox]:checked");
            	if(inputs.length != 0){
            		var acceptNo = new Array();
                	inputs.each(function(index, item){
                		acceptNo.push($(item).parent().parent().find("[type=hidden]").val());
                	});
                	location.href="/rejectPart.sool?type="+type+"&acceptNo="+acceptNo.join("/");
            	}else{
            		alert("선택해주세요");
            	}
            });
            $(".accept").click(function(){
            	var acceptNo = $(this).parent().prev().val();
            	location.href="/acceptOne.sool?type="+type+"&acceptNo="+acceptNo;
            });
            $(".reject").click(function(){
            	var acceptNo = $(this).parent().prev().val();
            	location.href="/rejectOne.sool?type="+type+"&acceptNo="+acceptNo;
            });
            $("[type=submit]").click(function(event){
            	if($("[name=search]").val() == ""){
            		alert("검색어를 입력해주세요");
            		event.preventDefault();
            	}
            });
        });
    </script>
</body>
</html>