package com.springapp.mvc.utils;

import java.util.UUID;

/**
 * Created by Xr on 2016/9/2.
 * ��������������֤code.
 */
public class UUIDUtils {

    /**
     * ����code
     * @return
     */
    public static String code() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }
}
