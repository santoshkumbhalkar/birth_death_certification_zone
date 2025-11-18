<%-- 
    Document   : d_certi
    Created on : 26 Feb, 2025, 11:20:45 PM
    Author     : Santosh Kumbhalkar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="D_CERTI.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
    String appId = request.getParameter("appId");
    if (appId != null && !appId.trim().isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM death_certi_application WHERE appId=?");
            ps.setString(1, appId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
%>
    <div class="certificate-container">
        <!-- Certificate Header -->
        <div class="certificate-header">
            <img src="d_logo.png" alt="Government Logo" class="gov-logo">
            <div class="header-text">
                <h2>GOVERNMENT OF MAHARASHTRA</h2>
                <h3>HEALTH DEPARTMENT</h3>
                <h3> Municipality <%= rs.getString("district") %></h3>
                <h2>DEATH CERTIFICATE</h2>
                <p>(Issued under section 12/17 of the Registration of Births & Deaths Act, 1969 and Rule 8/13 of the Maharashtra Registration of Births and Deaths Rules, 2000.)</p>
            </div>
            <img src="logo_bd.png" alt="Official Stamp" class="stamp-logo">
        </div>

        <!-- Certificate Body -->
        <div class="certificate-body">
            <table>
                <tr>
                    <td><strong>Certificate No:</strong><%= rs.getString("appId") %></td>
                    <td style="text-align: right;"><strong>Form No:</strong> 5</td>
                </tr>
            </table>

            <p>This is to certify that the following information has been taken from the original record of birth, which is the register for Bhandara Municipal Council, Maharashtra.</p>

            <table class="details-table">
                <tr>
                    <td><strong>Name of Deceased:</strong> <%= rs.getString("deceased_name")%></td>
                    <td><strong>Sex:</strong> <%= rs.getString("d_gender") %></td>
                </tr>
                <tr>
                    <td><strong>Date of Death:</strong><%= rs.getString("dod") %></td>
                    <td><strong>Place of Death:</strong><%= rs.getString("death_place") %></td>
                </tr>
                
                 <tr>
                    <td><strong>Age Of Deceased:</strong><%= rs.getString("d_age") %></td>
                    <td><strong>Deceased Aadhaar Number:</strong><%= rs.getString("deceased_adhar") %></td>
                </tr>
                
                <tr>
                    <td><strong>Marital Status:</strong><%= rs.getString("d_marital_status") %></td>
                    <td><strong>Type Of Death:</strong><%= rs.getString("typeOfDeath") %></td>
                </tr>
            </table>

            <table class="details-table">
                <tr>
                    <td><strong>Name of Spouse:</strong> <%= rs.getString("spouse_name") %></td>
                    <td><strong>Spouse Aadhar:</strong> <%= rs.getString("spouse_adhar") %></td>
                </tr>
                <tr>
                    <td><strong>Name of Mother:</strong> <%= rs.getString("mother_name") %></td>
                    <td><strong>Mother Aadhar:</strong> <%= rs.getString("mother_adhar") %></td>
                </tr>
                <tr>
                    <td><strong>Name of Father:</strong> <%= rs.getString("father_name") %></td>
                    <td><strong>Father Aadhar:</strong> <%= rs.getString("father_adhar") %></td>
                </tr>
            </table>
               
            <table class="details-table">
                <tr>
                    <td colspan="2"><strong>Address of Parents at the time of Death of the Deceased:</strong> <%= rs.getString("d_time_add") %></td>
                </tr>
                <tr>
                    <td colspan="2"><strong>Permanent Address:</strong><%= rs.getString("d_perma_add") %></td>
                </tr>
            </table>
                
             
            

            <table class="details-table">
                <tr>
                    <td><strong>Registration No:</strong> <%= rs.getString("appId") %></td>
                    <td><strong>Date of Registration:</strong> <%= rs.getString("date_app") %></td>
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
