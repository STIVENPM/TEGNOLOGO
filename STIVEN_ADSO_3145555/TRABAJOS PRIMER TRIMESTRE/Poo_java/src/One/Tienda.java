package One;



public class Tienda extends Empleado {
    protected int nivelRiesgo;

    public Tienda(String nombre, double salarioBase, int nivelRiesgo) {
        super(nombre, salarioBase);
        this.nivelRiesgo = nivelRiesgo;
    }

    public double calcularSalud() {
        return salarioBase * 0.04;
    }

    public double obtenerPorcentajeARL() {
        switch (nivelRiesgo) {
            case 1: return 0.00522;
            case 2: return 0.01044;
            case 3: return 0.02436;
            case 4: return 0.04350;
            case 5: return 0.06960;
            default: return 0;
        }
    }

    public double calcularARL() {
        return salarioBase * obtenerPorcentajeARL();
    }

    public double calcularPension() {
        return salarioBase * 0.04;
    }

    public double calcularDescuentos() {
        return calcularSalud() + calcularPension() + calcularARL();
    }
}
