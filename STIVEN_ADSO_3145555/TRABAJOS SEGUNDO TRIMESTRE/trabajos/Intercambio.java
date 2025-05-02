package trabajos;

public class Intercambio {
    
    public static void main(String[] args) {
        int a = 20;
        int b = 10;

        a = a + b;
        b = a - b;
        a = a - b;

        System.out.println("antes a= 20 b=10 despues del intercambio:"+"a = " + a + " b = " + b);
    }
}
