<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
	<%--view/header.jsp --%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<c:set var="id" value="${memberDto.id }" scope="session"/>

<table id="header" style="width:100%; min-width:70%">
<tr>
	<td align="right" colspan="3">
	<c:choose>
	<c:when test="${id ne null}">
		<a href="list.do" style="text-decoration: none; color:#ffffff;"> 
		홈으로 가기 
		</a>
		
		<a href="list.do" style="text-decoration: none; color:#ffffff;" >게시판</a>
		<a href="logOut.do" style="text-decoration: none; color:#ffffff;">로그아웃</a>
		<a href="loginSuccess.do" style="text-decoration: none; color:#ffffff;">마이페이지</a>
		
		</c:when>	
	
	<c:when test="${id eq null}">
	<a href="list.do" style="text-decoration: none; color:#ffffff;"> 
		홈으로 가기 
		</a>
		
		<a href="list.do" style="text-decoration: none; color:#ffffff;" >게시판</a>
		<a href="login.do" style="text-decoration: none; color:#ffffff;">로그인</a>
		<a href="insertForm.do" style="text-decoration: none; color:#ffffff;">회원가입</a>
	</c:when>
	</c:choose>
	
	</td>
</tr>
</table>
 


<!-- <table id="header" style="width:100%; min-width:70%">
<tr>
	<td align="right" colspan="3">
		<a href="list.do" style="text-decoration: none; color:#ffffff;"> 
		홈으로 가기 
		</a>
		
		<a href="list.do" style="text-decoration: none; color:#ffffff;" >게시판</a>
		<a href="login.do" style="text-decoration: none; color:#ffffff;">로그인</a>
		<a href="loginSuccess.do" style="text-decoration: none; color:#ffffff;">마이페이지</a>
		
	</td>
</tr>
</table>
	 -->
	<!-- 
	
	<h2 align="center">
		<a href="/tilestest/" style="text-decoration: none;"> 
		홈으로 가기 ( 패키지 마지막 이름) => 
		프로젝트이름=마지막패키지이름=컨텍스트이름 </a>
	</h2>
	
	
	 -->

</body>
</html>