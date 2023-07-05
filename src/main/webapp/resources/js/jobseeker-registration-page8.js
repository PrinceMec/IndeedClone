/* function validateForm() {
    var certifications = document.getElementById('certifications').value.split(',').map(certification => certification.trim());

    if (certifications.length === 0) {
      displayError('certifications-error', 'Please enter at least one certification or license.');
      return false;
    }

    return true;
  }

  function displayError(id, message) {
    var errorElement = document.getElementById(id);
    errorElement.innerHTML = message;
    errorElement.style.display = 'block';
  }*/
  
  function validateForm() {
  var certifications = document.getElementById('certifications').value.trim();

  if (certifications === '') {
    displayError('certifications-error', 'Please enter at least one certification or license.');
    return false;
  }

  return true;
}

function displayError(id, message) {
  var errorElement = document.getElementById(id);
  errorElement.textContent = message;
  errorElement.style.display = 'block';
}
