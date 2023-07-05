<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/post-job-page2.css' />" />
		<title>Post job</title>
		<script src="resources/js/post-job-page2.js"></script>
		
	</head>
	
	
<body style="background-color:#D3D3D3">

	
	
	<div class="blue-line"></div>
	
	<form action="post-job-page3" method="post" onsubmit="return validateForm();">
	
		<div class="container mt-5">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-6">
		        <div class="card-body">
		          <h2 class="card-title ml-4">Include details</h2>
		        </div>
		      </div>
		      <div class="col-md-4">
		        <div class="image">
		          <img src="/indeedclone/images/post-job-page2.png" alt="image" style="width:320px; height:180px;">
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
					  <label for="jobType" class="mb-3"><h5>What is the job type? *</h5></label>
					  <span id="jobTypeError" style="color: red;"></span>
					  <div class="row no-gutters">
					    <div class="col-md-2">
					      <div class="form-check" >
					        <input class="form-check-input" type="checkbox" name="jobType" id="fullTime" value="Full-time">
					        <label class="form-check-label" for="fullTime">Full-time</label>
					      </div>
					    </div>
					    <div class="col-md-2">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="jobType" id="partTime" value="Part-time">
					        <label class="form-check-label" for="partTime">Part-time</label>
					      </div>
					    </div>
					    <div class="col-md-2">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="jobType" id="contract" value="Contract">
					        <label class="form-check-label" for="contract">Contract</label>
					      </div>
					    </div>
					    <div class="col-md-2">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="jobType" id="temporary" value="Temporary">
					        <label class="form-check-label" for="temporary">Temporary</label>
					      </div>
					    </div>
					    <div class="col-md-2">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="jobType" id="internship" value="Internship">
					        <label class="form-check-label" for="internship">Internship</label>
					      </div>
					    </div>
					    <div class="col-md-2">
					      <div class="form-check">
					        <input class="form-check-input" type="checkbox" name="jobType" id="internship" value="Permanent">
					        <label class="form-check-label" for="internship">Permanent</label>
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
		              <label for="jobSchedule" class="mb-3"><h5>What is the schedule for this job? *</h5></label>
		              <span id="jobScheduleError" style="color: red;"></span>
		              <div class="row no-gutters">
		                <div class="col-md-3">
		                  <div class="form-check">
		                    <input class="form-check-input" type="checkbox" name="jobSchedule" id="MondaytoFriday" value="Monday to Friday">
		                    <label class="form-check-label" for="MondaytoFriday">Monday to Friday</label>
		                  </div>
		                </div>
		                <div class="col-md-4">
		                  <div class="form-check">
		                    <input class="form-check-input" type="checkbox" name="jobSchedule" id="Weekendavailability" value="Weekend availability">
		                    <label class="form-check-label" for="Weekendavailability">Weekend availability</label>
		                  </div>
		                </div>
		                <div class="col-md-2">
		                  <div class="form-check">
		                    <input class="form-check-input" type="checkbox" name="jobSchedule" id="Nightshift" value="Night shift">
		                    <label class="form-check-label" for="Night shift">Night shift</label>
		                  </div>
		                </div>
		              </div>
		              <div class="row no-gutters">
		                <div class="col-md-2 ">
		                  <div class="form-check">
		                    <input class="form-check-input" type="checkbox" name="jobSchedule" id="Dayshift" value="Day shift">
		                    <label class="form-check-label" for="temporary">Day shift</label>
		                  </div>
		                </div>
		                <div class="col-md-3">
		                  <div class="form-check">
		                    <input class="form-check-input" type="checkbox" name="jobSchedule" id="Morningshift" value="Morning shift">
		                    <label class="form-check-label" for="Morningshift">Morning shift</label>
		                  </div>
		                </div>
		                <div class="col-md-2">
		                  <div class="form-check">
		                    <input class="form-check-input" type="checkbox" name="jobSchedule" id="overtime" value="Overtime">
		                    <label class="form-check-label" for="overtime">Overtime</label>
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
		          <br>
		           <div class="form-group">
						<label for="streetAddressForJob"><h5>What is the start date for this job? *</h5></label>
						<input type="text" class="form-control" id="startDate" name="startDate" placeholder="yyyy-mm-dd">
						<span id="startDateError" style="color: red;"></span>
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
				        <label for="selectOption"><h5>How many people do you want to hire for this opening? *</h5> </label>
				        <span id="numberLimitError" style="color: red;"></span>
				        <select class="form-control" id="selectOption" name="numberlimitForThisRole">
				          <option value="">Select an option</option>
				          <option value="1">1</option>
				          <option value="2">2</option>
				          <option value="3">3</option>
				          <option value="4">4</option>
				          <option value="5">5</option>
				          <option value="6">6</option>
				          <option value="7">7</option>
				          <option value="8">8</option>
				          <option value="9">9</option>
				          <option value="10">10</option>
				          <option value="10+">10+</option>
				          <option value="I have an ongoing need to fill this role">I have an ongoing need to fill this role</option>
				          
				        </select>
			        </div>
			        
			        <div class="form-group">
				        <label for="selectOption"><h5>How quickly do you need to hire? *</h5> </label>
				        <span id="hireTimelineError" style="color: red;"></span>
				        <select class="form-control" id="selectOption" name="howQuicklyDoYouNeedToHire">
				          <option value="">Select an option</option>
				          <option value="1 to 3 days">1 to 3 days</option>
				          <option value="3 to 7 days">3 to 7 days</option>
				          <option value="1 to 2 weeks">1 to 2 weeks</option>
				          <option value="2 to 4 weeks">2 to 4 weeks</option>
				          <option value="More than 4 weeks">More than 4 weeks</option>
				          
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