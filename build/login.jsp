<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription Employé</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 150px; }
        input, select { padding: 8px; width: 250px; }
        button { padding: 10px 20px; margin-top: 20px; }
        .checkbox-group { margin-left: 155px; }
    </style>
</head>
<body>
    <h1>Inscription d'un Employé</h1>

    <form action="${pageContext.request.contextPath}/api/register" method="post">



        <div class="form-group">
            <label for="login">Login :</label>
            <input type="text" id="login" name="login" value="berthin" required>
        </div>

        <div class="form-group">
            <label for="password">Mot de passe :</label>
            <input type="password" id="password" name="password" value="laura" required>
        </div>

        <button type="submit">Se connecter</button>
    </form>
</body>
</html>