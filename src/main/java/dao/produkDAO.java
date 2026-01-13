package dao;

import util.KoneksiDB;
import model.produk;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class produkDAO {

    // 1. AMBIL TASK BERDASARKAN USER ID
    public List<produk> getAllTask(int userId) {
        List<produk> list = new ArrayList<>();
        String sql = "SELECT id, judul, deskripsi, status, deadline, user_id FROM produk WHERE user_id = ? ORDER BY id DESC";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId); // Set parameter user_id
            ResultSet r = ps.executeQuery();

            while (r.next()) {
                produk t = new produk();
                t.setId(r.getInt("id"));
                t.setJudul(r.getString("judul"));
                t.setDeskripsi(r.getString("deskripsi"));
                t.setStatus(r.getString("status"));
                t.setDeadline(r.getDate("deadline"));
                t.setUserId(r.getInt("user_id"));
                list.add(t);
            }
        } catch (Exception e) {
            System.out.println("Error getAllTask: " + e.getMessage());
        }
        return list;
    }

    // 2. SIMPAN TASK
    public void simpan(produk t) {
        String sql = "INSERT INTO produk (judul, deskripsi, status, deadline, user_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, t.getJudul());
            ps.setString(2, t.getDeskripsi());
            ps.setString(3, t.getStatus());

            if (t.getDeadline() != null) {
                ps.setDate(4, new java.sql.Date(t.getDeadline().getTime()));
            } else {
                ps.setNull(4, Types.DATE);
            }
            ps.setInt(5, t.getUserId()); // <--- SIMPAN ID USER PEMBUAT

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error simpan: " + e.getMessage());
        }
    }

    // 3. Ambil Statistik Dashboard untuk User
    public java.util.Map<String, Integer> getDashboardStats(int userId) {
        java.util.Map<String, Integer> stats = new java.util.HashMap<>();
        stats.put("total", 0);
        stats.put("selesai", 0);
        stats.put("hariIni", 0);

        try (Connection c = KoneksiDB.getConnection()) {
            // Query 1: Total Tugas
            String sqlTotal = "SELECT COUNT(*) FROM produk WHERE user_id = ?";
            try (PreparedStatement ps = c.prepareStatement(sqlTotal)) {
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    stats.put("total", rs.getInt(1));
                }
            }

            // Query 2: Total Selesai
            String sqlSelesai = "SELECT COUNT(*) FROM produk WHERE user_id = ? AND status = 'Selesai'";
            try (PreparedStatement ps = c.prepareStatement(sqlSelesai)) {
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    stats.put("selesai", rs.getInt(1));
                }
            }

            // Query 3: Deadline Hari Ini
            String sqlToday = "SELECT COUNT(*) FROM produk WHERE user_id = ? AND deadline = CURRENT_DATE AND status != 'Selesai'";
            try (PreparedStatement ps = c.prepareStatement(sqlToday)) {
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    stats.put("hariIni", rs.getInt(1));
                }
            }

        } catch (Exception e) {
            System.out.println("Error getDashboardStats: " + e.getMessage());
        }
        return stats;
    }

    // 4. Ambil 1 Task berdasarkan ID (Untuk logic Quick Checklist)
    public produk getTaskById(int id) {
        produk t = null;
        String sql = "SELECT * FROM produk WHERE id = ?";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet r = ps.executeQuery();
            if (r.next()) {
                t = new produk();
                t.setId(r.getInt("id"));
                t.setJudul(r.getString("judul"));
                t.setDeskripsi(r.getString("deskripsi"));
                t.setStatus(r.getString("status"));
                t.setDeadline(r.getDate("deadline"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    // 5. Ambil Task dengan Filter (Aktif / Riwayat)
    public List<produk> getFilteredTasks(int userId, String filter) {
        List<produk> list = new ArrayList<>();
        String sql = "SELECT id, judul, deskripsi, status, deadline, user_id FROM produk WHERE user_id = ?";

        // Default filter: Tampilkan yang BELUM selesai (Aktif)
        String statusCondition = "AND status != 'Selesai'";
        if ("riwayat".equals(filter)) {
            statusCondition = "AND status = 'Selesai'";
        } else if ("all".equals(filter)) {
            statusCondition = ""; // Tampilkan semua
        }

        sql += " " + statusCondition + " ORDER BY id DESC";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet r = ps.executeQuery();
            while (r.next()) {
                produk t = new produk();
                t.setId(r.getInt("id"));
                t.setJudul(r.getString("judul"));
                t.setDeskripsi(r.getString("deskripsi"));
                t.setStatus(r.getString("status"));
                t.setDeadline(r.getDate("deadline"));
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 6. Cari Tugas berdasarkan Keyword
    public List<produk> searchTasks(int userId, String keyword) {
        List<produk> list = new ArrayList<>();
        String sql = "SELECT id, judul, deskripsi, status, deadline, user_id FROM produk WHERE user_id = ?";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += " AND (LOWER(judul) LIKE ? OR LOWER(deskripsi) LIKE ?)";
        }
        sql += " ORDER BY id DESC";

        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId);
            if (keyword != null && !keyword.trim().isEmpty()) {
                String searchPattern = "%" + keyword.toLowerCase() + "%";
                ps.setString(2, searchPattern);
                ps.setString(3, searchPattern);
            }
            ResultSet r = ps.executeQuery();
            while (r.next()) {
                produk t = new produk();
                t.setId(r.getInt("id"));
                t.setJudul(r.getString("judul"));
                t.setDeskripsi(r.getString("deskripsi"));
                t.setStatus(r.getString("status"));
                t.setDeadline(r.getDate("deadline"));
                t.setUserId(r.getInt("user_id"));
                list.add(t);
            }
        } catch (Exception e) {
            System.out.println("Error searchTasks: " + e.getMessage());
        }
        return list;
    }

    // 7. Ambil SEMUA tugas (untuk Admin kalender)
    public List<produk> getAllTasksAdmin() {
        List<produk> list = new ArrayList<>();
        String sql = "SELECT p.id, p.judul, p.deskripsi, p.status, p.deadline, p.user_id, u.nama_lengkap "
                + "FROM produk p JOIN users u ON p.user_id = u.id ORDER BY p.deadline ASC";

        try (Connection c = KoneksiDB.getConnection(); Statement s = c.createStatement(); ResultSet r = s.executeQuery(sql)) {
            while (r.next()) {
                produk t = new produk();
                t.setId(r.getInt("id"));
                t.setJudul(r.getString("judul") + " (" + r.getString("nama_lengkap") + ")");
                t.setDeadline(r.getDate("deadline"));
                list.add(t);
            }
        } catch (Exception e) {
            System.out.println("Error getAllTasksAdmin: " + e.getMessage());
        }
        return list;
    }

    // 8. UBAH TASK
    public void ubah(produk t) {
        String sql = "UPDATE produk SET judul=?, deskripsi=?, status=?, deadline=? WHERE id=? AND user_id=?";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, t.getJudul());
            ps.setString(2, t.getDeskripsi());
            ps.setString(3, t.getStatus());

            if (t.getDeadline() != null) {
                ps.setDate(4, new java.sql.Date(t.getDeadline().getTime()));
            } else {
                ps.setNull(4, Types.DATE);
            }
            ps.setInt(5, t.getId());
            ps.setInt(6, t.getUserId()); // <--- SECURITY CHECK: Cek kepemilikan

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error ubah: " + e.getMessage());
        }
    }

    // 9. HAPUS TASK
    public void hapus(int id, int userId) {
        String sql = "DELETE FROM produk WHERE id=? AND user_id=?";
        try (Connection c = KoneksiDB.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.setInt(2, userId); // <--- SECURITY CHECK
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error hapus: " + e.getMessage());
        }
    }
}
