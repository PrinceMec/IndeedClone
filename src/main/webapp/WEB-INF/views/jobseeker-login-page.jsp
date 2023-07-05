<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jobseeker-login-page.css' />" />
	<meta charset="ISO-8859-1">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="resources/js/jobseeker-login-page.js"></script>
	
	
	<title>Login as jobseeker</title>
	
</head>
<body style="background-color:#D3D3D3">
	
	<div class="d-flex justify-content-center align-items-center mt-5">
	  <img src="/indeedclone/images/logo.png" alt="image" style="width:110px; height:60px;">
	</div>
	
	
	<div class="container mt-2">
	    <div class="card" style="border-radius: 10px; max-width:450px;">
	        <div class="card-body">
	            <form  id="jobseeker-login-form">
	            
	                <h4 class="text-center">Logging as jobseeker</h4>
	                <hr>
	                
	                <!-- Form content goes here -->
	                <div class="form-group">
	                    <label for="emailAddress"><h6>Email Address</h6></label>
	                    <input type="text" class="form-control input-sm" id="email" name="email">
	                </div>
	                
	                <div class="form-group">
	                    <label for="password"><h6>Password</h6></label>
	                    <input type="password" class="form-control input-sm" id="password" name="password">
	                </div>
	                
	                <div id="error-message" style="color: red;"></div><br>
	                
	                <div class="form-group">
	                    <button type="submit" class="btn btn-primary" style="width:410px; background-color:rgb(37, 87, 167);">Login</button>
	                </div>
	                
	                <div>
	                	<a href="employer-login-page">
		                	<h7 style="color: rgb(37, 87, 167); font-weight: 650;">
							  Wait, I am an employer
							  &rarr;
							</h7>
						</a>
					</div>
					
					
	            </form>
	        </div>
	    </div>
	</div>


	
</body>
</html>