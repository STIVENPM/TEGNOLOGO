
package Geometric;
public class Square extends GeometricClass {

    private double side;      
    private double calculate;

    
    public Square(double side) {
        super("Square");      
        this.side = side;     
    }

   
    public double getSide() {
        return this.side;
    }

  
    public void setSide(double side) {
        this.side = side;
    }

    
    @Override
    public double calculateArea() {
        this.calculate = this.side * this.side;
        return this.calculate;
    }
}



