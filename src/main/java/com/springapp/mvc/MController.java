package com.springapp.mvc;

import com.springapp.mvc.bean.User;
import com.springapp.mvc.utils.MD5Utils;
import com.springapp.mvc.utils.MySQLUtils;
import com.springapp.mvc.utils.StringUtils;
import com.sun.deploy.net.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@Controller
public class MController {


    /**
     * ��ת����ҳ
     * @return
     */
    @RequestMapping(value = "index.do")
    public String index() {
        return "index";
    }

    /**
     * ��½���
     * @param user ӳ��User�û�
     * @param modelMap
     * @return
     */
    @RequestMapping(value = "login.do", method = RequestMethod.POST)
    public String loginCheck(@ModelAttribute User user, ModelMap modelMap) throws SQLException {

        String email = user.getEmail();
        String password = MD5Utils.getMD5(user.getPassword());
        String sql = "select * from Users where username = '" + email + "' and password = '" + password + "'";
        if (MySQLUtils.queryEmail(sql)) {
            //��½����ҳ��
            return "forward:news.do";
        }
        //�ض���index.jspҳ��
        modelMap.addAttribute("msg", "������û������������!");
        modelMap.addAttribute("email", email);
        return "index";
    }

    /**
     * ��½����ҳ��
     * @param user
     * @param modelMap
     * @return ��ҳ��
     * @throws SQLException
     */
    @RequestMapping(value = "news.do")
    public String news(@ModelAttribute User user, ModelMap modelMap) throws SQLException {
        String sql = "select * from Users where username = '" + user.getEmail() + "' and password = '" + MD5Utils.getMD5(user.getPassword()) + "'";
        User u = MySQLUtils.queryForUser(sql);
        modelMap.addAttribute("nickname", u.getNickname());
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


    /**
     * �����Ƿ���ڼ��
     * @param email ��������
     * @return true: �������, false: ���䲻����.
     */
    @RequestMapping(value = "check.do", method = RequestMethod.POST)
    @ResponseBody
    public String checkMail(@RequestParam("email") String email) throws SQLException {
        String sql = "select * from Users where username = '" + email + "'";
        if (MySQLUtils.queryEmail(sql)) {
            return "true";
        }
        return "false";
    }
}