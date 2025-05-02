
import PRIMERO.Aprendice;
import PRIMERO.Primero;
import PRIMERO.Teacher;


public class PERSONA{
    public static void main(String[] args) throws Exception {

    Primero PRIMERO = new Primero(1075793962, "Stiven", "Perdomo", "2006-11-24");

    System.out.println("=== PRIMERO ===");
    System.out.println("Identificacion: " + PRIMERO.getIdentification());
    System.out.println("Nombre: " + PRIMERO.getName());
    System.out.println("Apellido: " + PRIMERO.getLastName());
    System.out.println("Cumpleaños: " + PRIMERO.getBirthday());

    Aprendice aprendiz = new Aprendice(1075793962, "Stiven", "Perdomo", "2006-11-24", "SENA - ADSO", 3122677170L);

    System.out.println("\n=== APRENDIZ ===");
    System.out.println("Nombre: " + aprendiz.getName());
    System.out.println("Apellido: " + aprendiz.getLastName());
    System.out.println("Programa: " + aprendiz.getProgramName());
    System.out.println("Telefono de contacto: " + aprendiz.getTelephoneContact());

    Teacher docente = new Teacher(123456789, "Laura", "Martínez", "1985-08-14", "Programación", 3001122334L);

    System.out.println("\n=== DOCENTE ===");
    System.out.println("Nombre: " + docente.getName());
    System.out.println("Programa: " + docente.getProgramName());
    System.out.println("Telefono: " + docente.getTelephoneContact());
}
}