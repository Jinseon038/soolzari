<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
               <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="/resources/css/introduce.css">

    <!-- Bootstrap cdn 설정 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

    <!--font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">



    <!-- script -->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">


</head>
<body>
   <%@include file="/WEB-INF/views/common/header.jsp" %>
   	<div style="height:40px; width:100%;"></div>
 <div class="wrapper">
           <div class="introduce">
            <h2 style="font-size:36px; color:white; "><br><br><br>술자리 소개</h2>


        </div>

			<c:choose>
			<c:when test="${sessionId==null }">
			     <div class="side-menu" style="text-align: left;">
            <img src="/resources/image/arrow.png" alt="" style="width: 40px; border-radius: 18px; 18px;18px; 18px; font-size:20px;">
            <span><a href="/views/client/join.jsp" style="text-decoration: none; color: black; font-size:20px;">회원가입</a></span><br><br>
             <img src="/resources/image/arrow.png" alt="" style="width: 40px; font-size:20px;border-radius: 18px; 18px;18px; 18px;">
            <span><a href="/login.sool" style="text-decoration: none; font-size:20px;color: black;">로그인</a></span><br><br>
             <img src="/resources/image/arrow.png" alt="" style="width: 40px; border-radius: 18px; 18px;18px; 18px;">
            <span><a href="/basicSool.sool" style="text-decoration: none; color: black;font-size:20px;">상품보기</a></span><br><br>
        </div>
			</c:when>
			<c:otherwise>
			    <div class="side-menu" style="text-align: left;">
			        <img src="/resources/image/arrow.png" alt="" style="width: 40px; border-radius: 18px; 18px;18px; 18px;">
            <span><a href="/basicSool.sool" style="text-decoration: none; color: black; font-size:20px;">상품보기</a></span><br><br>
            </div>
			</c:otherwise>
	</c:choose>
   
        
        <div class="soolzari_container">
            <h2 class="fw300 fs34 f_scd text-center mb40" style="font-size:30px;">이것이&nbsp;<span>&nbsp;[우리들의 술]&nbsp;</span>이다. </h2><br><br>
            <div class="contents">


                <div class="video_wrap">

                    <iframe width="100%" height="315" src="https://www.youtube.com/embed/sycYLCUMY5Q" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="back_blue"></div>


            </div>

        </div>

        <div class="container">

            <div class="row featurette">
                <div class="col-md-7">

                    <h5 class="featurette-heading">
                        <br><span style="font-weight: bold; font-size:30px; margin-top: 30px;">ABOUT 술자리</span><br>
                        <p class="lead">안녕하십니까? 반갑습니다.<br>술자리를 방문해주신 여러분께 진심으로 감사의 말씀을 전해드립니다.<br><br>
                            우리는 대한민국 5,000년 역사와 함께 해온<br>자랑스러운 전통술을 알리고자 이 자리에 섰습니다.<br><br>
                            우리는 전통술의 발전을 통해 지역 경제를 활성화하고, <br>나아가 세계 10위의 경제대국에 걸맞은<br>
                            한국 술의 문화 상품화에 작은 보탬이 되고자 합니다.</p>

                    </h5>

                </div>
                <div class="col-md-5">
                    <img src="/resources/image/carousel2.PNG" alt="" width="500px;" height="380px;" object-fit="cover;">
                </div>

            </div>
            <br><br><br>
            <div class="row featurette">
                <div class="col-md-7">
                    <img src="/resources/image/introduce2.jpg" alt="" width="500px;" height="380px;" object-fit="cover;">
                </div>
                <div class="col-md-5">
                    <h5 class="featurette-heading">

                        <p class="lead"><span style="font-size: 30px; font-weight: 500"><br>우리는 꿈을 꿉니다</span><br>
                            <span style="font-size: 25px; font-weight: 800">우리와 함께 해주시겠습니까?</span><br><br>
                            우리의 전통술이 와인, 위스키 그리고 사케 등<br>
                            세계적인 술과 어깨를 나란히 하는 꿈을 꿉니다.<br><br>
                            우리는 한국 전통술에 대한 무한한 애정을 가지고<br>
                            술자리를 방문해 주신 여러분의 손을 마주잡고 이 꿈을 현실로 만들고 싶습니다.

                        </p>

                    </h5>
                </div>

            </div>
            <br><br><br>   <br><br>   
            
            
            <div class="row featurette">
                <div class="col-md-2 sool_promise1">
                   <div class="promise" >술자리의<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: black;
                   font-weight: bold;">약속.&nbsp;</span></div>
                </div>
                <div class="col-md-10 sool_promise2">
                   <div class="promise_list">
                       <p><span class="number">&nbsp;&nbsp;하나.</span><br>
                       &nbsp;&nbsp;우리는 5,000년 우리 역사와 함께해온 자랑스러운 전통술의 <span style="text-decoration: underline;">국제적 브랜드화에 대표주자가</span> 되겠습니다.</p><br>
                          <p><span class="number">&nbsp;&nbsp;둘.</span><br>&nbsp;&nbsp;
                       우리는 대한민국의 높아진 세계적 위상에 걸맞게  <span style="text-decoration: underline;">한국술의 위상을 높이는데 일조</span>하겠습니다.</p><br>
                          <p><span class="number">&nbsp;&nbsp;셋.</span><br>
                      &nbsp;&nbsp; 우리는 <span style="text-decoration: underline;">전통술의 부가가치를 높이고</span> 회원과 직원을 섬기며
                         <span style="text-decoration: underline;">전통술 제조장을 존중</span>하겠습니다.</p><br>
                          <p><span class="number">&nbsp;&nbsp;넷.</span><br>
                      &nbsp;&nbsp; 우리는 전통술의 가격이 <span style="text-decoration: underline;">모든 회원분들이 인정할 수 있는 가격대가 되도록 끊임없이 혁신</span>하겠습니다.</p><br>
                             <p><span class="number">&nbsp;&nbsp;다섯.</span><br>
                       &nbsp;&nbsp;우리는 전통술의 가격이 <span style="text-decoration: underline;">모든 회원분들이 인정할 수 있는 가격대가 되도록 끊임없이 혁신</span>하겠습니다.</p>
                   </div>
                </div>

            </div>

        </div>
        <br><br><br><br><br>
    </div>
       <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

