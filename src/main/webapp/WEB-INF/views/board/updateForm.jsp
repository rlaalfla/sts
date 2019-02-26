<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
body{background-color: #fffafa;}
a:link{text-decoration:none;color:blue;}
a:hover {color:red;}
</style>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 썸머노트 -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<script type="text/javascript">
$(document).ready(function() {
   $('#content').summernote({
      height:300,
      minHeight:null,
      maxHeight:null,
      focus:true,
      lang:'ko-KR'
   });
});
</script>

 <script type="text/javascript">
 function check(){
	 
	 if($('#writer').val()==''){
		 alert("writer를 입력하시요");
		 $('#writer').focus();
		 return false;
	 }
	 if($('#content').val()==''){
		 alert("글내용를 입력하시요");
		 $('#content').focus();
		 return false;
	 }
	 return true;
 }
 </script>
</head>
<body>

 <h2 align="center">글수정</h2> 
 <form method="post" name="writeform" action="updatePro.do?pageNum=${pageNum}" onSubmit="return check()">
 
 <table width="70%" border="1" cellspacing="0" cellpadding="0" align="center">
	
	<tr>
		<td width="70"  bgcolor="#c8c8ff" align="center">이 름</td>
		<td align="left" width="330">
			<input type="text" size="10" id="writer" name="writer" value="${boardDto.writer}">
			<input type="hidden" name="num" value="${boardDto.num}">
			</td>
	</tr>
	
	<tr>
		<td  width="70"  bgcolor="#c8c8ff" align="center" >제 목</td>
		<td align="left" width="330">
			<input type="text" size="40" id="subject" name="subject" value="${boardDto.subject}"></td>
	</tr>
	<tr>
		<td  width="70"  bgcolor="#c8c8ff" align="center">Email</td>
		<td align="left" width="330">
			<input type="text" size="40" id="email" name="email" value="${boardDto.email}"></td>
	</tr>
	<tr>
		<td  width="70"  bgcolor="#c8c8ff" align="center">내 용</td>
		<td align="left" width="330">
			<textarea id="content" name="content" rows="13" cols="40">${boardDto.content}</textarea></td>
	</tr>
	<tr>
		<td  width="70"  bgcolor="#c8c8ff" align="center">비밀번호</td>
		<td align="left" width="330">
			<input type="password" id="passwd" name="passwd" size="8">
		</td>
	</tr>
	<tr>      
		<td colspan=2 bgcolor="#c8c8ff" align="center">
			<input type="submit" value="글수정"> 
			<input type="reset" value="다시작성">
			<input type="button" value="목록보기" onclick="document.location.href='list.do?pageNum=${pageNum}'">
		</td>
		</tr>
	</table>
 
 </form>
 
</body>
</html>