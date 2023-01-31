<%@ page import="DB.DBConnect"%> <%-- DB파일 안에 DBConnect을 가지고온다--%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sql = "insert into MEMBER_TBL values (?, ?, ?, ?, ?, ?, ?)";
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql); 
	
	pstmt.setInt(1, Integer.parseInt(request.getParameter("sub_id")));
	pstmt.setString(2, request.getParameter("sub_name")); 
	pstmt.setString(3, request.getParameter("credit")); 
	pstmt.setString(4, request.getParameter("lec_id"));
	pstmt.setString(5, request.getParameter("week"));
	pstmt.setString(6, request.getParameter("start_hour")); 
	pstmt.setString(7, request.getParameter("end_hour")); 
	
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