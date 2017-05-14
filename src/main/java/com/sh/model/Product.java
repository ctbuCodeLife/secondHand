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

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getkId() {
        return kId;
    }

    public void setkId(Integer kId) {
        this.kId = kId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public Integer getpNum() {
        return pNum;
    }

    public void setpNum(Integer pNum) {
        this.pNum = pNum;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public Integer getrealPrice() {
        return realPrice;
    }

    public void setrealPrice(Integer realPrice) {
        this.realPrice = realPrice;
    }

    public Integer getoriginPrice() {
        return originPrice;
    }

    public void setoriginPrice(Integer originPrice) {
        this.originPrice = originPrice;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
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