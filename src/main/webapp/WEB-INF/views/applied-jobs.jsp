<%@page import="java.util.List"%>
<%@page import="indeed.model.JobApplication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Applied jobs</title>
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
	
	<div class="container">
	<%List<JobApplication> jobApplications = (List<JobApplication>)request.getAttribute("jobApplications"); %>
		<h3  style="margin-top:10px;">Applied jobs (<%=jobApplications.size() %>)</h3>
	</div>
	
	<br>
	
	<c:forEach var="jobApplication" items="${jobApplications}">
	 
		 <div class="container">
	  		<h4>${jobApplication.job.jobTitle }</h4>
	  		<p>${jobApplication.employer.companyName }</p>
	  		<p>${jobApplication.job.address.city }, ${jobApplication.job.address.province }</p>
	  		
	  		<c:if test="${jobApplication.status eq 'Awaitingreview'}">
			    <p> Application status: Applied</p>
			</c:if>
			
			<c:if test="${jobApplication.status eq 'ShortList'}">
			    <p> Application status: Short list</p>
			</c:if>
			
			<c:if test="${jobApplication.status eq 'Maybe'}">
			    <p> Application status: Applied</p>
			</c:if>
			
			<c:if test="${jobApplication.status eq 'Hired'}">
			    <p> Application status: Hired</p>
			</c:if>
			
			<c:if test="${jobApplication.status eq 'Rejected'}">
			    <p> Application status: Rejected by employer</p>
			</c:if>
	  		
	  		<hr>
		</div> 
	  
	</c:forEach> 
	

</body>
</html>