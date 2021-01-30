<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
	<link href="/resources/css/noticeFrm.css" rel="stylesheet" type="text/css">
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/navi.jsp"/>
	<section class="frm">
        <div class="wrap">
            <h1>공지사항</h1>
            <form action="/notice/insert.sool" method="post" enctype="multipart/form-data">
                <table class="notice">
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="noticeTitle" placeholder="제목을 작성해주세요"></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td><input type="text" name="noticeWriter" readonly value="${sessionScope.sessionId}"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><textarea name="noticeContent" id="summernote"></textarea></td>
                    </tr>
                </table>
                <div class="btnwrap">
                    <button type="button" id="list">목록</button>
                    <div class="inputbtn">
                        <button type="submit">등록</button>
                        <button type="button"><a href="javascript:history.go(-1)" style="text-decoration:none; color:white">취소</a></button>
                    </div>
                </div>
            </form>
        </div>
    </section>
    
    <script>
        $(document).ready(function() {
            $("#list").click(function(){
               location.href="/notice/list.sool?reqPage=1"; 
            });
            $("[type=submit]").click(function(event){
            	if($("[name=noticeTitle]").val() == ""){
            		alert("제목을 작성해주세요");
            		event.preventDefault();
            	}else if($("textarea").val() == ""){
            		alert("내용을 작성해주세요");
            		event.preventDefault();
            	}
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
                placeholder: "* 관리자만 공지사항 작성 *",
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