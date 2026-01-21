<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    
    String login = (String) session.getAttribute("login");
    String userRole = (String) session.getAttribute("userRole");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Confirmation Connexion</title>
</head>
<body>
    <p>User = <%= login %></p>
    <p>Role = <%= userRole %></p>
</body>
</html>