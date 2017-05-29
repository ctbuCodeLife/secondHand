package com.sh.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.annotation.JSONType;
import com.alibaba.fastjson.serializer.SerializerFeature;

/**
 * Created by tao on 2017/5/27 0027.
 */
@JSONType(orders={"status","data"})
public class Message {
    int status;
    String data;
    String autoReturn;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getAutoReturn() {
        return autoReturn;
    }

    public void setAutoReturn(String autoReturn) {
        this.autoReturn = autoReturn;
    }

    public Message(int status, String data, String autoReturn) {
        this.status = status;
        this.data = data;
        this.autoReturn = autoReturn;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this, SerializerFeature.WriteDateUseDateFormat,SerializerFeature.PrettyFormat, SerializerFeature.DisableCircularReferenceDetect);
    }

    public Message(int status, String data){
        this.status = status;
        this.data = data;
        this.autoReturn = "index.jsp";
    }

    public  Message(){}

}
