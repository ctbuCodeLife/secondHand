package com.sh.model;

import java.io.Serializable;

/**
 * @author 
 */
public class Product implements Serializable {
    private Integer id;

    private Integer uId;

    private Integer kId;

    private String pName;

    private Integer pNum;

    private String pImage;

    private Integer realPrice;

    private Integer originPrice;

    private String pDesc;

    private static final long serialVersionuId = 1L;

    public Product(){}

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

    public Product(Integer id, Integer uId, Integer kId, String pName, Integer pNum, String pImage, Integer realPrice, Integer originPrice, String pDesc) {
        this.id = id;
        this.uId = uId;
        this.kId = kId;
        this.pName = pName;
        this.pNum = pNum;
        this.pImage = pImage;
        this.realPrice = realPrice;
        this.originPrice = originPrice;
        this.pDesc = pDesc;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", uId=" + uId +
                ", kId=" + kId +
                ", pName='" + pName + '\'' +
                ", pNum=" + pNum +
                ", pImage='" + pImage + '\'' +
                ", realPrice=" + realPrice +
                ", originPrice=" + originPrice +
                ", pDesc='" + pDesc + '\'' +
                '}';
    }
}