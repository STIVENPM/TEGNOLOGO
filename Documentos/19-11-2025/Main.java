
public class Main {
    public static void main(String[] args) throws Exception {
    
        UserDataInserter inserter = new UserDataInserter();

        // Agregar observadores
        inserter.addObserver(new LogInsertObserver());
        inserter.addObserver(new AuditInsertObserver());

        // Ejecutar inserción
        inserter.insertUser("Carlos Lopez", "carlos@example.com");

    }
}
//javac -cp ".;mssql-jdbc-13.2.1.jre8.jar" *.java
//java -cp ".;mssql-jdbc-13.2.1.jre8.jar" Main