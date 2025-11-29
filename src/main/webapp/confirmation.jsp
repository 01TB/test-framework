<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.lang.Integer"%>
<%
    String nom = (String) request.getAttribute("nom");
    String age = (String) request.getAttribute("age");
    String email = (String) request.getAttribute("email");
    String departement = (String) request.getAttribute("departement");
    String[] roles = (String[]) request.getAttribute("role");

%>
<!DOCTYPE html>
<html>
<head>
    <title>Confirmation</title>
</head>
<body>
    <div class="box">
        <h1>Félicitations <%= nom %> !</h1>
        <p>Inscription réussie !</p>
        <p>Tu as <%= age %> ans, ton email est <strong><%= email %></strong></p>
        <p>Département : <strong><%= departement %></strong></p>
        <p>Rôle(s) : 
            <strong>
            <%
                if (roles != null) {
                    for (int i = 0; i < roles.length; i++) {
                        out.print(roles[i]);
                        if (i < roles.length - 1) {
                            out.print(", ");
                        }
                    }
                } else {
                    out.print("Aucun rôle sélectionné");
                }
            %>
            </strong>
        <br>
    </div>
</body>
</html>