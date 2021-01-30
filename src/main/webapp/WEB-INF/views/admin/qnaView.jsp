<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 상세보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="/resources/css/qrv.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/navi.jsp"/>
	<section>
		<h1 class="qnatitle">1:1 문의</h1>
		<table class="qna">
			<tr>
				<th>제목</th>
				<td colspan="3">${qna.qnaName }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${qna.qnaId }</td>
				<th>작성일</th>
				<td>${qna.qnaEnroll }</td>
			</tr>
			<tr>
				<th colspan="4">
					<label>문의사항</label>
					<textarea readonly>${qna.qnaCon }</textarea>
				</th>
			</tr>
		</table>
		<div class="qrv">
			<c:choose>
				<c:when test="${qna.qnaAns == 0 }"><!-- 답변 없는 상태 -->
					<form action="/insertQrv.sool" method="post">
						<input type="hidden" name="qnaNo" value="${qna.qnaNo }">
						<input type="hidden" name="qrvWriter" value="${sessionScope.sessionId }">
						<table>
							<tr>
					            <th>답변</th>
					            <td class="qrvBefore">답변 전</td>
					        </tr>
					        <tr>
					            <td colspan="2"><textarea name="qrvContent">[${qna.qnaId}] 님 문의주셔서 감사합니다.
</textarea></td>
					        </tr>
					    </table>
					    <div class="btnwrap">
					    	<button type="button" id="list">목록</button>
					    	<div class="btns">
					            <button type="submit">등록</button>
						    </div>
					    </div>
					</form>
				</c:when>
				<c:otherwise>
					<form action="/updateQrv.sool" method="post">
					<input type="hidden" name="qnaNo" value="${qna.qnaNo }">
					<input type="hidden" name="qrvNo" value="${qrv.qrvNo }">
					    <table>
					        <tr>
					            <th>답변</th>
					            <td class="qrvAfter">답변 완료<label>${qrv.qrvEnroll}</label></td>
					        </tr>
					        <tr>
					            <td colspan="2"><textarea name="qrvContent">${qrv.qrvContent }</textarea></td>
					        </tr>
					    </table>
					    <div class="btnwrap">
					    	<button type="button" id="list">목록</button>
					    	<div class="btns">
					            <button type="submit">수정</button>
					            <button type="button" id="delete">삭제</button>
						    </div>
					    </div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
	
	<script>
		$(function(){
			$("textarea").focus();
			$("#delete").click(function(){
				var qnaNo = $("[name=qnaNo]").val();
				var qrvNo = $("[name=qrvNo]").val();
				location.href="/deleteQrv.sool?qnaNo="+qnaNo+"&qrvNo="+qrvNo;
			});
			$("#list").click(function(){
				location.href="/qna.sool?reqPage=1";
			});
		});
	</script>
</body>
</html>