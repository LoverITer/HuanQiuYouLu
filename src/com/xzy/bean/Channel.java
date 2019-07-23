package com.xzy.bean;

import java.io.Serializable;

public class Channel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1299746921993298515L;
	private long id;
	private String name;
	private long level;
	private String path;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getLevel() {
		return level;
	}

	public void setLevel(long level) {
		this.level = level;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
