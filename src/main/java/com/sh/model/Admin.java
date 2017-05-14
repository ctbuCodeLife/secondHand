package com.sh.model;

import java.io.Serializable;

/**
 * @author 
 */
public class Admin implements Serializable {
    private Integer id;

    private String username;

    private String password;

    private String email;

    private Integer level;

    private static final long serialVersionUID = 1L;

    public Admin(){}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Admin(Integer id, String username, String password, String email, Integer level) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.level = level;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", level=" + level +
                '}';
    }
}