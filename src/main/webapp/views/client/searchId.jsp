<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="/resources/css/searchId.css">
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
	<h2>아이디 찾기</h2>
	<br><br>
	<form action="/searchId.sool" method="post" class="searchId"><br><br>
		<table class="searchId-tbl">
			<tr>
				<td><input type="text" id="userName" name="userName" placeholder="이름을 입력하세요"></td>
			</tr>
			<tr>
				<td><input type="text" id="useremail" name="useremail" placeholder="이메일을 입력하세요"></td>
			</tr>
		</table><br><br>
		<button style="background :#4d5075; color:white;  type="submit">아이디 찾기</button><br><br><br><br>
	</form>
</div>
</body>
</html>