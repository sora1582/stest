<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("GBK") ;
%>
<%!
	public static final String DBDRIVER = "com.mysql.jdbc.Driver" ;
	public static final String DBURL = "jdbc:mysql://localhost:3306/strutscrud" ;
	public static final String DBUSER = "root" ;
	public static final String DBPASSWORD = "6666" ;
%>
<%
	Connection conn = null ;
	PreparedStatement pstmt = null ;
%>
<%
	String msg = "用户信息更新失败！" ;
	Class.forName(DBDRIVER) ;
	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
	String sql = "UPDATE users SET username=?,password=?WHERE uid=?" ;
	pstmt = conn.prepareStatement(sql) ;
	pstmt.setString(1,request.getParameter("username")) ;
	pstmt.setString(2,request.getParameter("password")) ;
	
	pstmt.setInt(3,(int)session.getAttribute("uid")) ; 
	if(pstmt.executeUpdate() > 0){
		msg = "用户信息更新成功！" ;
	}
%>
<%
	conn.close() ;
%>
<script language="javascript">
	alert("<%=msg%>") ;
	window.location = "login.jsp" ;
</script>
</body>
</html>