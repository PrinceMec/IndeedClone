function validateForm() {
    var levelOfEducation = document.getElementById('levelOfEducation').value;
    var fieldOfStudy = document.getElementById('fieldOfStudy').value;
    var schoolName = document.getElementById('schoolName').value;
    var country = document.getElementById('country').value;
    var city = document.getElementById('city').value;
    var province = document.getElementById('province').value;
    var startDate = document.getElementById('startDate').value;
    var endDate = document.getElementById('endDate').value;

    if (
      levelOfEducation === '' ||
      fieldOfStudy === '' ||
      schoolName === '' ||
      country === '' ||
      city === '' ||
      province === '' ||
      startDate === '' ||
      endDate === ''
    ) {
      displayError('education-error', 'Please fill in all the fields.');
      return false;
    }

    var dateRegex = /^\d{4}-\d{2}-\d{2}$/;

    if (!dateRegex.test(startDate) || !dateRegex.test(endDate)) {
      displayError('education-error', 'Please enter the date in the format yyyy-mm-dd.');
      return false;
    }

    return true;
  }

  function displayError(id, message) {
    var errorElement = document.getElementById(id);
    errorElement.innerHTML = message;
    errorElement.style.display = 'block';
  }