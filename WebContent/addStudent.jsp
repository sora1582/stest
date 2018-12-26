<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(){
	

	var sname=document.getElementById("sname").value;
	 var sage=document.getElementById("sage").value;

	var saddr=document.getElementById("saddr").value; 
	if(sname.length<1){
		alert("请输入用户名！");
		return;
	}else if( sage.length<1){
		alert("请输入年龄！");
		return;
	}else if(saddr.length<1){
		alert("请输入地址！");
		return;
	}else{
		document.fo.submit();
	}
	
}


</script>
</head>
<!-- <body background="img/本体 (5).jpg">
 -->
 

 
 <center>
<h2>添加学生</h2>
<form action="addStudent" method="post" name="fo">

学生姓名:<input type="text" name="stu.sname" id="sname"><br>
学生年龄:<input type="text" name="stu.sage" id="sage"><br>
学生性别:      <input type="radio" name="stu.ssex" value="male" >男
			 <input type="radio" name="stu.ssex" value="female" >女<br>
学生地址:<input type="text" name="stu.saddr" id="saddr"><br>
<input type="button" value="提交" onclick="check()">

</form>
</center>
</body>
</html>