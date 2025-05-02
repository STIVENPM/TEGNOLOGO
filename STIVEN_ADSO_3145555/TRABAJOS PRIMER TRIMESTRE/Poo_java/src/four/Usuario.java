package four;

public class Usuario {
    protected String name;
    protected String lastname;
    protected float id;
    protected String direccion;
    protected String telefono;
    protected String rh;

    public Usuario(String name, String lastname, float id, String direccion, String telefono, String rh) {
        this.name = name;
        this.lastname = lastname;
        this.id = id;
        this.direccion = direccion;
        this.telefono = telefono;
        this.rh = rh;
    }

    public String getNombreCompleto() {
        return name + " " + lastname;
    }

    public float getId() {
        return id;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getRh() {
        return rh;
    }
}
