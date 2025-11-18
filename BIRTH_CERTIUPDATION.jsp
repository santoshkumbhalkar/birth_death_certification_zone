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
  <link href="BIRTH_CERTIUPDATION.css" rel="stylesheet" type="text/css"/>
  <script src="BIRTH_CERTI_APPLICATION.js" type="text/javascript"></script>
  
  <title>Birth Certificate Updation</title>
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
      display: none;
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
                String query = "SELECT * FROM birth_certi_application WHERE app_Id=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, searchAppId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
    %>
    <div class="all">
        <div class="container">
    <h2>Birth Certificate Application</h2>
    <form action="BIRTH_CERTI_UPDATION_PROCESS.jsp" method="POST">
   <input type="hidden" name="app_Id" value="<%= rs.getString("app_Id") %>">

      <!-- Applicant Information (2 Columns) -->
      <div class="section">
        <div class="section-title">Applicant Information</div>
        <div class="form-grid-2">
          
          <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="t2" value="<%= rs.getString("app_fname") %>"  required>
            <div id="nameError" class="error-message"></div>

      
          </div>
          <div class="form-group">
            <label>Gender</label>
            <input type="text" name="t3" value="<%= rs.getString("gender") %>" required>

          </div>
          <div class="form-group">
            <label>Mobile No.</label>
            <input type="text" name="t4" value="<%= rs.getString("mo_no") %>" required>
               <div id="mobileError" class="error-message"></div>
          </div>
          <div class="form-group">
            <label>Relation with Child</label>
            <input type="text" name="t5" value="<%= rs.getString("rel_child") %>" required>

          </div>
            <div class="form-group">
            <label>Date</label>
        <input type="text" name="t6" value="<%= rs.getString("date") %>" required>
          </div>
          <div class="form-group full-width">
          <label>Address</label>
        <input type="text" name="t7" value="<%= rs.getString("app_add") %>" required>
          </div>
        </div>
      </div>

      <!-- Child Information (3 Columns) -->
      <div class="section">
        <div class="section-title">Child Information</div>
        <div class="form-grid-3">
          <div class="form-group">
            <label>Child First Name</label>
            <input type="text" name="t8" value="<%= rs.getString("c_f_name") %>" required>
             <div id="f_nameError" class="error-message"></div>
          </div>
          <div class="form-group">
            <label>Child Middle Name</label>
            <input type="text" name="t9" value="<%= rs.getString("c_m_name") %>" required>
            <div id="m_nameError" class="error-message"></div>
          </div>
          <div class="form-group">
            <label>Child Last Name</label>
            <input type="text" name="t10" value="<%= rs.getString("c_l_name") %>" required>
            <div id="l_nameError" class="error-message"></div>
          </div>
          <div class="form-group">
            <label>Date of Birth</label>
            <input type="date" name="t11" value="<%= rs.getString("dob") %>" required>
            <div id="dobError" class="error-message"></div>
          </div>
          <div class="form-group">
            <label>Sex</label>
            <input type="text" name="t12" value="<%= rs.getString("child_sex") %>" required>

          </div>
          <div class="form-group">
            <label>Place of Birth</label>
            <input type="text" name="t13" value="<%= rs.getString("birth_place") %>" required>
          </div>
           <div class="form-group">
            <label>Religion</label>
            <input type="text" name="t14" value="<%= rs.getString("religion") %>" required>
          </div>
          <div class="form-group">
            <label>Mother Full Name</label>
        <input type="text" name="t15" value="<%= rs.getString("mother_name") %>" required>
        <div id="mothernameError" class="error-message"></div>
          </div>
          <div class="form-group">
            <label for="motherAadharNo">Mother's Aadhar No.</label>
            <input type="text" name="t16" value="<%= rs.getString("mother_adhar") %>" required>
            <div id="motherAadharError" class="error-message"></div>
          </div>
          <div class="form-group">
            <label for="fatherFullName">Father's Full Name</label>
            <input type="text" name="t17" value="<%= rs.getString("father_name") %>" required>
            <div id="fathernameError" class="error-message"></div>
          </div>
            <div class="form-group">
            <label>Father Aadhar No.</label>
            <input type="text" name="t18" value="<%= rs.getString("father_adhar") %>" required>
          </div>
           <div class="form-group">
            <label>Parent Mobile No.</label>
            <input type="text" name="t19" value="<%= rs.getString("p_mo_num") %>" required>
          </div>
             <div class="form-group">
             <label>Parent's Address at the time of Birth:</label>
             <input type="text" name="t20" value="<%= rs.getString("p_time_b_add") %>" required>
             </div>
            <div class="form-group">
             <label>Permanent Address:</label>
             <input type="text" name="t21" value="<%= rs.getString("perma_add") %>" required>
             </div>
             <div class="form-group">
             <label>Description:</label>
             <input type="text" name="t22" value="<%= rs.getString("description") %>" required>
             </div>
              <div class="form-group">
             <label>District:</label>
             <input type="text" name="t23" value="<%= rs.getString("district") %>" required>
             </div>
        </div>
      </div>

      <!-- Hospital Detail (1 Column) -->
      <div class="section">
        <div class="section-title">Hospital Detail</div>
        <div class="form-grid-1">
            
          <div class="form-group">
            <label>Name of Hospital / Place of Birth</label>
        <input type="text" name="t24" value="<%= rs.getString("hospi_name") %>" required>
          </div>
          <div class="form-group">
            <label>Name of Doctor / Midwife</label>
        <input type="text" name="t25" value="<%= rs.getString("dr_name") %>" required>
          </div>
          <div class="form-group">
            <label>Hospital Registration Number</label>
        <input type="text" name="t26" value="<%= rs.getString("hospi_regno") %>" required>
          </div>
          <div class="form-group">
            <label>Delivery Type</label>
            <input type="text" name="t27" value="<%= rs.getString("del_type") %>" required>

          </div>
        </div>
      </div>
      
      <!-- Submit Button -->
      <button type="submit" class="btn-submit" >Update Information</button>
      

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
