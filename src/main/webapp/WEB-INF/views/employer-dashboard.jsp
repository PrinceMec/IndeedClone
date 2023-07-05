<%@page import="indeed.model.Employer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@include file="base-for-employer.jsp" %> 
<!DOCTYPE html>
<html>

	<head>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/employer-dashboard.css' />" />
		<meta charset="ISO-8859-1">
		<title>Dashboard</title>
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


	
	
	<h2 class="text-center" style="margin-top:40px;">Welcome ${employer.name }</h2>


</body>

</html>