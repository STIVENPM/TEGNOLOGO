public class Main {
    public static void main(String[] args) {

        NotificacionFactory factory;

        factory = new EmailFactory();
        Notificacion n1 = factory.crearNotificacion();
        n1.enviar("Factura enviada al correo.");

        factory = new SMSFactory();
        Notificacion n2 = factory.crearNotificacion();
        n2.enviar("Su código de verificación es 1234.");

        factory = new WhatsAppFactory();
        Notificacion n3 = factory.crearNotificacion();
        n3.enviar("Su pedido ha sido despachado.");
    }
}
