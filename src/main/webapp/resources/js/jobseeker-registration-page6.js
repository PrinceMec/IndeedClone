function validateForm() {
    var jobTitle = document.getElementById('jobTitle').value;
    var company = document.getElementById('company').value;
    var country = document.getElementById('country').value;
    var city = document.getElementById('city').value;
    var province = document.getElementById('province').value;
    var fromDate = document.getElementById('from').value;
    var toDate = document.getElementById('to').value;
    var description = document.getElementById('description').value;

    if (
      jobTitle === '' ||
      country === '' ||
      city === '' ||
      province === '' ||
      fromDate === '' ||
      toDate === '' || description === ''
    ) {
      displayError('work-experience-error', 'Please fill in all the required fields.');
      return false;
    }

    var dateRegex = /^\d{4}-\d{2}-\d{2}$/;

    if (!dateRegex.test(fromDate) || !dateRegex.test(toDate)) {
      displayError('work-experience-error', 'Please enter the date in the format yyyy-mm-dd.');
      return false;
    }

    return true;
  }

  function displayError(id, message) {
    var errorElement = document.getElementById(id);
    errorElement.innerHTML = message;
    errorElement.style.display = 'block';
  }