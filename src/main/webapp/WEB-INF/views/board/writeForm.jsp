<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
			body{background-color:#fffafa;}
			.list {
			font-family:"맑은 고딕", "돋움", sans-serif;
			font-size:15px;
			}
			.list th {
			border-top:2px solid #fbb9bb;
			border-bottom:1px solid #d0d0d0;
			padding:15px 0;
			}
			.list td {
			border-bottom:1px solid #d0d0d0; 
			padding:10px 0;
			}
			.list a {
			text-decoration:none;
			color:#6c6c6c;
			}
			.list a:hover {color:#f2216b;}
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

</head>
<body>
<c:set var="id" value="${memberDto.id }" scope="session"/>

<c:if test="${id ne null}">
 <h1 align="center">글쓰기 폼</h1>
 <form method="post" name="writeform" action="writePro.do">
 	<input type="hidden" name="pageNum" value="${pageNum }">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name="ref" value="${ref }">
	<input type="hidden" name="re_step" value="${re_step }">
	<input type="hidden" name="re_level" value="${re_level }">
 	
 	<table method="post" width="70%" border="1" cellspacing="0" cellpadding="0" align="center">
			
 	<tr>
		<td align="right" colspan="2" bgcolor="#c8c8ff">
			<font class="list">
				<a href="list.do">글목록</a>
			</font>
		</td>
	</tr>
 	
 	<tr>
		<td bgcolor="#c8c8ff" align="center">이 름</td>
		<td>
			<input type="text" id="writer" name="writer" value="${memberDto.id}" readonly="readonly">
		</td>
	</tr>
 	
 	<tr>
		<td bgcolor="#c8c8ff" align="center">제 목</td>
		<td>
			<c:if test="${num == 0}">
				<input type="text" size="40" maxlength="50" name="subject">
			</c:if>
			
			<c:if test="${num != 0}">
				<input type="text" size="40" maxlength="50" name="subject" value="[답변]">
			</c:if>
		</td>
	</tr>
 	
 	<tr>
		<td bgcolor="#c8c8ff" align="center">Email</td>
		<td>
			<input type="text" size="40" name="email" value="${memberDto.email}">
		</td>
	</tr>
 	
 	<tr>
		<td bgcolor="#c8c8ff" align="center">내용</td>
		<td>
			<textarea class="form-control" id="content" name="content" rows="10" cols="40"></textarea>
		</td>
	</tr>
	
	<tr>
		<td bgcolor="#c8c8ff" align="center">비밀번호</td>
		<td>
			<input type="password" size="8" name="passwd">
		</td>
	</tr>
				
	<tr>
		<td colspan=2 bgcolor="#c8c8ff" align="center">
			<input type="submit" value="글쓰기">
			<input type="reset" value="다시작성">
			<input type="button" value="목록보기" onclick="document.location.href='list.do'">
		</td>
	</tr>
 	
 	</table>
 </form>
 </c:if>
 <c:if test="${id eq null}">
 	<%
 	out.println("<script>alert('로그인해주세요'); location.href='login.do';</script>");
 	%>
 </c:if>
 
</body>
</html>