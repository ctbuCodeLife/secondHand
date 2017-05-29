package com.sh.model;

import java.io.Serializable;

/**
 * @author 
 */
public class Product implements Serializable {
    private Integer id;

    private Integer uid;

    private Integer kid;

    private String pname;

    private Integer pnum;

    private String pimage;

    private Integer realprice;

    private Integer originprice;

    private String pdesc;

    private Integer status;

    private static final long serialVersionuId = 1L;

    public Product() {
    }

    public Product(Integer id, Integer uid, Integer kid, String pname, Integer pnum, String pimage, Integer realprice, Integer originprice, String pdesc,Integer status) {
        this.id = id;
        this.uid = uid;
        this.kid = kid;
        this.pname = pname;
        this.pnum = pnum;
        this.pimage = pimage;
        this.realprice = realprice;
        this.originprice = originprice;
        this.pdesc = pdesc;
        this.status = status;
    }

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

    public Integer getKid() {
        return kid;
    }

    public void setKid(Integer kid) {
        this.kid = kid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Integer getPnum() {
        return pnum;
    }

    public void setPnum(Integer pnum) {
        this.pnum = pnum;
    }

    public String getPimage() {
        return pimage;
    }

    public void setPimage(String pimage) {
        this.pimage = pimage;
    }

    public Integer getRealprice() {
        return realprice;
    }

    public void setRealprice(Integer realprice) {
        this.realprice = realprice;
    }

    public Integer getOriginprice() {
        return originprice;
    }

    public void setOriginprice(Integer originprice) {
        this.originprice = originprice;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", uid=" + uid +
                ", kid=" + kid +
                ", pname='" + pname + '\'' +
                ", pnum=" + pnum +
                ", pimage='" + pimage + '\'' +
                ", realprice=" + realprice +
                ", originprice=" + originprice +
                ", pdesc='" + pdesc + '\'' +
                ", status=" + status +
                '}';
    }
}