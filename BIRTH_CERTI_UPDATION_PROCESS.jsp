<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Birth Certificate</title>
<script>
        function bu_call(){
            alert("Your Application has been updated Successful");
            win=open("DASH_PAGE.html");
        }
    </script>
</head>
<body>

<%
    // Database connection parameters
   
    // Retrieve form parameters
   String id = request.getParameter("app_Id");
    String fullName = request.getParameter("t2");
    String gender = request.getParameter("t3");
    String mobile = request.getParameter("t4");
    String relation = request.getParameter("t5");
    String appDate = request.getParameter("t6");
    String appAddress = request.getParameter("t7");
    String childFirstName = request.getParameter("t8");
    String childMiddleName = request.getParameter("t9");
    String childLastName = request.getParameter("t10");
    String childDOB = request.getParameter("t11");
    String childSex = request.getParameter("t12");
    String placeOfBirth = request.getParameter("t13");
    String religion = request.getParameter("t14");
    String motherFullName = request.getParameter("t15");
    String motherAadharNo = request.getParameter("t16");
    String fatherFullName = request.getParameter("t17");
    String fatherAadharNo = request.getParameter("t18");
    String parentMobile = request.getParameter("t19");
    String birthAddress = request.getParameter("t20");
    String permanentAddress = request.getParameter("t21");
    String description = request.getParameter("t22");
    String district = request.getParameter("t23");
    String hospitalName = request.getParameter("t24");
    String doctorName = request.getParameter("t25");
    String hospitalRegId = request.getParameter("t26");
    String deliveryType = request.getParameter("t27");

    try {
     
       Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone","root","");
       Statement st=con.createStatement();
       int i=st.executeUpdate("UPDATE birth_certi_application SET app_fname='"+fullName+"',gender='"+gender+"',mo_no='"+mobile+"',rel_child='"+relation+"',date='"+appDate+"',app_add='"+appAddress+"',c_f_name='"+childFirstName+"',c_m_name='"+childMiddleName+"',c_l_name='"+childLastName+"',dob='"+childDOB+"',child_sex='"+childSex+"',birth_place='"+placeOfBirth+"',religion='"+religion+"',mother_name='"+motherFullName+"',mother_adhar='"+motherAadharNo+"',father_name='"+fatherFullName+"',father_adhar='"+fatherAadharNo+"',p_mo_num='"+parentMobile+"',p_time_b_add='"+birthAddress+"',perma_add='"+permanentAddress+"',description='"+description+"',district='"+district+"',hospi_name='"+hospitalName+"',dr_name='"+doctorName+"',hospi_regno='"+hospitalRegId+"',del_type='"+deliveryType+"' WHERE app_Id='"+id+"'");
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


</body><script>bu_call();</script>
</html>
