<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="indeed.model.Job"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/view-job-details.css' />" />
		<meta charset="ISO-8859-1">
		<title>Job details</title>
	</head>
<body style="background-color:#D3D3D3">

	
	<div class="container mt-5">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-6">
		        <div class="card-body">
		          <h2 class="card-title ml-4">Review the job post</h2>
		        </div>
		      </div>
		      <div class="col-md-4">
		        <div class="image">
		          <img src="/indeedclone/images/view-job-details.png" alt="image" style="width:300px; height:160px;">
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="container mt-4">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-12">
		        <div class="card-body ml-4">
		          <h5>${job.jobTitle}</h5>
		          <p>${job.employer.companyName}</p>
		          <p>${job.address.streetAddress}</p>
		          
		          <hr>
		          
		          <h4>Job details</h4>
		          <h7>Pay</h7>
		          <p>CA$${job.minimumPay } - CA$${job.maximumPay } per year</p>
		          
		          
		          <h6>Job type</h6>
					<c:forEach var="jobType" items="${job.jobType}">
					  <p><c:out value="${jobType}" /></p>
					</c:forEach>
							          
		          
		          <h6>Number of openings for this position</h6>
		          <p>${job.numberlimitForThisRole }</p>
		          
		         
		          <h6>Schedule</h6>
					<c:forEach var="jobSchedule" items="${job.jobSchedule}">
					  <p><c:out value="${jobSchedule}" /></p>
					</c:forEach>
		          
		          <%Job job = (Job)request.getAttribute("job"); %>
		          
		          <h6>Expected start date</h6>
		          <p>
					  <c:set var="startDate" value="${job.startDate}" />
					  <c:set var="formattedStartDate">
					    <fmt:formatDate value="${startDate}" pattern="MMM yyyy" />
					  </c:set>
					  ${formattedStartDate}
					</p>
		          	
		          
		          <h6>Benefits</h6>
					<c:forEach var="benefits" items="${job.benefitsOffered}">
					  <p><c:out value="${benefits}" /></p>
					</c:forEach>
		          
		          <hr>
		          
		          <h6>Job description</h6>
		          <p>${job.jobDescription }</p>
		          
		          
		          <h6>Supplemental Pay</h6>
					<c:forEach var="supplementalPayType" items="${job.supplementalPay}">
					  <p><c:out value="${supplementalPayType}" /></p>
					</c:forEach>
		          
		          <h6>Work location</h6>
		          <p>${job.jobsLocation }</p>
		          
		          <h6>Language</h6>
		          <p>${job.languageToPerformThisJob }</p>
		          
		        </div>
		      </div>
		    </div>
		  </div>
	</div>
	
	<div class="container mt-4">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-12">
		        <div class="card-body ml-4">
		        
		        	<p>By pressing confirm, you agree that this job will be posted and applications will be<br>
		        	processed in accordance with Indeed's Cookie Policy, Privacy Policy, and Terms of Service.<br>
		        	You consent to Indeed informing a user that you have opened, viewed, or made a <br>
		        	decision regarding the user's application.</p>
		        
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
				    	<a href="job-is-posted-page"><button type="submit" class="btn btn-primary" style="background-color:rgb(37, 87, 167);">Confirm</button></a>
					</div>
				  </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  </div>

</body>
</html>