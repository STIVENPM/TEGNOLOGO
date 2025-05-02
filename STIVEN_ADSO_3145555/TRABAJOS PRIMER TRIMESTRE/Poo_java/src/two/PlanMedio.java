package two;

public class PlanMedio extends usuario {
    private float precio = 80000;
    private String descripcion = "Plan Medio: Acceso general + Clases dirigidas.";

    public PlanMedio(String nombre, String apellido, int id, int peso, double estatura) {
        super(nombre, apellido, id, peso, estatura);
    }

    public String getDescripcion() {
        return descripcion;
    }

    public float getPrecio() {
        return precio;
    }
}
