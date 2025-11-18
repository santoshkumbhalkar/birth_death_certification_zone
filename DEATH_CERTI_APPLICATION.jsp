<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Death Certificate Application Form</title>
    <link href="DEATH_CERTI_APPLICATION.css" rel="stylesheet" type="text/css"/>
    <script src="DEATH_CERTI_APPLICATION.js" type="text/javascript"></script>
    
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
<div class="all">
    <div class="container">
        <h2>Death Certificate Application Form</h2>
        <form action="DEATH_SUBMIT_PROCESS.jsp" method="post">
            <!-- Applicant Details -->
            <h3 class="section-title">1. Applicant Details</h3>
            <div class="section">
                <div class="form-group">
                    <label>Application Id:</label>
                   <%
              String appId="";

              try {
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");
                  Statement st = con.createStatement();
                  ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM death_certi_application");
                    if (rs.next()) {
                    int currentID = rs.getInt(1);
                    currentID++;
                    appId = String.valueOf(currentID); 
                 }
                  con.close();
                  
                  
                } catch (SQLException e) {
                    out.println("SQL Error: " + e.getMessage());
                } catch (ClassNotFoundException e) {
                    out.println("Driver Error: " + e.getMessage());
    }
            %>

            
            <input type="text" name="t1" value="<%= appId %>" readonly>
            </div>
            
            <div class="form-group">
                <label>Full Name:</label>
                <input type="text" name="t2" placeholder="Enter full name" required>
                <div id="nameError" class="error-message"></div>

                
            </div>
            <div class="form-grid-2">
            <div class="form-group">
                <label>Relation with Deceased:</label>
                <select name="t3" required>
                    <option value="">Select Relation</option>
                    <option value="Father">Father</option>
                    <option value="Mother">Mother</option>
                    <option value="Spouse">Spouse</option>
                    <option value="Son">Son</option>
                    <option value="Daughter">Daughter</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            
                <div class="form-group">
                    <label>Date of Application:</label>
                    <input type="date" name="t4" required>
                </div>
                <div class="form-group">
                    <label>Mobile Number:</label>
                    <input type="tel" name="t5" placeholder="Enter mobile number" required>
                    <div id="mobileError" class="error-message"></div>
                </div>
                   
                
                <div class="form-group full-width">
                    <label> Address:</label>
                    <input type="text" name="t6" placeholder="Enter full address" required>
                </div>
            </div>
            </div>
            <!-- Deceased Person's Details -->
            <h3 class="section-title">2. Deceased Person's Details</h3>
            <div class="section">
                <div class="form-group">
                    <label>Full Name:</label>
                    <input type="text" name="t7" placeholder="Enter full name" required>
                    <div id="decNameError" class="error-message"></div>


                </div>
                
            <div class="form-grid-2">
                <div class="form-group">
                    <label>Gender:</label>
                    <select name="t8" required>
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Deceased Age:</label>
                    <input type="text" name="t9"  required>
                </div>
                
                <div class="form-group">
                    <label>Marital Status:</label>
                    <select name="t10" required>
                        <option value="">Select</option>
                        <option value="Married">Married</option>
                        <option value="UnMarried">UnMarried</option>
                        <option value="Divorced">Divorced</option>

                    </select>
                </div>
                <div class="form-group">
                    <label>Date of Death:</label>
                    <input type="date" name="t11" required>
                    <div id="dodError" class="error-message"></div>
                </div>
                
               <div class="form-group">
                    <label>Aadhar Number (Deceased):</label>
                    <input type="text" name="t12" id="dAdhar" placeholder="xxxx xxxx xxxx" required>
                      <div id="dAdharError" class="error-message"></div>
                    <div id="aadharPopupError" class="popup-error"></div>
                </div>                    
                   

              
                <div class="form-group">
                    <label>Type of Death:</label>
                    <select name="t13" required>
                        <option value="">Select Type</option>
                        <option value="Natural">Natural</option>
                        <option value="Accidental">Accidental</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>place of death:</label>
                    <input type="text" name="t14" required>
                </div>
                
                <div class="form-group">
                    <label>Deceased Address At the Time Of Death:</label>
                    <input type="text" name="t15" required>
                </div>
                
                <div class="form-group">
                    <label>Deceased Permanent Address:</label>
                    <input type="text" name="t16" required>
                </div>
                <div class="form-group">
                    <label>District:</label>
                    <input type="text" name="t17" placeholder="District" required>
                     <div id="distNameError" class="error-message"></div>
                </div>
                
                
                 </div>
                 <div class="form-group">
                    <label>Religion:</label>
                    <input type="text" name="t18" placeholder="Religion" required>
                    <div id="religionNameError" class="error-message"></div>

                 </div>
           
            </div>
            
            <h3 class="section-title">3. Husband/ Wife Details</h3>
            <div class="section">
                <div class="form-group">
                    <label>Full Name.:</label>
                    <input type="text" name="t19" placeholder="Full Name" >
                    <div id="spouseNameError" class="error-message"></div>

                </div>
                <div class="form-grid-2">
                <div class="form-group">
                    <label>Aadhar Number:</label>
                    <input type="text" name="t20" id="spouseAdhar" placeholder="xxxx xxxx xxxx" >
                    <div id="spouseAdharError" class="error-message"></div>

                </div>
                <div class="form-group">
                    <label>Contact Number:</label>
                    <input type="text" name="t21" placeholder="Enter Contact No." >
                    <div id="SpousemobileError" class="error-message"></div>
                </div>
                </div>
            </div>
            <h3 class="section-title">3. Parent's Details</h3>
            <div class="section">
                <div class="form-grid-2">
                <div class="form-group">
                    <label>Mother Full Name</label>
                    <input type="text" id="motherFullName" name="t22" placeholder="Enter mother full name" required>
                    <div id="motherNameError" class="error-message"></div>

                </div>
                <div class="form-group">
                  <label for="motherAadharNo">Mother Aadhar No.</label>
                  <input type="text" id="motherAadharNo" name="t23" placeholder="xxxx xxxx xxxx" required>
                  <div id="motherAadharError" class="error-message"></div>
                </div>
                <div class="form-group">
                  <label for="fatherFullName">Father Full Name</label>
                  <input type="text" id="fatherFullName" name="t24" placeholder="Enter father full name" required>
                  <div id="fatherNameError" class="error-message"></div>

                </div>
                  <div class="form-group">
                  <label>Father Aadhar No.</label>
                  <input type="text" id="fatherAadharNo" name="t25" placeholder="xxxx xxxx xxxx" required>
                  <div id="fatherAadharError" class="error-message"></div>
                </div>
                 <div class="form-group">
                  <label>Parent Mobile No.</label>
                  <input type="text"  name="t26" placeholder="Enter mobile number" required>
                  <div id="parentMobileError" class="error-message"></div>
                </div>
                    <div class="form-group">
                  <label>Description:</label>
                  <input type="text"  name="t27" placeholder="Enter mobile number" required>
                </div>
                    
            </div>
            </div>
            

            <h3 class="section-title">3. Hospital Detail Details</h3>
            <div class="section">
                <div class="form-group">
                    <label>Doctor’s Signature Reference No.:</label>
                    <input type="text" name="t28" placeholder="Enter Reference No." required>
                </div>
                <div class="form-group">
                    <label>Hospital Name:</label>
                    <input type="text" name="t29" placeholder="Enter Hospital Name" required>
                    <div id="hospiNameError" class="error-message"></div>

                </div>
                <div class="form-group">
                    <label>Death Certificate No.:</label>
                    <input type="text" name="t30" placeholder="Enter Certificate No." required>
                </div>
           </div>
        
            
      
            <!-- Document Details -->
            
   
            <button type="submit" class="btn-submit">Submit Application</button>
        </form>
    </div>
   
</body>
</html>
