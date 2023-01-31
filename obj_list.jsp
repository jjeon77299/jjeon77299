<%@ page import="DB.DBConnect"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql="select c.sub_id, c.sub_name, c.credit, l.name, "
				+"decode(c.week, 1,'월요일', 2,'화요일', 3,'수요일', 4,'목요일', 5,'금요일', 6,'토요일') week, "
				+"substr(lpad(start_hour,4,0),1,2)||':'||substr(lpad(start_hour,4,0),3,2) start_hour, "
				+"substr(lpad(end_hour,4,0),1,2)||':'||substr(lpad(end_hour,4,0),3,2) end_hour "
				+"from course_tbl_02 c, lecturer_tbl_02 l "
				+"where c.lec_id = l.id";
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	String sql1="select count(*) from course_tbl_02";
	PreparedStatement pstmt1 = conn.prepareStatement(sql1);
	ResultSet rs1 = pstmt1.executeQuery();
	
	rs1.next();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_list</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<header>
	  <jsp:include page="layout/header.jsp"></jsp:include>
 </header>

 <nav>
   	 <jsp:include page="layout/nav.jsp"></jsp:include>
 </nav>
		
 <section class="section">
   	 <h2>홈쇼핑 회원 명단</h2><br>
  
	<table class="table_line">
		<caption style="text-align: left">총 <%= rs1.getInt(1) %>개의 교과목이 있습니다.</caption>
				<tr>
					<th>과목코드</th>
					<th>과목명</th>
					<th>학점</th>
					<th>담당강사</th>
					<th>요일</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th>관리</th>
					
				</tr>
				<%
					while(rs.next()) {
				%>
				<tr class="center">
					<td><%= rs.getString("sub_id")%></td>
					<td><%= rs.getString("sub_name") %></td>
					<td><%= rs.getString("credit") %></td>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("week") %></td>
					<td><%= rs.getString("start_hour") %></td>
					<td><%= rs.getString("end_hour") %></td>
					<td>
						<input type="button" value="수정" onclick="location.href=''">
						/
						<input type="button" value="삭제" onclick="location.href=''">
					</td>
				</tr>
				<%
					}
				%>
			</table>	
</section>
<footer id="footer">
HRDKOREA Copyrightⓒ2015 All rights reserved. Human Resources Development Service of Korea
</footer>
</body>
</html>