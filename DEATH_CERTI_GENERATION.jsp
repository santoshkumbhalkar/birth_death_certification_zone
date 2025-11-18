<%@page import="java.sql.PreparedStatement"%>
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
    <title>Death Certificate Generation</title>
    <link href="DEATH_CERTI_GENERATION.css" rel="stylesheet" type="text/css"/>
    
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
        <h3>Check it before generating Death Certificate</h3>
        <form  method="POST">
    <input type="hidden" name="appId" value="<%= rs.getString("appId") %>">

            <!-- Applicant Details -->
            <h3 class="section-title">1. Applicant Details</h3>
            <div class="section">
                
            <div class="form-group">
                <label>Full Name:</label>
                <input type="text" name="app_fname" value="<%= rs.getString("app_fname") %>" required>
            </div>
            <div class="form-grid-2">
            <div class="form-group">
                <label>Relation with Deceased:</label>
              <input type="text" name="rel_deceased" value="<%= rs.getString("rel_deceased") %>" required>

            </div>
            
                <div class="form-group">
                    <label>Date of Application:</label>
              <input type="text" name="date_app" value="<%= rs.getString("date_app") %>" required>
                </div>
                <div class="form-group">
                    <label>Mobile Number:</label>
              <input type="text" name="rel_deceased" value="<%= rs.getString("mo_num") %>" required>
                </div>
                   
                
                <div class="form-group full-width">
                    <label> Address:</label>
              <input type="text" name="rel_deceased" value="<%= rs.getString("app_add") %>" required>
                </div>
            </div>
            </div>
            <!-- Deceased Person's Details -->
            <h3 class="section-title">2. Deceased Person's Details</h3>
            <div class="section">
                <div class="form-group">
                    <label>Full Name:</label>
              <input type="text" name="deceased_name" value="<%= rs.getString("deceased_name") %>" required>
                </div>
                
            <div class="form-grid-2">
                <div class="form-group">
                    <label>Gender:</label>
                    <input type="text" name="d_gender" value="<%= rs.getString("d_gender") %>" required>

                </div>
                
                <div class="form-group">
                    <label>Deceased Age:</label>
              <input type="text" name="d_age" value="<%= rs.getString("d_age") %>" required>
                </div>
                
                <div class="form-group">
                    <label>Marital Status:</label>
                    <input type="text" name="d_marital_status" value="<%= rs.getString("d_marital_status") %>" required>

                </div>
                <div class="form-group">
                    <label>Date of Death:</label>
                    <input type="text" name="dod" value="<%= rs.getString("dod") %>" required>

                </div>
                
                <div class="form-group">
                    <label>Aadhar Number:</label>
                    <input type="text" name="deceased_adhar" value="<%= rs.getString("deceased_adhar") %>" required>
                </div>
                <div class="form-group">
                    <label>Type of Death:</label>
                <input type="text" name="typeOfDeath" value="<%= rs.getString("typeOfDeath") %>" required>

                </div>
                <div class="form-group">
                    <label>place of death:</label>
              <input type="text" name="death_place" value="<%= rs.getString("death_place") %>" required>
                </div>
                
                <div class="form-group">
                    <label>Deceased Address At the Time Of Death:</label>
              <input type="text" name="d_time_add" value="<%= rs.getString("d_time_add") %>" required>
                </div>
                
                <div class="form-group">
                    <label>Deceased Address:</label>
              <input type="text" name="d_perma_add" value="<%= rs.getString("d_perma_add") %>" required>
                </div>
                <div class="form-group">
                    <label>District:</label>
                     <input type="text" name="district" value="<%= rs.getString("district") %>" required>
                </div>
                
                 </div>
                 <div class="form-group">
                    <label>Religion:</label>
              <input type="text" name="religion" value="<%= rs.getString("religion") %>" required>
                 </div>
           
            </div>
            
            <h3 class="section-title">3. Husband/ Wife Details</h3>
            <div class="section">
                <div class="form-group">
                    <label>Full Name.:</label>
              <input type="text" name="spouse_name" value="<%= rs.getString("spouse_name") %>" required>
                </div>
                <div class="form-grid-2">
                <div class="form-group">
                    <label>Aadhar Number:</label>
              <input type="text" name="spouse_adhar" value="<%= rs.getString("spouse_adhar") %>" required>
                </div>
                <div class="form-group">
                    <label>Contact Number:</label>
              <input type="text" name="spouse_mo_num" value="<%= rs.getString("spouse_mo_num") %>" required>
                </div>
                </div>
            </div>
            <h3 class="section-title">3. Parent's Details</h3>
            <div class="section">
                <div class="form-grid-2">
                <div class="form-group">
                    <label>Mother Full Name</label>
              <input type="text" name="mother_name" value="<%= rs.getString("mother_name") %>" required>
                </div>
                <div class="form-group">
                  <label for="motherAadharNo">Mother's Aadhar No.</label>
              <input type="text" name="mother_adhar" value="<%= rs.getString("mother_adhar") %>" required>
                </div>
                <div class="form-group">
                  <label for="fatherFullName">Father's Full Name</label>
              <input type="text" name="father_name" value="<%= rs.getString("father_name") %>" required>
                </div>
                  <div class="form-group">
                  <label>Father Aadhar No.</label>
              <input type="text" name="father_adhar" value="<%= rs.getString("father_adhar") %>" required>
                </div>
                 <div class="form-group">
                  <label>Parent Mobile No.</label>
                  <input type="text" name="p_mo_num" value="<%= rs.getString("p_mo_num") %>" required>
                </div>
                <div class="form-group">
                    <label>Description:</label>
                    <input type="text" name="description" value="<%= rs.getString("description") %>" required>
                </div>
                    
            </div>
            </div>
            

            <h3 class="section-title">3. Hospital Detail Details</h3>
            <div class="section">
                <div class="form-group">
                    <label>Doctor’s Signature Reference No.:</label>
              <input type="text" name="dr_ref_num" value="<%= rs.getString("dr_ref_num") %>" required>
                </div>
                <div class="form-group">
                    <label>Hospital Name:</label>
              <input type="text" name="hospi_name" value="<%= rs.getString("hospi_name") %>" required>
                </div>
                <div class="form-group">
                    <label>Death Certificate No.:</label>
                    <input type="text" name="death_certi_num" value="<%= rs.getString("death_certi_num") %>" required>
                </div>
           </div>
        
            
      
            <!-- Document Details -->
            
   
            <button  class="btn-submit"><a href="D_CERTI.jsp?appId=<%= rs.getString("appid") %>">Submit Application</a></button>
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
