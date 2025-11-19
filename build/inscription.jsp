<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Inscription</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/api/inscription/traiter" method="post">
        <h2>Inscription</h2>
        <input type="text" name="nom" placeholder="Ton nom" required />
        <input type="number" name="age" placeholder="Ton âge" required />
        <input type="email" name="email" placeholder="Ton email" required />
        <select name="departement">
            <option value="INFORMATIQUE">Informatique</option>
            <option value="MARKETING">Marketing</option>
            <option value="FINANCES">Finances</option>
        </select>
        <button type="submit">S'inscrire</button>
    </form>
</body>
</html>