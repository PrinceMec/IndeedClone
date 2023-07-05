function validateForm() {
    var firstName = document.getElementById('firstName').value;
    var lastName = document.getElementById('lastName').value;

    if (firstName === '') {
      displayError('first-name-error', 'Please enter your first name.');
      return false;
    }

    if (lastName === '') {
      displayError('last-name-error', 'Please enter your last name.');
      return false;
    }

    return true;
  }

  function displayError(id, message) {
    var errorElement = document.getElementById(id);
    errorElement.innerHTML = message;
    errorElement.style.display = 'block';
  }