package model;

public class User {

    private int id;
    private String email;
    private String namaLengkap;
    private String role;

    // Constructor kosong wajib ada
    public User() {
    }

    // Constructor lengkap
    public User(int id, String email, String namaLengkap, String role) {
        this.id = id;
        this.email = email;
        this.namaLengkap = namaLengkap;
        this.role = role;
    }

    // Getter & Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNamaLengkap() {
        return namaLengkap;
    }

    public void setNamaLengkap(String namaLengkap) {
        this.namaLengkap = namaLengkap;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
