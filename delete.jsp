<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    Connection con = null;
    PreparedStatement pst = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");

        String sql = "DELETE FROM death_certi_application WHERE appId=?";
        pst = con.prepareStatement(sql);
        pst.setString(1, id);
        int rowsAffected = pst.executeUpdate();

        if (rowsAffected > 0) {
            out.println("<h3>Record Deleted Successfully!</h3>");
        } else {
            out.println("<h3>No Record Found with ID: " + id + "</h3>");
        }
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        if (pst != null) pst.close();
        if (con != null) con.close();
    }
%>
