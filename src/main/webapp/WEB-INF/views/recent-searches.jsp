<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recent searches</title>
</head>
<body>

 <style>
    .center-div {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
    
  </style>
  
  
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
	
	<div class="container">
	
		<h2>Recent searches</h2>
	</div>
	
	<br>
	
	<c:forEach var="search" items="${recentSearches}">
	 
		 <div class="container">
	  		<h5>${search.jobTitle }</h5>
	  		<p style="color:grey;">${search.city }</p>
	  		<hr>
		</div> 
	  
	</c:forEach> 




</body>
</html>