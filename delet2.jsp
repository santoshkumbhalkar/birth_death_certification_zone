<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Record</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; }
        input, button { padding: 10px; margin: 10px; }
    </style>
</head>
<body>
    <h2>Delete Record</h2>
    <form action="delete.jsp" method="post">
        <label>Enter ID to Delete:</label>
        <input type="text" name="id" required>
        <button type="submit">Delete</button>
    </form>
</body>
</html>
