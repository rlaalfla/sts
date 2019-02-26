<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginSuccess.jsp</title>
 <script type="text/javascript">
	 function updateUser(){
		 document.updateForm.action="editForm.do";//회원수정
		 document.updateForm.submit();
	 }

	 function deleteUser(){
		 document.deleteForm.action="memberDelete.do";//회원탈퇴 
		 document.deleteForm.submit();
	 }
	 
	 function listUser(){
		 document.listForm.action="list.do";//리스트
		 document.listForm.submit();
	 }

 </script>

</head>
<body>
${memberDto.name }님 저희홈에 오신것을 환영합니다<br>

<%
	//session.setAttribute("id",${memberDto.id});
%>

<%-- EL,JSTL 세션설정 --%>
<c:set var="id" value="${memberDto.id }" scope="session"/>

<a href="javaScript:listUser()">게시판리스트</a>&nbsp;&nbsp;
<a href="javaScript:updateUser()">회원정보수정</a>&nbsp;&nbsp;
<a href="javaScript:deleteUser()">회원탈퇴</a>&nbsp;&nbsp;
<a href="logOut.do">로그아웃</a>

<form method="post" name="updateForm">
    <input type="hidden" id="id" name="id" value="${id}"> 
</form>

<form method="post" name="deleteForm">
   <input type="hidden" id="id" name="id" value="${id}"> 
</form>

<form method="post" name="listForm">
   <input type="hidden" id="id" name="id" value="${id}"> 
</form>

</body>
</html>