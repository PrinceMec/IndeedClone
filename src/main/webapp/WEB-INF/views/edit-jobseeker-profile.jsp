<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit profile</title>
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
		        <a class="nav-link" href="jobseeker-dashboard">Find jobs</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">Company reviews</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">Salary guide</a>
		      </li>
		      
		      <c:if test="${jobseeker == null }">
		      	<li class="nav-item">
		        <a class="nav-link" href="signup-option-page">Sign in</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="login-option-page">Log in</a>
		      </li>
	      </c:if>
	      
	      <c:if test="${jobseeker != null }">
		      <li class="nav-item dropdown">
		      
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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

	<div class="container mt-5">
	  <div class="row justify-content-center">
	    <div class="col-md-6 mt-4">
	      <!-- Form content -->
	      <form action="profile-saved" method="post">
		      
		        <h2>Edit profile</h2>
		        
		        <br>
		        <input type="hidden" value="${jobseeker.jobSeekerId }" name="jobSeekerId">
		        <div class="form-group">
				    <label for="companyName" >First name</label>
				    <input type="text" class="form-control" id="firstName" name="firstName" value="${jobseeker.firstName }">
				</div>
				
				<div class="form-group">
				    <label for="name" >Last name</label>
				    <input type="text" class="form-control" id="lastname" name="lastname" value="${jobseeker.lastname }">
				</div>
				
				<div class="form-group">
				    <label for="phoneNumber" >Your phone number</label>
				    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${jobseeker.phoneNumber }">
				</div>
				
				<div class="form-group">
				    <label for="email" >Email</label>
				    <input type="text" class="form-control" id="email" name="email" value="${jobseeker.email }">
				</div>
				
				<div class="form-group">
				    <label for="password" >Password</label>
				    <input type="password" class="form-control" id="password" name="password" value="${jobseeker.password }">
				</div>
				
				<div class="text-right">
		        	<button type="submit" class="btn btn-primary" style="background-color:rgb(37, 87, 167);">Save</button>
		        	
		      	</div>
	        
	      </form>
	      
	      		
	      	
	      		
	    </div>
	  </div>  
	   
	</div>


</body>
</html>