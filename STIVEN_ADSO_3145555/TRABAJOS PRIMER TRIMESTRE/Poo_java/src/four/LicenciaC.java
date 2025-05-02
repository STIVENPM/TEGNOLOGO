package four;

public class LicenciaC extends Usuario {
    private String tipo;
    private String duracion;
    private float precio;

    public LicenciaC(String name, String lastname, float id, String direccion, String telefono, String rh) {
        super(name, lastname, id, direccion, telefono, rh);
        this.tipo = "Licencia C - Servicio público";
        this.duracion = "4 meses";
        this.precio = 750000;
    }

    public String getTipo() {
        return tipo;
    }

    public String getDuracion() {
        return duracion;
    }

    public float getPrecio() {
        return precio;
    }
}
