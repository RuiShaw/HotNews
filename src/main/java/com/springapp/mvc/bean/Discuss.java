package com.springapp.mvc.bean;

/**
 * Created by Xr on 2016/10/9.
 * ����ʵ��
 */
public class Discuss {
    //����id
    public String id;
    //����ʱ��
    public String time;
    //�����û�(�ǳ�)
    public String d_user;
    //��������
    public String content;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getD_user() {
        return d_user;
    }

    public void setD_user(String d_user) {
        this.d_user = d_user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
