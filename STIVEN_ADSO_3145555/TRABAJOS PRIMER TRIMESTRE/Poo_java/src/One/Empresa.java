package One;


public class Empresa {
    public static void main(String[] args) {
        Calculotnd empleado = new Calculotnd("Stiven Perdomo", 100000, 2, 10, 5, 2);

      
        System.out.println("Empleado: " + empleado.nombre);
        System.out.println("Salario Base: $" + empleado.salarioBase);
        System.out.println("Subsidio: " + (empleado.calcularSubsidio() > 0 ? "$" + empleado.calcularSubsidio() : "No aplica"));
        System.out.println("Horas Extras: $" + empleado.calcularHorasExtras());
        System.out.println("Descuentos: $" + empleado.calcularDescuentos());
        System.out.println("Pago Total: $" + empleado.calcularPagoTotal());

    }
}

