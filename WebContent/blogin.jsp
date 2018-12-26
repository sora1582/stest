<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js" ></script>
</head>
<body>
<div class="container">
 

<form class="form-inline" action="checkAction" method="post">

  <div class="form-group">
    <label for="exampleInputName2">Name</label>
    <input type="text" class="form-control" id="exampleInputName2" placeholder="Jane Doe" name="username">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail2">Password</label>
    <input type="password" class="form-control" id="exampleInputEmail2" placeholder="jane.doe@example.com" name="password">
  </div>
  <button type="submit" class="btn btn-primary">Send invitation</button>
</form>


</div>
</body>
</html>