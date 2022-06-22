<%@page import="java.sql.*"%>
<%@page import="DBPKG.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section style="position:fixed; top:60px;left:0px;width:100%;height:100%;background-color: yellow;left:0">
<h2 style="text-align:center"><b>교과목 목록 조회/수정</b></h2>
<form style="display:flex; align-items:center;justify-content:center">
<h3>진행 중</h3>
<table border ="1">
<tr>
	<td>TODO번호</td>
	<td>내용</td>
	<td>생성 날짜</td>
</tr>

<%
request.setCharacterEncoding("UTF-8");

try{
	Connection conn = Util.getConnection();
	String sql = "SELECT * FROM ToDoList ORDER BY idx ASC;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		
		%>
		<tr>
		<td> <a href="modify.jsp?id=<%=rs.getString(1) %>"><%= rs.getString(1) %></a></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><a href="action.jsp?id=<%=rs.getString(1)%>&mode=success">완료</a></td>
		<td><a href="action.jsp?id=<%=rs.getString(1)%>&mode=modify">수정</a></td>
		<td><a href="action.jsp?id=<%=rs.getString(1)%>&mode=delete">삭제</a></td>
		
		</tr>
		<%
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>

</table>

<h3>완료</h3>
<table border ="1">
<tr>
	<td>TODO번호</td>
	<td>내용</td>
	<td>생성 날짜</td>
</tr>

<%
request.setCharacterEncoding("UTF-8");

try{
	Connection conn = Util.getConnection();
	String sql = "SELECT * FROM CompleteList ORDER BY idx ASC;";
			PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		
		%>
		<tr>
		<td> <a href="modify.jsp?id=<%=rs.getString(1) %>"><%= rs.getString(1) %></a></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		</tr>
		<%
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>

</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
