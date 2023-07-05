<%@page import="indeed.model.WorkExperience"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="indeed.model.Education"%>
<%@page import="indeed.model.JobSeeker"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./base.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

    
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Registration-Details</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jobseeker-registration-page9.css' />" />
	
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
	<%JobSeeker jobseeker = (JobSeeker)request.getAttribute("jobSeekerObject"); 
	String name = jobseeker.getFirstName() + " " +  jobseeker.getLastname();%>
	
	
	<div class="container mt-5">
	  <div class="row justify-content-center">
	    <div class="col-6">
	      <div class="text-left">
	        	<h3>Is your resume ready?</h3>
				<p>Review below</p>
				
				<hr>
				
	        	<h5>${jobSeekerObject.firstName } ${jobSeekerObject.lastname }</h5>
	        	<p>${jobSeekerObject.email }</p>
	        	<p>${jobSeekerObject.address.city } ${jobSeekerObject.address.province } ${jobSeekerObject.address.postalCode }</p>
	        	
	      		<hr>
	      		
	      		<h4>Education</h4>
	      		<c:forEach var="e" items="${jobSeekerObject.educations}">
				  <c:set var="startDate" value="${e.startDate}" />
				  <c:set var="endDate" value="${e.endDate}" />
				  <fmt:formatDate var="formattedStartDate" value="${startDate}" pattern="MMM yyyy" />
				  <fmt:formatDate var="formattedEndDate" value="${endDate}" pattern="MMM yyyy" />
				  
				  <div class="d-flex justify-content-center mt-6">
				    <div class="card" style="width: 35rem;">
				      <div class="card-body">
				        <h5 class="card-title">${e.levelOfEducation} in ${e.fieldOfStudy}</h5>
				        <h6 class="card-subtitle mb-2 text-muted">${e.schoolName} - ${e.city} ${e.province}</h6>
				        <p class="card-text">${formattedStartDate} to ${formattedEndDate}</p>
				      </div>
				    </div>
				  </div>
				</c:forEach>

	      		
	      		<hr>
	      		
	      		
	      	

	      		
	      		
	      		<h4>Work experience</h4>
	      		<c:forEach var="w" items="${jobSeekerObject.workexperience}">
				  <c:set var="startDate" value="${w.startDate}" />
				  <c:set var="endDate" value="${w.endDate}" />
				  <c:set var="formattedStartDate">
				    <fmt:formatDate value="${startDate}" pattern="MMM yyyy" />
				  </c:set>
				  <c:set var="formattedEndDate">
				    <fmt:formatDate value="${endDate}" pattern="MMM yyyy" />
				  </c:set>
				
				  <div class="d-flex justify-content-center mt-6">
				    <div class="card" style="width: 35rem;">
				      <div class="card-body">
				        <h6 class="card-title">${w.jobTitle} in ${w.companyName}</h6>
				        <h7 class="card-subtitle mb-2 text-muted">${w.city} ${w.province}</h7>
				        <p class="card-text">${formattedStartDate} to ${formattedEndDate}</p>
				      </div>
				    </div>
				  </div>
				</c:forEach>

	      		
	      		<hr>
	      		
	      		
	      		
	      		<h4>Skills</h4>
	      		<c:forEach items="${jobSeekerObject.skills}" var="skill">
				  <div class="d-flex justify-content-center mt-6">
				    <div class="card" style="width: 35rem; height: 4rem;">
				      <div class="card-body">
				        <p class="card-title">${skill}</p>
				      </div>
				    </div>
				  </div>
				</c:forEach>
				
				<hr>
				
				<h4>Certifications and/or licences</h4>
				<c:forEach items="${jobSeekerObject.certifications}" var="certification">
				  <div class="d-flex justify-content-center mt-6">
				    <div class="card" style="width: 35rem; height: 4rem;">
				      <div class="card-body">
				        <p class="card-title">${certification}</p>
				      </div>
				    </div>
				  </div>
				</c:forEach>
					    	
	      		
				<div class="mt-3" >
			         <a href="profile-ready-page"><button type="submit" class="btn btn-primary" style="background-color:rgb(37, 87, 167);">Finish</button></a>
			    </div>
				
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>