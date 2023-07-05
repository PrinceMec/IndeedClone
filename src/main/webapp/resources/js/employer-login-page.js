$(document).ready(function() {
	    $('#login-form').submit(function(e) {
	        e.preventDefault(); // Prevent form submission

	        // Clear previous error messages
	        $('.error-msg').text('');

	        // Get form values
	        var email = $('#email').val();
	        var password = $('#password').val();

	        // Perform client-side validation
	        var errors = false;
	        if (email.trim() === '') {
	            $('#email-error').text('Email is required');
	            errors = true;
	        }
	        if (password.trim() === '') {
	            $('#password-error').text('Password is required');
	            errors = true;
	        }

	        if (errors) {
	            return; // Stop further processing if there are validation errors
	        }

	        // Perform server-side validation using AJAX
	        $.ajax({
	            url: 'login', // Replace with your controller mapping
	            type: 'POST',
	            data: {email: email, password: password},
	            success: function(response) {
	                // Handle successful login (e.g., redirect to dashboard)
	                window.location.href = 'employer-dashboard';
	            },
	            error: function(xhr, status, error) {
	                // Handle login error
	                var errorMessage = xhr.responseText;
	                if (errorMessage === 'invalid_email_password') {
	                    $('#email-error').text('Invalid email or password');
	                }
	                // Handle other error cases if needed
	            }
	        });
	    });
	});