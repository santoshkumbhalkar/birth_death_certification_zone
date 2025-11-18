<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Birth Certificate</title>
    <link href="BIRTH_CERTI.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
    String appId = request.getParameter("app_Id");
    if (appId != null && !appId.trim().isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM birth_certi_application WHERE app_Id=?");
            ps.setString(1, appId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
%>
    <div class="certificate-container">
        <!-- Certificate Header -->
        <div class="certificate-header">
            <img src="gov_logo.png" alt="Government Logo" class="gov-logo">
            <div class="header-text">
                <h2>GOVERNMENT OF MAHARASHTRA</h2>
                <h3>HEALTH DEPARTMENT</h3>
                <h3> Municipality <%= rs.getString("district") %></h3>

                <h2>BIRTH CERTIFICATE</h2>
                <p>(Issued under section 12/17 of the Registration of Births & Deaths Act, 1969 and Rule 8/13 of the Maharashtra Registration of Births and Deaths Rules, 2000.)</p>
            </div>
            <img src="logo_bd.png" alt="Official Stamp" class="stamp-logo">
        </div>

        <!-- Certificate Body -->
        <div class="certificate-body">
            <table>
                <tr>
                    <td><strong>Certificate No:</strong><%= rs.getString("app_Id") %></td>
                    <td style="text-align: right;"><strong>Form No:</strong> 5</td>
                </tr>
            </table>

            <p>This is to certify that the following information has been taken from the original record of birth, which is the register for Bhandara Municipal Council, Maharashtra.</p>

            <table class="details-table">
                <tr>
                    <td><strong>Name of Child:</strong> <%= rs.getString("c_f_name") + " " + rs.getString("c_m_name") + " " + rs.getString("c_l_name") %></td>
                    <td><strong>Gender:</strong> <%= rs.getString("child_sex") %></td>
                </tr>
                <tr>
                    <td><strong>Date of Birth:</strong><%= rs.getString("dob") %></td>
                    <td><strong>Place of Birth:</strong><%= rs.getString("birth_place") %></td>
                </tr>
            </table>

            <table class="details-table">
                <tr>
                    <td><strong>Name of Father:</strong> <%= rs.getString("father_name") %></td>
                    <td><strong>Father Aadhar:</strong> <%= rs.getString("father_adhar") %></td>
                </tr>
                <tr>
                    <td><strong>Name of Mother:</strong> <%= rs.getString("mother_name") %></td>
                    <td><strong>Mother Aadhar:</strong> <%= rs.getString("mother_adhar") %></td>
                </tr>
            </table>
                
              <table class="details-table">
                <tr>
                    <td><strong>Hospital Registration No.:</strong><%= rs.getString("hospi_regno") %></td>
                    <td><strong>Delivery Type:</strong> <%= rs.getString("del_type") %></td>
                </tr>
               
            </table>

            <table class="details-table">
                <tr>
                    <td colspan="2"><strong>Address of Parents at the time of birth of the child:</strong> <%= rs.getString("p_time_b_add") %></td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Permanent Address:</strong><%= rs.getString("perma_add") %></td>
                </tr>
            </table>

            <table class="details-table">
                <tr>
                    <td><strong>Registration No:</strong> <%= rs.getString("app_Id") %></td>
                    <td><strong>Date of Registration:</strong> <%= rs.getString("date") %></td>
                </tr>
            </table>

            <table class="details-table">
                <tr>
                    <td><strong>Date of Issue:</strong> </td>
                    <td><strong>Signature of Issuing Authority:</strong> __________</td>
                </tr>
            </table>
        </div>

        <!-- Footer -->
        <div class="certificate-footer">
            <p>Registrar of Births & Deaths, Bhandara</p>
            <p>Ensure Registration of Every Birth & Death</p>
        </div>
    </div>
                    
     <button class="print-btn" onclick="window.print()">Print Certificate</button>

<%
            } else {
                out.println("<h2>No record found for Application ID: " + appId + "</h2>");
            }
            conn.close();
        } catch (Exception e) {
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        }
    } else {
        out.println("<h2>Please provide an Application ID.</h2>");
    }
%>

</body>
</html>
