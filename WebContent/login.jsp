<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


	<!-- For-Mobile-Apps -->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Simple Contact Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //For-Mobile-Apps -->

	<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

	<!-- Web-Fonts -->
		<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900" 	type="text/css"  media="all">
		<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Raleway:400,500,600,700,800" 		type="text/css"  media="all">
	<!-- //Web-Fonts -->


<body>
<center>
<h1>登录</h1>

<div class="container">
<c:if test="${!empty requestScope.msg }">
<font size=2 color="red">${requestScope.msg }</font>
</c:if>
<div class="contact">
<form action="checkAction" method="post">
<label>用户名</label>
				<input type="text" Name="username" placeholder="" required="">
				<label>密码</label>
				<input type="text" Name="password" placeholder="" required="">
				
				<div class="send-button">
					<input type="submit" value="登录">
				</div>
</form>
</div>
</div>
</center>
</body>
</html>