<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Start Exam</title>
<script type="text/javascript">
$(function(){
	$("#adques").click(function(){
		var val = $(this).val();
		$.get("addquestionstart.do?cid="+val,show);
	});
	function show(data){
		$("#carosel").html("");
		$("#carosel").html(data);
	}
});
</script>
</head>
<body>

	<div class="container-fluid" style="padding: 5%;">
	<c:if test="${not empty category.listSection}">
		<div class="panel panel-primary" style="width: 300px;height: 200px; ">
			<div class="panel-heading" align="center">
				<h3 class="panel-title">${category.cName }</h3>
			</div>
			<div class="panel-body">
			
			<c:if test="${myadmin ne null }">
				<button value="${category.cId }" class="btn btn-success" id="adques" style="border-radius:20px;">Add Question</button>	
			</c:if>
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
		</c:if>
		<c:if test="${empty category.listSection}">
		<h3>Sorry! No Sections found.</h3>
		</c:if>
	</div>
</body>
</html>