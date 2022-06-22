<%@page import="java.sql.*"%>
<%@page import="DBPKG.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String mode = request.getParameter("mode");

String idx = request.getParameter("idx");
String content = request.getParameter("content");

try{
	Connection conn = Util.getConnection();
	String sql = ""; 
	PreparedStatement pstmt = null;
	
	switch(mode){
	case "success":
		sql = "INSERT INTO CompleteList Values(?, ?);";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,idx);
		pstmt.setString(2,content);

		pstmt.executeUpdate();
		
		sql = "DELETE FROM ToDoList WHERE idx = ?;";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,idx);

		%>
		<jsp:forward page="insert.jsp"></jsp:forward>
		<%
		break;
	case "insert":
		sql = "INSERT INTO ToDoList Values(MAX(idx) + 1, ?, null);";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,content);

		pstmt.executeUpdate();
		%>
		<jsp:forward page="insert.jsp"></jsp:forward>
		<%
		break;
	case "modify":
		sql = "UPDATE ToDoList SET content =? WHERE idx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,content);
		pstmt.setString(2, idx);
		
		
		pstmt.executeUpdate();
		%>
		<jsp:forward page="modify.jsp"></jsp:forward>
		<%
		break;
	case "delete":
		sql = "DELETE FROM ToDoList WHERE idx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		pstmt.executeUpdate();
		%>
		<jsp:forward page="list.jsp"></jsp:forward>
		<%
		break;
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>