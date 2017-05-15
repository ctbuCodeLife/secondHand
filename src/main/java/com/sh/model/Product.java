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
        return uId;
    }

    public void setUid(Integer uId) {
        this.uId = uId;
    }

    public Integer getKid() {
        return kId;
    }

    public void setKid(Integer kId) {
        this.kId = kId;
    }

    public String getPname() {
        return pName;
    }

    public void setPname(String pName) {
        this.pName = pName;
    }

    public Integer getPnum() {
        return pNum;
    }

    public void setPnum(Integer pNum) {
        this.pNum = pNum;
    }

    public String getPimage() {
        return pImage;
    }

    public void setPimage(String pImage) {
        this.pImage = pImage;
    }

    public Integer getRealprice() {
        return realPrice;
    }

    public void setRealprice(Integer realPrice) {
        this.realPrice = realPrice;
    }

    public Integer getOriginprice() {
        return originPrice;
    }

    public void setOriginprice(Integer originPrice) {
        this.originPrice = originPrice;
    }

    public String getPdesc() {
        return pDesc;
    }

    public void setPdesc(String pDesc) {
        this.pDesc = pDesc;
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