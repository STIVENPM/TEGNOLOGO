package trabajos;

public class Hipotenusa {
    public static void main (String []args){
        int cateto1=7;
        int cateto2=7;
        int calculo;
        double hipotenusa;

        calculo = (cateto1 * cateto1) + (cateto2 * cateto2);

        hipotenusa = Math.sqrt(calculo);

        System.out.println(" la hipotenusa usando el teorema de Pitagoras es = " + hipotenusa);
    }
    
}
