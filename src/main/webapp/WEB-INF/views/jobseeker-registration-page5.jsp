<%@page import="java.util.Set"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="indeed.model.Education"%>
<%@page import="java.util.List"%>
<%@page import="indeed.model.JobSeeker"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@include file="./base.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Registration</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jobseeker-registration-page5.css' />" />
	</head>
	
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" style="width: 110px; height: 60px; margin-right:20px;">
	
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="jobseeker-dashboard" style="color:black;">Find jobs</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#" style="color:black;">Company reviews</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#" style="color:black;">Salary guide</a>
	      </li>
	      
	      <c:if test="${jobseeker == null }">
	        <li class="nav-item">
	          <a class="nav-link" href="signup-option-page" style="color:black;">Sign in</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="login-option-page" style="color:black;">Log in</a>
	        </li>
	      </c:if>
	      
	      <c:if test="${jobseeker != null }">
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:black;">
	            Profile 
	          </a>
	          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	            <a class="dropdown-item" href="edit-jobseeker-profile">Edit profile</a>
	            <a class="dropdown-item" href="saved-jobs-lists">Saved jobs</a>
	            <a class="dropdown-item" href="applied-jobs">Applied jobs</a>
	            <a class="dropdown-item" href="#">help</a>
	            <a class="dropdown-item" href="logout">Logout</a>
	          </div>
	        </li>
	      </c:if>
	      
	    </ul>
	  </div>
	</nav>

<div class="blue-line"></div>

	<%Set<Education> educationList = (Set<Education>)request.getAttribute("educationList");
	
	%>
	
	<h2 class="text-center m-4">Review education</h2>
	
	<% for(Education e: educationList) { 
		Date startDate = e.getStartDate();
		Date endDate = e.getEndDate();
		SimpleDateFormat sdf = new SimpleDateFormat("MMM yyyy", Locale.US);
		String formattedStartDate = sdf.format(startDate);
		String formattedEndDate = sdf.format(endDate);
	%>
		<div class="d-flex justify-content-center mt-6">
		  <div class="card" style="width: 25rem;">
		    <div class="card-body">
		      <h5 class="card-title"><% out.println(e.getLevelOfEducation() + " in " + e.getFieldOfStudy());%></h5>
		      <h6 class="card-subtitle mb-2 text-muted"><% out.println(e.getSchoolName() + " - " + e.getCity());%></h6>
		      <p class="card-text"><% out.println(formattedStartDate + " to " + formattedEndDate);%></p>
		    </div>
		  </div>
		</div>
	<% } %>
	
	<div class="container mt-5">
        <div class="row">
            <div class="col-lg-13 offset-lg-4">
				<form action="jobseeker-registration-page6">
					<div class="">
			             <button type="submit" class="btn btn-primary" style="background-color:rgb(37, 87, 167);">Continue</button>
			        </div>
				</form>
			</div>
		</div>
	</div>
	
	
</body>
</html>
