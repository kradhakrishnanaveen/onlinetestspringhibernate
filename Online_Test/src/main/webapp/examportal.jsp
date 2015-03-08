<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Exam Portal</title>
<link rel="stylesheet" href="css/bootstrap.min.new.css" />
<script src="js/jquery.min.new.js"></script>
<script src="js/bootstrap.min.new.js"></script>
<script type="text/javascript">
	function uncheckall() {
		var cbs = document.getElementsByClassName('check');
		for (var i = 0; i < cbs.length; i++)
			cbs[i].checked = false;
	}	
	function MyTimer() {
		var valueTimer = $('#hdnTimer').val();

		if (valueTimer > 30) {
			valueTimer = valueTimer - 1;

			hours = (valueTimer / 3600).toString().split('.')[0];
			mins = ((valueTimer % 3600) / 60).toString().split('.')[0];
			secs = ((valueTimer % 3600) % 60).toString();

			if (hours.length == 1)
				hours = '0' + hours;
			if (mins.length == 1)
				mins = '0' + mins;
			if (secs.length == 1)
				secs = '0' + secs;

			$('#idTimerLCD').text(hours + ':' + mins + ':' + secs);
			$('#hdnTimer').val(valueTimer);

			document.title = $('#idTimerLCD').text();
		} else if(valueTimer > 0){
			if(valueTimer == 30)
				alert("your test will be Submitted within 30 secs");
			valueTimer = valueTimer - 1;

			hours = (valueTimer / 3600).toString().split('.')[0];
			mins = ((valueTimer % 3600) / 60).toString().split('.')[0];
			secs = ((valueTimer % 3600) % 60).toString();

			if (hours.length == 1)
				hours = '0' + hours;
			if (mins.length == 1)
				mins = '0' + mins;
			if (secs.length == 1)
				secs = '0' + secs;
			$("#idTimerLCD").css("color","red");
			$('#idTimerLCD').text(hours + ':' + mins + ':' + secs);
			$("#errortime").text("Your Test will be Submitted in "+secs+" secs");
			$('#hdnTimer').val(valueTimer);
		
		}else{
			alert(" Your time is up ! \n\n Let's see the Result & Statistics of the Test.");
			var val1 = $("#sid").val();
			window.location="submittest.do?sid="+val1;
		}
	}
	function myflagfunction(){
		var f = $("#flagvalue").val();
		if(f == "flag"){
			$("#flagvalue").val("unflag");
			$("#flagquestion").text("UnFlag");
		} else{
			$("#flagvalue").val("flag");
			$("#flagquestion").text("Flag")
		}
	}
</script>

<script type="text/javascript">
$(function() {
	$("#finish").click(function(){
		var ff = confirm("Are You Sure you want to Submit the Test");
		if(ff){
			var val1 = $("#sid").val();
			window.location="submittest.do?sid="+val1;
		}
	});
	$('#hdnTimer').val($('#hdnInitialTimer').val());
	$('#idTimerSpan').show();
	_timerHandler = setInterval("MyTimer()", 1000);
	$(document).on("keydown", function disableF5(e) {
		if ((e.which || e.keyCode) == 116 || (e.which || e.keyCode) == 82)
			e.preventDefault();
	});
	window.history.forward(-1);
});
/* window.onbeforeunload = function() {
    return "Dude, are you sure you want to leave? Think of the kittens!";
} */
</script>
<style type="text/css">
span {
	font-weight: bold;
}

#wrapper {
	padding-top: 2%;
}

#candidateinfo {
	text-align: right;
}

#questioninfo {
	text-align: right;
}

#display-left {
	border: 1px solid;
	text-align: center;
	height: 80px;
	padding-top: 2%;
}

#display-center {
	border: 1px solid;
	height: 80px;
	margin-left: 4%;
	margin-right: 4%;
}

#display-center-1 {
	padding-top: 5%;
}

#display-center-2 {
	padding-top: 5%;
}

#display-center-3 {
	padding-top: 5%;
}

#display-right {
	border: 1px solid;
	height: 80px;
	padding-top: 1%;
}

#display-question {
	height: 400px;
	padding: 0%;
	padding-left: 0%;
	margin-top: 2%;
}

#display-question-body {
	height: auto;
	margin-top: 2%;
}

#display-btn-body {
	margin-top: 2%;
	padding-left: 0;
	padding-right: 0px;
	font-size: 13px;
}
.questionId{
width: 100%; 
background-color: rgba(223, 223, 223, 1); 
border-radius: 20px;
}

</style>
</head>
<body>
	<div class="container-fluid" id="wrapper">
		<div class="col-md-12"></div>
		<div class="col-md-2">
			<p>
				Test Name: <span>Core Java</span>
			</p>
		</div>
		<div class="col-md-4"><label id="errortime" style="padding-left:20%; color: red;"></label></div>
		<div class="col-md-6" id="candidateinfo">
			<p>
				Candidate Name: <span>Naveen</span> | Email Id: <span>krnaveen1992@gmail.com</span>
			</p>
		</div>
		<div class="col-md-2 center-block" id="display-left">
			<p>
				Total Questions: <span><c:out value="${testSection.getListQuestions().size() }"></c:out></span>
				<c:set var="firstqid" value="${firstqid }"></c:set>
				<c:set var="lastqid" value="${lastqid }"></c:set>
				
			</p>
		</div>
		<!-- <div class="col-md-1"></div> -->
		<div class="col-md-7 center-block" id="display-center">
			<div class="col-md-5">
				<div class="col-md-12" id="display-center-1">
					<p>
						Answered: <span id="answer">${answercount }</span>
					</p>
				</div>
				<div class="col-md-12">
					<p>
						Not Answered: <span id="nonanswer">${testSection.getListQuestions().size()-answercount }</span>
					</p>
				</div>
			</div>
			<div class="col-md-7">
				<div class="col-md-6" id="display-center-2">
					<button class="btn btn-default active col-md-12" id="instructions"
						style="border-radius: 20px;">Instructions</button>
				</div>
				<div class="col-md-6" id="display-center-3">
					<!-- <form action="submittest.do" method="post" role="form"> -->
						<input type="hidden" id="sid" name="sid" class="form-control" value="${testSection.sId }">
						<input type="button" name="finish" id="finish" value="Finish Test"
							class="btn btn-default active form-control"
							style="border-radius: 20px;">
				<!-- 	</form> -->
				</div>
			</div>
		</div>
		<!-- <div class="col-md-1"></div> -->
		<div class="col-md-2 center-block" id="display-right">
			<div class="col-md-12">
				<p>Total Time Left</p>
			</div>
			<div class="col-md-12">
				<b id="idTimerLCD">hh:mm:ss</b> <input type="hidden" id="hdnInitialTimer"
					value="${testSection.sTime * 60}" /> <input type="hidden"
					id="hdnTimer" value="" />
			</div>
		</div>
		<div class="col-md-12"></div>
		<div class="col-md-12"></div>
		<div class="col-md-2 center-block" id="display-question">
			<fieldset style="border: 1px solid; min-height: 300px; padding: 7%;">
				<table style="width: 100%;">
					<tr>
						<c:set value="1" var="counter"></c:set>
						<c:forEach var="i" items="${testSection.getListQuestions() }" varStatus="count">
							<c:if test="${not count.first and count.index % 5==0 }">
					</tr>
					<tr>
						</c:if>
						<td style="padding: 1%;">
							<%-- <c:if test="${count.first }">
							<button
									style="width: 100%; background-color: rgba(223, 223, 223, 1); border-radius: 20px;"
									class="btn btn-sm active" value="${i.qId }" id="${i.qId }" name="${i.qId }" class="questionId">${counter }</button>
							</c:if> --%> <%-- <c:if test="${not count.first }"> --%>
							<button
								class="btn btn-sm questionId" value="${i.qId }" id="question${i.qId }"
								name="question${i.qId }" onclick="myfunction(this);">${counter }</button>
							<%-- 	</c:if> --%>
						</td>
						<c:set value="${counter+1 }" var="counter"></c:set>
						</c:forEach>
					</tr>
				</table>
			</fieldset>
			<div class="col-md-12" id="display-btn-body">

				<button disabled="disabled" class="btn btn-sm"
					style="background-color: #92CD00; border-radius: 20px;"></button>
				Answered &nbsp;
				<button disabled="disabled" class="btn btn-sm"
					style="background-color: #587498; border-radius: 20px;"></button>
				Not Answered

				<button disabled="disabled" class="btn btn-sm"
					style="background-color: #E86850; border-radius: 20px;"></button>
				Marked &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button disabled="disabled" class="btn btn-sm"
					style="background-color: rgba(207, 207, 207, 1); border-radius: 20px;"></button>
				Not Visited
			</div>
		</div>
		<div class="col-md-10" id="display-question-body">
		<%@ include file="subexamportal.jsp" %>
		</div>

	</div>
</body>
</html>