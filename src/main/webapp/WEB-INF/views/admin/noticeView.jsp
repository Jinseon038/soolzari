<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<link href="/resources/css/noticeView.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/navi.jsp"/>
	<section class="view">
        <h1 class="noticetitle">공지사항</h1>
        <form action="/notice/update.sool" method="post">
        	<input type="hidden" name="noticeNo" value="${n.noticeNo }">
            <table class="notice">
                <tr>
                    <th>제목</th>
                    <td colspan="3"><input type="text" name="noticeTitle" value="${n.noticeTitle}"></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><input type="text" name="noticeWriter" value="${n.noticeWriter}" class="readonly" readonly></td>
                    <th>작성일</th>
                    <td><input type="text" name="noticeEnroll" value="${n.noticeEnroll}" class="readonly" readonly></td>
                </tr>
                <%-- <tr>
                	<th>첨부파일</th>
	                <c:if test="${image.filename != null }">
	                    <td>
	                        <img src="/resources/image/file.png" width="16px">
	                        <a href="#">${image.filename}</a>
	                    </td>
	                </c:if>
	            </tr> --%>
                <tr>
                    <td><textarea name="noticeContent" id="summernote">${n.noticeContent}</textarea></td>
                </tr>
            </table>
            <div class="btns">
                <button type="button" id="list">목록</button>
                <div class="btn2">
                    <button type="submit">수정</button>
                    <button type="button" id="delete">삭제</button>
                </div>
            </div>
        </form>
    </section>
    
    <script>
        $(document).ready(function() {
            $("#list").click(function(){
               location.href="/notice/list.sool?reqPage=1"; 
            });
            $("#delete").click(function(){
                var noticeNo = $("[name=noticeNo]").val();
                location.href="/notice/deleteNo.sool?noticeNo="+noticeNo;
            });
            $('#summernote').summernote({
                height: 500, // set editor height
                width: 1200,
                focus: true,
                lang: "ko-KR",
                toolbar: [
                    // [groupName, [list of button]]
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                    ['color', ['forecolor','color']],
                    ['table', ['table']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['insert',['picture','link','video']],
                    ['view', ['fullscreen', 'help']]
                  ],
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
                disableResize: true,
                disableResizeEditor: true,
                codeviewFilter: false,
                callbacks: {
                	onImageUpload: function(files, editor, welEditable) {
                        for (var i = files.length - 1; i >= 0; i--) {
                            imageUpload(files[i], this);
                        }
                    }
                }
            });
            function imageUpload(file, editor) {
                var form_data = new FormData();
                form_data.append('file', file);
                $.ajax({
                    data: form_data,
                    type: "POST",
                    url: '/notice/imageUpload.sool',
                    cache: false,
                    contentType: false,
                    enctype: 'multipart/form-data',
                    processData: false,
                    success: function(data) {
                    	console.log(data);
                        $(editor).summernote('editor.insertImage', data);
                    }
                });
            }
        });
    </script>
</body>
</html>