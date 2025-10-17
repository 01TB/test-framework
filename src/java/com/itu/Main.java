import controller.TestController;
import servlet.annotation.Route;

import java.lang.reflect.Method;

public class Main {
    public static void main(String[] args) {
        try {
            // Load the TestController class
            Class<?> controllerClass = TestController.class;

            // Find the method named "testMethod"
            Method m = controllerClass.getMethod("testMethod");

            // Check if the Route annotation is present
            Route route = m.getAnnotation(Route.class);
            if (route != null) {
                System.out.println("Route url: " + route.url());
            } else {
                System.out.println("Pas d'annotation @Route trouvé sur la méthode testMethod()");
            }
        } catch (NoSuchMethodException e) {
            System.out.println("Méthode testMethod non trouvé: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Erreur de lecture de l'annotation: " + e);
        }
    }
}