package trabajos;

public class Salario {
    public static void main(String[] args) {
        double horastbj = 70;          
        double hourlyRate = 30000;      
        double total;

        if (horastbj > 40) {

            total = 40 * hourlyRate + (horastbj - 40) * hourlyRate * 1.5;
        } else {

            total = horastbj * hourlyRate;
        }
        System.out.println("total pago: $" +  total);
    }
}

    