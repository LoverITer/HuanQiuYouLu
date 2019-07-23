package com.xzy.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @Author: HuangXin
 * @Date: Created in 18:21 2019/7/13
 * @Description:  SHA1摘要算法，用于把用户输入的密码转成密文
 */
public class SHA1 {


    public static String toSHA1(String meg) {
        String pas = null;
        byte[] bytes = null;
        try {
            byte[] tem = meg.getBytes();
            MessageDigest sha1 = MessageDigest.getInstance("SHA1");
            sha1.reset();
            sha1.update(tem);
            bytes = sha1.digest();
            StringBuilder sb=new StringBuilder();
            for(byte t:bytes)
            {
                sb.append(Integer.toHexString(t&0xFF));
            }
            pas=sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return pas;
    }


   /* public static void main(String[] args){
         System.out.println(toSHA1("95162437"));
    }*/

}
