
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>술자리 판매자 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/sellerGoodsAdd.css">
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
	            <div id="goods_add">
			 	   <div id="goods_add_con">
				        <div class="goods_add_box">
				        <!-- <span>${sessionScope.sessionSeller.selNo }</span>-->
				        
				            <form action="/seller/insertGoods.sool" method="post" enctype="multipart/form-data">
				                <h2 id="goods_add_title">상품 등록하기</h2>
				                <label for="gdsName">상품 이름</label><input type="text" id="gdsName" name="gdsName" required>
				                <label for="gdsPri">상품 가격</label><input type="text" id="gdsPri" name="gdsPri" required>
				                <input type="hidden" name="selNo" value="${sessionScope.sessionSeller.selNo }">
				                <label>상품 타입</label><select name="goodsType">
				                    <option selected value="t">탁주/막걸리</option>
				                    <option value="f">과일주</option>
				                    <option value="c">청주</option>
				                    <option value="w">와인</option>
				                    <option value="s">증류주</option>
				                </select>
				                <label>상품사진</label><input type="file" name="files" required>
				        <label>상품 설명 사진</label><input type="file" name="files" required>
				                <input id="submitBtn" type="submit" name="button" class="submit-btn">
				            </form>
				        </div>
				        
				    </div>
				</div>
            </div>
        </div>
    </div>
    <div id="seller_footer">
        © SoolZaRi 술자리
    </div>
    <script>
    $(function(){
    	$("#submitBtn").click(function(event){
    		var count=0;
    		var moneyReg = /^[0-9]{1,}$/;
    		if(!moneyReg.test($("#gdsPri").val())){
    			alert("올바르지 않은 펀딩금액입니다. (숫자만 입력가능)");
    			count++;
    		}
    		if(count>0){
    			event.preventDefault();
    		}
    	});
    	
    })
    </script>
</body>

</html>