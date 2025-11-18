<%-- 
    Document   : BIRTH_SUBMIT_APPLICATION
    Created on : 12 Feb, 2025, 7:42:54 PM
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
        function bu(){
        alert("Your Birth Certificate Application is Submitted Successfully");
        win=open("DASH_PAGE.html");
         }
    </script>
    </head>
    <body>
        <%
            String appId =request.getParameter("t1");
            String f_name =request.getParameter("t2");
            String gender =request.getParameter("t3");
            String mo_no =request.getParameter("t4");
            String rel_child =request.getParameter("t5");
            String date =request.getParameter("t6");
            String app_add =request.getParameter("t7");
            String c_f_name =request.getParameter("t8");
            String c_m_name =request.getParameter("t9");
            String c_l_name =request.getParameter("t10");
            String dob =request.getParameter("t11");
            String child_sex =request.getParameter("t12");
            String birth_place =request.getParameter("t13");
            String religion =request.getParameter("t14");
            String mother_name =request.getParameter("t15");
            String mother_adhar =request.getParameter("t16");
            String father_name =request.getParameter("t17");
            String father_adhar =request.getParameter("t18");
            String p_mo_num =request.getParameter("t19");
            String p_time_b_add =request.getParameter("t20");
            String perma_add =request.getParameter("t21");
            String descript =request.getParameter("t22");
            String district =request.getParameter("t23");
            String hospi_name =request.getParameter("t24");
            String dr_name =request.getParameter("t25");
            String hospi_regno =request.getParameter("t26");
            String del_type=request.getParameter("t27");
            

           try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");
                Statement st = con.createStatement();
                int i = st.executeUpdate("INSERT INTO birth_certi_application(app_Id,app_fname, gender, mo_no,rel_child,date ,app_add, c_f_name, c_m_name,c_l_name, dob, child_sex, birth_place,religion,mother_name,mother_adhar,father_name,father_adhar,p_mo_num,p_time_b_add,perma_add,description,district,hospi_name,dr_name,hospi_regno,del_type) VALUES ('" +appId+"', '"+f_name+"', '" +gender+ "', '" +mo_no+ "', '" + rel_child + "', '"+date+ "', '" +app_add+"','" +c_f_name+ "', '" +c_m_name+ "', '" +c_l_name+ "', '" +dob+"', '"+child_sex+"', '"+birth_place+"','"+religion+"','"+mother_name+"','"+mother_adhar+"','"+father_name+"', '"+father_adhar+"','"+p_mo_num+"','"+p_time_b_add+"','"+perma_add+"','"+descript+"','"+district+"','"+hospi_name+"','"+dr_name+"','"+hospi_regno+"','"+del_type+"')");
                
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
           
    </body><script>
        bu();
    </script>
    
</html>
