<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.new.css" />
<script src="js/jquery.min.new.js"></script>
<script src="js/bootstrap.min.new.js"></script>
<script type="text/javascript">
	$(function() {
		$("#testresult").hide();
		myVar = setInterval("MyTimer1()", 250);
	});
	var i = 0;
	function MyTimer1() {
		i = (+i) + (+10);
		if (i < 120) {
			$("#progressbarid").css("width", i + "%");

		} else {
			$("#maindiv").hide();
			$("#testresult").show();
			clearInterval(myVar);
			$(".feedback").text("Feedback saved successfully");
		}
	}
</script>
</head>
<body>
	<div class="container-fluid" id="maindiv">
		<br> <br> <br> <br>
		<center>
			<div class="progress" style="width: 60%;">
				<div
					class="progress-bar progress-bar-success progress-bar-striped active"
					id="progressbarid" role="progressbar" aria-valuenow="10"
					aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
					<!-- <span class="feedback">Please wait to get Feedback</span> -->
				</div>
			</div>
		</center>
	</div>
	<div class="container" style="margin-top: 3%;">
		<center>
			<h2 class="feedback">Please wait to get Feedback</h2>
		</center>
	</div>
	<div class="container-fluid" id="testresult">
		<div class="panel panel-info" style="width: 50%;padding: 10%;margin-left: 25%; margin-top: 2%;">
			<div class="panel-heading" align="center">
				<h3 class="panel-title">Test Result</h3>
			</div>
			<div class="panel-body">
				<div class="col-md-12">
					<label>Correct Answers: <strong>${correctcount }</strong></label>
				</div>
				<div class="col-md-12">
					<label>Wrong Answers: <strong>${wrongcount }</strong></label>
				</div>
				<div class="col-md-12">
					<label>Not Attempted: <strong>${notcount }</strong></label>
				</div>
				<div class="col-md-12">
				<label>Click <a
					href="getentireresult.do?uid=${userid }&tid=${testid}">here</a> to
					see the result
				</label>
				</div>
			</div>
		</div>
	</div>

</body>
</html>