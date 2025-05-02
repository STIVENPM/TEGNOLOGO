package four;

public class LicenciaA extends Usuario {
    private String tipo;
    private String duracion;
    private float precio;

    public LicenciaA(String name, String lastname, float id, String direccion, String telefono, String rh) {
        super(name, lastname, id, direccion, telefono, rh);
        this.tipo = "Licencia A - Motocicletas";
        this.duracion = "2 meses";
        this.precio = 450000;
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

