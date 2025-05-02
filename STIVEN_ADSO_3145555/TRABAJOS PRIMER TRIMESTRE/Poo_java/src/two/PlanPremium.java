package two;

public class PlanPremium extends usuario {
    private float precio = 120000;
    private String descripcion = "Plan Premium: Acceso general + Clases dirigidas + Entrenador personal + Zona húmeda.";

    public PlanPremium(String nombre, String apellido, int id, int peso, double estatura) {
        super(nombre, apellido, id, peso, estatura);
    }

    public String getDescripcion() {
        return descripcion;
    }

    public float getPrecio() {
        return precio;
    }
}
