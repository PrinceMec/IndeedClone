function validateForm(event) {
			  event.preventDefault();
			  clearErrorMessages();

			  var companyName = document.getElementById("companyName").value;
			  var numberOfEmployees = document.getElementById("selectOption").value;
			  var name = document.getElementById("name").value;
			  var phoneNumber = document.getElementById("phoneNumber").value;
			  var email = document.getElementById("email").value;
			  var password = document.getElementById("password").value;

			  var isValid = true;

			  if (companyName.trim() === "") {
			    displayErrorMessage("companyNameError", "Please enter your company's name.");
			    isValid = false;
			  }

			  if (numberOfEmployees === "") {
			    displayErrorMessage("numberOfEmployeesError", "Please select the number of employees.");
			    isValid = false;
			  }

			  if (name.trim() === "") {
			    displayErrorMessage("nameError", "Please enter your first and last name.");
			    isValid = false;
			  }
			  
			  if (phoneNumber.trim() === "") {
				    displayErrorMessage("phoneNumberError", "Please enter your phone number.");
				    isValid = false;
				  } else if (!/^\d{10}$/.test(phoneNumber.trim())) {
				    displayErrorMessage("phoneNumberError", "Phone number must be 10 digits.");
				    isValid = false;
				  }

			  if (email.trim() === "") {
				    displayErrorMessage("emailError", "Please enter your email.");
				    isValid = false;
				  } else if (!/\S+@\S+\.\S+/.test(email.trim())) {
				    displayErrorMessage("emailError", "Please enter a valid email address.");
				    isValid = false;
				  } else {
				    checkEmailAvailability(email, function (response) {
				      if (response === "exists") {
				        displayErrorMessage("emailError", "This email is already registered.");
				        isValid = false;
				      } else {
				        if (isValid) {
				          submitForm();
				        }
				      }
			    });
			  }

			  if (password.trim() === "") {
			    displayErrorMessage("passwordError", "Please enter a password.");
			    isValid = false;
			  }
			}

			function checkEmailAvailability(email, callback) {
			  var xhr = new XMLHttpRequest();
			  xhr.open("POST", "check-email", true);
			  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			  xhr.onreadystatechange = function () {
			    if (xhr.readyState === XMLHttpRequest.DONE) {
			      if (xhr.status === 200) {
			        var response = xhr.responseText;
			        callback(response);
			      } else {
			        console.error("Error: " + xhr.status);
			      }
			    }
			  };
			  xhr.send("email=" + email);
			}

			function submitForm() {
			  document.getElementById("registrationForm").submit();
			}
			
			function clearErrorMessages() {
				  var errorElements = document.getElementsByClassName("error");
				  for (var i = 0; i < errorElements.length; i++) {
				    errorElements[i].textContent = "";
				  }
				}
			function displayErrorMessage(elementId, errorMessage) {
				  var errorElement = document.getElementById(elementId);
				  errorElement.textContent = errorMessage;
				}
