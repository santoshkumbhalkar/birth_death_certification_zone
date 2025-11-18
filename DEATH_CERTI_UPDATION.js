  document.addEventListener("DOMContentLoaded", function () {
                const fields = [
                    // Mobile number validation
                    { input: "t5", error: "mobileError", regex: /^\d{10}$/, message: "Please enter a valid 10-digit Mobile Number." },
                    { input: "t21", error: "SpousemobileError", regex: /^\d{10}$/, message: "Please enter a valid 10-digit Mobile Number." },
                    { input: "t26", error: "parentMobileError", regex: /^\d{10}$/, message: "Please enter a valid 10-digit Mobile Number." },

                    // Aadhar validation
                    { input: "dAdhar", error: "dAdharError", regex: /^\d{4} \d{4} \d{4}$/, message: "Aadhar Number must be in xxxx xxxx xxxx format." },
                    { input: "spouseAdhar", error: "spouseAdharError", regex: /^\d{4} \d{4} \d{4}$/, message: "Aadhar Number must be in xxxx xxxx xxxx format." },
                    { input: "motherAadharNo", error: "motherAadharError", regex: /^\d{4} \d{4} \d{4}$/, message: "Aadhar Number must be in xxxx xxxx xxxx format." },
                    { input: "fatherAadharNo", error: "fatherAadharError", regex: /^\d{4} \d{4} \d{4}$/, message: "Aadhar Number must be in xxxx xxxx xxxx format." },

                    // Name validation
                    { input: "t2", error: "nameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
                    { input: "t7", error: "decNameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
                    { input: "t19", error: "spouseNameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
                    { input: "t22", error: "motherNameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." },
                    { input: "t24", error: "fatherNameError", regex: /^[A-Za-z\s]+$/, message: "Only alphabets and spaces are allowed." }
                ];

                fields.forEach(({ input, error, regex, message }) => {
                    
                    const inputElement = document.getElementsByName(input)[0] || document.getElementById(input);
                    const errorElement = document.getElementById(error);

                    if (inputElement && errorElement) {
                        inputElement.addEventListener("input", function () {
                            // Validation logic
                            errorElement.style.display = regex.test(inputElement.value) ? "none" : "block";
                            errorElement.textContent = regex.test(inputElement.value) ? "" : message;
                        });
                    }
                });

                // Aadhar duplication check
                
            });