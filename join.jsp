<%@ page import="DB.DBConnect"%> <%-- DB파일 안에 DBConnect을 가지고온다--%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="select l.name from course_tbl_02 c, lecturer_tbl_02 l where c.lec_id = l.id";
	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	int num = rs.getInt(1)+1;
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>join</title>

<script type="text/javascript">
	function checkValue() {
		if(!document.data.a.value) {
			alert("과목코드를 입력하세요.");
			data.a.focus();
			return false;
		} 
		else if(!document.data.b.value) {
			alert("과목명를 입력하세요.");
			data.b.focus();
			return false;
		} 
		else if (!document.data.c.value) {
			alert("담당강사를 입력하세요.");
			data.c.focus();
			return false;
		} 
		else if (!document.data.d.value) {
			alert("학점를 입력하세요.");
			data.d.focus();
			return false;
		} 
		else if (!document.data.e.value) {
			alert("요일을 입력하세요.");
			data.e.focus();
			return false;
		}  
		else if (!document.data.f.value) {
			alert("시작시간를 입력하세요.");
			data.f.focus();
			return false;
		}
		else if (!document.data.g.value) {
			alert("종료시간를 입력하세요.");
			data.g.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body>
<header>
	  <jsp:include page="layout/header.jsp"></jsp:include>
</header>

<nav>
   	 <jsp:include page="layout/nav.jsp"></jsp:include>
</nav>
		
 <section class="section">
   	 <h2>홈쇼핑 회원 등록</h2><br>

<form name="data" action="join_p.jsp" method="post" onsubmit="return checkValue()">
			<table class="table_line">					
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="a"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="b" ></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td>
						<select>
						<% while(rs.next()) { %>
							<option value="<%= rs.getString(1) %>">
								<%= rs.getString(1) %>
							</option>
						</select>
						<% } %>
					</td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="d" ></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td>
						<input type="radio" name="e" value="1">
						<input type="radio" name="e" value="2">
						<input type="radio" name="e" value="3">
						<input type="radio" name="e" value="4">
						<input type="radio" name="e" value="5">
						<input type="radio" name="e" value="6">
					</td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="f" ></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="g" ></td>
				</tr>
				<tr class="center">
					<td  colspan="2" >
						<input type="submit" value="등록">
				</tr>
			</table>
		</form>	
   	
 </section>
		
<footer>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</footer>

</body>
</html>