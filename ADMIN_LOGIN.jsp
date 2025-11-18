<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Login</title>
    <script>
        function successCall(){
            alert("Your Login Has been Successful");
            window.location.href = "DASH_PAGE.html";
        }

        function failureCall(){
            alert("Login failed! Invalid username or password. Please try again.");
            window.location.href = "ADMIN_LOGIN.html"; // Redirect back to login page
        }
    </script>
</head>
<body>
<%
    String fixedUsername = "MAH_BDCZ";
    String fixedPassword = "MAH_@dmin";

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        // Check if username and password match the fixed values
        if (username.equals(fixedUsername) && password.equals(fixedPassword)) {
%>
            <script> successCall(); </script>
<%
        } else {
%>
            <script> failureCall(); </script>
<%
        }
    } else {
%>
        <h2>Please enter your login credentials.</h2>
        <a href="ADMIN_LOGIN.html">Go back to login page</a>
<%
    }
%>
</body>
</html>
