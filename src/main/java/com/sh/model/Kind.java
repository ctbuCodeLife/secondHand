package com.sh.model;

import java.io.Serializable;

/**
 * @author 
 */
public class Kind implements Serializable {
    private Integer id;

    private String kname;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKname() {
        return kname;
    }

    public void setKname(String kname) {
        this.kname = kname;
    }

    public Kind(Integer id, String kname) {
        this.id = id;
        this.kname = kname;
    }

    @Override
    public String toString() {
        return "Kind{" +
                "id=" + id +
                ", kname='" + kname + '\'' +
                '}';
    }
}