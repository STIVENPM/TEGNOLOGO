package four;

public class LicenciaB extends Usuario {
    private String tipo;
    private String duracion;
    private float precio;

    public LicenciaB(String name, String lastname, float id, String direccion, String telefono, String rh) {
        super(name, lastname, id, direccion, telefono, rh);
        this.tipo = "Licencia B - Vehículos particulares";
        this.duracion = "3 meses";
        this.precio = 600000;
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

