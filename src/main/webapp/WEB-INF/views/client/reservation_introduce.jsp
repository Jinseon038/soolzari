<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reservation_intro.css">

       <!-- script -->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

	<!-- 결제 api -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	     <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script> 


    <!-- icon 사용-->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">




    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">
</head>
<body>
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
                        <img src="resources/image/reservation1.PNG" alt="" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="resources/image/reservation2.PNG" alt="" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="resources/image/reservation3.PNG" alt="" style="width:100%;">
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
        


    <div class="soolzari_container">

        <div class="reservationLogo" style="text-align: center;">

            <img src="/resources/image/loginLogo.png" alt="">
        </div>
        <h2 class="fw300 fs34 f_scd text-center mb40" style="background:#f4f4f4; font-size:25px;">술자리<span>&nbsp;양조장 체험</span>프로그램 </h2><br><br>

        <div class="choiceBtn">
            <ul class>
                <li>
                    <a href="/reservation_intro.sool">클래스 안내</a>
                </li>
                <li>
                    <a href="/reservation.sool">클래스 예약</a>
                </li>
            </ul>
        </div>

        <div class="text-table">
            <div>
                <h5 style="text-align: center;"><span>다양한 체험을 통해 우리 전통주를 만나는</span></h5>
                <h5 style="text-align: center;"><span>오감만족 술자리 양조장체험</span></h5>
            </div>
        </div>
    </div>

    <div class="goods_list">
        <div class="goods_list_cont">
            <div class="item_gallery_type clearfix">
                <ul>


                    <li style="width:27%;">
                        <div class="item_cont">
                            <div class="item_photo_box">

                                <img src="/resources/image/ex1.PNG" alt="전통주 짱맛있어" width="100%;" class="middle">

                            </div>

                            <div class="item_info_cont">
                                <div class="item_tit_box">

                                    <strong style="font-size:25px;"><img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4206ee214.png" alt="">
                                        소곡주갤러리 탐방</strong>
                                    <p style="text-align: left;   margin-top:30px;">
                                        <span style="font-size: 16px;"> 소곡주 갤러리 카페에서 만나는 한신소곡주 삼화양조장</span>
                                        <span style="font-size:16px;">소곡주가 빚어지는 과정과 도구를 통해 삼화양조장의 이야기를 만나실 수 있습니다.</span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">사람과 시간, 역사와 문화를 만날 수 있는 탐방</span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            시간:20분
                                        </span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            비용 : 무료
                                        </span>
                                    </p>
                                </div>
                              
                            </div>
                        </div>
                    </li>
                    <li style="width:27%;">
                        <div class="item_cont">
                            <div class="item_photo_box">
                        
                                    <img src="/resources/image/ex2.PNG" alt="전통주 짱맛있어" width="100%;" class="middle">
                             
                            </div>

                            <div class="item_info_cont">
                                <div class="item_tit_box">
                                      <strong style="font-size:25px;"><img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4206ee214.png" alt="">
                                        소곡주 주례체험</strong>
                                    <p style="text-align: left;   margin-top:30px;">
                                        <span style="font-size: 16px;"> 한신소곡주를 통해 배우는 우리술 문화, 현대적인 </span>
                                        <span style="font-size:16px;">주례해석으로 유쾌하게 즐거운 술문화를 경험합니다</span>
                                    </p>
                               
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            시간:1시간
                                        </span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            비용 : 11000원
                                        </span>
                                    </p>
                                </div>
                              
                            </div>
                        </div>
                    </li>
                    <li style="width:27%;">
                        <div class="item_cont">
                            <div class="item_photo_box">
                          
                                    <img src="/resources/image/ex3.PNG" alt="전통주 짱맛있어" width="100%;" class="middle">
                               
                            </div>

                            <div class="item_info_cont">
                                <div class="item_tit_box">
                                     <strong style="font-size:25px;"><img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4206ee214.png" alt="">
                                        소곡주 시음 체험</strong>
                                    <p style="text-align: left;   margin-top:30px;">
                                        <span style="font-size: 16px;"> 한산에서 생산되는 다양한 소곡주를 주종별로 시음하고,</span>
                                        <span style="font-size:16px;"> 지역의 특별안주와 함께 마리아주를 경험, 체험에서만 구입할 수 있는 한신소곡주 미니어처 세트를</span>
                                              <span style="font-size:16px;"> 가져가실 수 있습니다.</span>
                                    </p>
                              
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            시간:1시간
                                        </span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            비용 : 18000원
                                        </span>
                                    </p>
                              
                            </div>
                        </div>
                    </li><br>
                    <li style="width:27%;">
                        <div class="item_cont">
                            <div class="item_photo_box">

                                <img src="/resources/image/ex4.PNG" alt="전통주 짱맛있어" width="100%;" class="middle">

                            </div>

                            <div class="item_info_cont">
                                <div class="item_tit_box">

                                    <strong style="font-size:25px;"><img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4206ee214.png" alt="">
                                        소곡주 병 재활용 DIY</strong>
                                    <p style="text-align: left;   margin-top:30px;">
                                        <span style="font-size: 16px;"> 한신소곡주 전용병을 재활용하여 인테리어</span>
                                        <span style="font-size:16px;">소품만들기</span>
                                    </p>
                                
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            시간:30분
                                        </span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            비용 : 8000원 ~ 15000원
                                        </span>
                                    </p>
                                </div>
                              
                            </div>
                        </div>
                    </li>
                    <li style="width:27%;">
                        <div class="item_cont">
                            <div class="item_photo_box">

                                <img src="/resources/image/ex5.PNG" alt="전통주 짱맛있어" width="100%;" class="middle">

                            </div>

                            <div class="item_info_cont">
                                <div class="item_tit_box">

                                    <strong style="font-size:25px;"><img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4206ee214.png" alt="">
                                        소곡주 빚기</strong>
                                    <p style="text-align: left;   margin-top:30px;">
                                        <span style="font-size: 16px;">이양주인 한산소곡주를 직접 빚어 나만의 소곡주를</span>
                                        <span style="font-size:16px;">만든다</span>
                                    </p>
                                   
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            시간:3시간
                                        </span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            비용 : 사전 신청 및 접수문의(15인 이상 가능)
                                        </span>
                                    </p>
                                </div>
                              
                            </div>
                        </div>
                    </li>
                    <li style="width:27%;">
                        <div class="item_cont">
                            <div class="item_photo_box">

                                <img src="/resources/image/ex6.PNG" alt="전통주 짱맛있어" width="100%;" class="middle">

                            </div>

                            <div class="item_info_cont">
                                <div class="item_tit_box">

                                    <strong style="font-size:25px;"><img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4206ee214.png" alt="">
                                        소곡주 장아찌 만들기</strong>
                                    <p style="text-align: left;  margin-top:30px;">
                                        <span style="font-size: 16px;"> 소곡주 지게미를 활용하여 무, 다시마, 오이 등 다양한</span>
                                        <span style="font-size:16px;">장아찌를 만듭니다.</span>
                                    </p>
                                   
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            시간: 1시간 30분 ~ 2시간
                                        </span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            비용 : 10000원(500g)
                                        </span>
                                    </p>
                                </div>
                              
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

     
    
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

<script>
		


$(function(){
    // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
    $('#carousel-example-generic').carousel({
    // 슬리아딩 자동 순환 지연 시간
    // false면 자동 순환하지 않는다.
    interval: 3000,


    });
    

    
    
    });
   

 
