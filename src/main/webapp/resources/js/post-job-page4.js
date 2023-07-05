function validateForm() {
    var applicationDeadline = document.getElementById("applicationDeadline").value;
    var jobDescription = document.getElementById("jobDescription").value;

    // Validate if applicationDeadline is empty or does not match the pattern
    if (applicationDeadline === "" || !/^\d{4}-\d{2}-\d{2}$/.test(applicationDeadline)) {
      // Display an error message for the applicationDeadline field
      document.getElementById("applicationDeadlineError").textContent = "Please enter a valid application deadline (yyyy-mm-dd).";
      return false; // Prevent form submission
    }

    // Validate if jobDescription is empty
    if (jobDescription === "") {
      // Display an error message for the jobDescription field
      document.getElementById("jobDescriptionError").textContent = "Please enter a job description.";
      return false; // Prevent form submission
    }

    // If all validations pass, you can submit the form
    return true;
  }