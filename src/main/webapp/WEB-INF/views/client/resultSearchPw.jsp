<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
             	       <link rel="stylesheet" href="/resources/css/resultPw.css">
    <script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
	<div class="searchPw">
		
		
		<h2>비밀번호 재설정</h2>
		<br><br><br>
		<c:choose>
		
		<c:when test="${result eq true}">
	
					<input type="hidden" name="userId" id="userId" value="${id }">
		<table class="searchPw-tbl">
			<tr>
				<td><input type="password" id="userPw" name="userPw" placeholder="재설정 할 비밀번호를 입력하세요"></td>
			</tr>
			
		</table><br><br>
		<button style="background :#4d5075; color:white;  type="button" class="setPw">비밀번호 재설정</button><br><br><br><br>
	


		</c:when>
		<c:otherwise>
			<span>해당 아이디와 이메일에 해당하는 비밀번호가 없습니다.</span>
		</c:otherwise>
			</c:choose>
		<br><br><br><br>

		
	</div>
</div>
</body>


</html>

<script>
	$(function(){
		
		$(".setPw").click(function(){
			var id=$("#userId").val();
			var pw=$("#userPw").val();
			console.log(id);
			console.log(pw);
			$.ajax({
				
				url:"setPw.sool",
				data:{
					userId:id,
					userPw:pw
				},
				success:function(data){
					alert("재설정이 완료되었습니다.");
					window.close();
				}
				
			})
		})
	
	})
</script>