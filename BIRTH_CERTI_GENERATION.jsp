<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Birth Certificate Generation</title>
  <link href="BIRTH_CERTI_GENERATION.css" rel="stylesheet" type="text/css"/>
 
  
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
                String query = "SELECT * FROM birth_certi_application WHERE app_Id=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, searchAppId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
    %>
    <div class="all">
        <div class="container">
    <h2>Check it before generating certificate</h2>
    <form method="POST">
    <input type="hidden" name="app_Id" value="<%= rs.getString("app_Id") %>">

      <!-- Applicant Information (2 Columns) -->
      <div class="section">
        <div class="section-title">Applicant Information</div>
        <div class="form-grid-2">
          
          <div class="form-group">
            <label>Full Name</label>
        <input type="text" name="app_fname" value="<%= rs.getString("app_fname") %>" required>
          </div>
          <div class="form-group">
            <label>Gender</label>
            <input type="text" name="gender" value="<%= rs.getString("gender") %>" required>

          </div>
          <div class="form-group">
            <label>Mobile No.</label>
            <input type="text" name="mo_no" value="<%= rs.getString("mo_no") %>" required>
          </div>
          <div class="form-group">
            <label>Relation with Child</label>
            <input type="text" name="rel_child" value="<%= rs.getString("rel_child") %>" required>

          </div>
            <div class="form-group">
            <label>Date</label>
        <input type="text" name="date" value="<%= rs.getString("date") %>" required>
          </div>
          <div class="form-group full-width">
          <label>Address</label>
        <input type="text" name="app_add" value="<%= rs.getString("app_add") %>" required>
          </div>
        </div>
      </div>

      <!-- Child Information -->
      <div class="section">
        <div class="section-title">Child Information</div>
        <div class="form-grid-3">
          <div class="form-group">
            <label>Child First Name</label>
            <input type="text" name="c_f_name" value="<%= rs.getString("c_f_name") %>" required>
          </div>
          <div class="form-group">
            <label>Child Middle Name</label>
            <input type="text" name="c_m_name" value="<%= rs.getString("c_m_name") %>" required>
          </div>
          <div class="form-group">
            <label>Child Last Name</label>
            <input type="text" name="c_l_name" value="<%= rs.getString("c_l_name") %>" required>
          </div>
          <div class="form-group">
            <label>Date of Birth</label>
            <input type="text" name="dob" value="<%= rs.getString("dob") %>" required>
          </div>
          <div class="form-group">
            <label>Sex</label>
            <input type="text" name="child_sex" value="<%= rs.getString("child_sex") %>" required>

          </div>
          <div class="form-group">
            <label>Place of Birth</label>
            <input type="text" name="birth_place" value="<%= rs.getString("birth_place") %>" required>
          </div>
           <div class="form-group">
            <label>Religion</label>
            <input type="text" name="religion" value="<%= rs.getString("religion") %>" required>
          </div>
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
             <label for="permanentAddress">Parent's Address at the time of Birth:</label>
             <input type="text" name="p_time_b_add" value="<%= rs.getString("p_time_b_add") %>" required>
             </div>
            <div class="form-group">
             <label for="permanentAddress">Permanent Address:</label>
             <input type="text" name="perma_add" value="<%= rs.getString("perma_add") %>" required>
             </div>
             <div class="form-group">
             <label for="permanentAddress">Description:</label>
             <input type="text" name="description" value="<%= rs.getString("description") %>" required>
             </div>
        </div>
      </div>

      <!-- Hospital Detail (1 Column) -->
      <div class="section">
        <div class="section-title">Hospital Detail</div>
        <div class="form-grid-1">
          <div class="form-group">
            <label>Name of Hospital / Place of Birth</label>
        <input type="text" name="hospi_name" value="<%= rs.getString("hospi_name") %>" required>
          </div>
          <div class="form-group">
            <label>Name of Doctor / Midwife</label>
        <input type="text" name="dr_name" value="<%= rs.getString("dr_name") %>" required>
          </div>
          <div class="form-group">
            <label>Hospital Registration Number</label>
        <input type="text" name="hospi_regno" value="<%= rs.getString("hospi_regno") %>" required>
          </div>
          <div class="form-group">
            <label>Delivery Type</label>
            <input type="text" name="del_type" value="<%= rs.getString("del_type") %>" required>

          </div>
        </div>
      </div>
      
      <!-- Submit Button -->
      <button type="submit" class="btn-submit" ><a href="BIRTH_CERTI.jsp?app_Id=<%= rs.getString("app_id") %>">GENERATE BIRTH CERTIFICATE</button>
      

    </form>
  </div>
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
