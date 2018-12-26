<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!--jquery放在最上面  -->
<script src="js/jquery-3.3.1.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function fs() {

		document.getElementById("f1").submit();

	}
	function fs2() {

		document.getElementById("f2").submit();
		/* window.location.reload(); */
	}
</script>
</head>
<style>
.abc {
	float: right;
	width: 140px;
	color: #fff;
}

body {
	background-image: url(img/3.jpg);
	background-size: 100%;
	background-repeat: repeat;
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






</style>
<body>

	<div class="container">
		<div class="row">
			<!-- <div class="col-md-8"><img alt="" src="img/本体 (5).jpg" height="80"></div> -->
			<br>
			<div class="abc">
				你好！${sessionScope.users.username }
				<form method="get" action="logOut">
					<button type="submit" class = "btnn"> 退出登录</button>
				</form>
				
			</div>
			<br>

			<!-- 搜索条 -->
			<form class="navbar-form navbar-left" role="search"
				action="searchStudent">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search"
						name="kw">
				</div>
				<button type="submit" class="btn btn-info">搜索</button>
			</form>
		</div>
		<br>
		<!-- 搜索结束 -->
		<!-- 导航条 -->
		<ul class="nav nav-tabs">
			<li role="presentation" class="active"><a href="#">学生列表</a></li>
			<li role="presentation" ><a href="member_update.jsp">修改用户信息</a></li>
		</ul>
		<br>
		<center>
			<h3>
				<p class="text-info">学生信息</p>
			</h3>

			<table border="1" class="table table-hover">
				<thead>
					<tr>
						<td class="success">学生ID</td>
						<td class="warning">学生姓名</td>
						<td class="danger">学生年龄</td>
						<td class="success">学生性别</td>
						<td class="warning">学生地址</td>
						<c:if test="${sessionScope.users.authority==2}">
							<td class="danger">操 作</td>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="stu">
						<tr class="info">
							<td>${stu.sid }</td>
							<td>${stu.sname }</td>
							<td>${stu.sage }</td>
							<td>${stu.ssex }</td>
							<td>${stu.saddr }</td>
							<td><c:if test="${sessionScope.users.authority==2}">
									<a class="btn btn-danger" href="deleteStudent?sid=${stu.sid }">刪除</a>
									<a class="btn btn-success" data-target="#myupdate${stu.sid}"
										data-toggle="modal">修改</a>
								</c:if> <!-- update模态框 --> <%-- <div class="modal fade bs-example-modal-sm" id="myupdate${stu.sid}"> --%>
								<div class="modal fade bs-example-modal-sm" tabindex="-1"
									role="dialog" aria-labelledby="mySmallModalLabel"
									id="myupdate${stu.sid}">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<center>
												<h3>更新学生信息</h3>
											</center>
											<hr>
											<!-- 表单开始 -->
											<form class="form-horizontal" action="updateStudent"
												method="post" id="f2">
												<input type="text" name="stu.sid" value="${stu.sid }"
													hidden="true"><br>
												<div class="form-group">
													<label for="inputEmail3" class="col-sm-2 control-label">name</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="inputEmail3"
															name="stu.sname" value="${stu.sname }">
													</div>
												</div>
												<div class="form-group">
													<label for="inputEmail3" class="col-sm-2 control-label">age</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="inputEmail3"
															name="stu.sage" value="${stu.sage }">
													</div>
												</div>

												<div class="form-group">
													<label for="inputEmail3" class="col-sm-2 control-label">sex</label>
													<div class="col-sm-10">
														<input type="radio" name="stu.ssex" value="male">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" name="stu.ssex" value="famle">女
													</div>
												</div>

												<div class="form-group">
													<label for="inputEmail3" class="col-sm-2 control-label">addr</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="inputEmail3"
															name="stu.saddr" value="${stu.saddr }">
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-offset-2 col-sm-10">
														<button type="submit" class="btn btn-info" onclick="fs2()">修改</button>

													</div>
												</div>
											</form>
											<!-- 表单结束 -->
										</div>
									</div>
								</div></td>
							<!-- update模态框 结束-->
						</tr>

					</c:forEach>
				</tbody>
			</table>
			<br>
			<!-- 添加用户 -->
			<!-- <a class="btn btn-info" href="addStudent.jsp">添加学生</a> -->

			<!-- Small modal -->
			<c:if test="${sessionScope.users.authority>0 }">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myinsert">添加学生</button>
			</c:if>
			<div class="modal fade bs-example-modal-sm" tabindex="-1"
				id="myinsert" role="dialog" aria-labelledby="mySmallModalLabel">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">
						<center>
							<h3>添加学生</h3>
						</center>
						
						<hr>
						<!-- 表单开始 -->
						<form class="form-horizontal" action="addStudent" method="post"
							id="f1">
							<%-- <input type="text" name="stu.sid" value="${stu.sid }" hidden="true"><br> --%>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputEmail3"
										name="stu.sname">
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">age</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputEmail3"
										name="stu.sage">
								</div>
							</div>

							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">sex</label>
								<div class="col-sm-10">
									<input type="radio" name="stu.ssex" value="male">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="stu.ssex" value="female">女
								</div>
							</div>

							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">addr</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputEmail3"
										name="stu.saddr">
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-info" onclick="fs()">添加</button>
								</div>
							</div>
						</form>
						<!-- 表单结束 -->
						<!-- 表单开始 -->
						<!-- <form action="addStudent" method="post" id="f1">
学生姓名:<input type="text" name="stu.sname" id="sname"><br><br>
学生年龄:<input type="text" name="stu.sage" id="sage"><br><br>
学生性别:      <input type="radio" name="stu.ssex" value="male" >男
			 <input type="radio" name="stu.ssex" value="female" >女<br><br>
学生地址:<input type="text" name="stu.saddr" id="saddr"><br><br>
<input type="button" value="提交" onclick="fs()">
</form> -->
						<!-- 表单结束 -->
					</div>
				</div>
			</div>
		</center>
	</div>
<br><br>
</body>
</html>