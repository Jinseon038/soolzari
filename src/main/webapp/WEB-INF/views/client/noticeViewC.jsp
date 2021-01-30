<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="/resources/css/noticeViewClient.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section>
        <h1 class="noticetitle">공지사항</h1>
        <table class="notice">
            <tr>
                <th>제목</th>
                <td colspan="3">${n.noticeTitle}</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${n.noticeWriter}</td>
                <th>작성일</th>
                <td>${n.noticeEnroll}</td>
            </tr>
<%--             <tr>
                <th>첨부파일</th>
                <c:if>
                    <td>
                        <img src="/resources/image/file.png" width="16px">
                        <a href="#">${filename}</a>
                    </td>
                </c:if>
            </tr> --%>
            <tr>
                <td colspan="4" class="noticeContent">${n.noticeContent}</td>
            </tr>
        </table>
        <button id="list">목록</button>
       	<c:if test="${nc.nextNo != 0 }">
       		<div id="next"><img src="/resources/image/arrowu.png"><span>next</span><a href="/notice/viewClient.sool?noticeNo=${nc.nextNo }">${nc.nextTitle }</a></div>
       	</c:if>
        <c:if test="${nc.prevNo != 0 }">
        	<div id="prev"><img src="/resources/image/arrowd.png"><span>prev</span><a href="/notice/viewClient.sool?noticeNo=${nc.prevNo }">${nc.prevTitle }</a></div>
        </c:if>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
        $("#list").click(function(){
            location.href="/notice/listClient.sool?reqPage=1";
        });
        $("#prev").click(function(){
        	location.href="/notice/viewClient.sool?noticeNo=${nc.prevNo }";
        });
        $("#next").click(function(){
        	location.href="/notice/viewClient.sool?noticeNo=${nc.nextNo }";
        });
    </script>
</body>
</html>