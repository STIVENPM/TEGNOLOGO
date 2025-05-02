
package Geometric;

public class Rectangle extends GeometricClass {
    private double length;
    private double height;
    private double area;

    public Rectangle(double length, double height) {
        super("Rectangle"); 
        this.length = length;
        this.height = height;
    }

    
    public double getLength() {
        return this.length;
    }

    
    public void setLength(double length) {
        this.length = length;
    }

    
    public double getHeight() {
        return this.height;
    }

   
    public void setHeight(double height) {
        this.height = height;
    }

    
    @Override
    public double calculateArea() {
        this.area = this.length * this.height;
        return this.area;
    }
}





