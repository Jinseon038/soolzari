<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="/resources/css/sellerLogin.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div class="login-box">
        <form action="/seller/loginCheck.sool" method="post">
            <h2 id="login-box-title">로그인하기</h2>
            <label for="selId">아이디</label><input type="text" id="selId" name="selId" value="" placeholder="아이디를 입력해주세요">
            <label for="selPw">비밀번호</label><input type="password" id="selPw" name="selPw" value="" placeholder="비밀번호">
            <button type="submit" name="button" class="submit-btn">로그인</button>
            <div class="loginNot">
                <span>본 페이지는 판매자 전용입니다<br>일반 사용자는 고객페이지를 이용해주세요</span>
                <div><a href="/seller/regist.sool">회원가입</a></div>
            </div>
        </form>
    </div>
</body>
</html>
