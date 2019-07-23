package com.xzy.bean;

import java.io.Serializable;

public class Travel implements Serializable {

	private static final long serialVersionUID = 7647253042391171133L;

	private long id;
	private String title;          //标题
	private String departureTime;   //出发时间
	private String city;            //出发城市
	private String visitcity;        //目的地城市
	private String content;          //内容介绍
	private long issue;              //是否禁用
	private String ctimes;           //创建时间
	private String pic;              //图片的路径

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

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getVisitcity() {
		return visitcity;
	}

	public void setVisitcity(String visitcity) {
		this.visitcity = visitcity;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public long getIssue() {
		return issue;
	}

	public void setIssue(long issue) {
		this.issue = issue;
	}

	public String getCtimes() {
		return ctimes;
	}

	public void setCtimes(String ctimes) {
		this.ctimes = ctimes;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	@Override
	public String toString() {
		System.out.println("id:"+id+
				"\ntitle"+title+
				"\ndepart"+departureTime+
				"\ncity"+city+
				"\nvisitcity"+visitcity+
				"\ncontent"+content+
				"\nissue"+issue+
				"\nctimes"+ctimes+
				"\npic"+pic);
		return null;
	}

}
