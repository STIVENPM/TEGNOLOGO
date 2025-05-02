package One;

public class Empleado {
    protected String nombre;
  
    protected double salarioBase;
    protected final double SMMLV = 1300000;

    public Empleado(String nombre, double salarioBase) {
        this.nombre = nombre;
        
        this.salarioBase = salarioBase;
        
    }
   

    public double calcularSubsidio() {
        return salarioBase < 2 * SMMLV ? SMMLV : 0;
    }
}





