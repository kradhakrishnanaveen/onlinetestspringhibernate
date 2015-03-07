<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Start Exam</title>
</head>
<body>

	<div class="container-fluid" style="padding: 5%;">
		<div class="panel panel-primary" style="width: 300px;height: 200px; ">
			<div class="panel-heading" align="center">
				<h3 class="panel-title">${category.cName }</h3>
			</div>
			<div class="panel-body">
			<br>
			<br>
				<ul>
				<c:forEach items="${category.listSection }" var="cat">
					<li>
					<a href="instructions.do?sid=${cat.sId }">${cat.sName }</a>
					</li>
				</c:forEach>
				</ul>
			</div>
			<!-- <div class="panel-footer">Panel footer</div> -->
		</div>
	</div>
</body>
</html>