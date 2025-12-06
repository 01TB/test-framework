<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "models.Employe"%>
<%
    Employe employe = (Employe) request.getAttribute("employe");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Confirmation Inscription</title>
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
        <h1>Inscription Confirmée !</h1>

        <div class="info">
            <span class="label">ID :</span> <%=employe.id%>
        </div>
        <div class="info">
            <span class="label">Nom complet :</span> <%=employe.prenom%> <%=employe.nom%>
        </div>
        <div class="info">
            <span class="label">Email :</span> <%=employe.email%>
        </div>

        <div class="info">
            <span class="label">Département :</span>
            ID: <%=employe.dept.id%> | Nom: <%=employe.dept.nom%>
        </div>

        <div class="info">
            <span class="label">Rôles :</span>
            <% if(employe.roles!=null){ %>
                <ul>
                    <% for(String role : employe.roles) { %>
                        <li><%=role%></li>
                    <% } %>
                </ul>
            <% } else { %>
                <em>Aucun rôle sélectionné</em>
            <% } %>
        </div>

        <p><a href="${pageContext.request.contextPath}/api/inscription">← Nouvelle inscription</a></p>
    </div>
</body>
</html>