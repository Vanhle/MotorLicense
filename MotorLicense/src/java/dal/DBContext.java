package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    protected Connection conn;
    protected PreparedStatement ps;
    protected ResultSet rs;

    public DBContext() {
        try {
            String username = "sa";
            String password = "1";
            // Thêm ;encrypt=true;trustServerCertificate=true vào URL
            String url = "jdbc:sqlserver://localhost:1433;databaseName=MotorLicense_V1;encrypt=true;trustServerCertificate=true";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

