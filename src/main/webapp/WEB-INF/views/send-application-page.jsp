<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./base.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Sending application</title>
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
		        <a class="nav-link" href="jobseeker-daashboard">Find jobs</a>
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
		          <a class="dropdown-item" href="#">help</a>
		          <a class="dropdown-item" href="logout">Logout</a>
		        </div>
		      </li>
	      </c:if>
	      
	    </ul>
	  </div>
	</nav>

	
	<h3 class="text-center mt-5"><img src="/indeedclone/images/logo.png" alt="image" style="width:108px; height:60px;"></h3> 
	<div class="container d-flex justify-content-center align-items-center">
	    <div class="card" style="border-radius: 10px; max-width:450px;">
	        <div class="card-body">
	        <h3>Please review your application</h3>
	        
	        	<h6 style="color:grey; padding-top:10px;">Contact information</h6>
	        	
	        	<div class="card" style="border-radius: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
	        		<div class="card-body">
	        		

	        			<h7 style="color:grey;">Full Name</h7>
	        			<h5>${jobseeker.firstName } ${jobseeker.lastname }</h5>
	        			<hr>
	        			
	        			<h7 style="color:grey;">Email</h7>
	        			<h5>${jobseeker.email }</h5>
	        			<hr>
	        			
	        			<h7 style="color:grey;">City, state</h7>
	        			<h5>${jobseeker.address.city }, ${jobseeker.address.province }</h5>
	        			<hr>
	        			
	        			<h7 style="color:grey;">Phone number</h7>
	        			<h5>${jobseeker.phoneNumber }</h5>
	        			
	        		</div>
	        	</div>
	        	
	        	<h6 style="color:grey; padding-top:10px;">Resume</h6>
	        	
	        	<form action="application-submitted"  method="post" enctype="multipart/form-data">
		        	<div class="card" style="border-radius: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
		        		<div class="card-body">
			            
					        <div class="form-group">
					            <label for="resumePDF">Resume PDF</label>
					            
					            <input type="file" class="form-control-file" id="resumePDF" name="resumePDF">
					        </div>
					       
					       <%if(request.getAttribute("resumeMissing") != null) { %>
							    <div class="alert alert-danger">
							        <strong>Error:</strong> <c:out value="${resumeMissing}" />
							    </div>
							<%} %> 
					    
					 	</div>
					</div>
				
					<button type="submit" class="btn btn-primary mt-5" style="background-color:rgb(37, 87, 167);">Submit the application</button>
	        	</form>
	    </div>
	</div>
	</div>
</body>
</html>