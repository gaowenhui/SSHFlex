package com.lewoo.action;

import java.security.MessageDigest;

/**
 * MD5的算法在RFC1321 中定义
 * 在RFC 1321中，给出了Test suite用来检验你的实现是否正确： 
 * MD5 ("") = d41d8cd98f00b204e9800998ecf8427e 
 * MD5 ("a") = 0cc175b9c0f1b6a831c399e269772661 
 * MD5 ("abc") = 900150983cd24fb0d6963f7d28e17f72 
 * MD5 ("message digest") = f96b697d7cb7938d525a2f31aaf161d0 
 * MD5 ("abcdefghijklmnopqrstuvwxyz") = c3fcd3d76192e4007dfb496cca67e13b 
 * 
 * @author haogj
 */
public class MD5 {
	private final static String[] hexDigits = {  
	      "0", "1", "2", "3", "4", "5", "6", "7",  
	      "8", "9", "a", "b", "c", "d", "e", "f"};  
	  

	 
	  /**  
	   * 转换字节数组为16进制字串  
	   * @param b 字节数组  
	   * @return 16进制字串  
	   */  

	  public static String byteArrayToHexString(byte[] b) {  
	    StringBuffer resultSb = new StringBuffer();  
	    for (int i = 0; i < b.length; i++) {  
	      resultSb.append(byteToHexString(b[i]));  
	    }  
	    return resultSb.toString();  
	  }  

	  private static String byteToHexString(byte b) {  
	    int n = b;  
	    if (n < 0)  
	      n = 256 + n;  
	    int d1 = n / 16;  
	    int d2 = n % 16;  
	    return hexDigits[d1] + hexDigits[d2];  
	  }  

	  public static String MD5Encode(String origin) {  
	    String resultString = null;  

	    try {  
	      resultString=new String(origin);  
	      MessageDigest md = MessageDigest.getInstance("MD5");  
	      resultString=byteArrayToHexString(md.digest(resultString.getBytes()));  
	    }  
	    catch (Exception ex) {  

	    }  
	    return resultString;  
	  }  

	  public static void main(String[] args){  
	    System.err.println(MD5Encode("admin175665"));  //
	    //e80700beb0649dbb3d1105f6a7f36d64  pp1565550
	    //21250c56fb8c190e4322d99f49c1be5e 12345644e074
	    //72e77bcb3c1f7f4363cec2c1d3b20418 admin175665
	  }  

}