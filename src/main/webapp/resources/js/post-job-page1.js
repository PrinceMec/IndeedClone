function validate() {
      // Validate job title field
      var jobTitle = document.getElementById("jobTitle").value;
      if (jobTitle.trim() === "") {
        displayErrorMessage("jobTitle", "Job Title is required.");
        return false;
      } else {
        hideErrorMessage("jobTitle");
      }

      // Validate jobs location field
      var jobsLocation = document.getElementById("selectOption").value;
      if (jobsLocation === "") {
        displayErrorMessage("selectOption", "Please select an option for job location.");
        return false;
      } else {
        hideErrorMessage("selectOption");
      }

      // Validate street address field
      var streetAddress = document.getElementById("streetAddressForJob").value;
      if (streetAddress.trim() === "") {
        displayErrorMessage("streetAddressForJob", "Street Address is required.");
        return false;
      } else {
        hideErrorMessage("streetAddressForJob");
      }

      // Validate city field
      var city = document.getElementById("city").value;
      if (city.trim() === "") {
        displayErrorMessage("city", "City is required.");
        return false;
      } else {
        hideErrorMessage("city");
      }

      // Validate province field
      var province = document.getElementById("province").value;
      if (province.trim() === "") {
        displayErrorMessage("province", "Province is required.");
        return false;
      } else {
        hideErrorMessage("province");
      }

      // Validate postal code field
      var postalCode = document.getElementById("postalCode").value;
      if (postalCode.trim() === "") {
        displayErrorMessage("postalCode", "Postal Code is required.");
        return false;
      } else {
        hideErrorMessage("postalCode");
      }

      // Validate country field
      var country = document.getElementById("country").value;
      if (country.trim() === "") {
        displayErrorMessage("country", "Country is required.");
        return false;
      } else {
        hideErrorMessage("country");
      }

      // Validate language to perform this job field
      var language = document.getElementById("languageToPerformThisJob").value;
      if (language.trim() === "") {
        displayErrorMessage("languageToPerformThisJob", "Language to perform this job is required.");
        return false;
      } else {
        hideErrorMessage("languageToPerformThisJob");
      }

      // Validate language training provided field
      var languageTraining = document.getElementById("languageTrainingProvided").value;
      if (languageTraining === "") {
        displayErrorMessage("languageTrainingProvided", "Please select an option for language training.");
        return false;
      } else {
        hideErrorMessage("languageTrainingProvided");
      }

      return true; // If all validations pass, allow the form to be submitted
    }

    // Function to display error message
    function displayErrorMessage(fieldId, message) {
      var errorElement = document.getElementById(fieldId + "-error");
      if (errorElement) {
        errorElement.textContent = message;
        errorElement.style.display = "block";
      }
    }

    // Function to hide error message
    function hideErrorMessage(fieldId) {
      var errorElement = document.getElementById(fieldId + "-error");
      if (errorElement) {
        errorElement.textContent = "";
        errorElement.style.display = "none";
      }
    }