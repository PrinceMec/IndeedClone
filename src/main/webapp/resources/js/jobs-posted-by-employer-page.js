document.addEventListener('DOMContentLoaded', function() {
    var searchField = document.getElementById('searchField');

    searchField.addEventListener('input', function() {
      clearTimeout(typingTimer);
      typingTimer = setTimeout(searchJobs, 500);
    });

    var typingTimer;
    function searchJobs() {
      var searchQuery = searchField.value;
      var xhttp = new XMLHttpRequest();

      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          document.getElementById('jobsContainer').innerHTML = this.responseText;
        }
      };

      xhttp.open("GET", "search?query=" + encodeURIComponent(searchQuery), true);
      xhttp.send();
    }
  });