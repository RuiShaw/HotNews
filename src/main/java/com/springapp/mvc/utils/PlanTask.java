package com.springapp.mvc.utils;

import java.sql.SQLException;
import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by Xr on 2016/9/2.
 * �ƻ�����
 * //1�� = 1000����
   //1���� = 60��

 */
public class PlanTask {

    /**
     * ����û�email��reset_code
     * @param email
     */
    public PlanTask(final String email) {
        Timer timer = new Timer();
        //30����
        long time = 30 * 60 * 1000;
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                String sql = "update Users set reset_code = null where username = '" + email + "'";
                try {
                    MySQLUtils.insert(sql);
                    System.out.println("���" + email + "��reset_code!");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }, time);
    }
}
