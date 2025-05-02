package two;

public class usuario {
    private String nombre;
    private String apellido;
    private int id;
    private int peso;
    private double estatura;

    public usuario(String nombre, String apellido, int id, int peso, double estatura) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.id = id;
        this.peso = peso;
        this.estatura = estatura;
    }

    public String getNombreCompleto() {
        return this.nombre + " " + this.apellido;
    }

    public int getId() {
        return this.id;
    }

    public int getPeso() {
        return this.peso;
    }

    public double getEstatura() {
        return this.estatura;
    }
}
