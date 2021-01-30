<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="/resources/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/navi.jsp"/>
	<section>
        <h1 class="usertitle">사용자 관리</h1>
        <div class="navi">
            <ul>
                <li><a href="javascript:void(0)">고객</a></li>
                <li><a href="javascript:void(0)">판매자</a></li>
            </ul>
        </div>
        <div class="mid">
        	<form action="/searchUser.sool" method="post">
            	<table class="searchbox">
	                <tr>
	                    <th>가입일</th>
	                    <td><input type="date" name="startDate"> ~ <input type="date" name="endDate"></td>
	                </tr>
	                <tr>
	                	<th>
	                		<select name="searchType">
	                			<c:choose>
		                    		<c:when test="${searchType eq 'name' }">
		                				<option value="id">아이디</option>
		                    			<option value="name" selected>이름</option>
		                			</c:when>
		                			<c:otherwise>
		                				<option value="id" selected>아이디</option>
		                    			<option value="name">이름</option>
		                			</c:otherwise>
	                			</c:choose>
	                    	</select>
	                	</th>
	                    <td>
	                    	<input type="hidden" name="type" value="${type }">
	                    	<input type="hidden" name="reqPage" value=1>
	                        <input type="text" name="search" value="${search }">
	                        <button type="submit">검색</button>
	                    </td>
	                </tr>
            	</table>
            </form>
            <a href="/user.sool?type=${type }&reqPage=1&order=1" class="order">가입일 최신순</a>
            <a href="/user.sool?type=${type }&reqPage=1&order=0" class="order">가입일 오래된 순</a>
            <c:choose>
	            <c:when test="${type eq 1 }">
		            <table class="client">
		                <tr>
		                    <th>선택</th>
		                    <th>고객 번호</th>
		                    <th>고객 아이디</th>
		                    <th>고객 이름</th>
		                    <th>고객 이메일</th>
		                    <th>고객 전화번호</th>
		                    <th>고객 주소</th>
		                    <th>가입일</th>
		                    <th>구독 등급</th>
		                    <th colspan="2">변경 / 탈퇴</th>
		                </tr>
		                <c:forEach items="${list }" var="u">
		                	<c:if test="${u.status != 10 }">
		                		<tr>
				                    <td><input type="checkbox" name="chk"></td>
				                    <td>${u.userNo }</td>
				                    <td>${u.userId }</td>
				                    <td>${u.userName }</td>
				                    <td>${u.userEmail }</td>
				                    <td>${u.userPhone }</td>
				                    <td>${u.userAddr }</td>
				                    <td id="enrollDate">${u.userEnroll }</td>
				                    <td>
				                        <select>
				                        	<c:choose>
				                        		<c:when test="${u.status == 0}">
				                        			<option value="0" selected>일반 회원</option>
						                        	<option value="1">구독 A</option>
						                        	<option value="2">구독 B</option>
				                        		</c:when>
				                        		<c:when test="${u.status == 1}">
				                        			<option value="0">일반 회원</option>
						                        	<option value="1" selected>구독 A</option>
						                        	<option value="2">구독 B</option>
				                        		</c:when>
				                        		<c:when test="${u.status == 2}">
				                        			<option value="0">일반 회원</option>
						                        	<option value="1">구독 A</option>
						                        	<option value="2" selected>구독 B</option>
				                        		</c:when>
				                        	</c:choose>
				                        </select>
				                    </td>
				                    <td>
				                        <button class="change">변경</button>
				                        <button class="delete">탈퇴</button>
				                    </td>
				                </tr>
		                	</c:if>
		                </c:forEach>
		            </table>
		            <div>
		                <button id="partch">선택 변경</button>
		                <button id="partde">선택 탈퇴</button>
		            </div>
	            </c:when>
	            <c:when test="${type eq 2 }">
		            <table class="seller">
		                <tr>
		                    <th>선택</th>
		                    <th>판매자 번호</th>
		                    <th>판매자 아이디</th>
		                    <th>판매자 이름</th>
		                    <th>판매자 전화번호</th>
		                    <th>판매자 주소</th>
		                    <th>가입일</th>
		                    <th>탈퇴</th>
		                </tr>
		                <c:forEach items="${list }" var="u">
		                	<tr>
			                    <td><input type="checkbox" name="chk"></td>
			                    <td>${u.userNo }</td>
			                    <td>${u.userId }</td>
			                    <td>${u.userName }</td>
			                    <td>${u.userPhone }</td>
			                    <td>${u.userAddr }</td>
			                    <td id="enrollDate">${u.userEnroll }</td>
			                    <td>
			                        <button class="delete">탈퇴</button>
			                    </td>
			                </tr>
		                </c:forEach>
		            </table>
		            <div>
		                <button id="partde">선택 탈퇴</button>
		            </div>
	            </c:when>
            </c:choose>
            <div class="page">
            	${page }
            </div>
        </div>
	</section>
	
	<script>
	var type = ${type};
    $(function(){
        $(".navi a").click(function(){
            var index = $(".navi a").index(this);
            location.href="/user.sool?type="+(index+1)+"&reqPage=1&order=1";
        });
        $(".navi a").eq(type-1).addClass('select');
        $("#partch").click(function(){//선택 변경
        	var inputs = $("[type=checkbox]:checked");
        	if(inputs.length == 0){
        		alert("선택해주세요");
        	}else{
        		var userNo = new Array();
        		var grade = new Array();
            	inputs.each(function(index, item){
            		userNo.push($(item).parent().next().html());
            		grade.push($(item).parent().parent().children().eq(8).find("select").val());
            	});
            	location.href="/changeAll.sool?type="+type+"&userNo="+userNo.join("/")+"&grade="+grade.join("/");
        	}
        });
        $("#partde").click(function(){//선택 탈퇴
        	var inputs = $("[type=checkbox]:checked");
        	if(inputs.length != 0){
        		if(confirm("탈퇴시키면 복구할 수 없습니다. 그럼에도 탈퇴시키겠습니까?")){
        			var userNo = new Array();
                	inputs.each(function(index, item){
                		userNo.push($(item).parent().next().html());
                	});
                	location.href="/deleteAll.sool?type="+type+"&userNo="+userNo.join("/");
        		}
        	}else{
        		alert("선택해주세요");
        	}
        });
        $(".change").click(function(){
        	var userNo = $(this).parent().parent().children().eq(1).html();
        	var grade = $(this).parent().parent().children().eq(8).find("select").val();
        	location.href="/changeOne.sool?type="+type+"&userNo="+userNo+"&grade="+grade;
        });
        $(".delete").click(function(){
        	if(confirm("탈퇴시키면 복구할 수 없습니다. 그럼에도 탈퇴시키겠습니까?")){
        		var userNo = $(this).parent().parent().children().eq(1).html();
            	location.href="/deleteOne.sool?type="+type+"&userNo="+userNo;
        	}
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