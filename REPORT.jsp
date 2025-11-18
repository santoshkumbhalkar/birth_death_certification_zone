<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Tab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px;
        }

        .header {
            background-color: #419999;
            color: white;
            text-align: center;
            padding: 20px;
            border-radius: 8px;
            width: 1400px;
        }

        .header h1 {
            margin: 0;
        }

        .nav-buttons {
            margin: 30px 0;
            text-align: center;
        }

        .nav-buttons button {
            background-color: #419999;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            margin: 10px;
            font-size: 18px;
        }

        .nav-buttons button.active {
            background-color: #07bf7a;
        }

        .record-table {
           
            width: 110%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size:12px;
        }

        .record-table th, .record-table td {
            width: 1000px;
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        .record-table th {
            background-color: #419999;
            color: white;
        }
        
         .btn-view {
      background-color: #419999;
      color: white;
      font-size: 16px;
      font-weight: bold;
      padding: 12px;
      border-radius: 6px;
      width: 100%;
      text-transform: uppercase;
      cursor: pointer;
      border: none;
    }
    
    .btn-view a{
        text-decoration: none;
        color: white;
    }
    </style>
    <script>
        function showRecords(type) {
            // Show birth or death records based on the button clicked
            document.getElementById('birth-records').style.display = (type === 'birth') ? 'block' : 'none';
            document.getElementById('death-records').style.display = (type === 'death') ? 'block' : 'none';
            
            // Set active class on the selected button
            document.getElementById('birth-btn').classList.toggle('active', type === 'birth');
            document.getElementById('death-btn').classList.toggle('active', type === 'death');
        }
    </script>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Reports</h1>
    </div>

    <div class="nav-buttons">
        <button id="birth-btn" onclick="showRecords('birth')" class="active">Birth Record</button>
        <button id="death-btn" onclick="showRecords('death')">Death Record</button>
    </div>

    <div id="birth-records">
        <h2>Birth Records</h2>
        <table class="record-table">
            <thead>
                <tr>
                    <th>Application ID</th>
                    
                    <th>Child Full Name</th>
                    
                    <th>DOB</th>
                    <th>Child Sex</th>
                    <th>Birth Place</th>
                    <th>Religion</th>
                    <th>Mother Name</th>
                    <th>Mother Adhar</th>
                    <th>Father Name</th>
                    <th>Father Adhar</th>
                    <th>Parent Mobile Number</th>
                    <th>Parent Address at the time of Birth</th>
                    <th>Permanent Address</th>
                    <th>Hospital Name</th>
                    
                    <th>View</th>
                </tr>
            </thead>
            <tbody>
            <%
                // Fetch birth records from the database
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM birth_certi_application");

                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("app_id") %></td>
            
            <td><%= rs.getString("c_f_name") + " " + rs.getString("c_m_name") + " " + rs.getString("c_l_name") %></td>
            
            <td><%= rs.getString("dob") %></td>
            <td><%= rs.getString("child_sex") %></td>
            <td><%= rs.getString("birth_place") %></td>
            <td><%= rs.getString("religion") %></td>
            <td><%= rs.getString("mother_name") %></td>
            <td><%= rs.getString("mother_adhar") %></td>
            <td><%= rs.getString("father_name") %></td>
            <td><%= rs.getString("father_adhar") %></td>
            <td><%= rs.getString("p_mo_num") %></td>
            <td><%= rs.getString("p_time_b_add") %></td>
            <td><%= rs.getString("perma_add") %></td>
            
            <td><%= rs.getString("hospi_name") %></td>
            
            
            <td><button class="btn-view"><a href="BIRTH_CERTI.jsp?app_Id=<%= rs.getString("app_id") %>">View</a></button></td>

                </tr>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
            </tbody>
        </table>
    </div>

    <div id="death-records" style="display:none;">
        <h2>Death Records</h2>
        <table class="record-table">
            <thead>
                <tr>
                    <th>Application ID</th>
                    <th>Deceased Full Name</th>
                    <th>Date of Death</th>
                    <th>Place of Death</th>
                    <th>Deceased Age</th>
                    <th>Deceased Aadhar</th>
                    <th>Marital Status</th>
                    <th>Type of Death</th>
                    <th>Spouse Name</th>
                    <th>Spouse Aadhar</th>
                    <th>Mother Name</th>
                    <th>Mother Aadhar</th>
                    <th>Father Name</th>
                    <th>Father Aadhar</th>
                    <th>Deceased Address at the time of Death</th>
                   <th>View</th>
                   
                           
                </tr>
            </thead>
            <tbody>
            <%
                // Fetch death records from the database
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM death_certi_application");

                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("appId") %></td>
                    <td><%= rs.getString("deceased_name") %></td>
                    <td><%= rs.getString("dod") %></td>
                    <td><%= rs.getString("death_place") %></td>
                    <td><%= rs.getString("d_age") %></td>
                    <td><%= rs.getString("deceased_adhar") %></td>
                    <td><%= rs.getString("d_marital_status") %></td>
                    <td><%= rs.getString("typeOfDeath") %></td>
                    <td><%= rs.getString("spouse_name") %></td>
                    <td><%= rs.getString("spouse_adhar") %></td>
                    <td><%= rs.getString("mother_name") %></td>
                    <td><%= rs.getString("father_name") %></td>
                    <td><%= rs.getString("father_adhar") %></td>
                    <td><%= rs.getString("d_time_add") %></td>
                    <td><%= rs.getString("d_perma_add") %></td>
                   <td><button class="btn-view"><a href="D_CERTI.jsp?appId=<%= rs.getString("appid") %>">View</a></button></td>

                  
                </tr>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<script>
    // Initially show birth records
    showRecords('birth');
</script>

</body>
</html>
