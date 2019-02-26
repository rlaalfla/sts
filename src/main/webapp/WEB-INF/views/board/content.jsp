<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content.jsp</title>

<style type="text/css">
		body{background-color: #fffafa;}
		.list {font-family:"맑은 고딕", "돋움", sans-serif;font-size:15px;}
		.list th {border-top:2px solid #E8D9FF;border-bottom:1px solid #FFA7A7; padding:15px 0;}
		.list td {border-bottom:1px solid #d0d0d0; padding:10px 0;}
		.list a {text-decoration:none;color:#6c6c6c;}
		.list a:hover {color:#f2216b;}
</style>
</head>

 
<body>

 <c:set var="id" value="${memberDto.id }" scope="session"/>
 <c:set var="writer" value="${boardDto.writer }" scope="session"/>
 
     <h2 align="center">글내용 보기</h2> 
    
    <table width="500" border="1" cellspacing="0" cellpadding="0" align="center">  
      <tr height="30">
        <td align="center" width="125" bgcolor="#c8c8ff">글번호</td>
        <td align="center" width="125">${boardDto.num}</td>
        <td align="center" width="125" bgcolor="#c8c8ff">조회수</td>
        <td align="center" width="125">${boardDto.readcount}</td>
      </tr>
      
      <tr height="30">
        <td align="center" width="125" bgcolor="#c8c8ff">작성자</td>
        <td align="center" width="125">${boardDto.writer}</td>
        <td align="center" width="125" bgcolor="#c8c8ff" >작성일</td>
        <td align="center" width="125">
        <fmt:formatDate value="${boardDto.regdate }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
      </tr>
      
      <tr height="30">
        <td align="center" width="125" bgcolor="#c8c8ff">글제목</td>
        <td align="center" width="375" colspan="3">${boardDto.subject}</td>
      </tr>
      
      <tr>
        <td align="center" width="125" bgcolor="#c8c8ff">글내용</td>
        <td width="375" colspan="3"><pre>${content}</pre></td>
      </tr>
      
      <tr height="30">
        <td colspan="4" bgcolor="#c8c8ff" align="right">
          
          <c:if test="${id eq writer}">
 	
          
          <input type="button" value="글수정" 
            onclick="document.location.href='updateForm.do?num=${boardDto.num}&pageNum=${pageNum}'">
          &nbsp;&nbsp;
          
          <input type="button" value="글삭제" 
            onclick="document.location.href='delete.do?num=${boardDto.num}&pageNum=${pageNum}'">
          &nbsp;&nbsp;
          
          <input type="button" value="답글쓰기" 
            onclick="document.location.href='writeForm.do?num=${boardDto.num}&ref=${boardDto.ref}&re_step=${boardDto.re_step}&re_level=${boardDto.re_level}'">
          &nbsp;&nbsp;
          
          <input type="button" value="글목록" 
            onclick="document.location.href='list.do?pageNum=${pageNum}'">
            
            </c:if>
            
             
          <c:if test="${id ne writer}">
  		<input type="button" value="답글쓰기" 
            onclick="document.location.href='writeForm.do?num=${boardDto.num}&ref=${boardDto.ref}&re_step=${boardDto.re_step}&re_level=${boardDto.re_level}'">
          &nbsp;&nbsp;

          <input type="button" value="글목록" 
            onclick="document.location.href='list.do?pageNum=${pageNum}'">
            
            </c:if>
        </td> 
      </tr>
    </table>

</body>
</html>