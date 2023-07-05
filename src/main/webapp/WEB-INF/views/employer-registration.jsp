<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./base.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>Registration</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="resources/js/employer-registration.js"></script>
		
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
	
	
	<div class="container mt-5">
	  <div class="row justify-content-center">
	    <div class="col-md-6">
	      
	      <form id="registrationForm" action="employer-registration-successful" method="post" onsubmit="validateForm(event);">
	      
	        <h2>Create an employer account</h2>
	        
	        <br>
	        
	        <div class="form-group">
			    <label for="companyName" >Your company's name *</label>
			    <input type="text" class="form-control" id="companyName" name="companyName">
			    <span id="companyNameError" class="error" style="color:red;"></span>
			</div>
			
			<div class="form-group">
		        <label for="selectOption">Your company's number of employees</label>
		        <select class="form-control" id="selectOption" name="numberOfEmployees">
		          <option value="">Select an option</option>
		          <option value="1 to 49">1 to 49</option>
		          <option value="50 to 99">50 to 99</option>
		          <option value="100 to 199">100 to 199</option>
		          <option value="200 to 399">200 to 399</option>
		          <option value="400 to 799">400 to 799</option>
		          <option value="800 to 999">800 to 999</option>
		          <option value="1000+">1000+</option>
		        </select>
		        <span id="numberOfEmployeesError" class="error" style="color:red;"></span>
	        </div>
			
			<div class="form-group">
			    <label for="name" >Your first and last name *</label>
			    <input type="text" class="form-control" id="name" name="name" >
			    <span id="nameError" class="error" style="color:red;"></span>
			</div>
			
			<div class="form-group">
			    <label for="phoneNumber" >Your phone number</label>
			    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" >
			    <span id="phoneNumberError" class="error" style="color:red;"></span>
			</div>
			
			<div class="form-group">
			    <label for="email" >Email</label>
			    <input type="text" class="form-control" id="email" name="email">
			    <span id="emailError" class="error" style="color:red;"></span>
			</div>
			
			<div class="form-group">
			    <label for="password" >Password</label>
			    <input type="password" class="form-control" id="password" name="password" >
			    <span id="passwordError" class="error" style="color:red;"></span>
			</div>
			
			 <div id="errorMessages" class="error" style="display:none;"></div>
			
			<div class="text-right">
	        	<button type="submit" class="btn btn-primary" style="background-color:rgb(37, 87, 167);">Save and continue</button>
	      	</div>
	        
	      </form>
	      
	    </div>
	    
	    <div class="col-md-6 text-center mt-4">
	      	<img src="${pageContext.request.contextPath}/images/employer-registration.png" alt="employer-registration-image" style="height:580px;">
	    </div>
	    
	  </div>
	</div>

	
	
	
</body>
</html>