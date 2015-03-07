<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="css/jquery-1.11.1.js"></script>
  <script src="js/bootstrap.min.js"></script><title>Instructions page</title>
<!-- <script type="text/javascript">
$(function(){
 $("#next").click(function(){
	var val =  $("#sid").val();
	alert(val)
	/* window.location.href="begintest.do?sid="+val; */
}); 
});
</script> -->
</head>
<body>
<div class="container" style="background-color:rgba(156,153,153,1);">
<input type="hidden" name="sid" value="sid" value="${sid }">
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>

<div class="col-md-12">
<div class="col-md-5"></div>
<div class="col-md-2" style="font-size:x-large;">Instructions</div>
<div class="col-md-5"></div>
<div class="col-md-12">
<fieldset style="border:fuchsia;font-size: small;padding:0%;margin: 0px;"><pre style="font-size:15px;line-height:1.5331; background-color:white;font-family: Arial,sans-serif;">
1. A candidate should read the instructions carefully and click the Next button after reading them.
2. Check Your Browser Options before the Test to ensure that it is not set to disconnect after several minutes of inactivity.  
3. After clicking on the BEGIN TEST button the actual test time will begin.
4. Only one question will be displayed at a time.
5. In order to answer a question, the candidate has to mouse click the option he/she thinks is appropriate/ correct. 
   The option which has been clicked on will be highlighted and shall be treated as the answer given by the candidate for the 
   question.
6. After selecting an answer for a question the candidate should click on the SAVE And NEXT button to save his answer and
   proceed to the next question. Note that without clicking on Save And Next button the answer selected for a question will   
   not be saved.
7. A candidate can navigate between questions by clicking on the question number displayed to the right of the screen.
8. In case a candidate does not wish to attempt the question then he/ she should not click on any option for that question.
   A candidate can choose to deselect his/her answer for a particular question by clicking on the CLEAR RESPONSE button provided against each question.
9. A candidate can review his/her answers by using the flag button available at the top of the question.
10.Review All of Your Answers Before Submitting the Quiz.
   Make sure you have not accidentally changed your response to a question or made a typographic mistake.
11.The question numbers of attempted and un attempted questions are also shown to the right of the screen.
12.A candidate can then click on any of the question numbers to view the question,in order to attempt/revise his/her the answer.
13.Each question number will be displayed in a particular colour depending on the status of the question:
			<button class="btn btn-sm"style="background-color: rgba(179, 179, 179, 1);"></button> Not visited: Question has not been viewed/ attempted
			<button class="btn btn-sm"style="background-color:#587498; "></button> Not Answered: Question has been viewed but not answered
			<button class="btn btn-sm"style="background-color:#92CD00; "></button> Answered: Question has been answered
			<button class="btn btn-sm"style="background-color: #E86850"></button> Marked: Question has been marked for review later
14.When you are satisfied with the result make sure you finish by clicking the FINISH TEST button at the bottom of the screen.
   Click the Button ONLY ONCE!
15.This Section has got ${testSection.getListQuestions().size() } Questions with total time of ${testSection.sTime} minutes.   
</pre>
</fieldset>
<div class="col-md-9"></div>
	<div class="col-md-3"><a href="begintest.do?sid=${sid }"><button class="btn btn-default active col-sm-12" style="margin-bottom: 5%;border-radius:15px;" id="next">Next</button></a></div>
</div>
</div>


</div>
</body>
</html>