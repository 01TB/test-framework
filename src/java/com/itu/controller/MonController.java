package com.itu.controller;

import servlet.annotation.Controller;
import servlet.annotation.URLMapping;

@Controller(path = "/api")
public class MonController {

    @URLMapping(url = "/users")
    public void listUsers() {
        // Votre logique ici
    }

    @URLMapping(url = "/products")
    public void listProducts() {
        // Votre logique ici
    }

    @URLMapping(url = "/hello")
    public void sayHello() {
        // Votre logique ici
    }
}
