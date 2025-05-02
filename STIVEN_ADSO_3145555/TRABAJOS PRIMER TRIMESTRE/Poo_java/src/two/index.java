package two;


public class index {
    public static void main(String[] args) {

        PlanBasico planBasico = new PlanBasico("Laura", "Gómez", 1012345678, 60, 1.65);
        System.out.println(" Plan Básico");
        System.out.println(planBasico.getDescripcion());
        System.out.println("Usuario: " + planBasico.getNombreCompleto());
        System.out.println("ID: " + planBasico.getId());
        System.out.println("Peso: " + planBasico.getPeso() + " kg");
        System.out.println("Estatura: " + planBasico.getEstatura() + " m");
        System.out.println("Precio del plan: $" + planBasico.getPrecio());
        System.out.println();

        PlanMedio planMedio = new PlanMedio("Carlos", "Ramírez", 1023456789, 72, 1.75);
        System.out.println(" Plan Medio");
        System.out.println(planMedio.getDescripcion());
        System.out.println("Usuario: " + planMedio.getNombreCompleto());
        System.out.println("ID: " + planMedio.getId());
        System.out.println("Peso: " + planMedio.getPeso() + " kg");
        System.out.println("Estatura: " + planMedio.getEstatura() + " m");
        System.out.println("Precio del plan: $" + planMedio.getPrecio());
        System.out.println();

        PlanPremium planPremium = new PlanPremium("Stiven", "Perdomo", 1034567890, 75, 1.80);
        System.out.println(" Plan Premium");
        System.out.println(planPremium.getDescripcion());
        System.out.println("Usuario: " + planPremium.getNombreCompleto());
        System.out.println("ID: " + planPremium.getId());
        System.out.println("Peso: " + planPremium.getPeso() + " kg");
        System.out.println("Estatura: " + planPremium.getEstatura() + " m");
        System.out.println("Precio del plan: $" + planPremium.getPrecio());
    }
}
