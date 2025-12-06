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

    <form action="${pageContext.request.contextPath}/api/inscription/traiter" method="post">
        <div class="form-group">
            <label for="id">ID :</label>
            <input type="number" id="id" name="id" required min="1">
        </div>

        <div class="form-group">
            <label for="nom">Nom :</label>
            <input type="text" id="nom" name="nom" required>
        </div>

        <div class="form-group">
            <label for="prenom">Prénom :</label>
            <input type="text" id="prenom" name="prenom" required>
        </div>

        <div class="form-group">
            <label for="email">Email :</label>
            <input type="email" id="email" name="email" required>
        </div>

        <fieldset style="margin-bottom: 20px;">
            <legend>Département</legend>

            <div class="form-group">
                <label for="dept.id">ID Département :</label>
                <input type="number" id="dept.id" name="dept.id" required min="1">
            </div>

            <div class="form-group">
                <label for="dept.nom">Nom Département :</label>
                <input type="text" id="dept.nom" name="dept.nom" required>
            </div>
        </fieldset>

        <div class="form-group">
            <label>Rôles :</label>
            <div class="checkbox-group">
                <label><input type="checkbox" name="roles[]" value="ADMIN"> Administrateur</label><br>
                <label><input type="checkbox" name="roles[]" value="USER"> Utilisateur</label><br>
                <label><input type="checkbox" name="roles[]" value="MANAGER"> Manager</label>
            </div>
        </div>

        <button type="submit">S'inscrire</button>
    </form>
</body>
</html>