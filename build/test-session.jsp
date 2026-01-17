<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    
    String testValue = (String) session.getAttribute("test");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Confirmation Inscription</title>
</head>
<body>
    <p>Clé[test] = <%= testValue %></p>
</body>
</html>