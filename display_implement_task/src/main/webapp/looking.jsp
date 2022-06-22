<%@page import="java.sql.*"%> 
<%@page import="DBPKG.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정/조회</title>
</head>
<body>
<%
  	String id = request.getParameter("id");
	String idx = null;
	ResultSet rs = null;
	if(id != null) {
		try{
			Connection conn = Util.getConnention();
			String sql = "SELECT idx, content FROM ToDoList WHERE idx = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			idx = rs.getInt("idx").toString();
			String content = rs.getString("content");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	} else {
		try{
			Connection conn = Util.getConnention();
			String sql = "SELECT max(idx)FROM ToDoList";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			idx = rs.getString(1);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<jsp:include page="header.jsp"></jsp:include>

<section style="position:fixed; top:60px;left:0px;width:100%;height:100%;background-color: yellow;left:0">
<h2 style="text-align:center"><b>교과목 목록 조회/수정</b></h2>
<form style="display:flex; flex-direction: column; align-items:center;justify-content:center">
<label for="id">ID</label>
  <input type="text" id="id" name="id"><br>
<label for="content">내용</label>
	<textarea cols=50 rows=5 id="content" name="content" name="content"></textarea><br>
<% if(id != null) { %> <a href="action.jsp?idx=<%=rs.getString(idx)%>&mode=insert">send</a>
<% } else { %>
<a href="action.jsp?idx=<%=rs.getString(idx)%>&mode=modify">send</a>
<%} %>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
