<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

    String fullName = request.getParameter("full_name");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String conPassword = request.getParameter("con_password");

    if (!password.equals(conPassword)) {
        out.println("Passwords do not match. Please try again.");
        return;
    }

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        
        Class.forName("com.mysql.jdbc.Driver");

       
        conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/birth_death_certify_zone", "root", "");

        stmt = conn.createStatement();

        String checkQuery = "SELECT * FROM register WHERE username = '" + username + "'";
        rs = stmt.executeQuery(checkQuery);

        if (rs.next()) {
            out.println("Username already taken. Please choose a different one.");
        } else {
            
            
            String insertQuery = "INSERT INTO register (full_name, email, username, password, con_password) " +
                                 "VALUES ('" + fullName + "', '" + email + "', '" + username + "', '" + password + "', '" + conPassword + "')";
            int result = stmt.executeUpdate(insertQuery);

            if (result > 0) {
                response.sendRedirect("ADMIN_LOGIN.html");
            } else {
                out.println("Error in registration. Please try again.");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%> 
