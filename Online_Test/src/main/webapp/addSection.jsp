<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Section</title>
<!-- <link rel="stylesheet" href="css/bootstrap.min.new.css" />
<script src="js/bootstrap.min.new.js"></script>
<script src="js/jquery.min.new.js"></script> -->
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript">
$(function(){
	function myTextOnly(value,element){
		return this.optional(element) || /^[a-zA-Z\s]+$/.test(value);
	}
	function categoryValidate(){
		var val=$("#category").val();
		if(val == "Select category")
			return false;
		return true;
	}
	function sectionTimeValidate(value,element){
		return this.optional(element) || value > 0;
	}
	$.validator.addMethod("textOnly",myTextOnly,"Please Enter Only Alphabets");
	$.validator.addMethod("selectCategory",categoryValidate,"Please Select Valid Category");
	$.validator.addMethod("sectionTime",sectionTimeValidate,"Please Enter Valid Time for Section");
	
	$("#addsecform").validate({
		rules:{
			sname:{
				required:true,
				minlength:3,
				textOnly:true
			},
			category:{
				selectCategory:true				
			},
			stime:{
				required:true,
				minlength:2,
				sectionTime:true
			}
		},
		messages:{
			sname:{
				required:"Please Enter Category name",
				minlength:"Please Enter Atleast 3 characters"
			},
			stime:{
				required:"Please Enter Section Time",
				minlength:"Please Enter Atleast 10 minutes for section"
			}
		}
	});
});
</script>
<style type="text/css">
em{
color: red;arg1
}
label.error{
float:none;
color:red;
}
input.error{
border:1px solid red;
}
.adsection{
border-radius:20px;
}
</style>
</head>
<body>
	<div class="container-fluid" style="padding: 2%;">
		<div class="panel panel-primary">
			<div class="panel-heading" align="center">
				<h3 class="panel-title">Add New Section</h3>
			</div>
			<div class="panel-body">
			<br><h3>${message }</h3>
			<br>
				<form action="addsection.do" role="form" class="form-horizontal" id="addsecform" name="addsecform" method="post">
					<div class="form-group">
						<label for="category" class="control-label col-md-2">Select
							Category:<em>*</em> </label>
						<div class="col-md-9">
							<select id="category" name="category" class="form-control">
								<option>Select category</option>
								<c:forEach items="${categoryList }" var="cat">
								<option value="${cat.cId }">${cat.cName }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="sname" class="control-label col-md-2">Enter
							Section Name:<em>*</em> </label>
						<div class="col-md-9">
							<input type="text" id="sname" name="sname" class="form-control"
								placeholder="Enter Section name">
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="form-group">
						<label for="sdescription" class="control-label col-md-2">Enter Section Description:  </label>
						<div class="col-md-9">
							<textarea id="sdescription" name="sdescription" class="form-control" cols="200"
								rows="5" placeholder="Enter Description"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="stime" class="control-label col-md-2">Enter Section Time in (minutes):  </label>
						<div class="col-md-9">
							<input type="number" id="stime" name="stime" class="form-control" placeholder="Enter Section Time in minutes">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4"></div>
						<div class="col-md-2">
						<input type="submit" name="addsec" id="addsec" value="Add Section" class="form-control btn btn-primary adsection">
						</div>
			
						<div class="col-md-2">
						<input type="reset" name="reset" id="reset" class="form-control btn btn-primary adsection">
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