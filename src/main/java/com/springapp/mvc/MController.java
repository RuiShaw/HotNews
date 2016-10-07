package com.springapp.mvc;

import com.springapp.mvc.bean.Blog;
import com.springapp.mvc.bean.User;
import com.springapp.mvc.impl.HotNewsImpl;
import com.springapp.mvc.service.HotNews;
import com.springapp.mvc.utils.*;
import com.sun.deploy.net.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class MController {

    /**
     * ��½��ʱ��ת��ҳ
     * @return
     */
    @RequestMapping(value = "indexTimeout.do", method = RequestMethod.GET)
    public String loginTimeout(@RequestParam("loginTimeout") String loginTimeout, ModelMap modelMap) {
        if (null != loginTimeout && !loginTimeout.isEmpty()) {
            modelMap.addAttribute("msg", "��½��ʱ,�����µ�½!");
        }
        return "index";
    }

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
            return "forward:main.do"; //��½����ҳ
        }

        //�ض���index.jspҳ��
        modelMap.addAttribute("msg", "������û������������!");
        modelMap.addAttribute("email", email);
        return "index";
    }

    /**
     * ���������б�
     * @param user
     * @param modelMap
     * @return
     * @throws SQLException
     */
    @RequestMapping(value = "blog.do")
    public String blog(@ModelAttribute User user, ModelMap modelMap) throws SQLException {
        //TODO ��ȡ��������

        String author = user.getEmail();

        String sql =
                "select 'true' as flag, id, title, IFNULL(discuss_id, 0) as discuss_id, IFNULL(good_id, 0) as good_id from blog where author = '" + author + "' " + //���߱������еĲ���
                "union all " +
                "select 'false' as flag, id, title, IFNULL(discuss_id, 0) as discuss_id, IFNULL(good_id, 0) as good_id from blog where authority = 'public' and author != '" + author + "'"; //���������Ĳ���

        Connection conn = MySQLUtils.getConn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        //�����б�
        List<Blog> list = new ArrayList<Blog>();

        while (rs.next()) {
            Blog blog = new Blog();

            String flag = rs.getString("flag");
            blog.setFlag(flag);

            String id = rs.getString("id");
            blog.setId(id);

            String title = rs.getString("title");
            blog.setTitle(title);

            String discuss_id = rs.getString("discuss_id");
            if (!discuss_id.equals("0")) {
                //��ѯ���۱�
                sql = "select count(*) as discuss_num from discuss where id = '" + discuss_id + "'";
                //������´���stmt�ͻ���Operation not allowed after ResultSet closed!
                //���ظ�ʹ��stmt.executeQuery(sql)��ʱ��ͻ�ر���һ��ResultSet.
                Statement st = conn.createStatement();
                ResultSet tmp = st.executeQuery(sql);
                int discuss_num = Integer.valueOf(tmp.getString("discuss_num"));
                blog.setDiscuss_num(discuss_num);
            } else {
                //������Ϊ0
                blog.setDiscuss_num(0);
            }

            String good_id = rs.getString("good_id");
            if (!good_id.equals("0")) {
                //��ѯ���ޱ�
                sql = "select count(*) as good_num from good where id = '" + good_id + "'";
                Statement st = conn.createStatement();
                ResultSet tmp = st.executeQuery(sql);
                while (tmp.next()) {
                    int good_num = Integer.valueOf(tmp.getString("good_num"));
                    blog.setGood_num(good_num);
                }
            } else {
                //������Ϊ0
                blog.setGood_num(0);
            }

            list.add(blog);
        }

        //������
        modelMap.put("blog_list", list);

        return "blog";
    }

    /**
     * ���Ͳ鿴
     * @return
     */
    @RequestMapping(value = "blog_view.do", method = RequestMethod.GET)
    public String blogView(@RequestParam String id, ModelMap modelMap, HttpSession httpSession) throws SQLException {
        //TODO ׼���������ݼ�����
        String sql = "select title, IFNULL(discuss_id,0) as discuss_id, IFNULL(good_id, 0) as good_id, content from blog where id = '" + id + "'";
        Connection conn = MySQLUtils.getConn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        //��ǰ�û���
        String username = httpSession.getAttribute("username").toString();

        while (rs.next()) {
            String title = rs.getString("title");
            String content = rs.getString("content");
            modelMap.put("title", title);
            modelMap.put("content", content);
            String discuss_id = rs.getString("discuss_id");
            String good_id = rs.getString("good_id");
            if (!discuss_id.equals("0")) {
                sql = "select d_user, content from discuss where id = '" + discuss_id + "'";
                //TODO ��ȡ�����б�
            }

            if (!good_id.equals("0")) {
                sql = "select good_username from good where id = '" + good_id + "'";
                Statement st = conn.createStatement();
                ResultSet tmp = st.executeQuery(sql);
                int count = 0;
                int max = 0; //����������������
                while (tmp.next()) {
                    max = tmp.getRow();
                    String g_username = tmp.getString("good_username");
                    if (!g_username.isEmpty() && g_username.equals(username)) {
                        //��ǰ�û������ظ���
                        modelMap.put("good", "<button id='good' type='button' class='btn btn-default btn-lg' disabled='disabled'>\n" +
                                "                    <span class='glyphicon glyphicon-thumbs-up'></span>\n" +
                                "                </button>");
                        break;
                    } else {
                        count++;
                    }
                }

                if (count != 0 && max != 0 && count == max) {
                    //û�е�ǰ�û��ĵ��޼�¼
                    modelMap.put("good", "<button id='good' type='button' class='btn btn-default btn-lg'>\n" +
                            "                    <span class='glyphicon glyphicon-thumbs-up'></span>\n" +
                            "                </button>");
                }

            } else {
                //��ǰ�û�������(��ǰ���»�δ������)
                modelMap.put("good", "<button id='good' type='button' class='btn btn-default btn-lg'>\n" +
                        "                    <span class='glyphicon glyphicon-thumbs-up'></span>\n" +
                        "                </button>");
            }
        }

        //����id
        modelMap.put("id", id);

        return "blog_view";
    }


    /**
     * ���͵�������
     * ����code����: 100: �Ѿ������. 200: ���޳ɹ�. 300: ����ʧ��.
     * @param blog_id
     * @return
     */
    @RequestMapping(value = "blog_good.do", method = RequestMethod.POST)
    @ResponseBody
    public String blogGood(@RequestParam String blog_id, HttpSession httpSession) throws SQLException {

        String username = httpSession.getAttribute("username").toString();
        String sql = "select IFNULL(good_id, 0) as good_id from blog where id = '" + blog_id  + "'";
        Connection conn = MySQLUtils.getConn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            String good_id = rs.getString("good_id");
            if (!good_id.equals("0")) {
                sql = "select * from good where good_username = '" + username + "' and id = '" + good_id + "'";
                Statement st = conn.createStatement();
                ResultSet tmp = st.executeQuery(sql);

                int row = 0;
                if (tmp != null) {
                    tmp.beforeFirst();
                    tmp.last();
                    row = tmp.getRow();
                }

                if (row > 0) {
                    //�Ѿ��������
                    return "100";
                }

                //������û�
                sql = "insert into good(id, good_username) values('" + good_id + "', '" + username + "')";
                String code = "";
                if (MySQLUtils.insert(sql)) {
                    code = "200";
                } else {
                    code = "300";
                }
                return code;

            } else {

                //û��good_id
                String g_id = "good_" + UUIDUtils.code();
                sql = "insert into good(id, good_username) values('" + g_id + "', '" + username + "')";
                String code = "";
                if (MySQLUtils.insert(sql)) {
                    //����good_id��blog_id;
                    sql = "update blog set good_id = '" + g_id + "' where id = '" + blog_id + "'";
                    if (MySQLUtils.insert(sql)) {
                        System.out.println("blog_id: " + blog_id + " �� " + "good_id: " + g_id + " �����ɹ�!");
                    } else {
                        System.out.println("blog_id: " + blog_id + " �� " + "good_id: " + g_id + " ����ʧ��!");
                    }
                    code = "200";
                } else {
                    code = "300";
                }
                return code;

            }
        }
        return "";
    }


    /**
     * ���ͱ༭��ת
     * @return
     */
    @RequestMapping(value = "blog_editor.do", method = RequestMethod.GET)
    public String blogEditor(ModelMap modelMap) {
        modelMap.put("blog_content", "���벩������.");
        modelMap.put("option", "<option value='private'>˽��</option><option value='public'>����</option>");
        return "blog_editor";
    }


    /**
     * ɾ����������
     * @param blog_id
     * @return
     * @throws SQLException
     */
    @RequestMapping(value = "blog_delete.do", method = RequestMethod.POST)
    public String blogDelete(@RequestParam String blog_id) throws SQLException{

        String sql = "delete from blog where id='" + blog_id + "'";
        if (MySQLUtils.insert(sql)) {
            System.out.println("ɾ������id:" + blog_id + " �ɹ�!");
        } else {
            System.out.println("ɾ������id:" + blog_id + " ʧ��!");
        }
        //TODO ҳ��δչ�ֳ����µ�����
        return "forward:blog.do";
    }

    /**
     * ���ʹ���
     * @param blog
     * @return
     */
    @RequestMapping(value = "blog_create.do", method= RequestMethod.POST)
    public String blogCreate(@ModelAttribute Blog blog, HttpSession session, ModelMap modelMap) throws SQLException {
        //����id
        String blog_id = "blog_" + UUIDUtils.code();
        blog.setId(blog_id);

        //���ʹ���ʱ��
        String create_time = DateUtils.getCurrDate();
        blog.setCreate_time(create_time);

        //��������
        String author = session.getAttribute("username").toString();
        blog.setAuthor(author);

        String sql = "insert into blog(id, title, create_time, author, authority, content) values('${id}', '${title}', '${create_time}', '${author}', '${authority}', '${content}')";

        sql = StringUtils.getString(sql, blog);

        if (MySQLUtils.insert(sql)) {
            modelMap.put("msg", "���벩�ͳɹ�!");
            modelMap.put("blog_content", "���벩������.");
        } else {
            modelMap.put("msg", "���벩��ʧ��!");
            modelMap.put("blog_content", blog.getContent());
            modelMap.put("title", blog.getTitle());
            if (blog.getAuthority().equals("private")) {
                modelMap.put("option", "<option value='private' selected>˽��</option><option value='public'>����</option>");
            } else {
                modelMap.put("option", "<option value='private'>˽��</option><option value='public' selected>����</option>");
            }
        }
        return "blog_editor";
    }

    /**
     * ����ҳ��
     * @param user
     * @return
     */
    @RequestMapping(value = "news.do")
    public String news(@ModelAttribute User user, ModelMap modelMap) {
        //׼��tab��News������ʾ
        //��ҳ��ʾ16������
        HotNews hn = new HotNewsImpl();
        ArrayList<String> hotNews = hn.getHotNews();
        modelMap.addAttribute("hotNews", hotNews);
        return "news";
    }

    /**
     * ��½����ҳ��
     * @param user
     * @param modelMap
     * @return ��ҳ��
     * @throws SQLException
     */
    @RequestMapping(value = "main.do")
    public String main(@ModelAttribute User user, ModelMap modelMap) throws SQLException {
        String sql = "select * from Users where username = '" + user.getEmail() + "' and password = '" + MD5Utils.getMD5(user.getPassword()) + "'";
        User u = MySQLUtils.queryForUser(sql);
        modelMap.addAttribute("nickname", u.getNickname());
        return "main";
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
     * ��½��ҳ�������޸�ҳ����ת
     * @return
     */
    @RequestMapping(value = "reset_password_jump.do")
    public String resetPassword() {
        return "reset_password";
    }

    /**
     * ��½��ҳ�������޸�ҳ���ύ
     * @return
     */
    @RequestMapping(value = "reset_password.do")
    public String resetPassword2(@RequestParam("s_password") String s_password, @RequestParam("n_password") String n_password,
                                 HttpSession session, ModelMap modelMap) throws SQLException {

        //ԭ����
        s_password = MD5Utils.getMD5(s_password);
        //������
        n_password = MD5Utils.getMD5(n_password);

        //�û���
        String username = session.getAttribute("username").toString();

        String sql = "update Users set password = '" + n_password + "' where username = '" + username + "' and password = '" + s_password + "'";

        if (MySQLUtils.insert(sql)) {
            //sessionʧЧ
            session.invalidate();
            modelMap.addAttribute("msg", "�����޸ĳɹ�!�����µ�½!");
            return "forward:index.do";
        } else {
            modelMap.addAttribute("msg", "�����޸�ʧ��!");
        }
        return "reset_password";
    }

    /**
     * ע��
     * @param session
     * @return
     */
    @RequestMapping(value = "logout.do", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:index.do";
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

    /**
     * ��������Ƿ���ȷ
     * @return true: ������ȷ, false: �������
     */
    @RequestMapping(value = "check_password.do", method = RequestMethod.POST)
    @ResponseBody
    public String checkPassword(@RequestParam("password") String password, HttpSession session) throws SQLException {

        password = MD5Utils.getMD5(password);
        String username = session.getAttribute("username").toString();

        String sql = "select * from Users where username = '" + username + "' and password = '" + password +"'";

        if (MySQLUtils.queryEmail(sql)) {
            return "true";
        }
        return "false";
    }
}