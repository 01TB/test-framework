<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Upload de fichier</title>
</head>
<body>
    <h2>Uploader un fichier</h2>

    <!-- ATTENTION : method POST + enctype multipart obligatoires ! -->
    <form action="${pageContext.request.contextPath}/api/form/upload" 
          method="post" 
          enctype="multipart/form-data">

        <p>
            <label for="description">Description (optionnel) :</label><br>
            <input type="text" id="description" name="description" size="50">
        </p>

        <p>
            <label for="fichier">Choisir un fichier 1 :</label><br>
            <input type="file" id="fichier" name="fichier_1" required>
        </p>

        <p>
            <label for="fichier">Choisir un fichier 2 :</label><br>
            <input type="file" id="fichier" name="fichier_2" required>
        </p>

        <p>
            <button type="submit">Envoyer le fichier</button>
        </p>
    </form>
</body>
</html>