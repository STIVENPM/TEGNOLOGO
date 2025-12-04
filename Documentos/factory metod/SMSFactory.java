public class SMSFactory extends NotificacionFactory {
    @Override
    public Notificacion crearNotificacion() {
        return new NotificacionSMS();
    }
}
