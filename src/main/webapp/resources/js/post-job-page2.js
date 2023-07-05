function validateForm() {
    var jobType = document.getElementsByName("jobType");
    var jobSchedule = document.getElementsByName("jobSchedule");
    var startDate = document.getElementById("startDate").value;
    var numberLimit = document.getElementById("selectOption").value;
    var hireTimeline = document.getElementById("selectOption").value;

    var jobTypeError = document.getElementById("jobTypeError");
    var jobScheduleError = document.getElementById("jobScheduleError");
    var startDateError = document.getElementById("startDateError");
    var numberLimitError = document.getElementById("numberLimitError");
    var hireTimelineError = document.getElementById("hireTimelineError");

    var isValid = true;

    // Reset error messages
    jobTypeError.innerHTML = "";
    jobScheduleError.innerHTML = "";
    startDateError.innerHTML = "";
    numberLimitError.innerHTML = "";
    hireTimelineError.innerHTML = "";

    // Validate job type
    var checkedJobType = Array.from(jobType).some((checkbox) => checkbox.checked);
    if (!checkedJobType) {
      jobTypeError.innerHTML = "Please select a job type.";
      isValid = false;
    }

    // Validate job schedule
    var checkedJobSchedule = Array.from(jobSchedule).some((checkbox) => checkbox.checked);
    if (!checkedJobSchedule) {
      jobScheduleError.innerHTML = "Please select a job schedule.";
      isValid = false;
    }

    // Validate start date
     var pattern = /^\d{4}-\d{2}-\d{2}$/;
    if (startDate.trim() === "" || !pattern.test(startDate)) {
      startDateError.innerHTML = "Date is required and it must be in yyyy-mm-dd format.";
      isValid = false;
    }

    // Validate number limit
    if (numberLimit === "") {
      numberLimitError.innerHTML = "Please select the number of people to hire.";
      isValid = false;
    }

    // Validate hire timeline
    if (hireTimeline === "") {
      hireTimelineError.innerHTML = "Please select the hiring timeline.";
      isValid = false;
    }

    return isValid;
  }