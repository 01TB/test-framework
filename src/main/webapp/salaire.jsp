<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.lang.Integer"%>
<%
    Integer employeId = (Integer) request.getAttribute("employeId");
    Integer salaire = (Integer) request.getAttribute("salaire");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Salaire de l'employé</title>
</head>
<body>
    <div>
        <% if (employeId != null) { %>
            <h1>Salaire de l'employé</h1>
            <div>
                Employé ID : <strong><%= employeId %></strong>
            </div>
            
            <div>
                <%= salaire %> €
            </div>
            
            <p>Calculé dynamiquement par ton framework avec @PathParam !</p>
        <% } else { %>
            <li>Aucun SALARIER</li>
        <% } %>
    </div>
</body>
</html>