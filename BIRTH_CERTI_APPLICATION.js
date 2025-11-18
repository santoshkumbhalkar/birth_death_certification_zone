document.addEventListener("DOMContentLoaded", function () {
    const fields = [
        { input: "t2", error: "nameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
        { input: "t8", error: "f_nameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
        { input: "t9", error: "m_nameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
        { input: "t10", error: "l_nameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
        { input: "t15", error: "mothernameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
        { input: "t17", error: "fathernameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
        { input: "t23", error: "distNameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
        { input: "t24", error: "hospiError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
        { input: "t4", error: "mobileError", regex: /^\d{10}$/, message: "Please enter a valid 10-digit Mobile Number." },
        { input: "motherAadharNo", error: "motherAadharError", regex: /^\d{4} \d{4} \d{4}$/, message: "Aadhar Number must be in xxxx xxxx xxxx format." },
        { input: "fatherAadharNo", error: "fatherAadharError", regex: /^\d{4} \d{4} \d{4}$/, message: "Aadhar Number must be in xxxx xxxx xxxx format." },
        { input: "t19", error: "parentMobileError", regex: /^\d{10}$/, message: "Please enter a valid 10-digit Mobile Number." }
    ];

    fields.forEach(({ input, error, regex, message }) => {
        const inputElement = document.getElementsByName(input)[0] || document.getElementById(input);
        const errorElement = document.getElementById(error);

        inputElement.addEventListener("input", function () {
            // Validate for exactly 10 digits in mobile number
            if (input === "t4" || input === "t19") {
                inputElement.value = inputElement.value.replace(/\D/g, ""); // Prevent non-numeric input
                if (inputElement.value.length > 10) {
                    inputElement.value = inputElement.value.slice(0, 10); // Limit to 10 digits
                }
            }
            // Validate alphabetic fields
            if (["t2", "t8", "t9", "t10", "t15", "t17", "t23", "t24"].includes(input)) {
                inputElement.value = inputElement.value.replace(/[^A-Za-z\s]/g, ""); // Remove non-alphabetic characters
            }

            // Show or hide error messages
            errorElement.style.display = regex.test(inputElement.value) ? "none" : "block";
            errorElement.textContent = regex.test(inputElement.value) ? "" : message;
        });
    });

    // Date of Birth Validation
    const dobInput = document.getElementsByName("t11")[0];
    const dobError = document.getElementById("dobError");

    dobInput.addEventListener("input", function () {
        const dobDate = new Date(dobInput.value);
        const today = new Date();
        dobError.style.display = dobDate > today ? "block" : "none";
        dobError.textContent = dobDate > today ? "Date of Birth cannot be in the future." : "";
    });
});
