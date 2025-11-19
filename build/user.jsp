<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Profil utilisateur</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            background: rgba(255,255,255,0.95);
            color: #333;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            text-align: center;
            min-width: 400px;
        }
        .username {
            font-size: 3.5em;
            margin: 20px 0;
            color: #764ba2;
            font-weight: 700;
        }
        .badge {
            display: inline-block;
            background: #27ae60;
            color: white;
            padding: 8px 20px;
            border-radius: 50px;
            font-size: 0.9em;
            margin: 15px 0;
        }
        a {
            color: #667eea;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Bienvenue !</h1>
        <div class="username">${username}</div>
        <div class="badge">Utilisateur connecté</div>
        <p>Cette page a été générée grâce à <strong>@PathParam("username")</strong></p>
        <p>
            <a href="${pageContext.request.contextPath}/api/user/admin">Essayer avec "admin"</a> |
            <a href="${pageContext.request.contextPath}/api/user/toto">Essayer avec "toto"</a>
        </p>
        <br>
        <a href="${pageContext.request.contextPath}/">← Retour</a>
    </div>
</body>
</html>