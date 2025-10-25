package com.itu.controller;

import servlet.annotation.Controller;
import servlet.annotation.URLMapping;

@Controller(path = "/bis")
public class BisController {
    
    
    @URLMapping(url = "/bisURL")
    public void testMethod() {
        System.out.println("This is a test method in BisController.");
    }

}
