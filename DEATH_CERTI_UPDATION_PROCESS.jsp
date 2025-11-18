<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Death Certificate</title>
    <script>
        function du_call(){
            alert("Your Death Certificate has been updated Successful");
            win=open("DASH_PAGE.html");
        }
    </script>
</head>
<body>

<%
    String appId = request.getParameter("appId");
    String appFname = request.getParameter("t2");
    String relDeceased = request.getParameter("t3");
    String dateApp = request.getParameter("t4");
    String moNum = request.getParameter("t5");
    String appAdd = request.getParameter("t6");
    String deceasedName = request.getParameter("t7");
    String dGender = request.getParameter("t8");
    String dAge = request.getParameter("t9");
    String dMaritalStatus = request.getParameter("t10");
    String dod = request.getParameter("t11");
    String deceasedAdhar = request.getParameter("t12");
    String typeOfDeath = request.getParameter("t13");
    String deathPlace = request.getParameter("t14");
    String dTimeAdd = request.getParameter("t15");
    String dPermaAdd = request.getParameter("t16");
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
    String description = request.getParameter("t27");
    String drRefNum = request.getParameter("t28");
    String hospiName = request.getParameter("t29");
    String deathCertiNum = request.getParameter("t30");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");
        Statement st = con.createStatement();
       
        int i = st.executeUpdate("UPDATE death_certi_application SET app_fname='"+appFname+"', rel_deceased='"+relDeceased+"', date_app='"+dateApp+"', mo_num='"+moNum+"', app_add='"+appAdd+"', deceased_name='"+deceasedName+"', d_gender='"+dGender+"', d_age='"+dAge+"', d_marital_status='"+dMaritalStatus+"', dod='"+dod+"', deceased_adhar='"+deceasedAdhar+"', typeOfDeath='"+typeOfDeath+"', death_place='"+deathPlace+"', d_time_add='"+dTimeAdd+"', d_perma_add='"+dPermaAdd+"',district='"+district+"', religion='"+religion+"', spouse_name='"+spouseName+"', spouse_adhar='"+spouseAdhar+"', spouse_mo_num='"+spouseMoNum+"', mother_name='"+motherName+"', mother_adhar='"+motherAdhar+"', father_name='"+fatherName+"', father_adhar='"+fatherAdhar+"', p_mo_num='"+pMoNum+"', description='"+description+"', dr_ref_num='"+drRefNum+"', hospi_name='"+hospiName+"', death_certi_num='"+deathCertiNum+"' WHERE appId='"+appId+"'");
        
        if (i > 0) {
            out.println("<p style='color:green;'>Record updated successfully!</p>");
        } else {
            out.println("<p style='color:red;'>Update failed!</p>");
        }

        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</body>
 <script>
        du_call();
 </script>
</html>
