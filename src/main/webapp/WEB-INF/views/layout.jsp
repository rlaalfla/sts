<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 <body bgColor="#fffafa">
	<c:set var="id" value="${memberDto.id }" scope="session"/>
	<table border="1" style="width: 100%; min-width: 700px; border-collapse: collapse;">
		<tr>
			<td colspan="2" height="60" bgColor="#9370db">
				<tiles:insertAttribute name="header"/><!-- header.jsp -->
			</td>
		</tr>
		
		<tr>
			<td width="120" height="500">
				<tiles:insertAttribute name="side"/><!--side.jsp -->
			</td>
		
			<td valign="top">
				<tiles:insertAttribute name="content"/><!-- 중앙에 표시 -->
			</td>
		</tr>
		
		<tr>
			<td colspan="2" height="100">
				<tiles:insertAttribute name="footer"/><!--footer.jsp -->
			</td>
		</tr>
	</table>
</body>

</html>