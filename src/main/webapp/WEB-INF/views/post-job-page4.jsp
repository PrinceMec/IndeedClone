<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="./bootstrap-base.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		  <title>Post a job</title>
		  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.7.2/dist/css/bootstrap.min.css">
		  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/post-job-page4.css' />" />
		  <script src="resources/js/post-job-page4.js"></script>
		  <script src="https://cdn.tiny.cloud/1/[YOUR_API_KEY]/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
		  
   
	</head>
<body style="background-color:#D3D3D3">
  
  
  
  <div class="blue-line"></div>
  
  	<div class="containerr">
  		<div class="container mt-5">
		  <div class="card" style="border-radius: 20px;">
		    <div class="row">
		      <div class="col-md-6">
		        <div class="card-body">
		          <h2 class="card-title ml-4">Describe the job</h2>
		        </div>
		      </div>
		      <div class="col-md-4">
		        <div class="image">
		          <img src="/indeedclone/images/post-job-page4.png" alt="image" style="width:300px; height:160px;">
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
   
	    <form action="view-job-details" method="post" onsubmit="return validateForm()">
	
		  <div class="container mt-4">
		    <div class="card" style="border-radius: 20px;">
		      <div class="row">
		        <div class="col-md-12">
		          <div class="card-body">
		          
		            <div class="form-group">
		              <label for="applicationDeadline"><h5>What is the Application deadline? *</h5></label>
		              <input type="text" class="form-control" id="applicationDeadline" name="applicationDeadline" placeholder="yyyy-mm-dd">
		              <span id="applicationDeadlineError" class="text-danger"></span> <!-- Error message element for applicationDeadline field -->
		            </div>
		            
		            <h5>Job description *</h5>
		            <p>Describe the responsibilities of this job, required work experience, skills, or education.</p>
		            
		            <div class="form-group">
		              <textarea class="form-control large-input" id="jobDescription" rows="5" name="jobDescription"></textarea>
			              <input type="hidden" id="jobDescriptionHtml" name="jobDescriptionHtml"> <!-- Hidden input field to store the HTML content -->
			              <span id="jobDescriptionError" class="text-danger"></span> <!-- Error message element for jobDescription field -->
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
	  </div>
	  
	   <script>
  function handlePaste(event) {
    // Prevent the default paste behavior
    event.preventDefault();
    
    // Get the pasted content as plain text
    var clipboardData = event.clipboardData || window.clipboardData;
    var pastedText = clipboardData.getData('text/plain');
    
    // Insert the pasted content with preserved formatting
    insertTextWithFormatting(pastedText);
  }
  
  function insertTextWithFormatting(text) {
    // Get the textarea element
    var textarea = document.getElementById('myTextarea');
    
    // Get the current selection start and end positions
    var startPos = textarea.selectionStart;
    var endPos = textarea.selectionEnd;
    
    // Get the current textarea value
    var currentValue = textarea.value;
    
    // Construct the updated value with the pasted text
    var updatedValue = currentValue.substring(0, startPos) +
                       text +
                       currentValue.substring(endPos);
    
    // Update the textarea value
    textarea.value = updatedValue;
  }
</script>

</body>
</html>







