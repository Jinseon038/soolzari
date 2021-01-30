<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style>
	.wrapper{
		margin-top : 80px;
	}
	.searchId{
		width : 300px;
		height : 300px;
		border-top : 2px solid black;
		border-left : 1px solid #e7e7e7;
		border-right : 1px solid #e7e7e7;
		border-bottom : 1px solid #e7e7e7;
		text-align : center;
		margin : 0 auto;
	}
	button{
		width : 150px;
		height : 30px;
		font-size : 15px;
	}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
	<div class="searchId">
		<br><br><br><br>
		
		
		<c:choose>
		
		<c:when test="${result eq true}">
			<span>당신의 ID는 <span style="color:#bca0c9;">${id }</span></span> 입니다.
		</c:when>
		<c:otherwise>
			<span>해당 이름과 이메일에 해당하는 아이디가 없습니다.</span>
		</c:otherwise>
			</c:choose>
		<br><br><br><br>
		<button style="background :#4d5075; color:white; "onclick="window.close();">닫기</button>
		
	</div>
</div>
</body>
</html>