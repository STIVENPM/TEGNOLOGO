package four;

public class ind {
    public static void main(String[] args) {
        LicenciaA estudianteA = new LicenciaA("Stiven", "Perdomo", 1075793962, "Cra 12 #34-56", "3123456789", "O+");
        System.out.println("Nombre: " + estudianteA.getNombreCompleto());
        System.out.println("ID: " + estudianteA.getId());
        System.out.println("Direccion: " + estudianteA.getDireccion());
        System.out.println("Teléfono: " + estudianteA.getTelefono());
        System.out.println("RH: " + estudianteA.getRh());
        System.out.println("Tipo de licencia: " + estudianteA.getTipo());
        System.out.println("Duracion: " + estudianteA.getDuracion());
        System.out.println("Precio: $" + estudianteA.getPrecio());
        System.out.println();

        LicenciaB estudianteB = new LicenciaB("Daniela", "Martinez", 1098765432, "Av 45 #78-90", "3009876543", "A-");
        System.out.println("Nombre: " + estudianteB.getNombreCompleto());
        System.out.println("ID: " + estudianteB.getId());
        System.out.println("Direccion: " + estudianteB.getDireccion());
        System.out.println("Teléfono: " + estudianteB.getTelefono());
        System.out.println("RH: " + estudianteB.getRh());
        System.out.println("Tipo de licencia: " + estudianteB.getTipo());
        System.out.println("Duracion: " + estudianteB.getDuracion());
        System.out.println("Precio: $" + estudianteB.getPrecio());
        System.out.println();

        LicenciaC estudianteC = new LicenciaC("Jose", "Maria", 1088123456, "Calle 23 #10-20", "3101122334", "B+");
        System.out.println("Nombre: " + estudianteC.getNombreCompleto());
        System.out.println("ID: " + estudianteC.getId());
        System.out.println("Direccion: " + estudianteC.getDireccion());
        System.out.println("Teléfono: " + estudianteC.getTelefono());
        System.out.println("RH: " + estudianteC.getRh());
        System.out.println("Tipo de licencia: " + estudianteC.getTipo());
        System.out.println("Duracion: " + estudianteC.getDuracion());
        System.out.println("Precio: $" + estudianteC.getPrecio());
    }
}

