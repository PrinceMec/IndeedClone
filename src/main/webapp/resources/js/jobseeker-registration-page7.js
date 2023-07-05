function validateForm() {
    var addASkill = document.getElementById('addASkill').value;
    var skills = addASkill.split(',').map(skill => skill.trim());

    if (skills.length < 6) {
      displayError('skills-error', 'Please enter at least 6 skills.');
      return false;
    }

    return true;
  }

  function displayError(id, message) {
    var errorElement = document.getElementById(id);
    errorElement.innerHTML = message;
    errorElement.style.display = 'block';
  }