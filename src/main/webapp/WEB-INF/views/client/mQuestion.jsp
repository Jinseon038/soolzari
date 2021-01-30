<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/client/mypageFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mQuestion.css">

<div class="wrap2">
	<div class="sideNavi"></div>
	<div class="content">
		<div class="mainContent">
			<div class="listDiv">
				<div class="textRigth"><button class="questionBtn modalBtnDiv" type="button" data-toggle="modal" data-target="#question" style="line-height: 20px;">문의하기</button></div>
				<table class="listTable">
					<tr>
						<th class="th1">문의 제목</th>
						<th class="th2">작성일자</th>
						<th class="th3">답변여부</th>
					</tr>
					<c:choose>
					<c:when test="${fn:length(list) eq 0}">
						<tr>
							<td colspan="3">
								<br><br><br>
								<h4>지난 ${period }개월 동안 작성한 문의사항이 없습니다.</h4>
								<br><br><br>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="qna">
							<tr>
								<td>
									<a href="/qnaViewClient.sool?qnaNo=${qna.qnaNo }&qnaAns=${qna.qnaAns }">
										<p>${qna.qnaName }</p>
									</a>
								</td>
								<td>
									<p>${qna.qnaEnroll }</p>
								</td>
								<td>
									<c:if test="${qna.qnaAns==0 }">
										<p class="ans1">답변대기</p>
									</c:if>
									<c:if test="${qna.qnaAns==1 }">
										<a href="/qnaViewClient.sool?qnaNo=${qna.qnaNo }&qnaAns=${qna.qnaAns }">
											<p class="ans2">답변완료</p>
										</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					<tr>
						<td colspan="3" style="text-align: center;" id="pageNavi">${pageNavi }</td>
					</tr>
					</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	</div>
	
</div>
<!-- Modal -->
  <div class="modal fade" id="question" role="dialog">
    <div class="modal-dialog" id="dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        	<h4 class="modal-title">1:1 문의하기</h4>
          	<button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <form action="/client/mQuestionInsert.sool" method="post">
        <div class="modal-body">
        	제목<br><textarea rows="1" cols="80" style="resize: none;" name="qnaName"></textarea><br>
	       	내용<br>
	        <textarea rows="12" cols="80" style="resize: none;" name="qnaCon"></textarea>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-default ">문의하기</button>
        </div>
        </form>
      </div>
      
    </div>
  </div>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
	//사이드바 호버
	$(".sideNaviA").hover(function(){
		if(!$(this).is(".a6")){
			$(".a6").css("background-color","white");
			$(".a6").css("color","black");
		}
	},function(){
		$(".a6").css("background-color","rgb(77, 80, 117)");
		$(".a6").css("color","white");
	});

	$(function(){
		$(".subTitle").html("문의 내역");
		$(".giftSel").remove();//선물함 선택 안보이게
		//조회기간별 조회(1,3,6,12개월)
		$(".searchA").eq(0).attr("href","/client/mQuestion.sool?reqPage=1&period=1");
		$(".searchA").eq(1).attr("href","/client/mQuestion.sool?reqPage=1&period=3");
		$(".searchA").eq(2).attr("href","/client/mQuestion.sool?reqPage=1&period=6");
		$(".searchA").eq(3).attr("href","/client/mQuestion.sool?reqPage=1&period=12");
		$(".searchA").each(function(){
			console.log($(this).attr("id"));
			console.log("m${period}");
			if($(this).attr("id")==("m${period}")){
				$(this).addClass("sA1");
			}
		});
	});
	
	//문의하기 줄 수 제한
	$("textarea[name=qnaName]").keyup(function(){
		 var rows = $(this).val().split('\n').length;
	        var maxRows = 1;
	        if( rows > maxRows){
	            modifiedText = $(this).val().split("\n").slice(0, maxRows);
	            $(this).val(modifiedText.join("\n"));
	        }
	});
	//문의하기 줄 수 제한
	$("textarea[name=qnaCon]").keyup(function(){
		 var rows = $(this).val().split('\n').length;
	        var maxRows = 10;
	        if( rows > maxRows){
	            modifiedText = $(this).val().split("\n").slice(0, maxRows);
	            $(this).val(modifiedText.join("\n"));
	        }
	});
</script>
</body>
</html>