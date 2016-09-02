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
    public static void sendMail(String emailAddress) throws Exception{
        String host = prop.getProperty("host");
        String username = prop.getProperty("username");
        String password = prop.getProperty("password");

        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", "smtp");
        properties.setProperty("mail.host", host);
        properties.setProperty("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(properties);

        MimeMessage mimeMessage = createMime(session, username, emailAddress);

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
    private static MimeMessage createMime(Session session, String sendMail, String receiveMail) throws Exception {
        MimeMessage message = new MimeMessage(session);

        //���÷�����
        message.setFrom(new InternetAddress(sendMail, "HotNews", "UTF-8"));

        String sql = "select * from Users where username = '" + receiveMail + "'";
        User user = MySQLUtils.queryForUser(sql);

        //�����ռ���
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiveMail, user.getNickname(), "UTF-8"));

        //��������
        message.setSubject("HotNews��������", "UTF-8");

        //�����ʼ�����
        message.setContent("����<table><tr><td>111</td></tr></table>", "text/html;charset=UTF-8");

        //���÷���ʱ��
        message.setSentDate(new Date());

        //���ñ���
        message.saveChanges();

        return message;
    }
}
