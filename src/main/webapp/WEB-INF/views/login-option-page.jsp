<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/login-option-page.css' />" />
		<meta charset="ISO-8859-1">
		
		
		
		<title>Login</title>
	</head>
<body style="background-color:#D3D3D3">
	
	<h3 class="text-center mt-5"><img src="/indeedclone/images/logo.png" alt="image" style="width:110px; height:60px;"></h3> 
	
	<div class="container mt-4">
		  <div class="card" style="border-radius: 10px; width:400px;">
		    <div class="row">
		      <div class="col-md-12">
		        <div class="card-body ml-2">
		        	<div class="d-flex justify-content-center align-items-center">
					  <img src="/indeedclone/images/welcome-image.png" alt="welcome" style="height:180px; width:370px;">
					</div>
		        	<br>
		        	<h5>Login</h5>
		        	<p>Find opportunities to your career</p>
		        	<a href="jobseeker-login-page"><button class="btn btn-primary" style="background-color: white; color: rgb(37, 87, 167); border-color:grey; width: 340px; font-weight:650;">Job seeker</button></a><br>
		        	<a href="employer-login-page"><button class="btn btn-primary mt-2" style="background-color: white; color: rgb(37, 87, 167); border-color:grey; width: 340px; font-weight:650;">Employer</button></a>
		        	
		        
		        </div>
		      </div>
		   </div>
		  </div>
	 </div>
	
</body>
</html>