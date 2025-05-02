package Geometric;

public class Circle extends GeometricClass{

    private double radius;
    private double area;

    public Circle(double radius) {
        super("Circle");
        this.radius = radius;
    }
    

    public double getRadius(){
        return this.radius;
    }

    public void setRadious(double radius){
        this.radius = radius;
    }

    @Override
    public double calculateArea(){
        this.area = Math.PI * this.radius * this.radius;
        return area;
    }    


}

