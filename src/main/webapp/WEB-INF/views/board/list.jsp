<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
body{
background-color: #fffafa;
}
a{
text-decoration: none;
color:blue;
}
a:hover{
color:red;
}
</style>

</head>
<body align="center">
<c:set var="id" value="${memberDto.id }" scope="session"/>


<center><b>글목록(전체 글:${count })</b></center>

<table width="70%" align="center">

<tr>
	<td align="right" bgcolor="#c8c8ff">
	<font color="blue">
	<a href="writeForm.do">글쓰기</a>
	</font>
	</td>
</tr>
</table>

<c:if test="${count==0}">
	<table width="70%" border="1" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td align="center">
		게시판에 저장된 글이 없습니다
		</td>
	</tr>
	</table>
</c:if>

<c:if test="${count > 0}">
	<table width="70%" border="1" cellpadding="0" cellspacing="0" align="center">
	<tr height="30">
		<td align="center">번  호</td>
		<td align="center">제  목</td>
		<td align="center">작성자</td>
		<td align="center">작성일</td>
		<td align="center">조  회</td>
		<td align="center">IP</td>
	</tr>
	
	<c:forEach var="dto" items="${list}">
	<tr height="30">
		<td align="center" width="50">
			<c:out value="${number}"/>
			<c:set var="number" value="${number-1}"/>
		</td>
		
		<td>
			 <c:if test="${dto.re_level > 0 }">
		 	  <img src="resources/imgs/level.gif" width="${5*dto.re_level }" height="16">
		 	  <img src="resources/imgs/re.gif">
		 	 </c:if>
		 	 
		 	 <c:if test="${dto.re_level == 0 }">
		 	  <img src="resources/imgs/level.gif" width="${5*dto.re_level }" height="16">
		 	 </c:if>
		 	 
		 	 <a href="content.do?num=${dto.num}&pageNum=${currentPage}">
		 	 	${dto.subject }
		 	 </a>
		 	 
		 	 <c:if test="${dto.readcount >= 20 }">
		 	 	<img src="resources/imgs/hot.gif" border="0" height="16">
		 	 </c:if>
		</td>
		
		<td align="center">
			<a href="matilto:${dto.email}">${dto.writer}</a>
		</td>
		
		<td align="center">
			<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/>
		</td>
		
		<td align="center">${dto.readcount}</td>
		<td align="center">${dto.ip}</td>
	</tr>
	</c:forEach>
	</table>
</c:if>

<%--블럭처리,페이지 처리 --%>
<c:if test="${count >0}">
	<!-- 
	<c:set var="cnt" value="${count%pageSize==0?0:1}"/>
	<c:set var="pageCount" value="${count/pageSize+cnt}"/>
	<c:set var="pageBlock" value="${10}"/>
	 -->
	 
	 <!-- 
	 currentPage 0,1,2,3,4,5,6,7,8,9
	 
	 정수/정수=정수(몫)
	 1/10=0
	 2/10=0
	 3/10=0
	...
	 8/10=0
	 9/10=0
	 10/10=1
	 currentPage-1 그래서 -1을 해주었다
	 currentPage가 10일때  11페이지로 이동하기 때문에
	  -->
	
	<fmt:parseNumber var="result" value="${(currentPage-1)/10}" integerOnly="true"/>
	<c:set var="startPage" value="${result * 10 +1 }"/>
	<c:set var="endPage" value="${startPage + pageBlock-1 }"/>
	
	<!-- 에러 방지 -->
	<c:if test="${endPage > pageCount }">
		<c:set var="endPage" value="${pageCount}"></c:set>
	</c:if>
	
	<center>
	<!-- 이전블럭 -->
	<c:if test="${startPage > 10 }">
		<a href="list.do?pageNum=${startPage-10}">[이전블럭]</a>
	</c:if>
	
	<!-- 페이지 처리 -->
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="list.do?pageNum=${i}">[${i}]</a>
	</c:forEach>
	
	<!-- 다음블럭 -->
	<c:if test="${endPage < pageCount }">
		<a href="list.do?pageNum=${startPage+10}">[다음블럭]</a>
	</c:if>
	</center>
	
</c:if>




</body>
</html>