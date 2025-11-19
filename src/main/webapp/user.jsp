<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (String) request.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Profil utilisateur</title>
    <style>
    </style>
</head>
<body>
    <div >
        <% if (username != null) { %>
            <h1>Bienvenue !</h1>
            <div><%= username %></div>
            <div>Utilisateur connecté</div>
            <p>Cette page a été générée grâce à <strong><%= username %></strong></p>
            <br>
        <% } else { %>
            <li>Aucun USER</li>
        <% } %>
        
    </div>
</body>
</html>