<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
  
  body{background-color: #fffafa;}
  
	table{
	margin:auto;
	line-height:40px; border:1px; width:80%; 
/* 	background-color: #f8f8ff; */
	}
	.log{
	border:1px solid #444444;
	}
</style>


</head>
<body>
<h2><center>로그인</center></h2>
 
 
${msg}
 <form method="post" action="loginPro.do">
 	<table>
 	  <tr>
	      <td class="log">ID</td>
	      <td class="log"><input type="text" id="id" name="id" size=20></td>
      </tr>
      
     <tr>
	     <td class="log">암호</td>
	     <td class="log"><input type="password" id="passwd" name="passwd" size=20></td>
     </tr>
      
 	<tr>
	    <td class="log" colspan="2" align="center">
	      <input type="submit" value="로그인">
	      <input type="reset" value="취소">
	      <input type="button" value="회원가입" onClick="javaScript:location='insertForm.do'">
	    </td>
    </tr>
 	  
 	</table>
 </form>

</body>
</html>