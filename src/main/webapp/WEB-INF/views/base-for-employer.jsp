<%@page import="indeed.model.Employer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.4.1/dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Font Awesome icons (optional, for the ellipsis icon) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/base-for-employer.css' />" />
    
  </head>
  <body>
    
    <div class="sidebar">
  <div class="toggle-btn" onclick="toggleSidebar()">
    <span class="toggle-icon" style="color:white;">&#9776;</span>
  </div>
  
  <ul class="sidebar-options" style="color:white;">
    <li>
      <a href="post-job-page1" style="text-decoration:none; color:white;">
        <span style="margin-right: 5px; font-size:20px;">+</span> <!-- Add the "+" icon using Unicode -->
        Post a job 
      </a>
    </li>
    
    <li>
      <a href="jobs-posted-by-employer-page" style="text-decoration:none; color:white;">
        <span class="fas fa-suitcase" style="margin-right: 5px;"></span>
        Jobs
      </a>
    </li>
    
    <li>
    <a href="candidates" style="text-decoration:none; color:white;">
    <div>
      
        <span class="bi bi-person" style="margin-right: 5px;"></span>
        Candidates
      
      </div>
      </a>
    </li>
    
    
    
    <li>
      <a href="#" style="text-decoration:none; color:white;">
        <span class="bi bi-info-circle" style="margin-right: 5px;"></span>
        About
      </a>
    </li>
  </ul>
</div>





    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
      </body>
</html>