import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnectionTest {

    public static void main(String[] args) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/seng696"; // Update with your database URL
        String username = "root"; // Update with your database username
        String password = "pknbgr86A@"; // Update with your database password

        try {
            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
            System.out.println("Database connection successful!");

            // Optionally, perform a simple query (e.g., SELECT 1)

            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Database connection failed!");
        }
    }
}


