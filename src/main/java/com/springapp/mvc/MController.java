package com.springapp.mvc;

import com.springapp.mvc.bean.User;
import com.springapp.mvc.impl.HotNewsImpl;
import com.springapp.mvc.service.HotNews;
import com.springapp.mvc.utils.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class MController {

    /**
     * ��ת����ҳ
     * @return
     */
    @RequestMapping(value = "index.do", method = RequestMethod.GET)
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
    public String loginCheck(@ModelAttribute User user, ModelMap modelMap, HttpSession session) throws SQLException {

        String email = user.getEmail();
        String password = MD5Utils.getMD5(user.getPassword());
        String sql = "select * from Users where username = '" + email + "' and password = '" + password + "'";

        if (MySQLUtils.queryEmail(sql)) {
            session.setAttribute("username", email);
            //����last_login_time�ֶ�
            String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            sql = "update Users set last_login_time = '" + time  + "' where username = '" + email + "'";
            MySQLUtils.insert(sql);
            return "forward:blog.do"; //��½����ҳ
        }

        //�ض���index.jspҳ��
        modelMap.addAttribute("msg", "������û������������!");
        modelMap.addAttribute("email", email);
        return "index";
    }

    /**
     * ����Ϊ��ҳ
     * @return
     */
    @RequestMapping(value = "blog.do")
    public String blog(@ModelAttribute User user) {
        return "blog";
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

        //TODO ׼����½��ҳ���������ʾ
        //��ҳ��ʾ18������
        HotNews hn = new HotNewsImpl();
        ArrayList<String> hotNews = hn.getHotNews();
        modelMap.addAttribute("hotNews", hotNews);

        return "news";
    }

    /**
     * �鿴(����session)
     * @return
     */
    @RequestMapping(value = "view.do", method = RequestMethod.GET)
    public String view() {
        return "view";
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

        String sql = "insert into Users(email, nickname, username, password, reg_time) values('${email}', '${nickname}', '${username}', '${password}', '${reg_time}')";
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
     * ���������ʼ�����
     * @param user
     * @return
     */
    @RequestMapping(value = "forgot.do", method = RequestMethod.POST)
    public String forgot(@ModelAttribute User user, HttpServletRequest request) {
        try {
            //Ϊ�˷�ֹ�ظ��ύ��������
            //���reset_code�Ƿ�Ϊ��
            if (null != user.getEmail() && !user.getEmail().isEmpty()) {
                String sql = "select * from Users where username = '" + user.getEmail() + "' and reset_code is null";
                if (MySQLUtils.queryEmail(sql)) {
                    //reset_codeΪ��: �������������ʼ�
                    String path = request.getContextPath();
                    String website_host = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

                    String code = UUIDUtils.code();

                    MailUtils.sendMail(user.getEmail(), website_host, code);

                    sql = "update Users set reset_code = '" + code + "' where username = '" + user.getEmail() + "'";
                    MySQLUtils.insert(sql);

                    //����һ���̼߳�����������codeʧЧʱ��
                    PlanTask pt = new PlanTask(user.getEmail());
                } else {
                    //reset_code��Ϊ��: �򲻷������������ʼ�,��ת����ʾ�Ѿ����������޸��ʼ�.
                    return "reset_repeat";
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "reset_error";
        }
        return "reset_success";
    }

    /**
     * code��֤
     * �����ʼ��е����������������ҳ��
     * @param email
     * @param code
     * @return
     */
    @RequestMapping(value = "reset.do", method = RequestMethod.GET)
    public String reset(@RequestParam("email") String email, @RequestParam("code") String code, ModelMap modelMap) {

        if (null != email && !email.isEmpty() && null != code && !code.isEmpty()) {

            String sql = "select * from Users where email = '" + email + "' and reset_code = '" + code + "'";
            try {
                if (MySQLUtils.queryEmail(sql)) {
                    //code��Ч -> effective_code
                    modelMap.addAttribute("email", email);
                    modelMap.addAttribute("reset_code", code);
                    return "effective_code";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        //code��Ч -> failure_code
        return "failure_code";
    }

    /**
     * ��������
     * @return
     */
    @RequestMapping(value = "effective_code.do", method = RequestMethod.POST)
    public String effectiveCode(@ModelAttribute User user) throws SQLException {

        if (null != user.getEmail() && !user.getEmail().isEmpty() && null != user.getReset_code() && !user.getReset_code().isEmpty()) {
            String sql = "select * from Users where email = '" + user.getEmail() + "' and reset_code = '" + user.getReset_code() + "'";
            try {
                if (MySQLUtils.queryEmail(sql)) {
                    //�޸�����,����reset_codeΪnull(����Ϊnull��ֹ�ظ��ύҳ���޸�����.)
                    sql = "update Users set password = '" + MD5Utils.getMD5(user.getPassword()) + "', reset_code = null where username = '" + user.getEmail() + "' and reset_code = '" + user.getReset_code() + "'";
                    MySQLUtils.insert(sql);
                    return "effective_success";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return "failure_code";
    }

    /**
     * ע��
     * @param session
     * @return
     */
    @RequestMapping(value = "logout.do", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
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