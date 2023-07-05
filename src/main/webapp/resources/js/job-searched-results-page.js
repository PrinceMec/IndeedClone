function loadJobDetails(jobId) {
	console.log(jobId);
	$('#btnSave').text('Save job');
  
	$.ajax({
		url: "jobs/" + jobId, 
		type: "GET",
		success: function (data) {
		// Update the job details in the right div
		console.log(data);
		$(".jobTitle").html(data.jobTitle);
		$(".companyName").html(data.employer.companyName);
		$(".locationAndAddress").html(data.address.city + ", " + data.address.province + " - " + data.jobsLocation);
		$(".salary").html("$" + data.minimumPay + " - $" + data.maximumPay + " per year");
		
		var jobTypes = data.jobType; 

		if (jobTypes && jobTypes.length > 0) {
		  var jobTypesText = jobTypes.join(", "); // Create comma-separated text
		  
		  $(".jobTypeee").text(jobTypesText);
		} else {
		  $(".jobTypeee").text(""); // Clear the element if jobTypes is empty
		}
		
		var schedule = data.jobSchedule; 

		if (schedule && schedule.length > 0) {
		  var jobScheduleText = schedule.join(", "); // Create comma-separated text
		  
		  $(".jobSch").text(jobScheduleText);
		} else {
		  $(".jobSch").text(""); // Clear the element if jobTypes is empty
		}
		
		$(".jobDescription").html(data.jobDescription);
		
		$("#employerId").val(data.employer.employerId);
		$("#jobId").val(data.jobId);
		$("#jobId2").val(data.jobId);
			        
			        
		},
		error: function (xhr, status, error) {
			console.error("Error occurred while loading job details:", error);
			console.log("Error status:", xhr.status);
			console.log("Error message:", xhr.responseText);
		}
	});
}

$(document).ready(function () {
	
  var firstJobId = $(".job-item:first .jobId").text();
  loadJobDetails(firstJobId);
	
	
  ////For description
  var jobDesElements = document.getElementsByClassName("jobDes");

  // Iterate through each "jobDes" element
  for (var i = 0; i < jobDesElements.length; i++) {
    var jobDesElement = jobDesElements[i];

    // Get the job description text
    var jobDescription = jobDesElement.textContent;

    // Split the job description into words
    var words = jobDescription.split(" ");

    // Limit the words to 10
    var limitedWords = words.slice(0, 20);

    // Join the limited words with whitespace
    var limitedJobDescription = limitedWords.join(" ");

    // Add "..." if there are more words
    if (words.length > 10) {
      limitedJobDescription += "...";
    }

    // Update the job description text
    jobDesElement.textContent = limitedJobDescription;
  }
  
  //for save job
  document.getElementById('jobSearchForm').addEventListener('submit', function(event) {
  event.preventDefault(); // Prevent the default form submission behavior
  
  var submitButton = $(this).find('button[type="submit"]');
	submitButton.text('Job Saved');
  // Get the form data
  var formData = new FormData(event.target);

  // Make an AJAX request to submit the form data
  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'job-searched-results-page', true);
  xhr.onload = function() {
    if (xhr.status === 200) {
      // Handle the response here if needed
      
    }
  };
  xhr.send(formData);
});

  
  
  
  
});
  
 
    
    
     

