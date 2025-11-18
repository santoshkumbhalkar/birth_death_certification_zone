<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%
    String aadhar = request.getParameter("aadhar");

    boolean exists = false;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");
        String query = "SELECT COUNT(*) FROM death_certi_application WHERE deceased_adhar = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, aadhar);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            exists = rs.getInt(1) > 0;
        }

        con.close();
    } catch (SQLException e) {
        out.println("SQL Error: " + e.getMessage());
    } catch (ClassNotFoundException e) {
        out.println("Driver Error: " + e.getMessage());
    }

    if (exists) {
        out.print("exists");
    } else {
        out.print("not_exists");
    }
%>
