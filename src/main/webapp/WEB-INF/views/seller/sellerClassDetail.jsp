
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
            <h2 style="text-align: center;padding:20px;margin: 0 auto;background-color:#f7b8b4;"> 클래스 상세보기 </h2>
<div id="goods_det">
    <div id="goods_det_con">
        <div id="goods_det_img">
            <img src="/resources/image/ex1.PNG" id="det_img">
        </div>
        <div id="goods_det_cons">
            <div id="goods_det_con_1">
                <span id="det_title">${cl.className }</span><br>
                <span id="det_content">예약 인원 : ${cl.classNow }명</span>
            </div>
            <div id="goods_det_con_2">
               
                <span id="det_date">등록일 : ${cl.classDate }</span>
            </div>
            <div id="goods_det_con_3">
                <span id="det_price_title">수강 가격</span><br>
                <span id="det_price">${cl.classPrice }원</span>
            </div>
        </div>
    </div>

    <div id="goods_det_fix">
    
    <form action="/seller/fixClass.sool" method="post">
          
        <table style="width:100%;height: 100%;">
            <tr style="height:40%;">
                <th style="width:45%;text-align:left; height:50px;" >클래스명</th>
         
                <td><input type="text" name="className" value="${cl.className}"></td>
                <td> <input type="hidden" name="classNo" value="${cl.classNo }" ></td>
            </tr>
            <tr style="height:40%;">
                <th style="width:45%;text-align:left; height:50px;">클래스 설명</th>
                <td><input type="text" name="classDetail" value="${cl.classDetail }"></td>
            </tr>
             <tr style="height:40%;">
                <th style="width:45%;text-align:left; height:50px;">클래스 가격</th>
                <td><input type="text" name="classPrice" value="${cl.classPrice }"></td>
            </tr>
             <tr style="height:40%;">
                <th style="width:45%;text-align:left; height:50px;">클래스 날짜</th>
                <td><input type="text" name="classEnroll" value="${cl.classEnroll }"></td>
            </tr>
             <tr style="height:40%;">
                <th style="width:45%;text-align:left; height:50px;">클래스 시작시간</th>
                <td><input type="text" name="classStartTime" value="${cl.classStartTime }"></td>
            </tr>
             <tr style="height:40%;">
                <th style="width:45%;text-align:left; height:50px;">클래스 정원</th>
                <td><input type="text" name="classPerson" value="${cl.classPerson }"></td>
            </tr>
            <tr style="height:40%;">
            	
                <td colspan="2"><input type="submit" value="수정하기" style="width:100%; height:40px; border:none; background-color: #4d5075; color:white;"></td>
            
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
