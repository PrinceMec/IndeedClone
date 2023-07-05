function displayErrorMessage(elementId, message) {
    var errorElement = document.getElementById(elementId);
    errorElement.innerText = message;
  }

  function validateForm() {
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    var isValid = true;

    if (email.trim() === "") {
      displayErrorMessage("email-error", "Please enter your email address.");
      isValid = false;
    }else if (!isValidEmail(email)) {
        displayErrorMessage("email-error", "Please enter a valid email address.");
        isValid = false;
      }

    if (password.trim() === "") {
      displayErrorMessage("password-error", "Please enter a password.");
      isValid = false;
    }

    if (isValid) {
      checkEmailAvailability(email, password, function (response) {
        if (response === "exists") {
          displayErrorMessage("email-error", "This email is already registered.");
        } else {
          // Email is valid and not in the database, proceed to the next page
          document.getElementById("registrationForm").submit();
        }
      });
    }

    return false; // Prevent form submission
  }

  function checkEmailAvailability(email, password, callback) {
    $.ajax({
      url: "check-email-for-jobseeker",
      type: "POST",
      data: { email: email, password: password },
      success: function (response) {
        callback(response);
      },
      error: function () {
        // Handle error
      }
    });
  }
  
  function isValidEmail(email) {
	  // Regular expression pattern to validate email format
	  var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	  return emailPattern.test(email);
	}