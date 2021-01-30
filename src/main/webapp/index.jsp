
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>술자리 메인페이지</title>
 <link rel="stylesheet" href="/resources/css/main.css">
 <!-- script -->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!--font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


    <!-- icon 사용-->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    
   

	


    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">


</head>
<body>
	<div class="wrap">
      <%@include file="/WEB-INF/views/common/header.jsp" %>
		<div style="height:80px; width:100%;"></div>
        <section class="carousel">

            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">

                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="resources/image/carousel1.PNG" alt="" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="resources/image/carousel2.PNG" alt="" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="resources/image/carousel3.jpg" alt="" style="width:100%;">
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </section>

        <section class="new_product">

            <span>
                <h2 style="text-align: center; margin: 80px; font-size:30px;"> 오늘의 신상품 <span>
                <a href="/basicSool.sool" style="float:right; cursor: pointer; text-decoration: none;  font-size:20px; margin-top:65px; ">더보기 </a>
                </span>
                </h2>
            </span>

            <div class="new-Plist">
                <ul class="nList">

                    <li class="newList-li">
                        <a href="/client/oGoodsDetail1.sool?gdsNo=21&gdsRate=3.8">
                            <div class="newImg-wrap">

                                <img src="resources/image/product.PNG" style="width: 100%;">
                            </div>

                            <div class="text-box" style="
                               padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">시나브로 에뚜왈 화이트 </h4>
                                    </span>
                                    <div class="rate">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                         <span class="rateNum">4.5/5.0</span>
                                    </div>
                                </div>

                                <div class="gray"><span class="price">30,000원</span></div>

                            </div>
                        </a>
                    </li>


                    <li class="newList-li">
                        <a href="/client/oGoodsDetail1.sool?gdsNo=23&gdsRate=4.2">
                            <div class="newImg-wrap">


                                <img src="/resources/image/product3.PNG" style="width: 100%;">
                                <!--  
                                    <button type="button" class="btn_like">
                                        <span class="img_emoti">좋아요</span>
                                        <span class="ani_heart_m"></span>
                                    </button>-->
                           </div>
                            <div class="text-box" style="padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">가덕 순쌀 생막거리</h4>
                                    </span>
                                   <div class="rate">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                    <span class="rateNum">4.0/5.0</span>
                                    </div>
                                </div>
                                <div class="gray"><span class="price">14400원</span></div>

                            </div>
                        </a>
                    </li>


                    <li class="newList-li">
                        <a href="/client/oGoodsDetail1.sool?gdsNo=22&gdsRate=4.4">
                            <div class="newImg-wrap">

                                <img src="/resources/image/product2.PNG" style="width:100%; object-fit:contain; ">
                            </div>
                            <div class="text-box" style="
                               padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">나루 생 막걸리 11.5도</h4>
                                    </span>
                                   <div class="rate">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span class="rateNum">4.2/5.0</span>
                                    </div>
                                </div>
                                <div class="gray"><span class="price">33000원</span></div>

                            </div>
                        </a>
                    </li>

                    <li class="newList-li">
                        <a href="/client/oGoodsDetail1.sool?gdsNo=24&gdsRate=3.9">
                            <div class="newImg-wrap">


                                <img src="/resources/image/product4.PNG" style="width: 100%;">

                            </div>
                            <div class="text-box" style="
                               padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">토박이 소곡화주</h4>
                                    </span>
                                  <div class="rate">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                          <span class="rateNum">4.5/5.0</span>
                                    </div>
                                    <!--  
                                    <button type="button" class="btn_like">
                                        <span class="img_emoti">좋아요</span>
                                        <span class="ani_heart_m"></span>
                                    </button>-->
                                </div>
                                <div class="gray"><span class="price">18000원</span></div>

                            </div>
                        </a>

                    </li>

                </ul>
            </div>
        </section>

        <section class="best_product">

            <span>
                <h2 style="text-align: center; margin: 80px; font-size:30px;"> 베스트 상품 <span><a  href="/basicSool.sool"  style="float:right;  font-size:20px; margin-top:35px;cursor: pointer; text-decoration: none; margin-top:65px;" >더보기 </a></span></h2>
            </span>
            <div class="best-Plist">
                <ul class="bList">

                    <li class="bestList-li">
                        <a href="/client/oGoodsDetail1.sool?gdsNo=25&gdsRate=3.9">
                            <div class="newImg-wrap">

                                <img src="/resources/image/product5.PNG" style="width: 100%;">
                            </div>

                            <div class="text-box" style="
                               padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">블루베리 생막걸리</h4>
                                    </span>
                                 <div class="rate">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span class="rateNum">4.8/5.0</span>
                                    </div>
                                </div>
                                <div class="gray"><span class="price">25000원</span></div>

                            </div>
                        </a>
                    </li>


                    <li class="bestList-li">
                        <a href="/client/oGoodsDetail1.sool?gdsNo=26&gdsRate=4.6">
                            <div class="newImg-wrap">


                                <img src="/resources/image/product6.PNG" style="width: 100%;">
                            </div>
                            <div class="text-box" style="padding: 10px; box-sizing: border-box;
                               padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">대왕 산삼 생막걸리</h4>
                                    </span>
                                  <div class="rate">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                          <span class="rateNum">4.5/5.0</span>
                                    </div>
                                </div>
                                <div class="gray"><span class="price">25000원</span></div>

                            </div>
                        </a>
                    </li>


                    <li class="bestList-li">

                        <a href="/client/oGoodsDetail1.sool?gdsNo=27&gdsRate=3.6">
                            <div class="newImg-wrap">

                                <img src="/resources/image/product7.PNG" style="width: 100%;">
                            </div>
                            <div class="text-box" style="padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">능이주 2종</h4>
                                    </span>
                                  <div class="rate">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                       <span class="rateNum">4.6/5.0</span>
                                    </div>
                                </div>
                                <div class="gray"><span class="price">12000원</span></div>

                            </div>
                        </a>
                    </li>


                    <li class="bestList-li">
                        <a href="/client/oGoodsDetail1.sool?gdsNo=28&gdsRate=3.6">
                            <div class="newImg-wrap">


                                <img src="resources/image/product8.PNG" style="width: 100%;">
                            </div>
                            <div class="text-box" style="padding: 20px; box-sizing: border-box;">
                                <div>
                                    <span>
                                        <h4 class="name">송이주 2종</h4>
                                    </span>
                                 <div class="rate">
                                        <span><i class="fas fa-star" style="color:orange;"></i></span>
                                        <span class="rateNum">4.7/5.0</span>
                                    </div>
                                </div>
                                <div class="gray"><span class="price">12000원</span></div>

                            </div>
                        </a>
                    </li>


                </ul>
            </div>
        </section>


        <section class="subscribe">
            <div class="subs-image">
                <img src="resources/image/subscribe.png" alt="">
            </div>

            <div class="sub-text">
                <h2>담화박스</h2>
                <span>
                    지금 바로 구독신청하고 <br>전국각지 양조장의 다양한
                    전통주를 경험하세요
                </span>
                <button type="button" id="subs_button" class="btn btn-danger btn-lg" onclick="location.href='/subscribe.sool'">구독하기</button>
            </div>


        </section>

 <%@include file="WEB-INF/views/common/footer.jsp" %>
     
    </div>
</body>
</html>


<script>
    
  
    $(function(){
    	$.ajax({
			
			url:"getNewProduct.sool",
			type:"POST",
			dateType:'json',
			async:false, 
			data:{
				
			},
			success:function(data){
		
				console.log(data);
	
			},
			error:function(request, status, error){
				console.log("error code : "+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				
			}
		})
    	
    })
    
 
   
    /* 좋아요*/
    
    
    
$('.btn_like').click(function(){
  if($(this).hasClass('btn_unlike')){
    $(this).removeClass('btn_unlike');
    $('.ani_heart_m').removeClass('hi');
    $('.ani_heart_m').addClass('bye');
  }
  else{
    $(this).addClass('btn_unlike');
    $('.ani_heart_m').addClass('hi');
    $('.ani_heart_m').removeClass('bye');
  }
});
</script>