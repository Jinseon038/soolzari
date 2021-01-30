<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="/resources/css/searchPw.css">
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
	<h2>비밀번호 재설정</h2>
	<br><br>
	<form action="/searchPw.sool" method="post" class="searchPw"><br><br>
		<table class="searchPw-tbl">
			<tr>
				<td><input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요"></td>
			</tr>
			<tr>
				<td><input type="text" id="useremail" name="useremail" placeholder="이메일을 입력하세요"></td>
			</tr>
		</table><br><br>
		<button style="background :#4d5075; color:white;  type="submit">비밀번호 재설정</button><br><br><br><br>
	</form>
</div>
</body>
</html>