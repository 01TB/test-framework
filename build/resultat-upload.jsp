<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String description = (String) request.getAttribute("description");
    byte[] fileBytes1 = (byte[]) request.getAttribute("fileBytes1");
    byte[] fileBytes2 = (byte[]) request.getAttribute("fileBytes2");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Confirmation Upload</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: #f7f7f7; }
        .card { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); max-width: 600px; }
        h1 { color: #2c3e50; }
        .info { margin: 10px 0; }
        .label { font-weight: bold; color: #34495e; }
        ul { margin: 5px 0; padding-left: 20px; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Upload Confirmé !</h1>

        <div class="info">
            <span class="label">Description :</span> <%=description%>
        </div>
        <div class="info">
            <span class="label">Taille du fichier 1 :</span> <%=fileBytes1.length%> octets
        </div>
        <div class="info">
            <span class="label">Taille du fichier 2 :</span> <%=fileBytes2.length%> octets
        </div>

        <p><a href="${pageContext.request.contextPath}/api/form">← Nouvelle upload</a></p>
    </div>
</body>
</html>