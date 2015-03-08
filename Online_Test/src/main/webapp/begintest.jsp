<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-1.11.1.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function () {
	          $("#checkbox").click(function () {
	              $("#begintest").attr("disabled", !this.checked);
	          });
	        });
</script>
<title>Begin Test</title>
</head>
<body>
<div class="container"style="background-color:rgba(156,153,153,1);">
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12"></div>
<div class="col-md-12">
<pre style="font-size:15px;line-height:1.5331; background-color:white;font-family: Arial,sans-serif;padding:3%">
<label style="color: blue;">DO'S</label>
1. A candidate can then click on any of the question numbers to view the question, in order 
   to attempt/ revise his/her answer to the question.
2. If u will not submit the test on time, it will be automatically submitted if time exceeds.
3. There is NO NEGATIVE MARKING for any question.
4. Whenever u finish the test u can click on FINISH TEST button.

<label style="color: blue;">DONT'S</label>
1.Don't close the window of the test for any reason.
2.Do Not Use the "Back" Button on Your Browser During the Test once you have begun taking the quiz.
  Instead, use the buttons provided at the right side of the screen.
3.Under no circumstances should a candidate click on any of the keyboard keys once the exam starts as this will lock the exam.
4.Don't use Calculators,mobile while writing the exam
5.Don't refresh the page for any reason
</pre></div>

<div class="col-md-9"><input type="checkbox" style="size:15px;" id="checkbox">  I agree with all the terms and conditions you have provided.</div>
<div class="col-md-3"><a href="startexam.do?sid=${sid }"><button class="btn btn-default active col-sm-12" style="margin-bottom: 5%;border-radius:15px;" id="begintest" disabled>Begin Test</button></a></div>
</div>
</body>
</html>