<%-- 
    Document   : DEATH_CERTI_UPDATION_PROCESS
    Created on : 1 Mar, 2025, 10:44:42 AM
    Author     : Santosh Kumbhalkar
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function b_call(){
                alert("Your Death Application has been Submitted Successful");
                win=open("DASH_PAGE.html");
            }
        </script>
    </head>
    <body>
       <%
    // Retrieve form parameters
    String appId = request.getParameter("t1");
    String appFname = request.getParameter("t2");
    String relDeceased = request.getParameter("t3");
    String dateApp = request.getParameter("t4");
    String moNum = request.getParameter("t5");
    String appAdd = request.getParameter("t6");
    String deceasedName = request.getParameter("t7");
    String dGender = request.getParameter("t8");
    String dage = request.getParameter("t9");
    String dMaritalStatus = request.getParameter("t10");
    String dod = request.getParameter("t11");
    String deceasedAdhar = request.getParameter("t12");
    String typeOfDeath = request.getParameter("t13");
    String deathPlace = request.getParameter("t14");
    String d_time_add = request.getParameter("t15");
    String d_perma_add = request.getParameter("t16");
    String district = request.getParameter("t17");
    String religion = request.getParameter("t18");
    String spouseName = request.getParameter("t19");
    String spouseAdhar = request.getParameter("t20");
    String spouseMoNum = request.getParameter("t21");
    String motherName = request.getParameter("t22");
    String motherAdhar = request.getParameter("t23");
    String fatherName = request.getParameter("t24");
    String fatherAdhar = request.getParameter("t25");
    String pMoNum = request.getParameter("t26");
    String descript = request.getParameter("t27");
    String drRefNum = request.getParameter("t28");
    String hospiName = request.getParameter("t29");
    String deathCertiNum = request.getParameter("t30");
  try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");
                Statement st = con.createStatement();
                int i = st.executeUpdate("INSERT INTO death_certi_application(appId, app_fname, rel_deceased, date_app, mo_num, app_add,deceased_name, d_gender,d_age, d_marital_status, dod, deceased_adhar, typeOfDeath, death_place,d_time_add,d_perma_add,district, religion, spouse_name, spouse_adhar, spouse_mo_num, mother_name, mother_adhar, father_name, father_adhar,p_mo_num,description, dr_ref_num, hospi_name, death_certi_num) VALUES ('" +appId + "', '" + appFname + "', '" + relDeceased + "', '" + dateApp + "', '" + moNum + "', '" +appAdd + "', '" + deceasedName + "', '" + dGender + "','" + dage + "', '" + dMaritalStatus + "', '" + dod + "', '" +deceasedAdhar + "', '" + typeOfDeath + "', '" + deathPlace + "','" + d_time_add + "','" + d_perma_add + "','" + district + "', '" + religion + "', '" +spouseName + "', '" + spouseAdhar + "', '" + spouseMoNum + "', '" + motherName + "', '" +motherAdhar + "', '" + fatherName + "', '" + fatherAdhar + "', '" + pMoNum + "','"+descript+"', '" +drRefNum + "', '" + hospiName + "', '" + deathCertiNum + "')");
                
                if (i > 0) {
            out.println("<h3 style='color:green;'>Data Inserted Successfully!</h3>");
        } else {
            out.println("<h3 style='color:red;'>Error in inserting data.</h3>");
        }

       
        st.close();
        con.close();

    } catch (SQLException e) {
        out.println("<h3 style='color:red;'>SQL Error: " + e.getMessage() + "</h3>");
    } catch (ClassNotFoundException e) {
        out.println("<h3 style='color:red;'>Database driver not found!</h3>");
    }

            %>
    </body>
    <script> b_call();</script>
</html>
