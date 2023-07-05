$(document).ready(function() {
	    $('#jobseeker-login-form').submit(function(e) {
	        e.preventDefault(); // Prevent form submission

	        // Clear previous error message
	        $('#error-message').text('');

	        // Get form inputs
	        var email = $('#email').val();
	        var password = $('#password').val();

	        // Validate inputs
	        if (email.trim() === '' || password.trim() === '') {
	            $('#error-message').text('Email and password are required');
	            return;
	        }

	        // Send AJAX request to the server for validation
	        $.ajax({
	            url: 'validate-login',
	            method: 'POST',
	            data: {
	                email: email,
	                password: password
	            },
	            success: function(response) {
	                // Check the response from the server
	                if (response === 'valid') {
	                    // Redirect to jobseeker dashboard
	                    window.location.href = 'go-to-jobseeker-dashboard';
	                } else {
	                    // Show error message
	                    $('#error-message').text('Invalid email or password');
	                }
	            },
	            error: function(xhr, status, error) {
	                // Show error message
	                $('#error-message').text('An error occurred. Please try again.');
	            }
	        });
	    });
	});