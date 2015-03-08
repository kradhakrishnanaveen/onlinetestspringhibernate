<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.min.new.js"></script>
<script type="text/javascript">
$(function(){
	$("#displaybtn").click(function(){
		var cid = $(this).val();
		$.get("subhomepage.do?cId="+cid,show);
		function show(data){
			$("#display").html(data);
		}
	})
});
</script>
</head>
<body>
<a href="startexam.do?sid=1&uid=1">Click Here</a>
<button id="displaybtn" value="2">getCategory</button>
<div id="display"></div>

</body>
</html>