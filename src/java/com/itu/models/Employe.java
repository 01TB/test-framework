package com.itu.models;

import java.util.Arrays;

public class Employe {
    private int id;
    private String nom;
    private String prenom;
    private String email;
    private String[] roles;
    private Departement dept;
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getPrenom() {
        return prenom;
    }
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String[] getRoles() {
        return roles;
    }
    public void setRoles(String[] roles) {
        this.roles = roles;
    }
    public Departement getDept() {
        return dept;
    }
    public void setDept(Departement dept) {
        this.dept = dept;
    }
    
    @Override
    public String toString() {
        return "Employe [id=" + id + ", nom=" + nom + ", prenom=" + prenom + ", email=" + email + ", roles="
                + Arrays.toString(roles) + ", dept=" + dept + "]";
    }
}
