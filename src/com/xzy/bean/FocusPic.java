package com.xzy.bean;

import java.io.Serializable;

public class FocusPic implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4874778443612064474L;
	private long id;
	private String dis;
	private int level;
	private String path;
	private String link;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getDis() {
		return dis;
	}

	public void setDis(String dis) {
		this.dis = dis;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

}
