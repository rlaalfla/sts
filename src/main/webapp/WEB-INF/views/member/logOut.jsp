<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
 <%--세션 무효화--%>
 <c:remove var="id" scope="session"/>
 
<%
//session.invalidate();//세션 무효화 
%>

<%
  response.sendRedirect("main.do");//http:// 새로 연결된다 
%>
