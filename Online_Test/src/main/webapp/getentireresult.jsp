<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Exam Result</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery.min.new.js"></script>
<script src="js/bootstrap.min.new.js"></script>
<script type="text/javascript">
$(function(){
	$(".panelclass").hide();
	$(".viewanswer").click(function(){
		var val = $(this).val();
		var val1 = $("#view"+val).attr("class");
		if(val1 == "glyphicon glyphicon-chevron-down"){
			$("#view"+val).removeClass("glyphicon glyphicon-chevron-down");
			$("#view"+val).addClass("glyphicon glyphicon-chevron-up");
		}else{
			$("#view"+val).removeClass("glyphicon glyphicon-chevron-up");
			$("#view"+val).addClass("glyphicon glyphicon-chevron-down");
		}
		$("#panel"+val).slideToggle("slow");
	});
});
</script>
<style type="text/css">
span {
	font-weight: bold;
}
.panelclass
{
padding:50px;
display:none;
}
</style>
</head>
<body>
<div id="wrapper" class="container-fluid">

	<%@include file="header.jsp" %>
	<div class="container-fluid" style="margin-top: 60px;margin-bottom: 30px;">
		<input type="hidden" id="uid" name="uid" value="${uid }"> <input
			type="hidden" id="tid" name="tid" value="${tid }">

		<div class="col-md-12" style="margin-top: 2%;">
			<div class="col-md-6" align="left">
				<p>
					Total No of Questions: <span>${normaltest.testSection.listQuestions.size() }</span>
				</p>
			</div>
			<div class="col-md-6" align="right">
				<p>
					Section Name: <span>${normaltest.testSection.sName }</span>
				</p>
			</div>
			<div class="col-md-12" align="left">
			<p>
				No of Marks Scored: <span>${normaltest.tMarks }</span>
			</p>
			</div>
		</div>

		<div class="col-md-12"> 
			<c:set value="1" var="counter" />
			<c:forEach items="${normaltest.testSection.listQuestions }" var="testQuestion">
				<div class="col-md-12" style="border: 1px solid; padding: 2%;border-radius:40px;">
				<div class="col-md-12"
					style="min-height: 100%; height: auto; padding-left: 4%;">
					<label style="width: 95%;">${counter }:&nbsp;${testQuestion.question }
					</label>
					<c:set var="counter" value="${counter+1 }" />
				</div>
				<div class="col-md-12" style="padding-left: 4%;">
					<br>
					<p style="margin-left: 2%;">A)&nbsp;&nbsp;${testQuestion.opt1 }</p>
					<p style="margin-left: 2%;">B)&nbsp;&nbsp;${testQuestion.opt2 }</p>
					<p style="margin-left: 2%;">C)&nbsp;&nbsp;${testQuestion.opt3 }</p>
					<p style="margin-left: 2%;">D)&nbsp;&nbsp;${testQuestion.opt4 }</p>
					<c:if test="${testQuestion.opt5 ne null}">
						<p style="margin-left: 2%;">E)&nbsp;&nbsp;${testQuestion.opt5 }</p>
					</c:if>
					<c:if test="${lisResult[testQuestion.qId] eq 'correct' }">
					<p>Your Answer: <span>${lisAnswers[testQuestion.qId] }</span>&nbsp;<span class="glyphicon glyphicon-ok" style="color:green;width:20px;height:20px;" ></span></p>
					</c:if>
					<c:if test="${lisResult[testQuestion.qId] ne 'correct' }">
					<p>Your Answer: <span>${lisAnswers[testQuestion.qId] }</span>&nbsp;<span class="glyphicon glyphicon-remove" style="color:red;" aria-hidden="true"></span></p>
					</c:if>
					<div>
					<button class="btn btn-sm btn-info viewanswer"  value="${testQuestion.qId }" style="border-radius: 20px;">
						<span id="view${testQuestion.qId }" class="glyphicon glyphicon-chevron-down"></span>&nbsp;&nbsp;&nbsp;View Answer
					</button>
					</div>
					<div class="col-md-10 panelclass" id="panel${testQuestion.qId }" style="padding: 1%;">
						<fieldset style="border: 1px; text-align: left; width: 95%; padding: 1%; border-style: dotted;">
						<p>Correct Answer: &nbsp;<span>${testQuestion.answer }</span></p>	
						<br>
						<c:if test="${testQuestion.explanation ne null }">
							<p><span>Explanation:</span> &nbsp;${testQuestion.explanation }</p>
						</c:if>
						<c:if test="${testQuestion.explanation eq null }">
							<p><span>Explanation:</span> &nbsp;No Explanation</p>
						</c:if>		
						</fieldset>		
					</div>
					<br>
				</div>
				</div>
			</c:forEach>
			<br>
		</div>
	</div>
	<%@include file="footer.jsp" %>

</div>
</body>
</html>