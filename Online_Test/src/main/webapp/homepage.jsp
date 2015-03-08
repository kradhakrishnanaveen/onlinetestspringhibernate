<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Test Portal</title>

<script src="js/jquery-1.11.1.js"></script> 

 <script type="text/javascript" src="tinymce/tinymce.min.js"></script> 
	<link href="css/bootstrap.min.css" rel="stylesheet">
 <link href="css/full-slider.css" rel="stylesheet">

<script type="text/javascript">
	$(function(){
		$(".menus").click(function(){
			var val = $(this).val();
			$.get("subhomepage.do?cId="+val,show);
		});
		$("#feedbackbtn").click(function(){
			$.get("gettestdetails.do",show);
		});
		$("#adcat").click(function(){
			$.get("addCategory.jsp",show);
		});
		$("#adsect").click(function(){
			$.get("addsectionstart.do",show);
		});
		function show(data){
			$("#carosel").html("");
			$("#carosel").html(data);
		}
	});
</script>
<style type="text/css">

* {
	margin-top: 0.0px;
	margin-bottom: 0.0px;
	margin-left: 0.0px;
	margin-right: 0.0px;
}
#wrapper {
	height: 100%;
	width: 100%;
}

.container-fluid {
	padding-left: 0px;
	padding-right: 0px;
}
.navbar{
	border-radius:0px;
	margin-bottom: 0px;
}
#footer{
height: 10px;
}
#menu{
margin-top: -30px;
height: 50px;
}
#homebtn{
margin-left: 50px;
width: 8%;
margin-top: 0.6%;
border-radius: 23px;
}
#feedbackbtn{
width: 8%;
margin-top: 0.6%;
border-radius: 23px;
}
#adcat{
width: 8%;
margin-top: 0.6%;
border-radius: 23px;
}
#adsect{
width: 8%;
margin-top: 0.6%;
border-radius: 23px;
}
.menus{
margin-left: 10px;;
width: 12%;
margin-top: 0.6%;
border-radius: 23px !important;
}
</style>
</head>
<body>
	<div id="wrapper" class="container-fluid">

		<%@include file="header.jsp" %>
		<div class="container-fluid" id="body" style="min-height: 470px; margin-top: 100px;">
		<div id="menu" style="background-color:grey;">
			<a href="homepage.do"><button class="btn btn-primary" type="button"
					id="homebtn">
					Home
				</button></a>
			<c:if test="${myadmin eq null }">
			<button class="btn btn-success" type="button" id="feedbackbtn">FeedBack</button>
			</c:if>	
			<c:set var="counter" value="2" />	
			<c:forEach items="${listCategories }" var="cat">
				<button class="btn btn-default menus" id="menu${cat.cId }" value="${cat.cId }" name="menu${cat.cId }">${cat.cName }</button>
			</c:forEach>
			<c:if test="${myadmin ne null }">
				<button class="btn btn-success menus" type="button" id="adcat">Add Category</button>
				<button class="btn btn-success menus" type="button" id="adsect">Add Section</button>
			</c:if>	
				<!-- <button class="btn btn-primary" type="button" id="menu2" >
					Java
				</button>


				<button class="btn btn-primary" type="button"
					id="menu3">
					C
				</button>
				<button class="btn btn-primary" type="button"
					id="menu4">
					Aptitude
				</button>
				<button class="btn btn-primary" type="button"
					id="menu5">
					Contact us
				</button> -->
				</div>
				
		<div id="carosel" style="height: 525px;width: 100%">
		<header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for Slides -->
        <div class="carousel-inner">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <div class="fill" style="background-image:url('img/1900x1080&text=Java.gif');"></div>
                <div class="carousel-caption">
                    <h2>Core Java</h2>
                </div>
            </div>
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
                <div class="fill" style="background-image:url('img/1900x1080&text=C++.gif');"></div>
                <div class="carousel-caption">
                    <h2>Advanced Java</h2>
                </div>
            </div>
            <div class="item">
                <!-- Set the third background image using inline CSS below. -->
                <div class="fill" style="background-image:url('img/1900x1080&text=Web Technologies.gif');"></div>
                <div class="carousel-caption">
                    <h2>Web Technologies</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>

    </header>
    </div>

    <!-- Page Content -->		
		
		</div>
		<%@include file="footer.jsp" %>

	</div>
	    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 2000 //changes the speed
    })
    </script>
</body>
</html>