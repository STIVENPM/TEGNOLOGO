
import java.util.ArrayList;
import java.util.List;

public class DataInserterSubject {
    private List<InsertObserver> observers = new ArrayList<>();

    public void addObserver(InsertObserver observer) {
        observers.add(observer);
    }

    public void removeObserver(InsertObserver observer) {
        observers.remove(observer);
    }

    protected void notifyObservers(String table, int id) {
        for (InsertObserver obs : observers) {
            obs.onInsert(table, id);
        }
    }
}