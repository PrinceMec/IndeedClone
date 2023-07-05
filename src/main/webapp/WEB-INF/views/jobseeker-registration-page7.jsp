<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./base.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Registration</title>
		<script src="resources/js/jobseeker-registration-page7.js"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jobseeker-registration-page7.css' />" />
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
	
	<div class="container mt-5">
        <div class="row">
            <div class="col-lg-5 offset-lg-3">
                <form action="jobseeker-registration-page8" method="post" onsubmit="return validateForm()">
                
                
                <h2>What are some of your skills?</h2>
                <p>Add at least 6 skills</p>
                
                <br>
                    <div id="skills-error" class="error-message" style="color:red;"></div>
                    <div class="form-group">
                        <label for="addASkill">Enter skill separated by commas</label>
                        <input type="text" class="form-control" id="addASkill" name="addASkill" placeholder="Add a skill">
                    </div>
                    
                    <hr>
                    
                    
                    <div class="">
                        <button type="submit" class="btn btn-primary" style="background-color:rgb(37, 87, 167);">Continue</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
	
</body>


</html>