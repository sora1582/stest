<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生信息</title>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css" >

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap.min.js" ></script>
</head>
<body>
<center><h3><p class="text-info">修改学生信息</p></h3></center>
<center>
<form class="form-horizontal" action="updateStudent" method="post">
<input type="text" name="stu.sid" value="${stu.sid }" hidden="true"><br>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" name="stu.sname" value="${stu.sname }" >
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">age</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" name="stu.sage" value="${stu.sage }" >
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">sex</label>
    <div class="col-sm-10">
      <input type="radio"  name="stu.ssex" value="male">男
			 <input type="radio" name="stu.ssex" value="female">女
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">addr</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" name="stu.saddr" value="${stu.saddr}" >
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-info">修改</button>
    </div>
  </div>
</form>
</center>
<%-- <center>
<h2>修改学生信息</h2>
<form action="updateStudent" method="post">
<!-- disabled="disabled" -->
<!--隐藏sid  -->
<input type="text" name="stu.sid" value="${stu.sid }" hidden="true"><br>
学生姓名:<input type="text" name="stu.sname" value="${stu.sname }"><br>
学生年龄:<input type="text" name="stu.sage" value="${stu.sage }"><br>
学生性别:<input type="radio" name="stu.ssex" value="1" >男
			 <input type="radio" name="stu.ssex" value="2" >女<br>
学生地址:<input type="text" name="stu.saddr" value="${stu.saddr }"><br>
<input type="submit" value="提交">

</form>
</center> --%>
</body>
</html>