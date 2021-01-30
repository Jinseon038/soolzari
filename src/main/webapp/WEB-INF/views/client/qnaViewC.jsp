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
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
					<table>
						<tr>
				            <th>답변</th>
				            <td class="qrvBefore">답변 전</td>
				        </tr>
				        <tr>
				            <td colspan="2"><textarea name="qrvContent" readonly></textarea></td>
				        </tr>
				    </table>
				</c:when>
				<c:otherwise>
				    <table>
				        <tr>
				            <th>답변</th>
				            <td class="qrvAfter">답변 완료<label>${qrv.qrvEnroll}</label></td>
				        </tr>
				        <tr>
				            <td colspan="2"><textarea name="qrvContent" readonly>${qrv.qrvContent }</textarea></td>
				        </tr>
				    </table>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
</body>
</html>