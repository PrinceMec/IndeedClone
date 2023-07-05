function validateForm() {
    var phoneNumber = document.getElementById('phoneNumber').value;

    if (phoneNumber === '') {
      displayError('phone-error', 'Please enter a phone number.');
      return false;
    }

    var phoneRegex = /^\d{10}$/;

    if (!phoneRegex.test(phoneNumber)) {
      displayError('phone-error', 'Please enter a 10-digit phone number consisting of digits only.');
      return false;
    }

    return true;
  }

  function displayError(id, message) {
    var errorElement = document.getElementById(id);
    errorElement.innerHTML = message;
    errorElement.style.display = 'block';
  }