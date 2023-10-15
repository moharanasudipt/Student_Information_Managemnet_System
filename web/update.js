$(document).ready(function () {

    function validateName() {
        const nameField = $("#name");
        const nameError = $("#nameError");
        const nameRegex = /^[A-Za-z\s]+$/;

        if (!nameField.val().match(nameRegex) || nameField.val().trim().length > 20) {
            nameError.text("Invalid name format.");
            return false;
        } else {
            nameError.text("");
            return true;
        }
    }

    function validateAddress() {
        const addrField = $("#address");
        const addressError = $("#addressError");
        const addrRegex = /^[A-Za-z\s]{1,12}$/;

        if (!addrField.val().match(addrRegex) || addrField.val().trim().length > 12) {
            addressError.text("Invalid address format.");
            return false;
        } else {
            addressError.text("");
            return true;
        }
    }

    function validateEmail() {
        const emailField = $("#email");
        const emailError = $("#emailError");
        const emailRegex = /^[a-zA-Z0-9._-]+@gmail\.com$/;

        if (!emailField.val().match(emailRegex)) {
            emailError.text("Please enter a valid email address.");
            return false;
        } else {
            emailError.text("");
            return true;
        }
    }

    function validateContact() {
        const contactField = $("#contact");
        const contactError = $("#contactError");
        const contactRegex = /^\d{10}$/;

        if (!contactField.val().match(contactRegex) || contactField.val().trim() === "") {
            contactError.text("Invalid phone number.");
            return false;
        } else {
            contactError.text("");
            return true;
        }
    }


    $("#name").blur(validateName);
    $("#address").blur(validateAddress);
    $("#email").blur(validateEmail);
    $("#contact").blur(validateContact);


    $("form").submit(function (event) {
        if (!validateName() || !validateAddress() || !validateEmail() || !validateContact()) {
            event.preventDefault();
        }
    });
});