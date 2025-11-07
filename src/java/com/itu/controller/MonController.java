package com.itu.controller;

import servlet.models.ModelView;
import servlet.annotation.Controller;
import servlet.annotation.URLMapping;

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
        return new ModelView("hello.jsp");
    }
}
