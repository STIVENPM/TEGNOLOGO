package two;

public class PlanBasico extends usuario {
    private float precio = 50000;
    private String descripcion = "Plan Básico: Acceso general al gimnasio.";

    public PlanBasico(String nombre, String apellido, int id, int peso, double estatura) {
        super(nombre, apellido, id, peso, estatura);
    }

    public String getDescripcion() {
        return descripcion;
    }

    public float getPrecio() {
        return precio;
    }
}
