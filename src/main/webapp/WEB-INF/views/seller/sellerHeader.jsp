<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/sellerHeader.css">
    <script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
	<div class="seller_header">
        <header>
            <div id="seller_banner" style="display:block;"><img src="/resources/image/logo1.png" style="height:30px;margin-top:5px;margin-bottom: 5px;width:115px;">
                <h5 style="margin:0 auto;">판매자페이지</h5>
            </div>
            <nav>
               <span>판매자 ${sessionScope.sessionSeller.selName}님 환영합니다.</span>
                <span><input type="button" class="btn btn-primary" value="고객페이지" id="customerBtn"></span>
                <span><input type="button" class="btn btn-danger" value="로그아웃" id="logoutBtn"></span>
            </nav>
        </header>
    </div>
</html>

<script>

	$(document).ready(function(){
		var loginStatus = "${sessionScope.sessionSeller.selName}";
		if(loginStatus=='null' || loginStatus==''){
			alert("로그인이 만료되었습니다. 다시 로그인해주세요");
			location.href="/seller/login.sool";
		};
	});
	
	$("#seller_banner").click(function(){
		location.href="/seller/mypage1.sool";
	})
	
	$("#customerBtn").click(function(){
		
		location.href="/";
	});
	
	$("#logoutBtn").click(function(){
		
		location.href='/seller/logout.sool';
	})
	
	$("seller_banner").click(function(){
		location.href="/seller/mypage1.sool";
	})
</script>