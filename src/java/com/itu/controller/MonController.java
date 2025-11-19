package com.itu.controller;

import servlet.models.ModelView;

import java.util.ArrayList;

import servlet.annotation.Controller;
import servlet.annotation.URLMapping;
import servlet.annotation.PathParam;

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
    public ModelView getSalaire(@PathParam("id") int employeId, String nom, int bibi) {
        ModelView mv = new ModelView("salaire.jsp");
        mv.addData("employeId", employeId);
        mv.addData("salaire", 5000 + employeId * 10);
        return mv;
    }

    @URLMapping(url = "/user/{username}")
    public ModelView getUser(@PathParam("username") String username, String nom, int bibi) {
        ModelView mv = new ModelView("user.jsp");
        mv.addData("username", username);
        return mv;
    }
}
