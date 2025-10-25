package com.itu.controller;

import servlet.annotation.Controller;
import servlet.annotation.URLMapping;

@Controller(path = "/test")
public class TestController {
    
    
    @URLMapping(url = "/testURL")
    public void testMethod() {
        System.out.println("This is a test method in TestController.");
    }

}
