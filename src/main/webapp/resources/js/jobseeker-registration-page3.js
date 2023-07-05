function validateForm() {
    var country = document.getElementById('country').value;
    var streetAddress = document.getElementById('streetAddress').value;
    var city = document.getElementById('city').value;
    var province = document.getElementById('province').value;
    var postalCode = document.getElementById('postalCode').value;

    if (country === '' || streetAddress === '' || city === '' || province === '' || postalCode === '') {
      displayError('location-error', 'Please fill in all the fields.');
      return false;
    }

    return true;
  }

  function displayError(id, message) {
    var errorElement = document.getElementById(id);
    errorElement.innerHTML = message;
    errorElement.style.display = 'block';
  }