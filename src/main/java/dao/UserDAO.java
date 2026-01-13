package dao;

import util.KoneksiDB;
import model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    // 1. HITUNG TOTAL USER TERDAFTAR
    public int getTotalUsers() {
        int total = 0;
        String sql = "SELECT COUNT(*) AS total FROM users";
        try (Connection c = KoneksiDB.getConnection(); Statement s = c.createStatement(); ResultSet r = s.executeQuery(sql)) {
            if (r.next()) {
                total = r.getInt("total");
            }
        } catch (Exception e) {
            System.out.println("Error getTotalUsers: " + e.getMessage());
        }
        return total;
    }

    // 2. HITUNG TOTAL SEMUA TUGAS (DI SEMUA USER)
    public int getTotalTasks() {
        int total = 0;
        String sql = "SELECT COUNT(*) AS total FROM produk";
        try (Connection c = KoneksiDB.getConnection(); Statement s = c.createStatement(); ResultSet r = s.executeQuery(sql)) {
            if (r.next()) {
                total = r.getInt("total");
            }
        } catch (Exception e) {
            System.out.println("Error getTotalTasks: " + e.getMessage());
        }
        return total;
    }

    // 3. AMBIL DAFTAR SEMUA USER
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT id, email, nama_lengkap, role FROM users ORDER BY id DESC";

        try (Connection c = KoneksiDB.getConnection(); Statement s = c.createStatement(); ResultSet r = s.executeQuery(sql)) {

            while (r.next()) {
                User u = new User();
                u.setId(r.getInt("id"));
                u.setEmail(r.getString("email"));
                u.setNamaLengkap(r.getString("nama_lengkap"));
                u.setRole(r.getString("role"));
                list.add(u);
            }
        } catch (Exception e) {
            System.out.println("Error getAllUsers: " + e.getMessage());
        }
        return list;
    }

    // Cari User berdasarkan Nama atau Email
    public List<User> searchUsers(String keyword) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT id, email, nama_lengkap, role FROM users";

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += " WHERE LOWER(nama_lengkap) LIKE ? OR LOWER(email) LIKE ?";
        }
        sql += " ORDER BY id DESC";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {

            if (keyword != null && !keyword.trim().isEmpty()) {
                String searchPattern = "%" + keyword.toLowerCase() + "%";
                ps.setString(1, searchPattern);
                ps.setString(2, searchPattern);
            } else {
                // Kalau pakai PreparedStatement tapi ga ada paramter where, error. Jadi kita eksekusi plain query
                // Tapi untuk code consistency, kita bisa biarkan kosong atau pakai Statement biasa.
                // Mari kita pakai Statement biasa untuk simplisitas jika tidak ada keyword
            }
            // NOTE: Logic PreparedStatement di atas agak tricky kalau parameternya dinamis.
            // Mari kita tulis ulang lebih aman:
        } catch (Exception e) {
            // fallback
        }

        // --- REVISI LOGIC SEARCH USER ---
        list.clear(); // reset
        String sqlRevisi = "SELECT id, email, nama_lengkap, role FROM users";
        boolean isSearch = (keyword != null && !keyword.trim().isEmpty());

        if (isSearch) {
            sqlRevisi += " WHERE LOWER(nama_lengkap) LIKE ? OR LOWER(email) LIKE ?";
        }
        sqlRevisi += " ORDER BY id DESC";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sqlRevisi)) {

            if (isSearch) {
                String pat = "%" + keyword.toLowerCase() + "%";
                ps.setString(1, pat);
                ps.setString(2, pat);
            }

            ResultSet r = ps.executeQuery();
            while (r.next()) {
                User u = new User();
                u.setId(r.getInt("id"));
                u.setEmail(r.getString("email"));
                u.setNamaLengkap(r.getString("nama_lengkap"));
                u.setRole(r.getString("role"));
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 4. HAPUS USER (DAN TUGASNYA)
    public void deleteUser(int id) {
        try (Connection c = KoneksiDB.getConnection()) {
            // Pertama, hapus semua tugas milik user tersebut agar error foreign key tidak muncul
            String delTasks = "DELETE FROM produk WHERE user_id = ?";
            PreparedStatement psTask = c.prepareStatement(delTasks);
            psTask.setInt(1, id);
            psTask.executeUpdate();

            // Kedua, hapus user itu sendiri
            String delUser = "DELETE FROM users WHERE id = ?";
            PreparedStatement psUser = c.prepareStatement(delUser);
            psUser.setInt(1, id);
            psUser.executeUpdate();

            System.out.println("User ID " + id + " berhasil dihapus bersama tugasnya.");
        } catch (Exception e) {
            System.out.println("Error deleteUser: " + e.getMessage());
        }
    }
}
