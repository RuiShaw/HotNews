package com.springapp.mvc;

import com.springapp.mvc.bean.User;
import com.springapp.mvc.utils.MD5Utils;
import com.springapp.mvc.utils.MySQLUtils;
import com.springapp.mvc.utils.StringUtils;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.StringWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class MController {

    /**
     * ��½���
     * @param user ӳ��User�û�
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "login.do", method = RequestMethod.POST)
    public String loginCheck(@ModelAttribute User user, ModelMap modelMap) {

        modelMap.addAttribute("email", user.getEmail());

        //TODO ������Ҫ����ΪMD5,�����ݿ����Ա�
        modelMap.addAttribute("password", user.getPassword());
        modelMap.addAttribute("nickname", "Rui Shawn");

        return "news";
    }

    /**
     * �û�ע����ת
     * @return
     */
    @RequestMapping(value = "registerJump.do", method = RequestMethod.GET)
    public String registerJump() {
        return "register";
    }

    /**
     * �û�ע��
     * @param user
     * @return
     */
    @RequestMapping(value = "register.do", method = RequestMethod.POST)
    public String register(@ModelAttribute User user, ModelMap modelMap) throws SQLException {

        String sql = "insert into Users(nickname, username, password, last_update_time) values('${nickname}', '${username}', '${password}', '${last_update_time}')";
        sql = StringUtils.getString(sql, user);

        if (MySQLUtils.insert(sql)) {
            //insert success
            //TODO ����ɹ���ת������ɹ�ҳ��.jsp(ҳ����5���Զ����뵽��½ҳ��)
            return "register_success";
        } else {
            //insert error
            //TODO ����ʧ����ת������ʧ��.jsp(ҳ����5���Զ����뵽ע��ҳ��)
            return "register_error";
        }

    }


    /**
     * ����������ת
     * @param user
     * @return
     */
    @RequestMapping(value = "forgotJump.do", method = RequestMethod.GET)
    public String forgotJump(@ModelAttribute User user) {
        return "forget";
    }

    /**
     * ��������
     * @param user
     * @return
     */
    @RequestMapping(value = "forgot.do", method = RequestMethod.GET)
    public String forgot(@ModelAttribute User user) {
        return "hello";
    }


}