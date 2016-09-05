package com.springapp.mvc.utils;

import com.springapp.mvc.bean.User;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

/**
 * Created by Xr on 2016/8/26.
 */
public class MailUtils {

    //get username and password
    private static Properties prop = new Properties();

    static {
        try {
            prop.load(MailUtils.class.getClassLoader().getResourceAsStream("mail.properties"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * �����ʼ�
     * @param emailAddress �ռ���
     * @throws Exception
     */
    public static void sendMail(String emailAddress, String website_host, String code) throws Exception{
        String host = prop.getProperty("host");
        String username = prop.getProperty("username");
        String password = prop.getProperty("password");

        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", "smtp");
        properties.setProperty("mail.host", host);
        properties.setProperty("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(properties);

        MimeMessage mimeMessage = createMime(session, username, emailAddress, website_host, code);

        Transport transport = session.getTransport();

        transport.connect(username, password);

        transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());

        transport.close();

    }

    /**
     * ���������ʼ�����
     * @param session
     * @param sendMail ������
     * @param receiveMail �ռ���
     * @return
     */
    private static MimeMessage createMime(Session session, String sendMail, String receiveMail, String website_host, String code) throws Exception {
        MimeMessage message = new MimeMessage(session);

        //���÷�����
        message.setFrom(new InternetAddress(sendMail, "HotNews", "UTF-8"));

        String sql = "select * from Users where username = '" + receiveMail + "'";
        User user = MySQLUtils.queryForUser(sql);

        //�����ռ���
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiveMail, user.getNickname(), "UTF-8"));

        //��������
        message.setSubject("HotNews��������", "UTF-8");

        //���url(receiveMail,code)
        //http://www.ruixiao.org:80/HotNews
        String url = website_host + "/reset.do?email=" + receiveMail + "&code=" + code;

        String html = "<div bgcolor=\"#FFFFFF\" leftmargin=\"0\" marginheight=\"0\" marginwidth=\"0\" topmargin=\"0\"> \n" +
                "   <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"680\"> \n" +
                "    <tbody><tr> \n" +
                "     <td style=\"border-bottom:2px solid #d30403\"><h1>HotNews</h1></td> \n" +
                "    </tr> \n" +
                "    <tr> \n" +
                "     <td align=\"center\" colspan=\"2\">\n" +
                "      <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"680\"> \n" +
                "       <tbody><tr> \n" +
                "        <td style=\"color:#333;line-height:28px;font-size:14px;font-family:Verdana,'����';\"> �װ����û���" + user.getEmail() + " ����<br> <br> ���������޸��������£�<br> <br> <a href=\"" + url + "\" target=\"_blank\">" + (website_host + "/reset") + "</a><br> <br> ���ʼ���ʹ��HTML��ʽ��ʾ�������������ӿ����޷���ȷ��ʾ��<br> <br> �������������Ӳ��ܽ��룬����������Ӹ���ճ����������ĵ�ַ����Ȼ��س���ִ�д����ӡ�<br> <br> �����Ӱ�Сʱ����Ч��������ʧЧ�뵽��վ���²����� </td> \n" +
                "       </tr> \n" +
                "      </tbody></table></td> \n" +
                "    </tr>\n" +
                "   </tbody></table> \n" +
                "  </div>";

        //�����ʼ�����
        message.setContent(html, "text/html;charset=UTF-8");

        //���÷���ʱ��
        message.setSentDate(new Date());

        //���ñ���
        message.saveChanges();

        return message;
    }
}
