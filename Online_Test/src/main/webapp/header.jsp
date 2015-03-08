<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.new.css" />

<script src="js/bootstrap.min.new.js"></script>

<style type="text/css">
* {
	margin-top: 0.0px;
	margin-bottom: 0.0px;
	margin-left: 0.0px;
	margin-right: 0.0px;
}

#wrapper {
	height: 100%;
	width: 100%;
}

.container-fluid {
	padding-left: 0px;
	padding-right: 0px;
}
.navbar{
	border-radius:0px;
	margin-bottom: 0px;
}

</style>
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="col-md-2">
			<img alt="Spaneos LOGO" src="img/spaneos.png" class="img-responsive"
				id="imglogo" height="60" width="60" />
		</div>
		<div class="col-md-3"></div>
		<div class="col-md-4" style="color: white;">
			<label class="control-label" id="header"><h3>Online Exam Portal</h3></label>
		</div>
		<div class="col-md-3" style="color: white;" align="right">
		<c:if test="${uname ne null }">
		<div class="col-md-12">
			<p>Welcome: <span>${uname }</span></p>
		</div>	
		<div class="col-md-12" style="padding-right: 30px;">	
			<p><a href="logout">logout</a></p>
		</div>
		</c:if>
		</div>
	</nav>

</body>
</html>