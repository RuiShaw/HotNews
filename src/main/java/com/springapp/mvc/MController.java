package com.springapp.mvc;

import com.springapp.mvc.bean.User;
import com.springapp.mvc.utils.MySQLUtils;
import com.springapp.mvc.utils.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;

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
            return "register_success";
        } else {
            //insert error
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


    @RequestMapping(value = "check.do", method = RequestMethod.POST)
    @ResponseBody
    public String checkMail(@RequestParam("email") String email) {
        //TODO ��������Ƿ����.
        return email;
    }
}