package trabajos;

public class Billetes {
    public static void main(String[] args) {
        int monto=777;
        int billestes100;
        int billestes50;
        int billestes20;
        int billestes10;
        int billestes5;
        int billestes1;

        billestes100= monto/100;
        monto%=100;
        billestes50= monto/50;
        monto%=50;
        billestes20= monto/20;
        monto%=20;
        billestes10= monto/10;
        monto%=10;
        billestes5= monto/5;
        monto%=5;
        billestes1= monto;

        System.out.println("se nesecitan "+billestes100+" de 100");
        System.out.println("se nesecitan "+billestes50+" de 50");
        System.out.println("se nesecitan "+billestes20+" de 20");
        System.out.println("se nesecitan "+billestes10+" de 10");
        System.out.println("se nesecitan "+billestes5+" de 5");
        System.out.println("se nesecitan "+billestes1+" de 1");

        
    }
    
}
