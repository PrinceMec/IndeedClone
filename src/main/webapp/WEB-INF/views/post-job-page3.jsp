<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %> 
<!DOCTYPE html>
<html>
	<head>
	
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/post-job-page3.css' />" />
		<title>Post job</title>
		<script src="resources/js/post-job-page3.js"></script>
		
    
	</head>
<body style="background-color:#D3D3D3">
	
	
	
	<div class="blue-line"></div>
	<form action="post-job-page4" method="post" onsubmit="return validateForm();">
	
		<div class="container mt-5">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-6">
		        <div class="card-body">
		          <h2 class="card-title ml-4">Add compensation</h2>
		        </div>
		      </div>
		      <div class="col-md-4">
		        <div class="image">
		          <img src="/indeedclone/images/post-job-page3.png" alt="image" style="width:300px; height:120px;">
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
		          <h5>What is the pay range?</h5><br>
				    <label for="minimumPay"><b>Minimum</b></label>
				    <span id="minimumPayError" style="color: red;"></span>
				    <input type="text" class="form-control" id="minimumPay" name="minimumPay" placeholder="$ per year">
				  </div>
				  <div class="form-group">
				    <label for="maximumPay"><b>Maximum</b></label>
				    <span id="maximumPayError" style="color: red;"></span>
				    <input type="text" class="form-control" id="maximumPay" name="maximumPay" placeholder="$ per year">
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
					  <label for="jobType" class="mb-3"><b>Do you offer any of the following supplemental pay? *</b></label>
					  <span id="supplementalPayTypeError" style="color: red;"></span>
					  <div class="row no-gutters">
					    <div class="col-md-3">
					      <div class="form-check" >
					        <input class="form-check-input" type="checkbox" name="supplementalPayType" id="overTimePay" value="Overtime pay">
					        <label class="form-check-label" for="overTimePay">Overtime pay</label>
					      </div>
					    </div>
					    <div class="col-md-2">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="supplementalPayType" id="bonusPay" value="Bonus pay">
					        <label class="form-check-label" for="bonusPay">Bonus pay</label>
					      </div>
					    </div>
					    <div class="col-md-2">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="supplementalPayType" id="tips" value="Tips">
					        <label class="form-check-label" for="tips">Tips</label>
					      </div>
					    </div>
					    <div class="col-md-3">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="supplementalPayType" id="Commissionpay" value="Commission pay">
					        <label class="form-check-label" for="Commissionpay">Commission pay</label>
					      </div>
					    </div>
					    
					  
					  <div class="row no-gutters">
					    <div class="col-md-6">
					      <div class="form-check" >
					        <input class="form-check-input" type="checkbox" name="supplementalPayType" id="fullTime" value="Signing bonus">
					        <label class="form-check-label" for="fullTime">Signing bonus</label>
					      </div>
					    </div>
					    <div class="col-md-6">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="supplementalPayType" id="Retentionbonus" value="Retention bonus">
					        <label class="form-check-label" for="Retentionbonus">Retention bonus</label>
					      </div>
					    </div>
					    <div class="col-md-4">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="supplementalPayType" id="other" value="Other">
					        <label class="form-check-label" for="other">Other</label>
					      </div>
					    </div>
					    
					  </div>
					</div>
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
					  <label for="jobType" class="mb-3"><b>Are any of the following benefits offered? *</b></label>
					  <span id="benefitsOfferedError" style="color: red;"></span>
					  <div class="row no-gutters">
					    <div class="col-md-2">
					      <div class="form-check" >
					        <input class="form-check-input" type="checkbox" name="benefitsOffered" id="fullTime" value="Dental care">
					        <label class="form-check-label" for="fullTime">Dental care</label>
					      </div>
					    </div>
					    <div class="col-md-3">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="benefitsOffered" id="partTime" value="Extended health care">
					        <label class="form-check-label" for="partTime">Extended health care</label>
					      </div>
					    </div>
					    <div class="col-md-2">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="benefitsOffered" id="contract" value="Life insurance">
					        <label class="form-check-label" for="contract">Life insurance</label>
					      </div>
					    </div>
					    <div class="col-md-4">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="benefitsOffered" id="temporary" value="Language training provided">
					        <label class="form-check-label" for="temporary">Language training provided</label>
					      </div>
					    </div>
					    
					  
					  <div class="row no-gutters">
					    <div class="col-md-7">
					      <div class="form-check" >
					        <input class="form-check-input" type="checkbox" name="benefitsOffered" id="fullTime" value="Flexible schedule">
					        <label class="form-check-label" for="fullTime">Flexible schedule</label>
					      </div>
					    </div>
					    <div class="col-md-6">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="benefitsOffered" id="partTime" value="Retention bonus">
					        <label class="form-check-label" for="partTime">Retention bonus</label>
					      </div>
					    </div>
					    
					    
					  </div>
					  
					  <div class="row no-gutters">
					    <div class="col-md-8">
					      <div class="form-check" >
					        <input class="form-check-input" type="checkbox" name="benefitsOffered" id="fullTime" value="Casual dress">
					        <label class="form-check-label" for="fullTime">Casual dress</label>
					      </div>
					    </div>
					    <div class="col-md-6">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="benefitsOffered" id="partTime" value="Pension">
					        <label class="form-check-label" for="partTime">Pension</label>
					      </div>
					    </div>
					    
					    
					  </div>
					  
					  
					</div>
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
			        	<button type="submit" class="btn btn-primary" style="background-color:rgb(37, 87, 167);">Save and continue</button>
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