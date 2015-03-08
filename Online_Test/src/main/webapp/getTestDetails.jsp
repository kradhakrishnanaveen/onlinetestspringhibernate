<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<div class="panel panel-success" style="minwidth: 600px;minheight: 500px;padding: 2%; ">
			<div class="panel-heading" align="center">
				<h3 class="panel-title">Test Details</h3>
			</div>
			<div class="panel-body">
			<br>
			<br>
			<c:if test="${empty testDetails }">
				<h3>No Records are present to get Feedback</h3>
			</c:if>
			<c:if test="${not empty testDetails }">
				<table class="table table-striped">
					<thead>
						<tr>	
							<th>S.No</th>
							<th>Test Date &amp; Time</th>
							<th>Section Name</th>
							<th>Total No of Questions</th>
							<th>Marks Scored</th>
						</tr>
					</thead>
				<c:set var="counter" value="1"/>
				<c:forEach items="${testDetails }" var="cat">
					<tbody>
						<tr>
							<td><c:out value="${counter }"/>
								<c:set var="counter" value="${counter+1 }"/></td>
							<td>${cat.tDate }</td>
							<td>${cat.testSection.getsName() }</td>
							<td style="padding-left: 6%;">${cat.testSection.getListQuestions().size() }</td>
							<td style="padding-left: 3%;">${cat.tMarks }</td>
						</tr>
					</tbody>
				</c:forEach>
				</table>
			</c:if>
			</div>
			<!-- <div class="panel-footer">Panel footer</div> -->
		</div>
	
</body>
</html>