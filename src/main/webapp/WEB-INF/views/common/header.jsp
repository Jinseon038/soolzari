<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/main.css">

   



    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">
</head>
<body>
<div class="wrap">
  <!-- 헤더 -->
        <div class="bgColor"  style="position:absolute;"> <!-- 화면 밀고 내려가지 않도록 absolute준다. -->
            <header>
                <span class="bg"></span> <!-- 반응형 메뉴 클릭하면 배경화면 어두워지게 하기위해 작성-->
                <a href="#" class="open"><span class="lnr lnr-menu"></span></a>
                <a href="/index.jsp" class="logo"><img src="/resources/image/logo1.png"></a>
                <nav>
                    <a href="#" class="close"><span class="lnr lnr-cross"></span></a>
                    <ul class="gnb">
                        <li><a href="#">사이트소개</a>

                            <ul class="sub">
                                <li id="nop"><a href="/views/client/introduce.jsp">이용안내</a></li>
                            </ul>
                        </li>
                        <li><a href="/takju.sool">전통주</a>
                            <ul class="sub">
                                <li id="nop"><a href="/takju.sool">탁주</a></li>
                                <li id="nop"><a href="/cheongju.sool">청주</a></li>
                                <li id="nop"><a href="/spirits.sool">증류주</a></li>
                                <li id="nop"><a href="/wine.sool">와인</a></li>
                                <li id="nop"><a href="/fruit.sool">과실주</a></li>
                            </ul>
                        </li>
                        <li><a href="/subscribe.sool">구독/펀딩</a>
                            <ul class="sub">
                                <li id="nop"><a href="/subscribe.sool">구독</a></li>
                                <li id="nop"><a href="/fund.sool">펀딩</a></li>
                            </ul>
                        </li>

                        <li><a href="/reservation_intro.sool">클래스</a>
                            <ul class="sub">
                                <li id="nop"><a href="/reservation_intro.sool">안내</a></li>
                                <li id="nop"><a href="/reservation.sool">예약</a></li>
                            </ul>
                        </li>
                        <li><a href="#">고객센터</a>
                            <ul class="sub">
                                <li id="nop"><a href="/notice/listClient.sool?reqPage=1">공지사항</a></li>
                                <li id="nop"><a href="/faqClient.sool">자주 묻는 질문</a></li>
                            </ul>
                        </li>
                    </ul>

                </nav>


	
	
		<c:choose>
			<c:when test="${sessionScope.sessionId!=null }">
				   <div>
			
                    <ul class="login">
                        <li> <input class="search_input" type="text" placeholder="search"></li>
                        <li><a href="/logout.sool">로그아웃</a>
                        <li><a href="/client/basketList.sool">장바구니</a>
                        <li><a href="/client/mOrderList.sool?reqPage=1&period=1">${sessionName}님</a>
                    </ul>
                </div>
			</c:when>
			<c:otherwise>
			 <div>
                    <ul class="login">
                        <li> <input class="search_input" type="text" placeholder="search"></li>
                        <li><a href="/login.sool">로그인</a>
                        <li><a href="/views/client/join.jsp">회원가입</a>
                    </ul>
                </div>
			</c:otherwise>
		</c:choose>			
               

            </header>
        </div>
        </div>
</body>
</html>
<script>
/* keyup delay 줌*/
function delay(callback, ms) {
	  var timer = 0;
	  return function() {
	    var context = this, args = arguments;
	    clearTimeout(timer);
	    timer = setTimeout(function () {
	      callback.apply(context, args);
	    }, ms || 0);
	  };
	}
	/* 빠른 검색*/
	$(".search_input").keyup(delay(function(e){
		
		console.log($(this).val());
		var searchWord=$(this).val();
		location.href='/basicSool.sool?searchWord='+searchWord;
	},1000));
 /* 헤더 */
 
 $(function(){
	 $(document).on('mouseover','.gnb li a', function(){
         if($(window).width()>1200){
        $('.bgColor').css('height','450px');
        $('.sub').slideDown(300);
        $('.bgColor').css('background-color','white');
       $('header').css('height','450px');
         }
    });
    
    $('.sub').on({
        mouseover:function(){
      
            $(this).children('#nop a').css('border-bottom','0px solid white');
        },
        mouseleave:function(){
                $(this).prev().css('border-bottom','0px solid green');
        }
        
    })
  
    
    $(document).on('mouseleave','header', function(){
        if($(window).width()>1200){
            $('.sub').slideUp(20);
         $('header').css('height','80px');
        $('.bgColor').css('height','0px'); 
        }else{
             $('header').css('height','80px');
        }  
       
    })
    
    
    
          $(function() {
    $('header .open').on('click', function() {
        $('body').css({'overflow': 'hidden'});   //스크롤하지 못하게 막음
        $('header .bg').css({'display': 'block'});
        $('header nav').addClass('on');
	});
    $('header .close, .section').on('click', function() {
        $('body').css({'overflow': 'auto'});
        $('header .bg').css({'display': 'none'});
        $('header nav').removeClass('on');
	});	
}); 
 })
      
    </script>