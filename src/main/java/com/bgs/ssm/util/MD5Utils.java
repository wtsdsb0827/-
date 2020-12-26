package com.bgs.ssm.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {

    public static String md5(String PWD) {
        byte[] secretBytes = null;
        try {
            secretBytes = MessageDigest.getInstance("md5").digest(PWD.getBytes());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        String md5code = new BigInteger(1, secretBytes).toString(16);
        // 如果生成数字未满32位，需要前面补0(可写可不写)
        for (int i = 0; i < 32 - md5code.length(); i++) {
            md5code = "0" + md5code;
        }
        /*System.out.println(md5code);*/

        return md5code;
    }



}
