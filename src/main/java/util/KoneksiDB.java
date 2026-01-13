package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class KoneksiDB {

    // Sesuaikan user dan password database kamu
    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5432/todolist_database";
            String user = "postgres";
            String pass = "123456789"; // Pastikan ini benar

            return DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("Koneksi Gagal: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
