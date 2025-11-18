<%-- 
    Document   : d_certi_update
    Created on : 18 Mar, 2025, 11:58:46 AM
    Author     : Santosh Kumbhalkar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
  <script>
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
                const aadharInput = document.getElementById("dAdhar");
                const errorElement = document.getElementById("aadharPopupError");

                if (aadharInput && errorElement) {
                    aadharInput.addEventListener("input", function () {
                        const aadhar = aadharInput.value.trim();

                        if (/^\d{4} \d{4} \d{4}$/.test(aadhar)) {
                            const xhr = new XMLHttpRequest();
                            xhr.open("GET", "chk_dup_adhar.jsp?aadhar=" + encodeURIComponent(aadhar), true);

                            xhr.onreadystatechange = function () {
                                if (xhr.readyState === 4 && xhr.status === 200) {
                                    if (xhr.responseText.trim() === "exists") {
                                        errorElement.textContent = "This Aadhar number is already registered!";
                                        errorElement.style.display = "block";
                                    } else {
                                        errorElement.style.display = "none";
                                    }
                                }
                            };
                            xhr.send();
                        } else {
                            errorElement.style.display = "none";
                        }
                    });
                }
            });
        </script>
        <link href="DEATH_CERTI_UPDATION.css" rel="stylesheet" type="text/css"/>
        <style>
             .error-message {
      color: red;
      font-size: 16px;
      display: none;
      padding: 5px;
    }
    
    .popup-error {
      color: red;
      font-size: 16px;
      
      padding: 5px;
    }
        </style>
    </head>
    <body>
         <div class="header">
        <img src="gov_logo.png" alt="Gov Logo">
        <div class="title">
            <h1>GOVERNMENT OF MAHARASHTRA </h1>
            <h2>HEALTH DEPARTMENT</h2>
        </div>
        <img src="logo_bd.png" alt="India Government Logo">
    </div>
    
     <h2>Search and Update Death Certificate</h2>

    <form method="post">
        <div class="serch_id">
            <div class="lbl-input">
        <label>Enter Application ID:</label>
        <input type="text" name="search_appId" required>
        <button type="submit" name="search">Search</button>
            </div>
        </div>
    </form>
 <%
        String searchAppId = request.getParameter("search_appId");

        if (searchAppId != null && !searchAppId.isEmpty()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");
                String query = "SELECT * FROM death_certi_application WHERE appId=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, searchAppId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
    %>
<div class="all">
    <div class="container">
        <h2>Death Certificate Application Form</h2>
        <form action="DEATH_CERTI_UPDATION_PROCESS.jsp" method="POST">
    <input type="hidden" name="appId" value="<%= rs.getString("appId") %>">

            <!-- Applicant Details -->
            <h3 class="section-title">1. Applicant Details</h3>
            <div class="section">
                
   
        <div class="form-group">
                <label>Full Name:</label>
                <input type="text" name="t2" value="<%= rs.getString("app_fname") %>" required>
                <div id="nameError" class="error-message"></div>

                
            </div>
            <div class="form-grid-2">
            <div class="form-group">
                <label>Relation with Deceased:</label>
                <input type="text" name="t3" value="<%= rs.getString("rel_deceased") %>" required>
            </div>
            
                <div class="form-group">
                    <label>Date of Application:</label>
                    <input type="date" name="t4" value="<%= rs.getString("date_app") %>" required>
                </div>
                <div class="form-group">
                    <label>Mobile Number:</label>
                    <input type="tel" name="t5" value="<%= rs.getString("mo_num") %>" required>
                    <div id="mobileError" class="error-message"></div>
                </div>
                   
                
                <div class="form-group full-width">
                    <label> Address:</label>
                    <input type="text" name="t6" value="<%= rs.getString("app_add") %>" required>
                </div>
            </div>
            </div>
            <!-- Deceased Person's Details -->
            <h3 class="section-title">2. Deceased Person's Details</h3>
            <div class="section">
                <div class="form-group">
                    <label>Full Name:</label>
                    <input type="text" name="t7" value="<%= rs.getString("deceased_name") %>"  required>
                    <div id="decNameError" class="error-message"></div>


                </div>
                
            <div class="form-grid-2">
                <div class="form-group">
                    <label>Gender:</label>
                    <input type="text" name="t8" value="<%= rs.getString("d_gender") %>"  required>
                </div>
                
                <div class="form-group">
                    <label>Deceased Age:</label>
                    <input type="text" name="t9" value="<%= rs.getString("d_age") %>"  required>
                </div>
                
                <div class="form-group">
                    <label>Marital Status:</label>
                    <input type="text" name="t10" value="<%= rs.getString("d_marital_status") %>" required>
                </div>
                <div class="form-group">
                    <label>Date of Death:</label>
                    <input type="date" name="t11" value="<%= rs.getString("dod") %>" required>
                    <div id="dodError" class="error-message"></div>
                </div>
                
               <div class="form-group">
                    <label>Aadhar Number (Deceased):</label>
                    <input type="text" name="t12" id="dAdhar" value="<%= rs.getString("deceased_adhar") %>" required>
                      <div id="dAdharError" class="error-message"></div>
                    <div id="aadharPopupError" class="popup-error"></div>
                </div>                    
                   

              
                <div class="form-group">
                    <label>Type of Death:</label>
                    <input type="text" name="t13"  value="<%= rs.getString("typeOfDeath") %>" required>

                </div>
                <div class="form-group">
                    <label>Place of Death:</label>
                    <input type="text" name="t14" value="<%= rs.getString("death_place") %>" required>
                </div>
                
                <div class="form-group">
                    <label>Deceased Address At the Time Of Death:</label>
                    <input type="text" name="t15"  value="<%= rs.getString("d_time_add") %>" required>
                </div>
                
                <div class="form-group">
                    <label>Deceased Permanent Address:</label>
                    <input type="text" name="t16" value="<%= rs.getString("d_perma_add") %>" required>
                </div>
                <div class="form-group">
                    <label>District:</label>
                    <input type="text" name="t17" value="<%= rs.getString("district") %>" required>
                     <div id="distNameError" class="error-message"></div>
                </div>
                
                
                 </div>
                 <div class="form-group">
                    <label>Religion:</label>
                    <input type="text" name="t18" value="<%= rs.getString("religion") %>" required>
                    <div id="religionNameError" class="error-message"></div>

                 </div>
           
            </div>
            
            <h3 class="section-title">3. Husband/ Wife Details</h3>
            <div class="section">
                <div class="form-group">
                    <label>Full Name.:</label>
                    <input type="text" name="t19" value="<%= rs.getString("spouse_name") %>" >
                    <div id="spouseNameError" class="error-message"></div>

                </div>
                <div class="form-grid-2">
                <div class="form-group">
                    <label> Aadhar Number:</label>
                    <input type="text" name="t20" id="spouseAdhar" value="<%= rs.getString("spouse_adhar") %>" >
                    <div id="spouseAdharError" class="error-message"></div>

                </div>
                <div class="form-group">
                    <label>Contact Number:</label>
                    <input type="text" name="t21" value="<%= rs.getString("spouse_mo_num") %>" >
                    <div id="SpousemobileError" class="error-message"></div>
                </div>
                </div>
            </div>
            <h3 class="section-title">3. Parent's Details</h3>
            <div class="section">
                <div class="form-grid-2">
                <div class="form-group">
                    <label>Mother Full Name</label>
                    <input type="text" id="motherFullName" name="t22" value="<%= rs.getString("mother_name") %>" required>
                    <div id="motherNameError" class="error-message"></div>

                </div>
                <div class="form-group">
                  <label for="motherAadharNo">Mother Aadhar No.</label>
                  <input type="text" id="motherAadharNo" name="t23" value="<%= rs.getString("mother_adhar") %>" required>
                  <div id="motherAadharError" class="error-message"></div>
                </div>
                <div class="form-group">
                  <label for="fatherFullName">Father Full Name</label>
                  <input type="text" id="fatherFullName" name="t24" value="<%= rs.getString("father_name") %>" required>
                  <div id="fatherNameError" class="error-message"></div>

                </div>
                  <div class="form-group">
                  <label>Father Aadhar No.</label>
                  <input type="text" id="fatherAadharNo" name="t25" value="<%= rs.getString("father_adhar") %>" required>
                  <div id="fatherAadharError" class="error-message"></div>
                </div>
                 <div class="form-group">
                  <label>Parent Mobile No.</label>
                  <input type="text"  name="t26" value="<%= rs.getString("p_mo_num") %>" required>
                  <div id="parentMobileError" class="error-message"></div>
                </div>
                    <div class="form-group">
                  <label>Description:</label>
                  <input type="text"  name="t27" value="<%= rs.getString("description") %>" required>
                </div>
                    
            </div>
            </div>
            

            <h3 class="section-title">3. Hospital Detail Details</h3>
            <div class="section">
                <div class="form-group">
                    <label>Doctor’s Signature Reference No.:</label>
                    <input type="text" name="t28" value="<%= rs.getString("dr_ref_num") %>" required>
                </div>
                <div class="form-group">
                    <label>Hospital Name:</label>
                    <input type="text" name="t29" value="<%= rs.getString("hospi_name") %>" required>
                    <div id="hospiNameError" class="error-message"></div>

                </div>
                <div class="form-group">
                    <label>Death Certificate No.:</label>
                    <input type="text" name="t30" value="<%= rs.getString("death_certi_num") %>"required>
                </div>
           </div>
        
            
      
            <!-- Document Details -->
            
   
            <button type="submit" class="btn-submit">Submit Application</button>
        </form>
    </div>
    <%
                } else {
                    out.println("<p style='color:red;'>No record found!</p>");
                }
                con.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    %>
</body>
</html>

   