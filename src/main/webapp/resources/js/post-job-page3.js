function validateForm() {
    // Get the values of the minimumPay and maximumPay fields
    var minimumPay = document.getElementById("minimumPay").value;
    var maximumPay = document.getElementById("maximumPay").value;

    // Check if the minimumPay field is empty
    if (minimumPay.trim() === "" || !/^\d+$/.test(minimumPay)) {
      // Display an error message for the minimumPay field
      document.getElementById("minimumPayError").textContent = "Please enter a valid minimum pay (digits only).";
      return false; // Prevent form submission
    }

    // Check if the maximumPay field is empty
    if (maximumPay.trim() === "" || !/^\d+$/.test(maximumPay)) {
      // Display an error message for the maximumPay field
      document.getElementById("maximumPayError").textContent = "Please enter a valid maximum pay (digits only).";
      return false; // Prevent form submission
    }

    // Get the values of the benefitsOffered checkboxes
    var benefitsOffered = document.getElementsByName("benefitsOffered");
    var selectedBenefits = Array.from(benefitsOffered).some(function (checkbox) {
      return checkbox.checked;
    });

    // Check if no benefits are selected
    if (!selectedBenefits) {
      // Display an error message for the benefitsOffered checkboxes
      document.getElementById("benefitsOfferedError").textContent = "Please select at least one benefit offered.";
      return false; // Prevent form submission
    }

    // Get the values of the supplementalPayType checkboxes
    var supplementalPayType = document.getElementsByName("supplementalPayType");
    var selectedPayTypes = Array.from(supplementalPayType).some(function (checkbox) {
      return checkbox.checked;
    });

    // Check if no supplemental pay types are selected
    if (!selectedPayTypes) {
      // Display an error message for the supplementalPayType checkboxes
      document.getElementById("supplementalPayTypeError").textContent = "Please select at least one supplemental pay type.";
      return false; // Prevent form submission
    }

    // If all validations pass, you can submit the form
    return true;
  }