package com.springapp.mvc.bean;

import java.util.List;
import java.util.Map;

/**
 * Created by Xr on 2016/9/28.
 */
public class Blog {

    //������ݱ�ʾ
    public String flag;

    //����id
    public String id;

    //���ͱ���
    public String title;

    //��������
    public String author;

    //���ʹ���ʱ��
    public String create_time;

    //���͸���ʱ��
    public String update_time;


    //��������id
    public String discuss_id;

    //���͵���id
    public String good_id;

    //����������
    public int discuss_num;

    //���͵�����
    public int good_num;

    //����Ȩ��
    public String authority;

    //��������
    public String content;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    //��������
    public List<Map<String, String>> list;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Map<String, String>> getList() {
        return list;
    }

    public String getDiscuss_id() {
        return discuss_id;
    }

    public void setDiscuss_id(String discuss_id) {
        this.discuss_id = discuss_id;
    }

    public String getGood_id() {
        return good_id;
    }

    public void setGood_id(String good_id) {
        this.good_id = good_id;
    }

    public int getDiscuss_num() {
        return discuss_num;
    }

    public void setDiscuss_num(int discuss_num) {
        this.discuss_num = discuss_num;
    }

    public int getGood_num() {
        return good_num;
    }

    public void setGood_num(int good_num) {
        this.good_num = good_num;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    /**
     * map<String user, String comment>
     * user: �����û�
     * comment: ��������
     * @param list
     */
    public void setList(List<Map<String, String>> list) {
        this.list = list;
    }
}
