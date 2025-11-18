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
  <title>Birth Certificate Application</title>
  <script src="BIRTH_CERTI_APPLICATION.js" type="text/javascript"></script>
  <link href="BIRTH_CERTI_APPLICATION.css" rel="stylesheet" type="text/css"/>
  </head>
<body>
  <div class="header">
    <img src="gov_logo.png" alt="Gov Logo">
    <div class="title">
      <h1>GOVERNMENT OF MAHARASHTRA</h1>
      <h2>HEALTH DEPARTMENT</h2>
    </div>
    <img src="logo_bd.png" alt="India Government Logo">
  </div>
    <div class="all">
    <div class="container">
      <h2>Birth Certificate Application</h2>
      <form action="BIRTH_SUBMIT_APPLICATION.jsp" method="POST">
       <div class="section">
          <div class="section-title">Applicant Information</div>
          <div class="form-grid-2">
            <div class="form-group">
              <label>Application ID</label>
              <%
                String appId = "";
                try {
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");
                  Statement st = con.createStatement();
                  ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM birth_certi_application");
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
              <label>Full Name</label>
              <input type="text" name="t2" placeholder="Full Name" required>
              <div id="nameError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label>Gender</label>
              <select name="t3" required>
                <option value="" disabled selected>Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
              </select>
            </div>
            <div class="form-group">
              <label>Mobile No.</label>
              <input type="text" name="t4" placeholder="Mobile Number" required>
              <div id="mobileError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label>Relation with Child</label>
              <select name="t5" required>
                <option value="" disabled selected>Select relation</option>
                <option value="father">Father</option>
                <option value="mother">Mother</option>
                <option value="guardian">Guardian</option>
              </select>
            </div>
            <div class="form-group">
              <label>Date</label>
              <input type="date" name="t6" required>
            </div>
            <div class="form-group full-width">
              <label>Address</label>
              <textarea name="t7" rows="2" placeholder="Enter address" required></textarea>
            </div>
          </div>
        </div>
        <div class="section">
          <div class="section-title">Child Information</div>
          <div class="form-grid-3">
            <div class="form-group">
              <label>Child First Name</label>
              <input type="text" name="t8" placeholder="First Name" required>
              <div id="f_nameError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label>Child Middle Name</label>
              <input type="text" name="t9" placeholder="Middle Name" required>
              <div id="m_nameError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label>Child Last Name</label>
              <input type="text" name="t10" placeholder="Last Name" required>
              <div id="l_nameError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label>Date of Birth</label>
              <input type="date" name="t11" required>
              <div id="dobError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label>Sex</label>
              <select name="t12" required>
                <option value="" disabled selected>Select Sex</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
              </select>
            </div>
            <div class="form-group">
              <label>Place of Birth</label>
              <input type="text" name="t13" required>
            </div>
            <div class="form-group">
              <label>Religion</label>
              <input type="text" name="t14" placeholder="Enter Religion" required>
            </div>
            <div class="form-group">
              <label>Mother Full Name</label>
              <input type="text" id="motherFullName" name="t15" placeholder="Enter mother's full name" required>
              <div id="mothernameError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label for="motherAadharNo">Mother Aadhar No.</label>
              <input type="text" id="motherAadharNo" name="t16" placeholder="Enter mother's Aadhar number" required>
              <div id="motherAadharError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label for="fatherFullName">Father Full Name</label>
              <input type="text" id="fatherFullName" name="t17" placeholder="Enter father's full name" required>
              <div id="fathernameError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label>Father Aadhar No.</label>
              <input type="text" id="fatherAadharNo" name="t18" placeholder="Enter father's Aadhar number" required>
              <div id="fatherAadharError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label>Parent Mobile No.</label>
              <input type="text" name="t19" placeholder="Enter mobile number" required>
              <div id="parentMobileError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label>Parent's Address at the time of Birth:</label>
              <textarea id="address" name="t20" rows="2" placeholder="Enter address" required></textarea>
            </div>
            <div class="form-group">
              <label>Permanent Address:</label>
              <textarea id="perma_add" name="t21" rows="2" placeholder="Enter address" required></textarea>
            </div>
            <div class="form-group">
              <label>Description:</label>
              <textarea id="descript" name="t22" rows="2" placeholder="Enter Description" required></textarea>
            </div>
            <div class="form-group">
              <label>District:</label>
              <textarea id="district" name="t23" rows="2" placeholder="Enter District" required></textarea>
              <div id="districtError" class="error-message"></div>
            </div>
          </div>
        </div>

        <!-- Hospital Detail -->
        <div class="section">
          <div class="section-title">Hospital Detail</div>
          <div class="form-grid-1">
            <div class="form-group">
              <label>Name of Hospital / Place of Birth</label>
              <input type="text" name="t24" placeholder="Name Of Hospital" required >
              <div id="hospiError" class="error-message"></div>
            </div>
            <div class="form-group">
              <label>Name of Doctor / Midwife</label>
              <input type="text" name="t25" placeholder="Name of Doctor" required>
            </div>
            <div class="form-group">
              <label>Hospital Registration Number</label>
              <input type="text" name="t26" placeholder="Hospital Registeration Number">
            </div>
            <div class="form-group">
              <label>Delivery Type</label>
              <select name="t27" required>
                <option value="Normal">Normal</option>
                <option value="C-Section">C-Section</option>
              </select>
            </div>
          </div>
        </div>
        <div class="submit-container">
            <input type="submit" value="Submit Application" class="btn-submit">
        </div>
      </form>
    </div>
  </div>
</body>
</html>
