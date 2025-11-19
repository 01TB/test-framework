package com.itu.controller;

import servlet.models.ModelView;

import java.util.ArrayList;

import servlet.annotation.Controller;
import servlet.annotation.URLMapping;
import servlet.annotation.PathParam;
import servlet.annotation.RequestParam;

@Controller(path = "/api")
public class MonController {

    @URLMapping(url = "/users")
    public String listUsers() {
        return "Liste des utilisateurs";
    }

    @URLMapping(url = "/products")
    public String listProducts() {
        return "Liste des produits";
    }

    @URLMapping(url = "/hello")
    public ModelView sayHello() {

        ArrayList<String> depts = new ArrayList<>();
        depts.add("INFORMATIQUE");
        depts.add("MARKETING");
        depts.add("FINANCES");
        
        ModelView model = new ModelView("test.jsp");  // sans le slash devant !
        model.addData("nom", "Berthin");
        model.addData("age", 12);
        model.addData("departements", depts);

        return model;
    }

    @URLMapping(url = "/employe/{id}/salaire")
    public ModelView getSalaire(@PathParam("id") int employeId) {
        ModelView mv = new ModelView("salaire.jsp");
        mv.addData("employeId", employeId);
        mv.addData("salaire", 5000 + employeId * 10);
        return mv;
    }

    @URLMapping(url = "/user/{username}")
    public ModelView getUser(@PathParam("username") String username) {
        ModelView mv = new ModelView("user.jsp");
        mv.addData("username", username);
        return mv;
    }

    // Page avec formulaire
    @URLMapping(url = "/inscription")
    public ModelView showForm() {
        return new ModelView("inscription.jsp");
    }

    // Traitement du formulaire 
    @URLMapping(url = "/inscription/traiter")
    public ModelView traiterForm(
            @RequestParam("nom") String nom,
            @RequestParam("age") int age,
            @RequestParam("email") String email,
            @RequestParam("departement") String dept) {

        ModelView mv = new ModelView("confirmation.jsp");
        mv.addData("nom", nom);
        mv.addData("age", age);
        mv.addData("email", email);
        mv.addData("departement", dept);
        mv.addData("message", "Inscription réussie !");

        return mv;
    }
}
