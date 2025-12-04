public class WhatsAppFactory extends NotificacionFactory {
    @Override
    public Notificacion crearNotificacion() {
        return new NotificacionWhatsApp();
    }
}
