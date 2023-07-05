$(document).ready(function() {
	
	 $(".filter-btn").click(function() {
      // Get the data status attribute value of the clicked button
      var status = $(this).data("status");
      
      // Update the text of the "status" <h2> element with the clicked button's data status
      $("#status").text(status + " applications");
    });
    
    // Function to handle the button click event for filtering
    $(".filter-btn").click(function() {
        var status = $(this).data("status");

        // Send an AJAX request to retrieve the filtered job applications
        $.ajax({
            type: "GET",
            url: "filterJobApplications",
            data: { status: status },
            success: function(response) {
                // Update the jobApplicationsContainer with the filtered job applications HTML
                $("#jobApplicationsContainer").html(response);
            },
            error: function() {
                alert("Error occurred while filtering job applications.");
            }
        });
    });

    // Function to handle the button click event for moving to the next status
    $("#jobApplicationsContainer").on("click", ".move-btn", function() {
        var jobApplicationId = $(this).data("job-application-id");

        // Send an AJAX request to update the status in the database
        $.ajax({
            type: "POST",
            url: "moveToNextStatus",
            data: { jobApplicationId: jobApplicationId },
            success: function(response) {
                if (response === "Success") {
                    // Refresh the list of job applications by triggering a click event on the currently active filter button
                    var activeFilterBtn = $(".filter-btn.active");
                    if (activeFilterBtn.length > 0) {
                        activeFilterBtn.click();
                    } else {
                        // If no active filter button exists, reload the page to display the updated list
                        location.reload();
                    }
                } else {
                    alert("Failed to move the job application to the next status.");
                }
            },
            error: function() {
                alert("Error occurred while moving the job application to the next status.");
            }
        });
    });
});