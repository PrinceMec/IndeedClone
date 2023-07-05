<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/employer-login-page.css' />" />
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="resources/js/employer-login-page.js"></script>
		<meta charset="ISO-8859-1">
		<title>Login as employer</title>
	</head>
	
	
<body style="background-color:#D3D3D3">


	<div class="d-flex justify-content-center align-items-center mt-5">
	  <img src="/indeedclone/images/logo.png" alt="image" style="width:110px; height:60px;">
	</div>
	
	<div class="container mt-2">
	
	    <div class="card" style="border-radius: 10px; max-width:450px;">
	        <div class="card-body">
	            <form id="login-form" action="login" method="post">
				    <h4 class="text-center">Logging as employer</h4>
				    <hr>
				    <div class="form-group">
				        <label for="emailAddress"><h6>Email Address</h6></label>
				        <input type="text" class="form-control input-sm" id="email" name="email">
				        <span id="email-error" class="error-msg" style="color:red;"></span>
				    </div>
				    <div class="form-group">
				        <label for="password"><h6>Password</h6></label>
				        <input type="password" class="form-control input-sm" id="password" name="password">
				        <span id="password-error" class="error-msg" style="color:red;"></span>
				    </div><br>
				    
				    <span id="email-error" class="error-msg" style="color:red;"></span>
				    <br>
				    <div class="form-group">
				        <button type="submit" class="btn btn-primary" style="width:410px; background-color:rgb(37, 87, 167);">Login</button>
				    </div>
				    
				    <div>
				        <a href="jobseeker-login-page">
				            <h7 style="color: rgb(37, 87, 167); font-weight: 650;">
				                Wait, I am a jobseeker
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