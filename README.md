![header](https://capsule-render.vercel.app/api?type=waving&text=Welcome!&color=auto&height=230&fontAlignY=40)
<div>
<h3>제가 배우고 있는 프로그래밍 언어입니다.</h3>
<img src="https://img.shields.io/badge/Python-060824?style=flat-square&logo=Python&logoColor=3776AB"/>
<img src="https://img.shields.io/badge/Java-62c2ee?style=flat-square&logo=Java&logoColor=000000"/>
<div>
<!--
**jjeon77299/jjeon77299** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:
- https://capsule-render.vercel.app/api?
- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->

<%@ page import="DB.DBConnect"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sql = "insert into TBL_VACCRESV_202108 values(?, ?, ?, ?, ?, ?)";
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql); 
	
	pstmt.setInt(1, Integer.parseInt(request.getParameter("resvno")));
	pstmt.setString(2, request.getParameter("jumin"));
	pstmt.setString(3, request.getParameter("hospcode"));
	pstmt.setString(4, request.getParameter("resvdate"));
	pstmt.setString(5, request.getParameter("resvtime"));
	pstmt.setString(6, request.getParameter("vcode"));
	
	pstmt.executeUpdate();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Tr
ansitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쇼핑몰회원관리</title>
</head>
<body>
	<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>
