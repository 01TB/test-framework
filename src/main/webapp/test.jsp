<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<%
    String nom = (String) request.getAttribute("nom");
    int age = (int) request.getAttribute("age");
    List<String> departements = (List<String>) request.getAttribute("departements");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test Framework</title>
</head>
<body>
    <h1>Hello World!!!</h1>

    <p>Nom : <%= nom %></p>
    <p>Âge : <%= age %></p>

    <h3>Départements :</h3>
    <ul>
        <% if (departements != null) {
            for(String dept : departements) { %>
                <li><%= dept %></li>
            <% }
        } else { %>
            <li>Aucun département</li>
        <% } %>
    </ul>
</body>
</html>