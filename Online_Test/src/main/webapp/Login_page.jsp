<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>

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

		$("#loginform").validate({
			rules : {
				uname : {
					required : true,
					minlength : 4,
				},
				pwd : {
					required : true,
					minlength : 5
				}
			},
			messages : {
				uname : {
					required : "Please Enter user name name",
					minlength : "Please Enter a valid user name "
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
			<div class="col-md-12" id="message" style="margin-top: 50px;">
				<h2>Please Enter your Login Details</h2>
				<p style="color: red; font-weight: bold;">${message }</p>
				<br>
			</div>
		</div>
		<div class="row  pad-top" style="height: 472px; width: 100%">

			<div
				class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong> Enter Details to Login </strong>
					</div>
					<div class="panel-body">
						<form action="login.do" role="form" id="loginform"
							name="loginform" method="post">
							<br />

							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-tag"></i></span>
								<label for="uname"></label> <input type="email" id="uname"
									name="uname" class="form-control"
									placeholder="Enter Your email here" required>
							</div>
							<div class="form-group input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<label for="pwd"></label> <input type="password" id="pwd"
									name="pwd" class="form-control"
									placeholder="Enter Your Password here" required>
							</div>
							<div class="form-group">
								<label class="checkbox-inline"> <input type="checkbox" id="check" name="check" />Remember
									me
								</label> <span class="pull-right"> <a href="#">Forget
										password ? </a>
								</span>
							</div>
							<div class="form-group" style="padding-left: 55px;">
								<input type="submit" value="Login now" id="submit" name="submit"
									class="btn btn-primary" style="border-radius:25px; width: 100px;"> <a href="Login_page.jsp"><input type="button"
									id="cancel" name="cancel" value="Reset" class="btn btn-primary" style="border-radius:25px; width: 100px;"></a>
							</div>
							<hr />
							Not register ? <a href="registration.jsp">click here </a>
						</form>
					</div>
				</div>
			</div>
		</div><%-- <%  %><%@ include file="" %><%@ include file="" %> --%>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>