$(document).ready(function() {
	 // Initially show the test div and hide the content-container div
   $('#content-container').hide();
  $('#test').show();

  // Click event for Job Feed and Recent Searches links
  $('#job-feed').click(function(e) {
    e.preventDefault();
    $('#test').show();
    $('#content-container').hide();
    loadJobFeed();
  });

  $('#recent-searches').click(function(e) {
    e.preventDefault();
    $('#content-container').show();
    $('#test').hide();
    loadRecentSearches();
  });
	
	
	
	
	
    // Load the job feed content by default
    $.noConflict();
    //loadJobFeed();

    // Handle the click event for the job feed option
    /*$('#job-feed').click(function(e) {
      e.preventDefault();
      loadJobFeed();
    });

    // Handle the click event for the recent searches option
    $('#recent-searches').click(function(e) {
      e.preventDefault();
      loadRecentSearches();
    });*/

    // Function to load the job feed content
    function loadJobFeed() {
		$('#content-container').hide();
		$('#test').show();
		/*$('#content-container').empty();
      jQuery.ajax({
        url: 'job-feed',
        method: 'GET',
        success: function(response) {
          // Update the content container with the retrieved job feed content
          
          $('#content-container').html(response);
          //console.log("in function");
        },
        error: function(xhr, status, error) {
          console.log('Error loading job feed:', error);
        }
      });*/
    }

    // Function to load the recent searches content
    function loadRecentSearches() {
		//$('#test').hide();
		$('#content-container').empty();
		//$('#content-container').show();
		
      jQuery.ajax({
        url: 'recent-searches',
        method: 'GET',
        success: function(response) {
          // Update the content container with the retrieved recent searches content
          
          $('#content-container').html(response);
          
        },
        error: function(xhr, status, error) {
          console.log('Error loading recent searches:', error);
        }
      });
    }
    
    
    
    
    
  });