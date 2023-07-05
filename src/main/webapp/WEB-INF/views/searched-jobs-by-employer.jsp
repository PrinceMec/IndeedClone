<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Jobs</title>
	</head>
<body>
	<div id="jobsContainer">
	
		  <c:forEach var="eJobs" items="${employerJobs}">
		    <div class="card" style="margin-left:210px; width:1696px; border-radius:10px; margin-top:8px;">
		      <div class="card-body">
		        <h6 style="color:rgb(37, 87, 167);">${eJobs.jobTitle}</h6>
		        <p style="color:grey;">${eJobs.address.city}, ${eJobs.address.province} ${eJobs.address.postalCode}</p>
		      </div>
		    </div>
		  </c:forEach>
		  
	</div>
</body>
</html>