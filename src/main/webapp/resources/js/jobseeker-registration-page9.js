 function validateForm() {
    var minimumBasePay = document.getElementById('minimumBasePay').value;
    var desiredJobTitle = document.getElementById('desiredJobTitle').value;

    if (minimumBasePay === '') {
      displayError('minimumBasePay-error', 'Please enter the minimum base pay.');
      return false;
    }

    if (isNaN(minimumBasePay) || parseFloat(minimumBasePay) <= 0) {
      displayError('minimumBasePay-error', 'Please enter a valid minimum base pay.');
      return false;
    }

    if (desiredJobTitle === '') {
      displayError('desiredJobTitle-error', 'Please enter the desired job title.');
      return false;
    }

    var desiredJobTypeCheckboxes = document.getElementsByName('desiredJobType');
    var desiredWorkScheduleCheckboxes = document.getElementsByName('desiredWorkSchedule');
    var checkedJobTypeCount = 0;
    var checkedWorkScheduleCount = 0;

    for (var i = 0; i < desiredJobTypeCheckboxes.length; i++) {
      if (desiredJobTypeCheckboxes[i].checked) {
        checkedJobTypeCount++;
      }
    }

    for (var i = 0; i < desiredWorkScheduleCheckboxes.length; i++) {
      if (desiredWorkScheduleCheckboxes[i].checked) {
        checkedWorkScheduleCount++;
      }
    }

    if (checkedJobTypeCount === 0) {
      displayError('jobType-error', 'Please select at least one desired job type.');
      return false;
    }

    if (checkedWorkScheduleCount === 0) {
      displayError('workSchedule-error', 'Please select at least one desired work schedule.');
      return false;
    }

    return true;
  }

  function displayError(id, message) {
    var errorElement = document.getElementById(id);
    errorElement.innerHTML = message;
    errorElement.style.display = 'block';
  }