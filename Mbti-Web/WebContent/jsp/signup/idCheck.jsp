<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.co.mlec.member.vo.MemberVO"%>
<%@page import="kr.co.mlec.member.dao.SignupDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	SignupDAO dao = new SignupDAO();
	boolean result = dao.checkId(id);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Id 중복체크</title>
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br /><b><%= id %></b>
		<%
			if(result) {
				out.println("는 이미 존재하는 ID입니다<p />");
			} else {
				out.println("는 사용가능 합니다<p />");
			}
		%>
		<a href="#"	onClick="self.close()">닫기</a>
	</div>
</body>
</html>