<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Category</title>
<!-- <link rel="stylesheet" href="css/bootstrap.min.new.css" />
<script src="js/bootstrap.min.new.js"></script>
<script src="js/jquery.min.new.js"></script> -->
<script type="text/javascript" src="js/jquery.validate.js"></script> 
<script type="text/javascript">
$(function(){
	function myTextOnly1(value,element){
		return this.optional(element) || /^[a-zA-Z\s]+$/.test(value);
	}
	
	$.validator.addMethod("textOnly1",myTextOnly1,"Please Enter Only Alphabets");
	$("#addcatform").validate({
		rules:{
			cname:{
				required:true,
				minlength:3,
				textOnly1:true
			}
		},
		messages:{
			cname:{
				required:"Please Enter Category name",
				minlength:"Please Enter Atleast 3 characters"
			}
		}
	});
});
</script>
<style type="text/css">
.btnstyle{
border-radius:20px;
}
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
</style>
</head>
<body>
	<div class="container-fluid" style="padding: 2%;">
		<div class="panel panel-primary">
			<div class="panel-heading" align="center">
				<h3 class="panel-title">Add New Category</h3>
			</div>
			<div class="panel-body">
			<br><h3>${message }</h3>
			<br>
				<form action="addcategory.do" role="form" id="addcatform" name="addcatform" class="form-horizontal" method="post">
					
					<div class="form-group">
						<label for="cname" class="control-label col-md-2">Enter
							Category Name:<em>*</em> </label>
						<div class="col-md-9">
							<input type="text" id="cname" name="cname" class="form-control"
								placeholder="Enter Category name">
						</div>
						<div class="col-md-1"></div>
					</div>
					<div class="form-group">
						<label for="cdescription" class="control-label col-md-2">Enter Category Description:  </label>
						<div class="col-md-9">
							<textarea id="cdescription" name="cdescription" class="form-control" cols="200"
								rows="5" placeholder="Enter Description"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4"></div>
						<div class="col-md-2">
						<input type="submit" name="addcat" id="addcat" value="Add Category" class="form-control btn btn-primary btnstyle">
						</div>
			
						<div class="col-md-2">
						<input type="reset" name="reset" id="reset" class="form-control btn btn-primary btnstyle">
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