<%@page import="java.util.List"%>
<%@page import="indeed.model.SavedJob"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My jobs | Indeed</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/saved-jobs.js"></script>


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
	
	<div class="container mb-5">
	<%List<SavedJob> savedJobs = (List<SavedJob>)request.getAttribute("listOfSavedJobs"); %>
		<h3 class="mt-2">Saved jobs (<%=savedJobs.size() %>)</h3>
	</div>
	
	<c:forEach var="savedJob" items="${listOfSavedJobs}">
	 	
	 	<div class="container">
			<div class="row">
			  <div class="col">
			    <div class="d-flex justify-content-between">
			      <h5>${savedJob.job.jobTitle}</h5>
			      <form action="send-application-page" method="post" target="_blank">
			        <input type="hidden" value="${savedJob.job.jobId}" name="jobId" />
			        <input type="hidden" value="${savedJob.job.employer.employerId}" name="employerId" />
			        <input type="hidden" value="${savedJob.jobSeeker.jobSeekerId}" name="jobseekerId" />
			        <button type="submit" class="btn btn-primary" style="width:200px; background-color:rgb(37, 87, 167);">Apply now</button>
			      </form>
			    </div>
			  </div>
			</div>
			<br>
	 		<div class="d-flex justify-content-between">
	  			<p>${savedJob.job.employer.companyName }</p>
	  			<p>${savedJob.job.address.city }, ${savedJob.job.address.province }</p>
	  			
	  			<a href="remove-from-saved/${savedJob.savedJobId}" class="remove-job-link">
				  <button class="btn btn-primary remove-job" data-jobid="${savedJob.savedJobId}" style="width:200px; background-color:white; color:rgb(37, 87, 167);">Remove from saved job</button>
				</a>

	  			
	  			</div>
	  		
	  		<hr>
		</div> 
	  
	</c:forEach>
	
	
	

</body>
</html>