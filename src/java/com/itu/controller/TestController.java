package controller;

import servlet.annotation.Route;

public class TestController {
    
    @Route(url = "/testURL")
    public void testMethod() {
        System.out.println("This is a test method in TestController.");
    }

}
