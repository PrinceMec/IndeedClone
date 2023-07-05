<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./base.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<script src="resources/js/jobseeker-registration-page9.js"></script>
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
	
	<div class="container mt-5">
        <div class="row">
            <div class="col-lg-5 offset-lg-3">
                <form action="registration-details" method="post" onsubmit="return validateForm()">
					  <h2>What kind of job are you looking for?</h2>
					  <br>
					
					  <!-- Form content goes here -->
					  <div class="form-group">
					    <label for="minimumBasePay"><b>Minimum base pay</b></label>
					    <input type="text" class="form-control" id="minimumBasePay" name="minimumBasePay" placeholder="$">
					    <div id="minimumBasePay-error" class="error-message" style="color:red;"></div>
					  </div>
					
					  <div class="form-group">
					    <label for="desiredJobTitle"><b>Desired job title</b></label>
					    <input type="text" class="form-control" id="desiredJobTitle" name="desiredJobTitle">
					    <div id="desiredJobTitle-error" class="error-message" style="color:red;"></div>
					  </div>
					
					  <label><b>Relocation</b></label>
					  <div class="form-check">
					    <input class="form-check-input" type="checkbox" name="willingToRelocate" id="relocateCheckbox">
					    <label class="form-check-label" for="relocateCheckbox">I am willing to relocate</label>
					  </div>
					  <br>
					
					  <div class="form-group">
					    <label for="employmentType"><b>Desired job Type</b></label>
					    <div class="checkbox-list">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="desiredJobType" id="fullTime" value="Full-time">
					        <label class="form-check-label" for="fullTime">Full-time</label>
					      </div>
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="desiredJobType" id="partTime" value="Part-time">
					        <label class="form-check-label" for="partTime">Part-time</label>
					      </div>
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="desiredJobType" id="contract" value="Contract">
					        <label class="form-check-label" for="contract">Contract</label>
					      </div>
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="desiredJobType" id="temporary" value="Temporary">
					        <label class="form-check-label" for="temporary">Temporary</label>
					      </div>
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="desiredJobType" id="internship" value="Internship">
					        <label class="form-check-label" for="internship">Internship</label>
					      </div>
					    </div>
					    <div id="jobType-error" class="error-message" style="color:red;"></div>
					  </div>
					
					  <div class="form-group">
					    <label for="availability"><b>Desired work schedule</b></label>
					    <div class="checkbox-list">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="desiredWorkSchedule" id="weekendsOnly" value="Weekends only">
					        <label class="form-check-label" for="weekendsOnly">Weekends only</label>
					      </div>
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="desiredWorkSchedule" id="weekendAvailability" value="Weekend availability">
					        <label class="form-check-label" for="weekendAvailability">Weekend availability</label>
					      </div>
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="desiredWorkSchedule" id="noWeekends" value="No weekends">
					        <label class="form-check-label" for="noWeekends">No weekends</label>
					      </div>
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="desiredWorkSchedule" id="everyWeekend" value="Every Weekend">
					        <label class="form-check-label" for="everyWeekend">Every Weekend</label>
					      </div>
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="desiredWorkSchedule" id="monToFri" value="Monday to Friday">
					        <label class="form-check-label" for="monToFri">Monday to Friday</label>
					      </div>
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="desiredWorkSchedule" id="holidays" value="Holidays">
					        <label class="form-check-label" for="holidays">Holidays</label>
					      </div>
					    </div>
					    <div id="workSchedule-error" class="error-message" style="color:red;"></div>
					  </div>
					
					  <div class="">
					    <button type="submit" class="btn btn-primary" style="background-color:rgb(37, 87, 167);">Save</button>
					  </div>
					</form>
            </div>
        </div>
    </div>
	
</body>

</html>