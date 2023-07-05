<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./base-for-employer.jsp" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Candidates</title>
		<script src="resources/js/candidates.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	
	  <a class="navbar-brand" href="#"><img src="/indeedclone/images/employer-side-indeed-logo.png" alt="image" style="width:110px; height:40px;"></a>
	  
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  
	  <div class="collapse navbar-collapse" id="navbarNav">
	    
	    <ul class="navbar-nav ml-auto">
	      <li class="nav-item dropdown"> <!-- Add "dropdown" class to the list item -->
	        <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <i class="fas fa-user"></i> <!-- Add the profile symbol icon here (you may need to include Font Awesome for the icons) -->
	        </a>
	        
		        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="profileDropdown">
			          <!-- Dropdown menu items -->
			          <form action = "edit-employer-profile" method="post">
				          <input type="hidden" name="employerId" value="${employer.employerId }">
				          <button type="submit" class="dropdown-item">Edit profile</button>
			          </form>
			          <a class="dropdown-item" href="#">Help</a>
			          <a class="dropdown-item" href="logout">Logout</a>
		        </div>
	      </li>
	      
	      <li class="nav-item">
	      
	        <a class="nav-link" href="#">${employer.email }</a>
	      </li>
	    </ul>
	  </div>
	</nav>

	<h3 style="margin-left:210px; margin-top:10px;">Candidates</h3>
	
	<button type="button" class="btn btn-primary filter-btn" data-status="Awaitingreview" style="margin-left:210px; border-radius:15px; background-color:rgb(37, 87, 167)">Awaiting review</button>
	<button type="button" class="btn btn-primary filter-btn" data-status="Shortlist" style="border-radius:15px; background-color:rgb(37, 87, 167)">Shortlist</button>
	<button type="button" class="btn btn-primary filter-btn" data-status="Maybe" style="border-radius:15px; background-color:rgb(37, 87, 167)">Maybe</button>
	<button type="button" class="btn btn-primary filter-btn" data-status="Hired" style="border-radius:15px; background-color:rgb(37, 87, 167)">Hired</button>
	<button type="button" class="btn btn-primary filter-btn" data-status="Rejected" style="border-radius:15px; background-color:rgb(37, 87, 167); ">Rejected</button>
	
	<h4 id="status" style="margin-left:210px; margin-top:10px;">Awaiting review</h4>
	<!-- Container to display the filtered job applications -->
	<div id="jobApplicationsContainer" style="margin-top:20px;">
	    <!-- The loop to display the job applications -->
	    <c:forEach var="eJobApplication" items="${jobApplications}">
	        <div class="card" style="margin-left: 210px; width: 1696px; border-radius: 10px; margin-top:7px;">
	            <div class="card-body">
	                <h6 style="color: rgb(37, 87, 167);">${eJobApplication.jobSeeker.firstName} ${eJobApplication.jobSeeker.lastname}</h6>
	                <h8>${eJobApplication.job.jobTitle }</h8><br>
	                <a href="downloadPdf?jobApplicationId=${eJobApplication.jobApplicationId}" target="_blank">View resume</a><br>
	                <h8>Application date: ${eJobApplication.applicationSubmitDate }</h8>
	                <button type="button" class="btn btn-primary move-btn" data-job-application-id="${eJobApplication.jobApplicationId}" style="border-radius:15px;">Move to Next</button>
	            </div>
	        </div>
	    </c:forEach>
	</div>

	



</body>
</html>