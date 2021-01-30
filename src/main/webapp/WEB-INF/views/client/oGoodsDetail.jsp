<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"/> --%>
<meta charset="UTF-8">
<title>상품 상세보기</title>
</head>
<style>
   #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
    
   .commentList-ul{
    	list-style:none;
    }
	li{
		list-style:none;
	}
	.result-li textarea{
		width:450px !important;
		height:50px !important;
		margin-top:15px;
	}
	
	.name a{
		text-decoration:none;
		color:black;
	}
	.name a:hover{
	text-decoration:none;
		color:black;
	}
	
	.rotate{
      transform: rotate(180deg);
   }
</style>
<body>
<link rel="stylesheet" type="text/css" href="/resources/css/oGoodsDetail.css">
<div class="wrap2">
	<%-- <div id="main_container">
    	<div id="main_content">
			<jsp:include page="/WEB-INF/views/client/oGoodsDetailFrm.jsp"/>
		</div>
	</div> --%>
	<div class="mainContent">
		<a name="mainGo"/>
		<div class="mainImg">
			<img src="/resources/upload/${gsd.filepath }">
		</div>
		<hr>
		<div class="detailContent">
			<div>
				<img src="/resources/upload/${gsdGD.filepath }">
			</div>
		</div>
				<div class="reviewContent" >
			<a name="reviewGo"/>
				<c:if test="${sessionId!=null }">
			<div class="glTitle">
                          <span style="font-size:25px;">댓글</span>
            	<hr width="800px" align="left">
            </div>
       <div class="gl">
            	<!-- 댓글 입력하는 창 -->
            	  <span style="font-size:18px;">평점 :</span> <p id="star_grade" style="display:inline-block;">
	            	<a href="#">★</a>
	            	<a href="#">★</a>
	            	<a href="#">★</a>
	            	<a href="#">★</a>
	            	<a href="#">★</a>


	            </p>
	            <span id="rateCount"> </span>
	            <div class="inputComment">
		            <form action="/insertComment1.sool" method="post" onsubmit='return check()'>
		
			            <input type="hidden" name="goodNo" value="${goodNo}"> <!-- 스룹스터디no -->
			            <input type="hidden" name="commentWriter" value="${sessionNo}"> <!-- 작성자 -->
			            <input type="hidden" name="commentWriterName" value="${sessionName}"> <!-- 작성자 -->
			          	<input type="hidden" id="commentRate" name="commentRate">
			            <textarea class="form-control rowCheck" name="commentContent" style="resize: none; width: 65%; display: inline-block; outline: none;" maxlength="65" required="required"></textarea> 
			            <button type="submit" class="btn btn-success btn-lg endDayCheck" style="background-color: #4d5075; color:white; border:none; margin-bottom:50px; margin-left:10px;">등록</button>
		            </form>
	            </div>
	            </div> 
	            </c:if>
	             		    <div id="commentScrollDiv" style="width: 74%;">
	            <!-- 전체 댓글 출력 및 본인 댓글 수정 / 삭제 -->
	             <h4 style="font-size:20px;">댓글 리스트
	             	<c:if test="${!empty reviewList}">
	             		   <span class="toggle-review"><i class="fas fa-sort-down" width="20" style="transition-duration:0.2s;"></i></span>
	             	</c:if>
	             </h4>
	        
	               <ul class="commentList-ul" style=" width:110%; padding:0px 15px;" >
	          
	              	<c:forEach items="${reviewList}" var="r">
	   
	            		<li class="result-li" style="width:96%;  border:1px solid lightgrey; border-radius:15px 15px 15px 15px; padding:10px 15px; margin-bottom:8px;" >
	            			<div class="name" style=" width:100%;">
	            			       
			                     	<p id="commentWriterP" style="margin: 0; font-size:18px;">${r.commentWriterName}<span><c:forEach var="i" begin="1" end="${r.commentRate }">	<a href="#" style="color:orange;">★</a></c:forEach></span></p>
			                            		<input type="hidden" name="reviewNo" value="${r.reviewNo}">
			                        <textarea name="commentContent" class="form-control changeComment" style="resize: none; display:inline-block;"  required="required" onfucs="this.value=this.value;" >${r.commentContent }</textarea>
			           
			             		<c:if test="${r.commentWriter eq sessionScope.sessionClient.clientNo }">
			                    		<a href="javascript:void(0)" onclick="modify(this,${r.reviewNo})">수정</a>
			                    <a href="javascript:void(0)" onclick="delete1(this,${r.reviewNo})">삭제</a>
			                  
			                    	</c:if>
			                     </div> 
			          
	            		         
			                   
			                 
			                    
			                    	
			                 </li> 
			  
	           
	                </c:forEach>
	                 </ul>
       </div>
             </div>
		
	</div>
	<div class="fixContent">
		<form action="/client/basketInsert.sool" method="post">
			<h4><p class="fundName">${gsd.gdsName }</p></h4>
			<h4 class="gh4"><span class="goodsPrice comma">${gsd.gdsPri }</span> 원</h4>
			<table class="table fixTable">
				<tr>
					<th>등록일</th>
					<td>${gsd.goodsDate }</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>2,500원</td>
				</tr>
				<tr>
					<th>수량</th>
					<td>
						<button type="button" class="btn btn-outline-secondary btn-sm mi" onclick="plusMinusBtn(this,0);">-</button>
						<span class="basCnt">1</span>
						<button type="button" class="btn btn-outline-secondary btn-sm pl"  onclick="plusMinusBtn(this,1);">+</button>
					</td>
				</tr>
			</table>
			<hr style="width: 90%;">
			<div class="totalWrap">
				<div class="totalDiv1">총 상품금액</div>
				<div class="totalDiv2"><h3 class="totalPrice comma">0</h3>원</div>
			</div>
			<div class="btnDiv">
				<button type="button" class="btn btn-lg basketBtn">장바구니 담기</button> 
				<button type="button" class="btn btn-lg paymentBtn">구매하기</button> 
			</div>
			<div class="aTarget">
				<a href="#mainGo" class="mainGo at">상품 상세</a> 
				<a href="#reviewGo" class="reviewGo at">상품 후기 보기</a>
			</div>
			
		</form>
	</div>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
	$(function(){
		$(".goodsPrice").html(commaSet($(".goodsPrice").html()));
		$(".totalPrice").html($(".goodsPrice").html());
	})

	//플러스 마이너스 버튼
	function plusMinusBtn(btnType,chk){
		//마이너스버튼을 눌렀는지 플러스버튼을 눌렀는지 체크
		var basCnt = null;
		if(chk==0){
			basCnt = $(btnType).next().html();
		}else{
			basCnt = $(btnType).prev().html();
		}
		console.log(basCnt);
		if((basCnt>1 || chk==1) && (basCnt<99 || chk==0)){
			if(chk==0){
				$(btnType).next().html($(btnType).next().html()-1);
				totalPrice();//수량이 변할때마다 총상품금액 변동
			}else{
				$(btnType).prev().html(Number($(btnType).prev().html())+1);
				totalPrice();//수량이 변할때마다 총상품금액 변동
			}
		}else if(basCnt<=1){
			alert("최소 1개 이상 구매가 가능합니다");
		}else if(basCnt>=99){
			alert("최대 99개까지 구매가 가능합니다");
		}
	}
	
	//수량이 변할때마다 총상품금액 변동
	function totalPrice(){
		var goodsPrice = Number("${gsd.gdsPri }");
		var basCnt = Number($(".basCnt").html());
		$(".totalPrice").html(commaSet(goodsPrice*basCnt));
	}
	
	//금액단위 콤마 구분
	function commaSet(price) {
		var str = String(price);
		let price1 = str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return price1;
	}
	//콤마 제거
	function commaReset(price){
		var str = String(price);
		let price1 = str.replace(/[^\d]+/g, "");
		return price1;
	}
	
	//장바구니에 담기 버튼
	$(".basketBtn").click(function(){
		location.href="/client/basketInsert.sool?cliNo=${sessionScope.sessionClient.clientNo}&gdsNo=${gsd.gdsNo}&basCnt="+$(".basCnt").html()+"&gdsRate=${gdsRate}";
	})
	//바로 구매하기버튼
	$(".paymentBtn").click(function(){
		location.href="/client/paymentShow.sool?gdsNo=${gsd.gdsNo}&gdsLCnt="+Number($(".basCnt").html());
	})
</script>



<script>
	function check(){
		
		var rate=$("#commentRate").val();
		if(rate==0){
			alert('별점을 체크해주세요.');
			return false;
		}else{
			return true;
		}
	}
	
var count=0;
        $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            count=$('#star_grade a.on').length-1;
            $("#rateCount").html(count+"점");
            $("#commentRate").val(count);
            console.log(count);
            return false;
        });
        
        $(".toggle-review").click(function(){ //리뷰 div 토글
            $(".commentList-ul").slideToggle('600');
            $(".toggle-review").children().toggleClass('rotate');
         });
        
  function modify(obj,reviewNo){
        	console.log(obj);
        	console.log(reviewNo);
        	var tx=$(obj).prev();
        	tx.focus();
        	tx.val(tx.val()+' ');  //textarea 글끝으로 커서 보내기
        	$(obj).html('수정완료');
        	$(obj).attr('onclick','modifyComplete(this,"'+reviewNo+'")');
        	$(obj).next().html('수정취소');
        	$(obj).next().attr('onclick','modifyCancel(this)');
        	
        }
  
  function delete1(obj,reviewNo){
	  console.log("delete");
	  var content=$(obj).prev().prev().val();
	  console.log(content);
	  $.ajax({
	  		
	  		url:"/deleteComment.sool",
	  		type:"POST",
	  		data:{
	  			reviewNo : reviewNo,
	  			commentContent :content
	  		},
	  		dataType:"json",
	  		
	  		success:function(data){
	  			console.log(data);
	  			
	  			alert(data.msg);
	  			location.reload();
	  		},
	  		error:function(error){
	  			console.log(error);
	  		}
	  		
	  	});
	  
	  
  }
  
  function modifyComplete(obj, reviewNo){
	  console.log("수정완료");
	  console.log("수정완료 : "+obj);
	  console.log(reviewNo);
	  var content=$(obj).prev().val();
	  console.log(content);
	  $.ajax({
  		
  		url:"/modifyComment.sool",
  		type:"POST",
  		data:{
  			reviewNo : reviewNo,
  			commentContent :content
  		},
  		dataType:"json",
  		
  		success:function(data){
  			console.log(data);
  			alert(data.msg);
  			$(obj).prev().val(content);
  			$(obj).html('수정');
  			$(obj).attr('onclick','modify(this,"'+reviewNo+'")');
  			$(obj).next().html('삭제');
  			$(obj).next().attr('onclick','delete');
  			location.reload();
  			console.log(data);
  		},
  		error:function(error){
  			console.log(error);
  		}
  		
  	})
  }
  
  function modifyCancel(obj){
	  console.log("cancel");
  	var tx=$(obj).prev().prev();
  
  	tx.focusout();

  	$(obj).html('삭제');
  	$(obj).attr('onclick','delete');
  	$(obj).prev().html('수정');
  	$(obj).prev().attr('onclick','modify');
  	location.reload();
	  
  }
      
      
        $(".modifyComplete").click(function(){
        	console.log("수정완료");
			var reviewNo=$(this).prev().prev().val();
			console.log(reviewNo);
        	var content=$(".changeComment").val();
      	
        })
      
        
</script>
</body>
</html>