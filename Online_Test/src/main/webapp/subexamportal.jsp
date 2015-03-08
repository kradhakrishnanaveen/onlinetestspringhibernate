<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){

	var initial = $("#question" + $("#qId").val()).css("background-color");
	document.getElementById("questioncolor").value = initial;
	$("#question" + $("#qId").val()).css("background-color","rgba(156, 153, 153, 1)");
	$("#nextquestion").click(function(){
		var arr = new Array();
		var count=0;
		var flag1 = 0;
		var qid=$(this).val();
		var flag = $("#flagvalue").val();
		var cbs = document.getElementsByClassName('check');
		for (var i = 0; i < cbs.length; i++){
			if(cbs[i].checked == true){
				arr[count++] = cbs[i].value;
				flag1++;
			} else{
				arr[count++] = 'Z';
			}
		}	
		/* $("#question"+qid).removeClass("activebtn");
		$("#question"+qid).removeClass("questionId"); */
		if(flag=="unflag"){
			$("#question"+qid).css("background-color","#E86850");
		} else{
			if(flag1>0){
				$("#question"+qid).css("background-color","#92CD00");
			} else{
				$("#question"+qid).css("background-color","#587498");
			}
		}
		$.get("getnewquestion.do?answer="+arr+"&qid="+qid+"&flag="+flag,show);
		function show(data){
			$("#display-question-body").html('');
			$("#display-question-body").html(data);
			$("#answer").text($("#answervar").val());
			$("#nonanswer").text($("#nonanswervar").val());
		}
	});
	$("#lastquestion").click(function(){
		
		var arr = new Array();
		var count=0;
		var flag1 = 0;
		var qid=$(this).val();
		var flag = $("#flagvalue").val();
		var cbs = document.getElementsByClassName('check');
		for (var i = 0; i < cbs.length; i++){
			if(cbs[i].checked == true){
				arr[count++] = cbs[i].value;
				flag1++;
			} else{
				arr[count++] = 'Z';
			}
		}	
		/* $("#question"+qid).removeClass("activebtn");
		$("#question"+qid).removeClass("questionId"); */
		if(flag=="unflag"){
			/*  $("#question"+qid).css("background-color","#E86850"); */ 
			document.getElementById("questioncolor").value = "#E86850";
		} else{
			if(flag1>0) {
				/* $("#question"+qid).css("background-color","#92CD00"); */
				document.getElementById("questioncolor").value = "#92CD00";
			} else {
				/* $("#question"+qid).css("background-color","#587498"); */
				document.getElementById("questioncolor").value = "#587498";
			}
		}
		$.ajax({
			url:"savelastquestion.do?answer="+arr+"&qid="+qid+"&flag="+flag,
			type:"post",
			success:function(response){
				$("#answer").text($("#answervar").val());
				$("#nonanswer").text($("#nonanswervar").val());
			}
		});
		/* function show(data) {
			$("#display-question-body").html('');
			$("#display-question-body").html(data);
			
		} */
	});
	$("#previousquestion").click(function(){
		
		var qid=$(this).val();
		var id = (+qid)+(+1);
		var val = $("#questioncolor").val();
		$("#question"+id).css("background-color",val);
		$.get("getpreviousquestion.do?qid="+qid,show);
		function show(data){
			$("#display-question-body").html('');
			$("#display-question-body").html(data);
			$("#answer").text($("#answervar").val());
			$("#nonanswer").text($("#nonanswervar").val());
		}
		
	});
});
</script>
<script type="text/javascript">
function myfunction(bx){
	
	var qid = bx.value;
	var id = $("#qId").val();
	var val = $("#questioncolor").val();
	$("#question"+id).css("background-color",val); 
	$.get("getpreviousquestion.do?qid="+qid,show);
	function show(data){
		$("#display-question-body").html('');
		$("#display-question-body").html(data);
		$("#answer").text($("#answervar").val());
		$("#nonanswer").text($("#nonanswervar").val());
	}
}
</script>
</head>
<body>
	<input type="hidden" id="questioncolor" name="questioncolor">
	<input type="hidden" id="answervar" name="answervar" value="${answercount }">
	<input type="hidden" id="nonanswervar" name="nonanswervar" value="${testSection.getListQuestions().size()-answercount }">
			<div class="col-md-2" style="padding-left: 5%;">
				<input type="hidden" name="flagvalue" id="flagvalue"
					value="${flagvar }">
				<c:if test="${flagvar eq 'flag' }">
					<button class="btn btn-default btn-xs active col-md-11 input-xs"
						style="font-size: 14px;border-radius:15px; " id="flagbtn" name="flagbtn" onclick="myflagfunction();">
						<img src="img/Flag.png" height="18" width="18"> <span
							id="flagquestion" style="font-weight: normal;">Flag</span>
					</button>
				</c:if>
				<c:if test="${flagvar eq 'unflag' }">
					<button class="btn btn-default btn-xs active col-md-11 input-xs"
						style="font-size: 14px;border-radius:15px;" id="flagbtn" name="flagbtn" onclick="myflagfunction();">
						<img src="img/Flag.png" height="18" width="18"> <span
							id="flagquestion" style="font-weight: normal;">Un Flag</span>
					</button>
				</c:if>
				<input type="hidden" name="qId" id="qId"
					value="${testQuestion.qId }">
			</div>
			<div class="col-md-10" id="questioninfo" style="padding-right: 5%;">
				<p>
					Question Section: <span>${testSection.sName }</span>
				</p>
			</div>
			<div class="col-md-12"
				style="min-height: 100%; height: auto; padding-left: 4%;">
				<label style="width: 95%;">Q: ${testQuestion.question } </label>

			</div>
			<div class="col-md-12" style="padding-left: 4%;">
				<br> <label>Choose Correct Answer(May be Multiple): </label>
				<fieldset
					style="border: 1px; text-align: left; width: 95%; padding: 1%; border-style: dotted;">
					<p>
					<c:if test="${lisAnswers.charAt(0) == 65 }">
						<input type="checkbox" name="check1" id="check1" class="check"
							value="A" checked> ${testQuestion.opt1 }
					</c:if>
 					<c:if test="${lisAnswers.charAt(0) != 65 }">
						<input type="checkbox" name="check1" id="check1" class="check"
							value="A"> ${testQuestion.opt1 }
					</c:if>		
					</p>
					<p>
					<c:if test="${lisAnswers.charAt(2) == 66 }">
						<input type="checkbox" name="check2" id="check2" class="check"
							value="B" checked> ${testQuestion.opt2 }
					</c:if>
					<c:if test="${lisAnswers.charAt(2) != 66 }">
						<input type="checkbox" name="check2" id="check2" class="check"
							value="B"> ${testQuestion.opt2 }
					</c:if>
					</p>
					<p>
					<c:if test="${lisAnswers.charAt(4) == 67 }">
						<input type="checkbox" name="check3" id="check3" class="check"
							value="C" checked> ${testQuestion.opt3 }
					</c:if>		
					<c:if test="${lisAnswers.charAt(4) != 67 }">
						<input type="checkbox" name="check3" id="check3" class="check"
							value="C"> ${testQuestion.opt3 }
					</c:if>		
					</p>
					<p>
					<c:if test="${lisAnswers.charAt(6) == 68 }">
						<input type="checkbox" name="check4" id="check4" class="check"
							value="D" checked> ${testQuestion.opt4 }
					</c:if>	
					<c:if test="${lisAnswers.charAt(6) != 68 }">
						<input type="checkbox" name="check4" id="check4" class="check"
							value="D"> ${testQuestion.opt4 }
					</c:if>		
					</p>
					<c:if test="${testQuestion.opt5 ne null }">
						<p>
						<c:if test="${lisAnswers.charAt(8) == 69 }">
							<input type="checkbox" name="check5" id="check5" class="check"
								value="E" checked> ${testQuestion.opt5 }
						</c:if>		
						<c:if test="${lisAnswers.charAt(8) != 69 }">
							<input type="checkbox" name="check5" id="check5" class="check"
								value="E"> ${testQuestion.opt5 }
						</c:if>		
						
						</p>
					</c:if>

					<button class="btn" style="background-color: white;"
						onclick="uncheckall();">
						<u style="color: rgba(124, 124, 252, 1);">Clear Answer</u>
					</button> 
				</fieldset>
			</div>
			<div class="col-md-12"
				style="margin-top: 1%; margin-bottom: 3%; padding-left: 2%; padding-right: 5%;">
				<div class="col-md-3">
				<c:if test="${firstqid eq testQuestion.qId }">
					<button class="col-md-12 btn btn-default active input-xs"
						style="border-radius: 20px;" onclick="myfunction();"
						value="${testQuestion.qId-1 }" id="previousquestion" name="previousquestion" disabled="disabled">Previous Question</button>
				</c:if>	
				<c:if test="${firstqid ne testQuestion.qId }">
					<button class="col-md-12 btn btn-default active input-xs"
						style="border-radius: 20px;" onclick="myfunction();"
						value="${testQuestion.qId-1 }" id="previousquestion" name="previousquestion">Previous Question</button>
				</c:if>		
				</div>
				<div class="col-md-6"></div>
				<div class="col-md-3">
				<input type="hidden" name="answers" id="answers" class="answers" value="${lisAnswers }"/>
				<c:if test="${lastqid eq testQuestion.qId }">
					<button class="col-md-12 btn btn-default active input-xs nextquestion"
						style="border-radius: 20px;" value="${testQuestion.qId }" id="lastquestion" name="lastquestion">Save</button>
				</c:if>
				<c:if test="${lastqid ne testQuestion.qId }">
					<button class="col-md-12 btn btn-default active input-xs nextquestion"
						style="border-radius: 20px;" value="${testQuestion.qId }" id="nextquestion" name="nextquestion">Save
						& Next Question</button>
				</c:if>
				</div>
			</div>
</body>
</html>