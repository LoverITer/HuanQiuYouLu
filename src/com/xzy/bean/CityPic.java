package com.xzy.bean;

import java.io.Serializable;

public class CityPic implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2606203635480096357L;
	private long id;
	private long cityId;
	private String dis;
	private String path;
	private long level;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getCityId() {
		return cityId;
	}

	public void setCityId(long cityId) {
		this.cityId = cityId;
	}

	public String getDis() {
		return dis;
	}

	public void setDis(String dis) {
		this.dis = dis;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public long getLevel() {
		return level;
	}

	public void setLevel(long level) {
		this.level = level;
	}

}
