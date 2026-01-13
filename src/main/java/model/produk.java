package model;

import java.io.Serializable;
import java.util.Date;

public class produk implements Serializable {

    private int id;
    private String judul;
    private String deskripsi;
    private String status;
    private Date deadline;
    private int userId; // <--- TAMBAHKAN INI

    public produk() {
    }

    // Getter & Setter Lama + Baru
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    // Getter & Setter untuk userId
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
