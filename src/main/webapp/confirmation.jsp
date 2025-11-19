<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.lang.Integer"%>
<%
    String nom = (String) request.getAttribute("nom");
    Integer age = (Integer) request.getAttribute("age");
    String email = (String) request.getAttribute("email");
    String departement = (String) request.getAttribute("departement");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Confirmation</title>
</head>
<body>
    <div class="box">
        <h1>Félicitations <%= nom %> !</h1>
        <p>Inscription réussie !</p>
        <p>Tu as <%= age %> ans, ton email est <strong><%= email %></strong></p>
        <p>Département : <strong><%= departement %></strong></p>
        <br>
    </div>
</body>
</html>