<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>

<link href="css/style.css" rel="stylesheet" />
<link href="css/font-awesome.min.css" rel="stylesheet" />
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap.css.map.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.min.new.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.css.map.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.new.js"></script>
<script type="text/javascript">
	$(function() {

		function myTextOnly1(value, element) {
			var val = $("#uname").val();
			return this.optional(element) || /^[a-zA-Z\s]+$/.test(value);
		}

		$.validator.addMethod("textOnly1", myTextOnly1,
				"Please Enter Only Alphabets");

		$("#loginform").validate({
			rules : {
				name : {
					required : true,
					minlength : 3,
					textOnly1 : true
				},
				uname : {
					required : true,
					minlength : 3,
					textOnly1 : true
				},
				email : {
					required : true,
					minlength : 6
				},
				pwd : {
					required : true,
					minlength : 6
				}
			},
			messages : {
				name : {
					required : "Please Enter user name name",
					minlength : "Please Enter a valide user name "
				},
				uname : {
					required : "Please Enter user name name",
					minlength : "Please Enter a valide user name "
				},
				email : {
					required : "Please Enter your password",
					minlength : "Please Enter Atleast 6 characters"
				},
				pwd : {
					required : "Please Enter your password",
					minlength : "Please Enter Atleast 6 characters"
				}
			}
		});
	});
</script>
<style type="text/css">
label.error {
	float: none;
	color: red;
}

input.error {
	border: 1px solid red;
}
</style>

</head>
<body>
	<div class="container">
		<%@include file="header.jsp"%>
		<div class="row text-center pad-top ">
			<div class="col-md-12" style="margin-top: 40px;">
				<h2>User Registration Page</h2>
			</div>
		</div>
		<div class="row  pad-top">

			<div
				class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong> Provide Your Details </strong>
					</div>
					<div class="panel-body">
						<form role="form" action="register.do" id="loginform">
							<br />
							<div class="form-group input-group">
								<span class="input-group-addon"><i
									class="fa fa-circle-o-notch"></i></span> <input type="text" 
									class="form-control" id="name" name="name" placeholder="Your Name" />
							</div>
							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-tag"></i></span>
								<input type="text" class="form-control" id="uname" name="uname"
									placeholder="Desired Username" />
							</div>
							<div class="form-group input-group">
								<span class="input-group-addon">@</span> <input type="email"
									class="form-control" id="email" name="email" placeholder="Your Email" />
							</div>
							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" id="pwd" name="pwd"
									placeholder="Enter Password" />
							</div>
							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" id="rpwd" name="rpwd"
									placeholder="Retype Password" />
							</div>

							<input type="submit" value="Register now" class="btn btn-success"
								style="margin-left: -16px;"> <input type="reset"
								class="btn btn-primary" id="reset"
								style="margin-left: 23px; width: 98px;"> <a
								href="LoginPage.jsp"><input type="button"
								class="btn btn-primary" id="cancel" value="cancel"
								style="margin-left: 244px;width: 98px;margin-top: -55px;"></a>
							<hr />
							Already Registered ? <a href="Login_page.jsp">Login here</a>
						</form>
					</div>

				</div>
			</div>


		</div>
	</div>


<%@include file="footer.jsp"%>
</body>

</html>
