public class AuditInsertObserver implements InsertObserver {
    @Override
    public void onInsert(String table, int insertedId) {
        System.out.println("AUDITORIA: Se registró un nuevo elemento con ID " + insertedId);
    }
}