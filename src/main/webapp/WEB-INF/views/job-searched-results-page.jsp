<%@page import="indeed.model.JobSeeker"%>
<%@page import="java.util.Set"%>
<%@page import="indeed.model.Job"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./base.jsp" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
<!DOCTYPE html>
<html>
	<head>
	
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/job-searched-results-page.css' />" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

    	
		
		<meta charset="ISO-8859-1">
		<title>Job search</title>
		<script src="resources/js/job-searched-results-page.js"></script>
		
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
		          <a class="dropdown-item" href="recent-searches">Recent searches</a>
		          <a class="dropdown-item" href="#">help</a>
		          <a class="dropdown-item" href="logout">Logout</a>
		        </div>
		      </li>
	      </c:if>
	      
	    </ul>
	  </div>
	</nav>
	
	
	<div class="container" style="margin-top:20px;" >
	  <form class="text-center" action="job-searched-results-page">
	    <div class="row justify-content-center">
	      <div class="">
	        <input type="text" class="form-control" style="width: 500px;" placeholder="job title" name="jobTitle">
	      </div>
	      <div class="ml-2">
	        <input type="text" class="form-control" style="width: 500px;" placeholder="city" name="city">
	      </div>
	      <div class="ml-2">
	        <button type="submit" class="btn btn-primary" style="width: 100px;background-color:rgb(37, 87, 167);">Find jobs</button>
	      </div>
	    </div>
	  </form>
	</div>
<br>
<hr>
	
	<%List<Job> jobs = (List<Job>)request.getAttribute("jobs"); %>
	
	<%if(jobs.size() != 0) {%>
		
	
 
    <div class="container">
    	
	  <div class="row">
	    <div class="col-md-4" style="margin-right: 0px; overflow-y: scroll;" >
	    
	      <small style="color:grey;">${results}</small>
	      <small style="color:grey; float:right;"><%=jobs.size() %> jobs </small>
	      
	      <div class="list-group" style="max-height: 600px; margin-top:30px;">
	        
	          <c:forEach var="job" items="${jobs}">
		          <div class="job-item" >
			          <a href="#" class="list-group-item job-item" style="border-radius:8px; margin-bottom:7px;" onclick="loadJobDetails(${job.jobId}); return false;">
			          	
	
			          	
			          	<h3 class="jobId" style="display:none;">${job.jobId }</h3>
			            <h5 class="job-title" style="color: black;">${job.jobTitle }</h5>
			            <p class="company-name" style="color: grey; margin-bottom: 0px;">${job.employer.companyName }</p>
			            <p class="location" style="color: grey; margin-bottom: 0px;">${job.address.city}, ${job.address.province }</p>
			            <br>
			            
						<c:set var="jobTypesSize" value="${fn:length(job.jobType) - 1}" />	            
							<c:forEach var="jobType" items="${job.jobType}" varStatus="status">
							  <c:if test="${status.index == 0}">
							  	<%-- <p>${jobType}+${jobTypesSize}</p> --%>
							    <span style="background-color: #D3D3D3;margin-right:5px; border-radius:5px; padding: 2px 5px; color:black;">${jobType}+${jobTypesSize}</span>
							  </c:if>
						  
					  	</c:forEach>

						 
						 <c:set var="jobScheduleSize" value="${fn:length(job.jobSchedule) - 1}" />	            
							<c:forEach var="jobSchedule" items="${job.jobSchedule}" varStatus="status">
							  <c:if test="${status.index == 0}">
							  	<%-- <p>${jobType}+${jobTypesSize}</p> --%>
							    <span style="background-color: #D3D3D3;  border-radius:5px; padding: 2px 5px; color:black;">${jobSchedule}+${jobScheduleSize}</span>
							  </c:if>
						  
					  	</c:forEach>
						 
			            
			            <br>
			    		
			    		<small class="jobDes" style="color:grey; margin-top:10px;">${job.jobDescription}</small>
						<p class="hiring-info" style="color: black; margin-bottom: 0px;">Hiring ${job.numberlimitForThisRole } people for this role</p>
						
			      	 </a>
			      		
		           </div>
	           
	        </c:forEach>
	      </div>
    </div>
     
    <div class="col-md-8" style="max-height:500px;">
      
      <div class="card" style="position: sticky; top: 0; max-height: 100vh; overflow-y: auto;">
           <div class="card-body">
             	
             	<p class="jobIdForDefault">${job.jobId }</p>
             	<h5 class="jobTitle">Job Title</h5>
               <h7 class="companyName">Company Name</h7>
               <p class="locationAndAddress" style="color:grey; margin-bottom:0px;">Address - job location</p>
               <p class="salary" style="margin-bottom:7px;">Salary</p>
                        
                        
               <c:if test="${jobseeker != null }">
	              <form action="send-application-page" method="post" target="_blank">
	              		<input type="hidden"   name="jobId" id="jobId"/>
	                    <input type="hidden"  name="employerId" id="employerId"/>
	                    <input type="hidden"  name="jobseekerId" value="${jobseeker.jobSeekerId }"/>
	                    <button type="submit" class="btn btn-primary" style="width:200px; background-color:rgb(37, 87, 167);">Apply now</button>
	              </form>
	              
	 				<br>
	 				<div id="jobSearchForm">	
	 					<form action="job-saved" method="post">
						  <input type="hidden" name="jobId" id="jobId2"/>
						  <input type="hidden" name="jobseekerId" value="${jobseeker.jobSeekerId }"/>
						
						  <button type="submit" class="btn btn-secondary" style="background-color:rgb(37, 87, 167); width:200px;" id="btnSave">
						    Save job
						  </button>
						</form>
					</div>
				    
					
	              
               </c:if>
               
               <c:if test="${jobseeker == null}">
						    <a href="jobseeker-login-page"><button type="button" class="btn btn-primary" style="width:200px; background-color:rgb(37, 87, 167);">Apply now</button></a>
				</c:if>
                        
                        <hr>
                        
                        <h5>Job details</h5>
                        
                        <br>
                        <span class="fas fa-money-bill" style="margin-right: 5px;"></span><h7> Salary</h7>

                        <p style="margin-bottom: 7px;"  class="salary" >
						    <!-- <span style="background-color: #D3D3D3; border-radius:5px; padding: 2px 5px; text-color:rgb(89, 89, 89)"></span> -->
						</p>
						<br>
						<h7><span class="fas fa-suitcase" style="margin-right: 5px;"></span>Job type</h7>
                        <p style="margin-bottom: 7px;" class="jobTypeee" >
						    
						</p>
						<br>
						
						<h7><span class="fas fa-clock" style="margin-right: 5px;"></span>Shift and schedule</h7>
						<p style="margin-bottom: 7px;" class = "jobSch">
						    
						</p>
                        
                        <hr>
                        
                        <p class="jobDescription"></p>
                        
                        
                    </div>
                </div>  
		  </div>
		</div>
	</div>
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	

	<%} else { %>
		<h1 class="text-center">No results found</h1>
	<%} %>
	
		
      
</body>
</html>