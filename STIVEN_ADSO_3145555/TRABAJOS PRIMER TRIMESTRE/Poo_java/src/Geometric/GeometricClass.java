package Geometric;

public abstract class GeometricClass {
    private String Name;

    public GeometricClass(String name) {
        this.Name = name;
    }

   public String getName(){
    return Name;
   }

   public abstract double calculateArea();

}


