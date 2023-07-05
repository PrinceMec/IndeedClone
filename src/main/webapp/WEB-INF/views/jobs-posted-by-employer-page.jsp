<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="base-for-employer.jsp" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Your jobs</title>
		<script src="resources/js/jobs-posted-by-employer-page.js"></script>
		
	</head>
<body>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="#"><img src="/indeedclone/images/employer-side-indeed-logo.png" alt="image" style="width:110px; height:40px;"></a>
	  
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  
	  <div class="collapse navbar-collapse" id="navbarNav">
	    
	    <ul class="navbar-nav ml-auto">
	      <li class="nav-item dropdown"> 
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
  
  	<h3 style="margin-left:210px; margin-top:10px;">Jobs</h3>

	
	  <input type="text" class="form-control" id="searchField" placeholder="Search by title" style="border-radius: 10px; margin-left:210px; margin-top:10px; width:250px; height:35px;">
	
	
	<br>
	
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