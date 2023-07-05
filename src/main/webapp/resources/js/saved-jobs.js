$(document).ready(function() {
		  $('.remove-job').click(function(e) {
		    e.preventDefault();

		    var url = $(this).parent('.remove-job-link').attr('href');

		    $.ajax({
		      url: url,
		      type: 'DELETE',
		      success: function(response) {
		        console.log('Job removed successfully');
		        // Perform any necessary UI updates here
		      },
		      error: function(xhr, status, error) {
		        console.error('Failed to remove job:', error);
		      }
		    });
		  });
		});