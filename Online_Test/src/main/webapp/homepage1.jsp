<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="js/jquery.min.new.js"></script>


     <link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">
$(function(){
	$(".menus").click(function(){
		var val = $(this).val();
		alert(val)
		$.get("subhomepage.do?cId="+val,show);
		function show(data){
			$("#mydiv").html(data);
		}
	});
});
</script>
</head>
<body>
<c:forEach items="${listCategories }" var="cat">
				<button class="btn btn-default menus" id="menu${cat.cId }" value="${cat.cId }" name="menu${cat.cId }">${cat.cName }</button>
			
			</c:forEach>	
				<div id="mydiv"></div>	
</body>
</html>