import Geometric.Circle;
import Geometric.Rectangle;
import Geometric.Square;
import Geometric.Triangle;



public class App {
    public static void main(String[] args) throws Exception {
        

        Circle circle = new Circle(5.7);
        System.out.println("area del circulo: " + circle.calculateArea());

        Rectangle rectangle = new Rectangle(4.5, 3.0);
        System.out.println("area del rectangulo: " + rectangle.calculateArea());

        
        Square Square = new Square(6.7);
        System.out.println("Área del cuadrado: " + Square.calculateArea());

        Triangle triangle = new Triangle(4.0, 5.0);
        System.out.println("Área del triángulo: " + triangle.calculateArea());
        
    }
}

