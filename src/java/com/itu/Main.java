// Main.java dans le projet test
package com.itu;

import servlet.util.FrameworkScanner;

public class Main {
    public static void main(String[] args) {
        System.out.println("Démarrage du test du framework...");
        
        // Test avec le scanner robuste
        FrameworkScanner.scanControllers();
        
        System.out.println("\nTest terminé !");
    }

    // Compilation :
    // javac -cp "lib/servlet.jar;lib/servlet-api.jar" -d bin src/java/com/itu/Main.java src/java/com/itu/controller/TestController.java src/java/com/itu/controller/TestNonController.java src/java/com/itu/controller/BisController.java

    // Execution :
    // java -cp "bin;lib/servlet.jar;lib/servlet-api.jar" com.itu.Main
}