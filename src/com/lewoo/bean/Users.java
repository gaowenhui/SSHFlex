package com.lewoo.bean;


/**
 * Users entity. @author MyEclipse Persistence Tools
 */

public class Users  implements java.io.Serializable {

	// Fields

	private Integer UId;
	private String UName;
	private String UPwd;
	private String Md5Pwd;
	private String Salt;

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** full constructor */
	public Users(String UName, String UPwd, String Md5Pwd,String Salt) {
		this.UName = UName;
		this.UPwd = UPwd;
		this.Md5Pwd = Md5Pwd;
		this.Salt = Salt;
	}

	// Property accessors

	public Integer getUId() {
		return this.UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public String getUName() {
		return this.UName;
	}

	public void setUName(String UName) {
		this.UName = UName;
	}

	public String getUPwd() {
		return this.UPwd;
	}

	public void setUPwd(String UPwd) {
		this.UPwd = UPwd;
	}
	public String getMd5Pwd() {
		return this.Md5Pwd;
	}

	public void setMd5Pwd(String Md5Pwd) {
		this.Md5Pwd = Md5Pwd;
	}

	public String getSalt() {
		return Salt;
	}

	public void setSalt(String salt) {
		Salt = salt;
	}
	
	
}