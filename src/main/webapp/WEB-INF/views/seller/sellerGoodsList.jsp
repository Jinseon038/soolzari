<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>술자리 판매자 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/sellerGoodsList.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>

<body>
    <%@include file="/WEB-INF/views/seller/sellerHeader.jsp"%>
    <div id="content_box">
        <div id="left_bar">
            <div class="wrapper">
                <ui class="mainMenu">
                    <li class="item" id="goods_con">
                        <a href="#goods_con" class="btn-left">상품 관리</a>
                        <div class="subMenu">
                            <a href="/seller/goodsAdd.sool">상품 등록</a>
                            <a href="/seller/goodsList.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">상품 보기</a>
                        </div>
                    </li>
                    <li class="item" id="class_con">
                        <a href="#class_con" class="btn-left">클래스 관리</a>
                        <div class="subMenu">
                            <a href="/seller/classAdd.sool">클래스 등록</a>
                            <a href="/seller/classList.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">클래스 확인</a>
                        </div>
                    </li>
                    <li class="item" id="funding_con">
                        <a href="#funding_con" class="btn-left">펀딩 관리</a>
                        <div class="subMenu">
                            <a href="/seller/fundingAdd.sool">펀딩 열기</a>
                            <a href="/seller/fundingList.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">펀딩 확인</a>
                        </div>
                    </li>
                    <li class="item" id="mypage_con">
                        <a href="#mypage_con" class="btn-left">마이페이지</a>
                        <div class="subMenu">
                            <a href="/seller/mypage1.sool">내 정보 보기</a>
                            <a href="/seller/mypage2.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">상품 배송 관리</a>
                            <a href="/seller/mypage3.sool?reqPage=1">펀딩 배송 관리</a>
                        </div>
                    </li>
                </ui>
            </div>
        </div>
        <div id="main_container">
            <div id="main_content">
            <h2 style="text-align: center;padding:20px;margin: 0 auto;background-color:#f7b8b4;"> 내 상품 목록 </h2>
            
            
<form action="deleteGoods.sool" method="post">
<table class="table">
    <thead>
        <tr>
            <th scope="col">상품 번호</th>
            <th scope="col">상품 이름</th>
            <th scope="col">상품 가격</th>
            <th scope="col">상품 등록일</th>
            <th scope="col">선택</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${list }" var="g">
        <tr>
            <th scope="row">${g.gdsNo}</th>
            <td><a href="/seller/goodsDetail.sool?gdsNo=${g.gdsNo }">${g.gdsName}</a></td>
            <td>${g.gdsPri}</td>
            <td>${g.goodsDate}</td>
            <td><input type="checkbox" name="checkbox" value="${g.gdsNo }"></td>
        </tr>
        </c:forEach>
    </tbody>
</table>
<div id="page">
                        ${page }
            </div>
<div id="main_crud">
        <input type="submit" value="선택 상품 삭제">
    </div>
</form>

            </div>
        </div>
    </div>
    <div id="seller_footer">
        © SoolZaRi 술자리
    </div>
</body>
<script>
   
</script>
</html>