
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>술자리 판매자 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/sellerGoodsDetail.css">
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
            <h2 style="text-align: center;padding:20px;margin: 0 auto;background-color:#f7b8b4;"> 상품 상세보기 </h2>
<div id="goods_det">
    <div id="goods_det_con">
        <div id="goods_det_img">
            <img src="/resources/image/${gd.filename1 }" id="det_img1">
            <img src="/resources/image/${gd.filename2 }" id="det_img2">
        </div>
        <div id="goods_det_cons">
            <div id="goods_det_con_1">
                <span id="det_title">${gd.gdsName }</span><br>
                <span id="det_content">판매된 갯수 : ${gd.gdsBcnt }개</span>
            </div>
            <div id="goods_det_con_2">
                <span id="det_score">평점 : ${gd.avgRevScore }/5.0</span><span id="det_revcnt"> [리뷰 갯수:${gd.countRevScore }]</span><br>
                <span id="det_date">등록일 : ${gd.goodsDate }</span>
            </div>
            <div id="goods_det_con_3">
                <span id="det_price_title">판매가격</span><br>
                <span id="det_price">${gd.gdsPri }원</span>
            </div>
        </div>
    </div>

    <div id="goods_det_fix">
    <form action="/seller/fixGds.sool" method="post">
          
        <table style="border:1px solid black; width:100%;height: 100%;">
            <tr style="height:30%;">
                <th style="width:25%;text-align:center;">상품명</th>
         
                <td><input id="gdsName" type="text" name="gdsName" value="${gd.gdsName }"></td>
                <td> <input type="hidden" name="gdsNo" value="${gd.gdsNo }"></td>
            </tr>
            <tr style="height:30%;">
                <th style="width:25%;text-align:center;">판매가</th>
                <td><input id="gdsPri" type="text" name="gdsPri" value="${gd.gdsPri }"></td>
            </tr>
            <tr style="height:40%;">
            	
                <td colspan="2"><input id="submitBtn" type="submit" value="수정하기" style="width:100%; border:none; height:100%;background-color: #4d5075; color:white;"></td>
            
            </tr>
        </table>
        </form>
    </div>
</div>
            </div>
        </div>
    </div>
    <div id="seller_footer">
        © SoolZaRi 술자리
    </div>
</body>

</html>
