<%@page import="indeed.model.Employer"%>
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
	
	<div class="container mt-5">
	  <div class="row justify-content-center">
	    <div class="col-md-6 mt-4">
	      <!-- Form content -->
	      <form action="profile-updated" method="post">
		      <c:set var="employer" value="${sessionScope.employer}" />
		      
		      	
		        <h2>Update your employer account</h2>
		        
		        <br>
		        <input type="hidden" value="${employer.employerId }" name="employerId">
		        <div class="form-group">
				    <label for="companyName" >Your company's name *</label>
				    <input type="text" class="form-control" id="companyName" name="companyName" value="${employer.companyName }">
				</div>
				
				<div class="form-group">
			        <label for="selectOption">Your company's number of employees</label>
			        <select class="form-control" id="selectOption" name="numberOfEmployees" >
			          <option value="${employer.numberOfEmployees }">${employer.numberOfEmployees }</option>
			          <option value="1 to 49">1 to 49</option>
			          <option value="50 to 99">50 to 99</option>
			          <option value="100 to 199">100 to 199</option>
			          <option value="200 to 399">200 to 399</option>
			          <option value="400 to 799">400 to 799</option>
			          <option value="800 to 999">800 to 999</option>
			          <option value="1000+">1000+</option>
			        </select>
		        </div>
				
				<div class="form-group">
				    <label for="name" >Your first and last name *</label>
				    <input type="text" class="form-control" id="name" name="name" value="${employer.name }">
				</div>
				
				<div class="form-group">
				    <label for="phoneNumber" >Your phone number</label>
				    <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${employer.phoneNumber }">
				</div>
				
				<div class="form-group">
				    <label for="email" >Email</label>
				    <input type="text" class="form-control" id="email" name="email" value="${employer.email }">
				</div>
				
				<div class="form-group">
				    <label for="password" >Password</label>
				    <input type="password" class="form-control" id="password" name="password" value="${employer.password }">
				</div>
				
				<div class="text-right">
		        	<button type="submit" class="btn btn-primary" style="background-color:rgb(37, 87, 167);">Save and continue</button>
		        	
		      	</div>
		      	
		      	<div class="text-right mt-1">
		      	<a href="go-to-employer-dashboard"><button class="btn btn-primary" style="background-color:rgb(37, 87, 167); width:155px;">Cancel</button></a>
	        	</div>
	        	
	      </form>
	      
	    </div>
	    
	      <div class="col-md-6 text-center mt-4">
	      
	      	<img src="/indeedclone/images/employer-registration.png" alt="employer-registration-image" style="height:580px;">
	    
	      </div>
	  </div>
	</div>
	
</body>
</html>