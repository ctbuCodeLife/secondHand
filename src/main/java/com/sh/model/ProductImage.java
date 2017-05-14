package com.sh.model;

import java.io.Serializable;

/**
 * @author 
 */
public class ProductImage implements Serializable {
    private Integer id;

    private Integer pid;

    private String imagetype;

    private String imagename;

    private String imagesrc;

    private static final long serialVersionUID = 1L;

    public ProductImage(){}

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

    public String getImagetype() {
        return imagetype;
    }

    public void setImagetype(String imagetype) {
        this.imagetype = imagetype;
    }

    public String getImagename() {
        return imagename;
    }

    public void setImagename(String imagename) {
        this.imagename = imagename;
    }

    public String getImagesrc() {
        return imagesrc;
    }

    public void setImagesrc(String imagesrc) {
        this.imagesrc = imagesrc;
    }

    public ProductImage(Integer id, Integer pid, String imagetype, String imagename, String imagesrc) {
        this.id = id;
        this.pid = pid;
        this.imagetype = imagetype;
        this.imagename = imagename;
        this.imagesrc = imagesrc;
    }

    @Override
    public String toString() {
        return "ProductImage{" +
                "id=" + id +
                ", pid=" + pid +
                ", imagetype='" + imagetype + '\'' +
                ", imagename='" + imagename + '\'' +
                ", imagesrc='" + imagesrc + '\'' +
                '}';
    }
}