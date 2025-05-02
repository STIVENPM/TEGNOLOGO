package Geometric;

public class Triangle extends GeometricClass {
    private double base;
    private double height;
    private double area;

    public Triangle(double base, double height) {
        super("triangle");
        this.base = base;
        this.height = height;
    }

    public double getBase() {
        return base;
    }

    public void setBase(double base) {
        this.base = base;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    @Override
    public double calculateArea() {
        this.area = (base * height) / 2;
        return area;
    }
}
