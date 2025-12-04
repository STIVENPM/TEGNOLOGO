
public class LogInsertObserver implements InsertObserver {
    @Override
    public void onInsert(String table, int insertedId) {
        System.out.println("LOG: Insertado en tabla " + table + " con ID = " + insertedId);
    }
}