<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
  <%--  프로젝트이름=마지막패키지이름 --%>
<%-- EL,JSTL 세션설정 --%>
<c:set var="id" value="${memberDto.id }" scope="session"/>

<c:if test="${id ne null}">
<a href="list.do" style="text-decoration: none; text-align:center; color:#000000;">게시판</a><br>
<a href="logOut.do" style="text-decoration: none; text-align:center; color:#000000;">로그아웃</a><br>
<a href="loginSuccess.do" style="text-decoration: none; text-align:center; color:#000000;">마이페이지</a><br>
</c:if>
<c:if test="${id eq null}">
<a href="list.do" style="text-decoration: none; text-align:center; color:#000000;">게시판</a><br>
<a href="login.do" style="text-decoration: none; text-align:center; color:#000000;">로그인</a><br>
<a href="insertForm.do" style="text-decoration: none; text-align:center; color:#000000;">회원가입</a>
</c:if>
	<%--
	
	views/member/insertForm.jsp 작성
	회원가입폼
        views/board/list.jsp 작성
	게시판

	 --%>


</body>
</html>