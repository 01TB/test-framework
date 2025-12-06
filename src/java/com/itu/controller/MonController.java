package com.itu.controller;

import servlet.models.ModelView;

import java.util.ArrayList;
import java.util.Map;

import com.itu.models.Employe;

import servlet.annotation.Controller;
import servlet.annotation.mappings.GetMapping;
import servlet.annotation.mappings.PostMapping;
import servlet.annotation.parameters.PathParam;
import servlet.annotation.parameters.RequestParam;

@Controller(path = "/api")
public class MonController {

    @GetMapping(url = "/users")
    public String listUsers() {
        return "Liste des utilisateurs";
    }

    @GetMapping(url = "/products")
    public String listProducts() {
        return "Liste des produits";
    }

    @GetMapping(url = "/hello")
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

    @GetMapping(url = "/employe/{id}/salaire")
    public ModelView getSalaire(@PathParam("id") int employeId) {
        ModelView mv = new ModelView("salaire.jsp");
        mv.addData("employeId", employeId);
        mv.addData("salaire", 5000 + employeId * 10);
        return mv;
    }

    @GetMapping(url = "/user/{username}")
    public ModelView getUser(@PathParam("username") String username) {
        ModelView mv = new ModelView("user.jsp");
        mv.addData("username", username);
        return mv;
    }

    // Page avec formulaire
    @GetMapping(url = "/inscription")
    public ModelView showForm() {
        return new ModelView("inscription.jsp");
    }

    // Traitement du formulaire 
    @PostMapping(url = "/inscription/traiter")
    public ModelView traiterForm(Employe employe) {
        ModelView mv = new ModelView("confirmation.jsp");
        mv.addData("employe", employe);
        return mv;
    }
}
