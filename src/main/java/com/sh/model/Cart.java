package com.sh.model;

import java.io.Serializable;

/**
 * @author 
 */
public class Cart implements Serializable {
    private Integer id;

    private Integer uid;

    private Integer pid;

    private Integer count;

    private String isbuy;

    private Integer totalprice;

    private static final long serialVersionUID = 1L;

    public Cart(){}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getIsbuy() {
        return isbuy;
    }

    public void setIsbuy(String isbuy) {
        this.isbuy = isbuy;
    }

    public Integer getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Integer totalprice) {
        this.totalprice = totalprice;
    }

    public Cart(Integer id, Integer uid, Integer pid, Integer count, String isbuy, Integer totalprice) {
        this.id = id;
        this.uid = uid;
        this.pid = pid;
        this.count = count;
        this.isbuy = isbuy;
        this.totalprice = totalprice;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", uid=" + uid +
                ", pid=" + pid +
                ", count=" + count +
                ", isbuy='" + isbuy + '\'' +
                ", totalprice=" + totalprice +
                '}';
    }
}