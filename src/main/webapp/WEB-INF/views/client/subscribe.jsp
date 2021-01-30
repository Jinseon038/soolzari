<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/resources/css/subscribe.css">
    <!-- script -->
     <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap cdn 설정 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">

    <link rel="preconnect" href="https://fonts.gstatic.com">

    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">


 
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">
    
    <!-- 결제 api -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
        <h2 class="fw300 fs34 f_scd text-center mb40" style="background:#f4f4f4; font-size:25px;">술자리 <span>구독 </span>안내 </h2><br><br>



        <div class="text-table">
            <div>
                <h5 style="text-align: center;"><span>술자리는 여러분의 지갑을 생각합니다</span></h5>
                <h5 style="text-align: center;"><span><br>술자리 구독박스를 통해 전통주를 더 저렴한 가격으로 즐겨보세요</span></h5>
                <h5 style="text-align: center;"><span><br>전통주 구독서비스는 상시판매가 아닌 매달 달리지는 구성으로 월1회 택배박스에 담겨 보내집니다.</span></h5>
            </div>
        </div>
    </div>
  
   <div class="goods_list">
        <div class="goods_list_cont">
            <div class="item_gallery_type clearfix">
                <ul>


                    <li style="width:35%;">
                        <div class="item_cont">
                            <div class="item_photo_box">

                                <img src="/resources/image/subscribe1.PNG" alt="전통주 짱맛있어" width="100%;" class="middle">

                            </div>

                            <div class="item_info_cont">
                                <div class="item_tit_box">

                                    <strong style="font-size:25px;"><img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4206ee214.png" alt="">
                                        술자리 구독세트 A</strong>
                                    <p style="text-align: left;   margin-top:30px;">
                                        <span style="font-size: 16px;"> 2021년 첫 술자리 구독박스 !</span>
                                        <span style="font-size:16px;">국내산 사탕수수를 증류하여 달달한 맛이 느껴지는 한국식 럼<br>하얀 눈처럼 깨끗한 느낌과 고소한 맛을 가진 증류식 소주<br>고구마와 쌀의 담백한 맛이 잘 어우러지는 우리나라 증류식 소주</span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">지금 바로 만나보세요!!</span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            가격 : 43000원
                                        </span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            배송비 : 3000원
                                        </span>
                                    </p>
                                    <p style="text-align: center;">
                                        <span style="font-size:16px;">
                          					<input type="button" style="width:90px; height:40px;" class="pay" value="구독하기">
                                        </span>
                                    
                                    </p>
                                </div>
                              
                            </div>
                        </div>
                    </li>
                    <li style="width:35%;">
                        <div class="item_cont">
                            <div class="item_photo_box">
                                <a href="#">
                                    <img src="/resources/image/subscribe2.PNG" alt="전통주 짱맛있어" width="100%;" style="padding-bottom:5px;" class="middle">
                                </a>
                            </div>

                            <div class="item_info_cont">
                                <div class="item_tit_box">
                                      <strong style="font-size:25px;"><img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4206ee214.png" alt="">
                                        술자리 구독세트 B</strong>
                                     <p style="text-align: left;   margin-top:30px;">
                                        <span style="font-size: 16px;"> 2021년 첫 술자리 구독박스 !</span>
                                        <span style="font-size:16px;">국내산 사탕수수를 증류하여 달달한 맛이 느껴지는 한국식 럼<br>하얀 눈처럼 깨끗한 느낌과 고소한 맛을 가진 증류식 소주<br>고구마와 쌀의 담백한 맛이 잘 어우러지는 우리나라 증류식 소주</span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">지금 바로 만나보세요!!</span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            가격 : 63000원
                                        </span>
                                    </p>
                                    <p style="text-align: left;">
                                        <span style="font-size:16px;">
                                            <img src="https://cdn.imweb.me/upload/S201805235b04d0e324735/5b3a4252955b4.png" alt="">
                                            배송비 : 3000원
                                        </span>
                                    
                                    </p>
                                    <p style="text-align: center;">
                                        <span style="font-size:16px;">
                          					<input type="button" style="width:90px; height:40px;" class="pay"value="구독하기">
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
                    
                    
                          <!-- 모달 -->
           <div class="modal">
           <div class="modal-top">
               <h1>구독신청</h1>
               <hr>
           </div>
           <div class="modal-content">
               <form  method="post" >
                
                 <div class="name">
                     <span class="first">받는분 성함 : </span> <input type="text" class="subscribePerson" name="subscribePerson" placeholder="받는분 성함">
                </div><br>
                <div class="name">
                     <span class="first">받는분 주소: </span> <input type="text" class="subscribeAddress" name="subscribeAddress" placeholder="받는분 주소">
                </div><br>
                <div class="name">
                     <span class="first">구독상품 : </span> <input type="text" class="subscribeName" name="subscribeName" placeholder="구독상품">
                </div><br>
             
                 <div class="person">
                     <span class="first">수량 : </span><input type="number" class="subscribeAmount" min="1" max="15" name="subscribeAmount" placeholder="1">
                 </div><br>
                 
                  <div class="price">
                       <span class="first">가격 : </span><input type="text"class="subscribePrice" name="subscribePrice"placeholder="43000">
                  </div><br>

                     <div class="date">
                         <span class="first">구독시작일</span><input type="text"  class="subscribeEnroll"name="subscribeEnroll" placeholder="2020-02-24">
                     </div><br>
                     
                     
               <br>
                      <div class="btnGroup">
                             <input type="button" class="payBtn"value="예약">
                   			<input type="button" class="reset" value="취소">
                      </div>
                  
               </form>
           </div>
       </div>
           <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>


<script>
	$(function(){
		 var sessionName='<%=session.getAttribute("sessionName")%>';
		 var sessionAddress='<%=session.getAttribute("sessionAddr")%>';
		 var subscribeName1=null;
		 var price;
		 
		 var date=getToday();
		 console.log(date);
			$("input[type=number]").change(function(){
				var person=$(this).val();
				console.log("person : "+person);
				
				console.log("price : "+price);
				var amount=price*person;
				console.log("amount: "+amount);
				
				$(".subscribePrice").val(amount);
			})
		$('.pay').click(function(){
			$(".subscribeAmount").val(1);
			subscribeName1=$(this).parent().parent().parent().children('strong').text().trim();
			console.log("구독상품");
			console.log(subscribeName1);
			var id='<%=session.getAttribute("sessionId")%>';
			if(sessionName=='null'){
				alert('로그인 후 이용가능합니다.');
				location.href="/login.sool";
			}else{
				$.ajax({
					url:"checkUsergrade.sool",
					type:"POST",
					//dateType:'json',
					async:false,
					data:
						{
							id :id,
						
						
						},
					success:function(data){
					console.log("data : "+data) //이런식으로 하면 안뜬다. 왜냐하면 "data :" 를 붙이면 javascrtip에서 string형으로 변환시킴
					alert(data.msg);
					if(data.msg=="신청가능합니다."){
						console.log("hihihihii");
						$('.modal').modal("show");
    	        		
					}
			
					},
					error:function(error){
						console.log(error);
					}
			
				})
	
			}
			
			if(subscribeName1==="술자리 구독세트 A"){
				price=43000;
				console.log("술자리 a"+price);
				$(".subscribePrice").val(price);
	
			}else{
				price=63000;

				console.log("술자리 b"+price);
				$(".subscribePrice").val(price);
		
			}
			$(".subscribePerson").val(sessionName);
			$(".subscribeAddress").val(sessionAddress);
			$(".subscribeName").val(subscribeName1);
		 
		 	$(".subscribeEnroll").val(date);
		
			
		})
		
		
		$(".payBtn").click(function(){
		 	var id='<%=session.getAttribute("sessionId")%>';
			console.log("session: "+id);
			var name='<%=session.getAttribute("sessionName")%>';
			console.log("name : "+name);
			var email='<%=session.getAttribute("sessionEmail")%>';
			var phone='<%=session.getAttribute("sessionPhone")%>';
			var addr='<%=session.getAttribute("sessionAddr")%>';
			var price=100;
			console.log("price : "+price);
			var subName=$(".subscribeName").val();
			var subPrice=$(".subscribePrice").val();
			var d = new Date();
			var date = d.getFullYear() + '' + (d.getMonth() + 1)
					+ '' + d.getDate() + '' + d.getHours() + ''
					+ d.getMinutes() + '' + d.getSeconds();
			
			console.log("test:"+subscribeName1);
			
		 	IMP.init('imp16593684');
			
			IMP.request_pay({
				merchant_uid : 'soolZari' + date,//상점거래ID
				name : name+"-"+'구독 결제', //결제이름
				amount : price, //결제금액
				buyer_email : email,
				buyer_name : name,
				buyer_tel : phone,
				buyer_addr : addr,
				buyer_postcode : "000-000" //우편번호
			},function(rsp){
				if(rsp.success){
					var msg='클래스 예약 결제가 완료되었습니다';
				        msg += '결제 금액 : ' + rsp.paid_amount;
				
						$.ajax({
							url:"setUsergrade.sool",
							type:"POST",
							//dateType:'json',
							async:false,
							data:
								{
									id :id,
									name:subscribeName1
								
								},
							success:function(data){
							console.log("data : "+data) //이런식으로 하면 안뜬다. 왜냐하면 "data :" 를 붙이면 javascrtip에서 string형으로 변환시킴
						
								alert(data.msg);
							},
							error:function(error){
								console.log(error);
							}
					
						})
				        alert(msg);
						location.href="/subscribe.sool";
				    
				}else{
					var msg='결제 실패하셨습니다';
					  msg += '에러내용 : ' + rsp.error_msg;
					  alert(msg);
				}
			})
			
		})
			


		/* 모달창 취소*/
	 	 $(".reset").click(function(){
	 		 console.log("취소");  
	 		 $('.modal').modal("hide");
	 		 
	 	   });
			
			
		
		 function getToday(){
			    var now = new Date();
			    var year = now.getFullYear();
			    var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
			    var date = now.getDate();

			    month = month >=10 ? month : "0" + month;
			    date  = date  >= 10 ? date : "0" + date;
			     // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.

			    //console.log(""+year + month + date);
			    return today = ""+year +"-"+  month +"-"+ date; 
			}

	})
</script>



