<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/post-job-page1.css' />" />
		 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 		 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.0/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  		<script src="resources/js/post-job-page1.js"></script>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<title>Post a job</title>
		
	</head>
	
<body style="background-color:#D3D3D3;">
	
	
	<div class="blue-line"></div>
	
	
  
  
  
  
  
  
  
  <div id="languageTrainingProvided-error" class="error-message" style="color:red;"></div>
	
	<form action="post-job-page2" method="post" onsubmit="return validate()">
	  <div class="container mt-5">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-6">
		        <div class="card-body">
		          <h2 class="card-title ml-4">Provide basic<br> information</h2>
		        </div>
		      </div>
		      <!-- <div class="">
		        <div class="image"> -->
		          <img src="/indeedclone/images/post-job-page1.png" alt="image" id="provide-basic-info-img" >
		        <!-- </div>
		      </div> -->
		    </div>
		  </div>
	</div>

	  
	  <div class="container mt-4">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-12">
		        <div class="card-body">
		          <div class="form-group">
				    <label for="jobTitle"><h5>Job Title *</h5></label>
				    <input type="text" class="form-control" id="jobTitle" name="jobTitle">
				    <div id="jobTitle-error" class="error-message" style="color:red;"></div>
				  </div>
		        </div>
		      </div>
		    </div>
		  </div>
	  </div>
	
	<div class="container mt-4">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-12">
		        <div class="card-body">
		          <div class="form-group">
				    <div class="form-group">
				        <label for="selectOption"><h5>Which option best describes this job's location? *</h5> </label>
				        <select class="form-control" id="selectOption" name="jobsLocation">
				          <option value="">Select an option</option>
				          <option value="In person - precise location">In person - precise location - The job is performed at a specific address</option>
				          <option value="In person - general location">In person - general location - The job is performed at sites within a specified area</option>
				          <option value="Remote">Remote - The job is performed remotely. No on-site work required</option>
				          <option value="Hybrid remote">Hybrid remote - The job combines on-site work at a specific address with some remote flexibility</option>
				          <option value="On the road">On the road - The job requires regular travel</option>
				          
				        </select>
				        <div id="selectOption-error" class="error-message" style="color:red;"></div>
			        </div>
			        
			        <div class="form-group">
				    <label for="streetAddressForJob"><h5>What is the street address for this location? *</h5></label>
				    <input type="text" class="form-control" id="streetAddressForJob" name="streetAddressForJob">
				    <div id="streetAddressForJob-error" class="error-message" style="color:red;"></div>
				    </div>
				  
					</div>
		        </div>
		      </div>
		    </div>
		  </div>
	</div>
	
	
	<div class="container mt-4">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-12">
		        <div class="card-body">
		          <div class="form-group">
				    <div class="form-group">
				        <label for="city"><h5>City *</h5></label>
				    	<input type="text" class="form-control" id="city" name="city">
				    	<div id="city-error" class="error-message" style="color:red;"></div>
			        </div>
			        
			        <div class="form-group">
					    <label for="province"><h5>Province *</h5></label>
					    <input type="text" class="form-control" id="province" name="province">
					    <div id="province-error" class="error-message" style="color:red;"></div>
				    </div>
				    
				    <div class="form-group">
				        <label for="postalCode"><h5>Postal code *</h5></label>
				    	<input type="text" class="form-control" id="postalCode" name="postalCode">
				    	<div id="postalCode-error" class="error-message" style="color:red;"></div>
			        </div>
			        
			        <div class="form-group">
					    <label for="country"><h5>Country *</h5></label>
					    <input type="text" class="form-control" id="country" name="country">
					    <div id="country-error" class="error-message" style="color:red;"></div>
				    </div>
				  
					</div>
		        </div>
		      </div>
		    </div>
		  </div>
	</div>
	
	
	<div class="container mt-4">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-12">
		        <div class="card-body">
		          <div class="form-group">
				    <div class="form-group">
					  <label for="languageToPerformThisJob"><h5>Provide the language to perform this job?</h5></label>
					  <input type="text" class="form-control" id="languageToPerformThisJob" name="languageToPerformThisJob">
					 </div>
					 
					 <div class="form-group">
				        <label for="isLanguageTrainingProvided"><h5>Is language training provide for the job?</h5> </label>
				        <select class="form-control" id="languageTrainingProvided" name="languageTrainingProvided">
				          <option value="">Select an option</option>
				          <option value="Yes">Yes</option>
				          <option value="No">No</option>
				          
				        </select>
			        </div>
					 
				  </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  </div>
		  
	<div class="container mt-4">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-12">
		        <div class="card-body">
		          <div class="form-group">
				    <div class="text-right">
	        			<button type="submit" class="btn btn-primary"style="background-color:rgb(37, 87, 167);">Save and continue</button>
	      			</div>
				  </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
	
	

 </body>
</html>