<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/sellerMypage.css">
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
				<div class="confirmDiv">
					<h5 style="text-align: center;padding:20px;margin: 0 auto;background-color:#f7b8b4;"> 펀딩 배송 승인 </h5>
					<div id="class_maincon">
					<table class="table">
					    <thead>
					        <tr>
					            <th scope="col">펀딩 이름</th><!-- 펀딩이름 -->
					            <th scope="col">펀딩 결제금액</th>
					            <th scope="col">구매자 아이디</th><!-- 구매자 아이디 -->
					            <th scope="col">펀딩상품 이름</th><!-- 펀딩상품이름 -->
					            <th scope="col">배송</th>
					            <th scope="col">상태</th>
					        </tr>
					    </thead>
					    <tbody>
					       <c:forEach items="${fndList}" var="f">
					        <tr>
					            <th scope="row">${f.fundName}</th><!-- f.fundName -->
					            <td>${f.fndDPrice}</td>
					            <td>${f.cliId }</td><!-- f.cliId -->
					            <td>${f.fndGName}</td><!-- f.fndGName -->
					            <td>
					            
					            <c:choose>
					            <c:when test="${f.fndDStatus<2}">
					            <span>결제준비</span>
					            </c:when>
					            <c:when test="${f.fndDStatus==2}">
					            <input type="hidden" value="${f.fndDNo}">
					            <select name="fndDStatus" id="fndDStatus">
					            <option value="2" selected>결제완료</option>
					            <option value="3">배송중</option>
					            </select>
					            </c:when>
					            <c:when test="${f.fndDStatus==3}">
					            <input type="hidden" value="${f.fndDNo}">
					            <select name="fndDStatus" id="fndDStatus">
					            <option value="3" selected>배송중</option>
					            <option value="4">배송완료</option>
					            </select>
					            </c:when>
					            <c:when test="${f.fndDStatus>=4}">
					            <span>배송완료</span>
					            </c:when>
					            </c:choose>
					            </td>
					            <td>
					            <c:choose>
					            <c:when test="${f.fndDStatus<2}">
					            <span>미결제</span>
					            </c:when>
					            <c:when test="${f.fndDStatus==2}">
					            <span>결제완료</span>
					            </c:when>
					            <c:when test="${f.fndDStatus==3}">
					            <span>배송중</span>
					            </c:when>
					            <c:when test="${f.fndDStatus>=4}">
					            <span>배송완료</span>
					            </c:when>
					            </c:choose>
					            </td>
					        </tr>
					        </c:forEach>
					    </tbody>
					</table>
					</div>
					<div id="page">
					            ${fndPage}
					</div>
				</div>
				<br>
            </div>
        </div>
    </div>
    <div id="seller_footer">
        © SoolZaRi 술자리
    </div>

    <script>
  	
	$(function(){
		$("select[name=fndDStatus]").change(function(){
			var fndDNo = $(this).prev().val();
			console.log(fndDNo);
			console.log($(this).val());
			location.href="/seller/updateFndDStatus.sool?fndDNo="+fndDNo+"&fndDStatus="+$(this).val();
		})
	})

    </script>
</body>
</html>