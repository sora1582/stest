<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>
<html>
<head><title></title></head>

<style>


    table
        {
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }
        table td, table th
        {
            border: 1px solid #cad9ea;
            color: #666;
            height: 30px;
        }
        table thead th
        {
            background-color: #CCE8EB;
            width: 100px;
        }
        table tr:nth-child(odd)
        {
            background: #fff;
        }
        table tr:nth-child(even)
        {
            background: #F5FAFA;
        }





.btnn {
 BORDER-RIGHT: #7b9ebd 1px solid; 
 PADDING-RIGHT: 2px; BORDER-TOP: #7b9ebd 1px solid; 
 PADDING-LEFT: 2px; FONT-SIZE: 12px; 
 FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#cecfde); 
 BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; 
 COLOR: #C86E5C; 
 PADDING-TOP: 2px; 
 BORDER-BOTTOM: #7b9ebd 1px solid
}

body { 


font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
    color: #4f6b72; 
    background: #F0E2DF; } 
a { 
    color: #c75f3e; } 
#mytable { 
    width: 650px; 
    padding: 0; 
    margin: 0; } 
caption { 
    padding: 0 0 5px 0; 
    width: 700px;      
font: italic 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
    text-align: right; } 
th { 
font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
    color: #4f6b72; 
    border-right: 1px solid #C1DAD7; 
    border-bottom: 1px solid #C1DAD7; 
    border-top: 1px solid #C1DAD7; 
    letter-spacing: 2px; 
    text-transform: uppercase; 
    text-align: left; 
    padding: 6px 6px 6px 12px; 
    background: #CAE8EA; } 
th.nobg { 
    border-top: 0; 
    border-left: 0; 
    border-right: 1px solid #C1DAD7; 
    background: none; } 
td { 
    border-right: 1px solid #C1DAD7; 
    border-bottom: 1px solid #C1DAD7; 
    background: #fff; 
    font-size:11px; 
    padding: 6px 6px 6px 12px; 
    color: #4f6b72; } 
td.alt { 
    background: #F5FAFA; 
    color: #797268; } 
th.spec { 
    border-left: 1px solid #C1DAD7; 
    border-top: 0; 
    background: #fff; 
font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
} 
th.specalt { 
    border-left: 1px solid #C1DAD7; 
    border-top: 0; 
    background: #f5fafa; 
font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
    color: #797268; } 
html>body td {
    font-size:11px;} 
    
    





</style>

	
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
	ResultSet rs = null ;
%>

<%
	Class.forName(DBDRIVER) ;
	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
	String sql = "SELECT uid,username,password,authority FROM users WHERE uid=?" ;
	pstmt = conn.prepareStatement(sql) ;

	
	pstmt.setInt(1,(int)session.getAttribute("uid")) ;
	rs = pstmt.executeQuery() ;
%>
<%
	if(rs.next()){	// 查找到了信息
		int uid = rs.getInt(1) ;
		String username = rs.getString(2) ;
		String password = rs.getString(3) ;
		int authority = rs.getInt(4) ;
		
%>

<div align = "center">
<form action="member_update_do.jsp" method="post">

	<table  class="table">
	<tr>
		<td colspan="2">
			修改用户信息
		</td>
	</tr>
	<tr>
		<td><span class="STYLE10">用户编号</span></td>
		<td><font size="2"><%=uid%>
		</font></td>
	</tr>
	<tr>
		<td><span class="STYLE10">用户名</span></td>
		<td><font size="2"><input type="text" name="username" value="<%=username%>" size="50"></font></td>
	</tr>
	<tr>
		<td><span class="STYLE10">密码</span></td>
		<td><font size="2"><input type="text" name="password" value="<%=password%>" size="50"></font></td>
	</tr>
	<tr>
		<td><span class="STYLE10">权限</span></td>
		<td><font size="2"><%=authority%></td>
	</tr>
	
	<tr >
		<td colspan="2"><span class="STYLE10">
			<input type="hidden" name="uid" value="<%=uid%>">
			<input type="hidden" name="authority" value="<%=authority%>">
			<button type="submit" class = "btnn">修改</button>
			<button type="reset" class = "btnn">重置</button>
			
			
		</span></td>
	</tr>
	</table>
</form>
</div>

<%
	}
%>
<%
	conn.close() ;
%>
</body>
</html>