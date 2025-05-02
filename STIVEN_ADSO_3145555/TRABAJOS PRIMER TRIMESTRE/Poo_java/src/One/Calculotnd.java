package One;

public class Calculotnd extends Tienda {
    private int horasExtraDiurnas;
    private int horasExtraNocturnas;
    private int horasExtraFestivas;

    public Calculotnd(String nombre, double salarioBase, int nivelRiesgo, int horasExtraDiurnas, int horasExtraNocturnas, int horasExtraFestivas) {
        super(nombre, salarioBase, nivelRiesgo);
        this.horasExtraDiurnas = horasExtraDiurnas;
        this.horasExtraNocturnas = horasExtraNocturnas;
        this.horasExtraFestivas = horasExtraFestivas;
    }

    public double calcularHorasExtras() {
        double valorHora = salarioBase / 240;
        return (horasExtraDiurnas * valorHora * 1.25) +
               (horasExtraNocturnas * valorHora * 1.75) +
               (horasExtraFestivas * valorHora * 2.0);
    }

    public double calcularPagoTotal() {
        return salarioBase + calcularSubsidio() + calcularHorasExtras() - calcularDescuentos();
    }


}

