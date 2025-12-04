
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

public class UserDataInserter extends DataInserterSubject {

    private Connection connect() throws Exception {
        return DriverManager.getConnection(
            "jdbc:sqlserver://localhost:1433;" +
            "databaseName=mi_db;" +
            "encrypt=false;",
            "sa",                
            "Admin123@"      
        );
    }

    public int insertUser(String nombre, String email) throws Exception {
        String sql = "INSERT INTO usuarios (nombre, email) VALUES (?, ?)";

        try (Connection conn = connect();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, nombre);
            stmt.setString(2, email);

            stmt.executeUpdate();

            // Obtener el ID generado
            ResultSet keys = stmt.getGeneratedKeys();
            int id = 0;

            if (keys.next()) {
                id = keys.getInt(1);
            }

            // Notificar observadores
            notifyObservers("usuarios", id);

            return id;
        }
    }
}