package com.springapp.mvc.bean;

/**
 * Created by Xr on 2016/8/25.
 */
public class User {

    /**
     * email = username
     */
    private String email;

    /**
     * �û��ǳ�
     */
    private String nickname;

    /**
     * username = email
     */
    private String username;

    /**
     * �û�����MD5
     */
    private String password;

    /**
     * ����������֤code
     */
    private String reset_code;

    /**
     * ���һ�ε�¼ʱ��
     */
    private String last_login_time;

    /**
     * ע��ʱ��
     */
    private String reg_time;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getReset_code() {
        return reset_code;
    }

    public void setReset_code(String reset_code) {
        this.reset_code = reset_code;
    }

    public String getLast_login_time() {
        return last_login_time;
    }

    public void setLast_login_time(String last_login_time) {
        this.last_login_time = last_login_time;
    }

    public String getReg_time() {
        return reg_time;
    }

    public void setReg_time(String reg_time) {
        this.reg_time = reg_time;
    }
}
