package com.sh.model;

import java.io.Serializable;

/**
 * @author 
 */
public class Hot implements Serializable {
    private Integer id;

    private Integer pid;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Hot(Integer id, Integer pid) {
        this.id = id;
        this.pid = pid;
    }

    @Override
    public String toString() {
        return "Hot{" +
                "id=" + id +
                ", pid=" + pid +
                '}';
    }
}