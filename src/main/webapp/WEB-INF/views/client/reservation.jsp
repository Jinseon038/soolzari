<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/reservation.css">


    	   
    <script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
   
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

	<!-- 결제 api -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <!--font-->
    <link href='/resources/fullcalendar-4.4.0/packages/core/main.css' rel='stylesheet' />
    <link href='/resources/fullcalendar-4.4.0/packages/daygrid/main.css' rel='stylesheet' />
<link href='/resources/fullcalendar-4.4.0/packages/timegrid/main.css' rel='stylesheet' />
<link href='/resources/fullcalendar-4.4.0/packages/list/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar-4.4.0/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.4.0/packages/interaction/main.js'></script>
<script src='/resources/fullcalendar-4.4.0/packages/daygrid/main.js'></script>
<script src='/resources/fullcalendar-4.4.0/packages/timegrid/main.js'></script>
<script src='/resources/fullcalendar-4.4.0/packages/list/main.js'></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

	


    <!-- moment -->
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script> 
	



    <!-- icon 사용-->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <!-- script -->


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
        
          <div id="calendar"  style="position: relative">  </div>
          
          <!-- 모달 -->
           <div class="modal">
           <div class="modal-top">
               <h1>클래스 예약</h1>
               <hr>
           </div>
           <div class="modal-content">
               <form method="post">
                
                <div class="name">
                     <span class="first">클래스 이름 : </span> <input type="text" class="className" name="className" placeholder="클래스이름" readonly>
                </div><br>
                <div class="creator">
                      <span class="first">클래스 개설자 : </span> <input  type="text" class="classCreator" name="classCreator" placeholder="클래스개설자" readonly>
                </div><br>
                        <div class="description">
                                         <span class="first" style="text-align: center;">클래스 설명 </span> 
               <input type="text" name="classDescription" class="classDescription" placeholder="음식디미방 전통주(감향주 등) 만들기체험" readonly>
                  
                 </div><br>
                 
                 <div class="person">
                     <span class="first">인원 : </span><input type="number" class="classPerson" min="1" max="15" name="classPerson" placeholder="1" >
                 </div><br>
                  <div class="price">
                       <span class="first">클래스 참가비 : </span><input type="text"class="classPrice" name="classPrice"placeholder="20000" readonly>
                  </div><br>

                     <div class="date">
                         <span class="first">예약일</span><input type="text"  class="classDate"name="classEnroll" placeholder="2020-02-24" readonly>
                     </div><br>
                     
                     
               <br>
                      <div class="btnGroup">
                             <input type="button" id="payBtn" value="예약">
                   			<input type="button" value="취소">
                      </div>
                  
               </form>
           </div>
       </div>
        
    
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

<script>

 /* 결제   */
  $(function(){
	
	$("#payBtn").click(function(){
		var person=$('input[name=classPerson]').val();
		var title=$('input[name=className]').val();
		  var sessionNo='<%=session.getAttribute("sessionNo")%>';
		  console.log("k:"+k);
		$.ajax({
				
				url:"checkPerson.sool",
				type:"POST",
				dateType:'json',
				async:false, 
				data:{
					sessionNo:sessionNo,
					person:person,
					title:title,
					classNo:k
				},
				success:function(data){
			
					if(data.msg=="가능 인원이 초과입니다."){
						alert(data.msg+data.person+"명 만 가능합니다.");
						location.href="/reservation.sool"
					}
					
				},
				error:function(request, status, error){
					console.log("error code : "+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					
				}
			})
	
		
		
		var title=$('input[name=className]').val();
	
		var id='<%=session.getAttribute("sessionId")%>';
		console.log("session: "+id);
		var name='<%=session.getAttribute("sessionName")%>';
		console.log("name : "+name);
		var email='<%=session.getAttribute("sessionEmail")%>';
		var phone='<%=session.getAttribute("sessionPhone")%>';
		var addr='<%=session.getAttribute("sessionAddr")%>';
		var price=100;
		console.log("price : "+price);
		var d = new Date();
		var date = d.getFullYear() + '' + (d.getMonth() + 1)
				+ '' + d.getDate() + '' + d.getHours() + ''
				+ d.getMinutes() + '' + d.getSeconds();
		
		IMP.init('imp16593684');
		IMP.request_pay({
			merchant_uid : 'soolZari' + date,//상점거래ID
			name : name+"-"+'클래스 결제', //결제이름
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
			        var eventDB=getEvents();
		
			        for(var i=0; i<eventDB.length; i++){
			        
			        if(eventDB[i].title==title && eventDB[i].id==k){
			          	setClassDB(eventDB[i].id,person);
			        }
			      
			        }
			  	  	
			        alert(msg);
			    
			}else{
				var msg='결제 실패하셨습니다';
				  msg += '에러내용 : ' + rsp.error_msg;
				  alert(msg);
			}
		})
		
		
	})
	  
  })
  




   

$(function(){
	
	$(".fc-past").text('예약불가');
	$(".fc-today").text('예약불가');
	//$(".fc-future").append(("<a href="#">test</a>"));
	$("input[type=number]").change(function(){
		var person=$(this).val();
		console.log("person : "+person);

		console.log("price : "+price);
		var amount=price*person;
		console.log("amount: "+amount);
		
		$(".classPrice").val(amount);
	})
	 
});



</script>
 
 <script>
 var price;
 	function getInput(info){
		console.log("getInput");
		  var session='<%=session.getAttribute("sessionNo")%>';
		  
			console.log("k : "+k);
			  var eventDB=getEvents();
			console.log(eventDB);
			  var date = new Date();
				var today=dateFormat(date);
 		console.log(today);
 		var title=info.event.title;
 	
 		var creator;
 		var description;
 		console.log("title : "+title);
 		console.log(eventDB.length);
 		
 		
 		for(var i=0; i<eventDB.length; i++){
 			if(title==eventDB[i].title){
 				price=eventDB[i].price;
 				description=eventDB[i].description;
 				$.ajax({
 					
 					url:"findSeller.sool",
 					type:"POST",
 					dateType:'json',
 					async:false, 
 					data:{
 						selNo:eventDB[i].creator
 					},
 					success:function(data){
 						console.log("findSeller");
 						creator=data;
 					},
 					error:function(error){
 						alert(error);
 					}
 				})
 			
 			
 				
 			}
 		}
 		
 	 
 	 	console.log("price : "+price);
 	 	$(".classPerson").val('1');
 	 	$(".className").val(info.event.title);
 	 	$(".classDate").val(today);
 	 	$(".classPrice").val(price);
 	 	$(".classCreator").val(creator);
 	 	$(".classDescription").val(description);
 	}
 	
 	function dateFormat(data){
 		
 		var yyyy=data.getFullYear();
 		var MM=data.getMonth()+1;
 		MM = MM >= 10 ? MM : '0' + MM;  //month 두자리로 저장
 		var dd=data.getDate();
 		dd = dd >= 10 ? dd : '0' + dd;          //day 두자리로 저장
 		var rtnDate=yyyy+'-'+MM+'-'+dd;
 		return rtnDate;
 	}
 	
 	/* 모달창 취소*/
 	 $("input[type=button]").click(function(){
 		   
 		 $('.modal').modal("hide");
 	   });
 	
 	
 </script>


<script>

	
var i=0;


	function setClassDB(eventDB, person){
	  var session='<%=session.getAttribute("sessionNo")%>';
		console.log("session: "+session);
	  console.log("setClass");
	  var realClassNo;
	  var date = new Date();
		var today=dateFormat(date);
		console.log(today);
	  console.log(eventDB);
		$.ajax({
			url:"setClassListDB.sool",
			type:"POST",
			//dateType:'json',
			async:false,
			data:
				{
				eventDB:eventDB,
				session:session,
				person:person,
				today:today
				},
			success:function(data){
			console.log("data : "+data) //이런식으로 하면 안뜬다. 왜냐하면 "data :" 를 붙이면 javascrtip에서 string형으로 변환시킴
				console.log(data);
				console.log(data.length);
				
			},
			error:function(error){
				console.log(error);
			}
	
		})
}
	function getEvents(){
		
		var title ,start , classDate;
		var classInfo=[];
		var classNo, classStart, price;
		var description, person, creator ,selNo;
		$.ajax({
			url:"getClassDB.sool",
			type:"POST",
			dateType:'json', //이렇게 하면 객체를 return 하면 다른곳에서 받을수있다. 동기식으로 처리되는ㄴ 자바스크립트라면 반드시 이 getEvents()가 끝나고 classInfo를 리턴하고 다음 로직을 처리했을텐데
			  //하지만 Ajax는 기본적으로 비동기식 처리방식이므로 Ajax 호출이 서버에서 응답받는데에 아무리 빨리 받아도 다음로직을 실행하기 전에 받을수 있다고 확신x 
			  //async:false를 통해서 동기식 방식으로 설정하면 이제 ajax를 호출하여 서버에서 응답을 기다렸다가 응답을 모두 완료한 후 다음 로직을 싱행하므로 undefined가 뜨지않고 객체를 return할수있다.
			async:false, 
			success:function(data){
				//console.log("data : "+data) 이런식으로 하면 안뜬다. 왜냐하면 "data :" 를 붙이면 javascrtip에서 string형으로 변환시킴
				
			console.log(data);
					for(var i=0; i<data.length; i++){
					classInfo[i]={
							title:data[i].className,
							id:data[i].classNo,
							person:data[i].classPerson,
							date:data[i].classDate,
							time:data[i].classStartTime,
							description:data[i].classDescription,
							creator:data[i].classCreator,
							price:data[i].classPrice,
							color:'#4d5075',
							start:data[i].classDate+"T"+data[i].classStartTime,
							}
				
					}
				
				
					
			},
			error:function(error){
				console.log(error);
			}
			
			
	
		})

		return classInfo;
	
	}



	var k=0;
  document.addEventListener('DOMContentLoaded', function() {
	  console.log("hi");
	  var eventDB=getEvents();
    var calendarEl = document.getElementById('calendar');

    var date = new Date();
    var date1 = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
      initialView: 'dayGridMonth',
      header: {
        left: '',
        center: 'prev,title,next',
        right: ''
      },
      
      locale:"ko",
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit:true,
      selectable:true,
      //hiddenDays:[ 0, 6 ],

      dateClick:function(info){
    	  var myDate= moment().format('YYYY-MM-DD');
    	  var clickDate=info.dateStr;
    	  if(clickDate <= myDate){
    		  
    		  alert("예약불가");
    	  }
    	
      },
    	events:eventDB,
    	datesRender:function(){
    	 	$(".fc-past").text('예약불가');
    		$(".fc-today").text('예약불가');
    	},
    	eventClick:function(info){
    	
    		 var session='<%=session.getAttribute("sessionId")%>';
   
    		if(session=="null"){
    			alert('로그인 후 예약가능합니다');
    			location.href="/login.sool";
    		}else{
    			  var session='<%=session.getAttribute("sessionNo")%>';
    			  var classNo=0;
    				classNo=info.event.id;
    				k=info.event.id;
   
    			$.ajax({
    				url:"checkUser.sool",
    				type:"POST",
    				//dateType:'json',
    				async:false,
    				data:
    					{
    					classNo:classNo,
    					session:session,
    					},
    				success:function(data){
    					console.log("data : "+data) //이런식으로 하면 안뜬다. 왜냐하면 "data :" 를 붙이면 javascript에서 string형으로 변환시킴
    					
 
    					if(data.msg=="예약 가능합니다."){
    						console.log("hihihihii");
    						$('.modal').modal("show");
        	        		getInput(info);
    					}else{
    						alert(data.msg);
    					}
    				},
    				error:function(error){
    				
    					console.log(error);
    				}
    			
    			})

    		}
    	
    	}
    	
    	/*
    	businessHours: {
    		  // days of week. an array of zero-based day of week integers (0=Sunday)
    		  daysOfWeek: [1, 2, 3, 4,5], // Monday - Thursday
    		  startTime: "10:00", // a start time (10am in this example)
    		  endTime: "18:00" // an end time (6pm in this example)
    		},
    		selectConstraint: "businessHours",
    		*/
      
      
    });

    calendar.render();
  });
  

 
  

</script>