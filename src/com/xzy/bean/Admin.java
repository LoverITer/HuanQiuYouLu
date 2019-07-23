package com.xzy.bean;

import java.io.Serializable;
import com.hqyl.annotation.Table;

@Table(value = "admin")
public class Admin implements Serializable {


	private static final long serialVersionUID = 7256359962030358347L;

	private Long id;       //管理员id
	private String email;   //管理员的账号
	private String upwd;    //管理员的密码
	private String upur;    //管理员的权限
	
	public Admin() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public String getUpur() {
		return upur;
	}

	public void setUpur(String upur) {
		this.upur = upur;
	}

}
