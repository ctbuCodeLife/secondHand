package com.sh.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.annotation.JSONType;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.util.List;

/**
 * Created by tao on 2017/5/27 0027.
 */
@JSONType(orders={"status","data"})
public class Message {
    private int status;//1表示成功，0表示失败，3表示未登录
    private List<Object> data;//返回给前台的数据
    private String autoReturn;//浏览器自动跳转的页面

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<Object> getData() {
        return data;
    }

    public void setData(List<Object> data) {
        this.data = data;
    }

    public String getAutoReturn() {
        return autoReturn;
    }

    public void setAutoReturn(String autoReturn) {
        this.autoReturn = autoReturn;
    }

    public Message(int status, List<Object> data, String autoReturn) {
        this.status = status;
        this.data = data;
        this.autoReturn = autoReturn;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this, SerializerFeature.WriteDateUseDateFormat,SerializerFeature.PrettyFormat, SerializerFeature.DisableCircularReferenceDetect);
    }

    public Message(int status, List<Object> data){
        this.status = status;
        this.data = data;
        this.autoReturn = "index.jsp";
    }

    public  Message(){}

}
