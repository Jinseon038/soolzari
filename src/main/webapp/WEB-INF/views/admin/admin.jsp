<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자</title>
<link href="/resources/css/admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(userChart);
      google.charts.setOnLoadCallback(goodsChart);
      google.charts.setOnLoadCallback(classChart);
      google.charts.setOnLoadCallback(fundingChart);
      let list;
      function userChart() {//사용자 현황
        var data = google.visualization.arrayToDataTable([
          ['사용자', '사용자 현황'],
          ['일반회원', ${user.client}],
          ['구독 A', ${user.clientA}],
          ['구독 B', ${user.clientB}],
          ['판매자', ${user.seller}]
        ]);

        var options = {
          title: '사용자 현황',
          titleTextStyle: {
        	  fontSize: 20
          },
          pieHole: 0.4,
          colors:['#4d5075','#bca0c9','#f7b8b4','#ffd0bf'],
          fontSize: 16
        };

        var chart = new google.visualization.PieChart(document.getElementById('userChart'));
        chart.draw(data, options);
      }
      
      function goodsChart() {
    	  if(list !== undefined){
    		  var arr = new Array();
        	  arr.push(['월', '탁주', '청주', '증류주', '와인', '과실주', '평균']);
        	  for(var i=0;i<list.length;i++){
            	  arr.push([list[i].month+"월", Number(list[i].takju), Number(list[i].chungju), Number(list[i].soju), Number(list[i].wine), Number(list[i].fruit), Number(list[i].avg)]);
              }
        	  var data = google.visualization.arrayToDataTable(arr);

                var options = {
                  title: '상품 판매량',
                  titleTextStyle: {
                	  fontSize: 20
                  },
                  vAxis: {title: '판매 개수'},
                  hAxis: {title: '월'},
                  seriesType: 'bars',
                  series: {5: {type: 'line'}},
                  colors:['#4d5075','#bca0c9','#f7b8b4','#ffd0bf', 'rgb(251, 220, 173)', 'rgb(215, 109, 119)', 'rgb(254, 180, 123)'],
                  fontSize: 16
                };

                var chart = new google.visualization.ComboChart(document.getElementById('goodsChart'));
                chart.draw(data, options);  
    	  }
    	  
        }
      
      	function classChart() {
          var data = google.visualization.arrayToDataTable([
            ['월', '클래스 예약'],
            ['${pprev}월', ${classes.pprev}],
            ['${prev}월', ${classes.prev}],
            ['${now}월', ${classes.now}],
            ['${next}월', ${classes.next}],
            ['${nnext}월', ${classes.nnext}]
          ]);

          var options = {
        	 title: '클래스 예약 인원 현황',
        	 titleTextStyle: {
           	  fontSize: 20
             },
        	 vAxis: {title: '클래스 예약 인원 수'},
             hAxis: {title: '월'},
             colors: ['#4d5075','#bca0c9','#f7b8b4','#ffd0bf', 'rgb(251, 220, 173)', 'rgb(215, 109, 119)', 'rgb(254, 180, 123)'],
             fontSize: 16
          };

          var chart = new google.visualization.ColumnChart(document.getElementById('classChart'));
          chart.draw(data, options);
        }
      	
      	$(function(){
      		$.ajax({
      			url : "/selectSool.sool",
      			type : "post",
      			success : function(data){
      				list = data;
      				goodsChart();
      			}
      		});
      	});
      	
      	function fundingChart() {
            var data = google.visualization.arrayToDataTable([
              ['펀딩', '달성률'],
              ['100% 이상', ${funding.one}],
              ['80% 이상', ${funding.eight}],
              ['50% 이상', ${funding.five}],
              ['미달성', ${funding.zero}]
            ]);

            var options = {
              title: '펀딩 달성률',
              titleTextStyle: {
            	  fontSize: 20
              },
              pieHole: 0.4,
              colors: ['#4d5075','#bca0c9','#f7b8b4','#ffd0bf', 'rgb(251, 220, 173)', 'rgb(215, 109, 119)', 'rgb(254, 180, 123)'],
              fontSize: 16
            };

            var chart = new google.visualization.PieChart(document.getElementById('fundingChart'));
            chart.draw(data, options);
          }
    </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/navi.jsp"/>
	<section>
	    <div class="main">
	        <img src="/resources/image/logo1.png">
		    <div id="userChart"></div>
		    <div id="goodsChart"></div>
		    <div id="classChart"></div>
		    <div id="fundingChart"></div>
		    <div>
		    	<div class="chart">
			    	<h1 class="chartTitle">${now }월 펀딩 최고 금액</h1>
			    	<h2 class="highlight">${fundTotalMoney } 원</h2>
			    	<h3>${bestFunding.fundName }</h3>
			    </div>
		    	
		    	<div class="chart">
			    	<h1 class="chartTitle">${now }월 가장 많이 팔린 전통주</h1>
			    	<div class="type">
			    		<span>
					    	<c:choose>
					    		<c:when test="${bestGoods.goodsType eq 't' }">
					    			탁주
					    		</c:when>
					    		<c:when test="${bestGoods.goodsType eq 'c' }">
					    			청주
					    		</c:when>
					    		<c:when test="${bestGoods.goodsType eq 's' }">
					    			증류주
					    		</c:when>
					    		<c:when test="${bestGoods.goodsType eq 'f' }">
					    			과실주
					    		</c:when>
					    		<c:when test="${bestGoods.goodsType eq 'w' }">
					    			와인
					    		</c:when>
					    	</c:choose>
				    	</span>
				    	<img src="/resources/image/wine.png">
			    	</div>
			    	<h2 class="highlight bestGoods">${bestGoods.goodsName } - ${bestGoods.buyCount }개</h2>
			    </div>
		    </div>
		    <div>
		    	<div class="chart">
		    		<h1 class="chartTitle" style="margin-top:40px">${now }월 전통주 총 판매 금액</h1>
		    		<h2 class="highlight">${goods.totalPrice } 원</h2>
		    	</div>
		    	<div class="chart">
		    		<h1 class="chartTitle" style="margin-top:-20px">${now }월 전통주 총 판매량</h1>
		    		<h2 class="highlight">${goods.totalSales } 개</h2>
		    	</div>
		    </div>
	    </div>
	</section>
</body>
</html>