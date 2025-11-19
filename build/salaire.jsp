<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Salaire de l'employé</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            color: #333;
            padding: 40px;
            text-align: center;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        h1 { color: #2c3e50; }
        .salaire {
            font-size: 3em;
            color: #27ae60;
            margin: 20px 0;
            font-weight: bold;
        }
        .info {
            font-size: 1.4em;
            margin: 15px 0;
            color: #34495e;
        }
        a {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 25px;
            background: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }
        a:hover { background: #2980b9; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Salaire de l'employé</h1>
        
        <div class="info">
            Employé ID : <strong>${employeId}</strong>
        </div>
        
        <div class="salaire">
            ${salaire} €
        </div>
        
        <p>Calculé dynamiquement par ton framework avec @PathParam !</p>
        
        <a href="${pageContext.request.contextPath}/api/employe/999/salaire">Tester avec l'ID 999</a>
        <br><br>
        <a href="${pageContext.request.contextPath}/">Retour à l'accueil</a>
    </div>
</body>
</html>