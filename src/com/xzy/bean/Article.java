package com.xzy.bean;

import java.io.Serializable;
import java.util.Date;

import com.hqyl.annotation.Table;

@Table(value = "article")
public class Article implements Serializable {
	
	private static final long serialVersionUID = -2549044556409267401L;
	private long id;           //资讯id
	private String title;      //资讯标题 
	private String keywords;   //资讯关键字
	private String content;     //资讯的内容
	private String pic;         //资讯的图片
	private String visits;      //资讯的访问次数
	private Date ctime;         //资讯添加的时间
	private long channelId;        //资讯的栏目id
	private long countryId;         //资讯的国家id   
	private long level;             //资讯的等级

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getVisits() {
		return visits;
	}

	public void setVisits(String visits) {
		this.visits = visits;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	public long getChannelId() {
		return channelId;
	}

	public void setChannelId(long channelId) {
		this.channelId = channelId;
	}

	public long getCountryId() {
		return countryId;
	}

	public void setgetCountryId(long cityId) {
		this.countryId = cityId;
	}

	public long getLevel() {
		return level;
	}

	public void setLevel(long level) {
		this.level = level;
	}

}
