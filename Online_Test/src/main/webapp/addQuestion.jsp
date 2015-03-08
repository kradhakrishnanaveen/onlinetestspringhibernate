<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Question</title>
<!-- <link rel="stylesheet" href="css/bootstrap.min.new.css" />
<script src="js/bootstrap.min.new.js"></script>
<script src="js/jquery.min.new.js"></script> -->
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript">
$(function(){
$("textarea").keydown(function(e) {
	  var $this, end, start;
	  if (e.keyCode === 9) {
	    start = this.selectionStart;
	    end = this.selectionEnd;
	    $this = $(this);
	    $this.val($this.val().substring(0, start) + "\t" + $this.val().substring(end));
	    this.selectionStart = this.selectionEnd = start + 1;
	    return false;
	  }
	});

	function sectionValidate(){
		var val = $("#section").val();
		if(val=="Select section")
			return false;
		return true;
	}
	function correctAnswerValidate(){
		var val=$("#correctans").val();
		
		var arr = val.split(",");
		
		for(var i=0;i<arr.length;i++){
			if(arr[i].length != 1)
				return false; 
			   if((arr[i].charAt(0) < 65 && arr[i].charAt(0)>90) || (arr[i].charAt(0) < 97 && arr[i].charAt(0) > 122))
				return false;   
			  /*  if(!(arr[i].match("/[a-e]/")|| arr[i].match("/[A-E]/")))
				   return false; */
			/*  if(arr[i].charAt(0) != 'A' || arr[i].charAt(0) != 'B' || arr[i].charAt(0) !='C' || arr[i].charAt(0) !='D' || arr[i].charAt(0) !='E' || arr[i].charAt(0) !='a' || arr[i].charAt(0) !='b' || arr[i].charAt(0) !='c' || arr[i].charAt(0) !='d' || arr[i].charAt(0) !='e')
					return false;	 */ 
			/*   if(!arr[i].charAt(0).equals('A'))
					return false; */
		}
		if(val.charAt(val.length-1)==",")
			return false;
		return true;
	}
	
	
	$.validator.addMethod("selectSection",sectionValidate,"Please Select Valid Section");
	$.validator.addMethod("validCorrectAns",correctAnswerValidate,"Please Enter Valid format of Correct Answers As(A,B,C,D)");
$("#addquesform").validate({
	rules:{
		question:{
			required:true,
			minlength:5
		},
		section:{
			selectSection:true
		},
		opt1:{
			required:true
		},
		opt2:{
			required:true
		},
		opt3:{
			required:true
		},
		opt4:{
			required:true
		},
		correctans:{
			required:true,
			validCorrectAns:true
		}		
	},
	messages:{
		question:{
			required:"Please Enter Valid Question",
			minlength:"Please Enter Atleast 5 characters"
		},
		opt1:{
			required:"Please Enter Valid Option"
		},
		opt2:{
			required:"Please Enter Valid Option"
		},
		opt3:{
			required:"Please Enter Valid Option"
		},
		opt4:{
			required:"Please Enter Valid Option"
		},
		correctans:{
			required:"Please Enter Correct Answer As (A or A,B,C(if multiple))"
		}
	}
});
});
</script>
<style type="text/css">
em{
color: red;
}
label.error{
float:none;
color:red;
}
input.error{
border:1px solid red;
}
textarea.error{
border:1px solid red;
}
.adq{
border-radius:20px;
}
</style>
</head>
<body>
	<div class="container-fluid" style="padding: 2%;">
		<div class="panel panel-primary">
			<div class="panel-heading" align="center">
				<h3 class="panel-title">Add New Question</h3>
			</div>
			<div class="panel-body">
			<br><h3>${message }</h3>
			<br>
				<form action="addquestion.do" role="form" class="form-horizontal" id="addquesform" name="addquesform" method="post">
					<div class="form-group">
						<label for="section" class="control-label col-md-2">Select
							Section:<em>*</em> </label>
						<div class="col-md-9">
							<select id="section" name="section" class="form-control">
								<option>Select section</option>
								<c:forEach items="${sectionList }" var="sec">
								<option value="${sec.sId }">${sec.sName }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="question" class="control-label col-md-2">Enter
							Question:<em>*</em> </label>
						<div class="col-md-9">
							<textarea id="question" name="question" class="form-control"
								cols="200" rows="20"
								placeholder="Enter Question"><pre>Enter Program in between this tag(formatted content)</pre></textarea>
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="form-group">
						<label for="opt1" class="control-label col-md-2">A:<em>*</em> </label>
						<div class="col-md-9">
							<textarea id="opt1" name="opt1" class="form-control" cols="200"
								rows="3" placeholder="Enter Option 1"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="opt2" class="control-label col-md-2">B:<em>*</em> </label>
						<div class="col-md-9">
							<textarea id="opt2" name="opt2" class="form-control" cols="200"
								rows="3" placeholder="Enter Option 2"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="opt3" class="control-label col-md-2">C:<em>*</em> </label>
						<div class="col-md-9">
							<textarea id="opt3" name="opt3" class="form-control" cols="200"
								rows="3" placeholder="Enter Option 3"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="opt4" class="control-label col-md-2">D:<em>*</em> </label>
						<div class="col-md-9">
							<textarea id="opt4" name="opt4" class="form-control" cols="200"
								rows="3" placeholder="Enter Option 4"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="opt5" class="control-label col-md-2">E: </label>
						<div class="col-md-9">
							<textarea id="opt5" name="opt5" class="form-control" cols="200"
								rows="3" placeholder="Enter Option 5(Optional)"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="correctans" class="control-label col-md-2">Correct
							Answer:<em>*</em> </label>
						<div class="col-md-9">
							<textarea id="correctans" name="correctans" class="form-control"
								cols="200" rows="2"
								placeholder="Enter Answer As:(A,B,C). If multiple Answers seperated By Comma(,)"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="explanation" class="control-label col-md-2">Explanation: </label>
						<div class="col-md-9">
							<textarea id="explanation" name="explanation" class="form-control"
								cols="200" rows="2"
								placeholder="Enter Explanation for Correct Answer"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4"></div>
						<div class="col-md-2">
						<input type="submit" name="addques" id="addques" value="Add Question" class="form-control btn btn-primary adq">
						</div>
			
						<div class="col-md-2">
						<input type="reset" name="reset" id="reset" class="form-control btn btn-primary adq">
						</div>	
						<div class="col-md-4"></div>
					</div>
				</form>
			</div>
			<!-- <div class="panel-footer">Panel footer</div> -->
		</div>
	</div>
</body>
</html>