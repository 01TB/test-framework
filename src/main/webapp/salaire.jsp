<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Salaire de l'employé</title>
</head>
<body>
    <div>
        <h1>Salaire de l'employé</h1>
        
        <div>
            Employé ID : <strong>${employeId}</strong>
        </div>
        
        <div>
            ${salaire} €
        </div>
        
        <p>Calculé dynamiquement par ton framework avec @PathParam !</p>
    </div>
</body>
</html>