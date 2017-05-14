package com.sh.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 
 */
public class Sales implements Serializable {
    private Long id;

    private Integer uid;

    private Integer pid;

    private Integer count;

    private Integer totalprice;

    private Date orderdate;

    private String invoiceno;

    private String orderstatus;

    private Date delivdate;

    private String contactman;

    private String contacttel;

    private String contactaddr;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public Integer getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Integer totalprice) {
        this.totalprice = totalprice;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public String getInvoiceno() {
        return invoiceno;
    }

    public void setInvoiceno(String invoiceno) {
        this.invoiceno = invoiceno;
    }

    public String getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus;
    }

    public Date getDelivdate() {
        return delivdate;
    }

    public void setDelivdate(Date delivdate) {
        this.delivdate = delivdate;
    }

    public String getContactman() {
        return contactman;
    }

    public void setContactman(String contactman) {
        this.contactman = contactman;
    }

    public String getContacttel() {
        return contacttel;
    }

    public void setContacttel(String contacttel) {
        this.contacttel = contacttel;
    }

    public String getContactaddr() {
        return contactaddr;
    }

    public void setContactaddr(String contactaddr) {
        this.contactaddr = contactaddr;
    }

    public Sales(Long id, Integer uid, Integer pid, Integer count, Integer totalprice, Date orderdate, String invoiceno, String orderstatus, Date delivdate, String contactman, String contacttel, String contactaddr) {
        this.id = id;
        this.uid = uid;
        this.pid = pid;
        this.count = count;
        this.totalprice = totalprice;
        this.orderdate = orderdate;
        this.invoiceno = invoiceno;
        this.orderstatus = orderstatus;
        this.delivdate = delivdate;
        this.contactman = contactman;
        this.contacttel = contacttel;
        this.contactaddr = contactaddr;
    }

    @Override
    public String toString() {
        return "Sales{" +
                "id=" + id +
                ", uid=" + uid +
                ", pid=" + pid +
                ", count=" + count +
                ", totalprice=" + totalprice +
                ", orderdate=" + orderdate +
                ", invoiceno='" + invoiceno + '\'' +
                ", orderstatus='" + orderstatus + '\'' +
                ", delivdate=" + delivdate +
                ", contactman='" + contactman + '\'' +
                ", contacttel='" + contacttel + '\'' +
                ", contactaddr='" + contactaddr + '\'' +
                '}';
    }
}