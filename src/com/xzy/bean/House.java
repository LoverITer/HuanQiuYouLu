package com.xzy.bean;

import java.io.Serializable;
import java.sql.Date;

public class House implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -656385560212377050L;

	private long id;
	private String name;
	private String keyword;
	private String area;
	private String addr;
	private String priceRMB; // 人民币价格
	private String priceOther; // 其他币种价格
	private String feature;
	private String types;
	private String propertys;
	private String sizes;
	private long payment;
	private String housetype;
	private String fitment;
	private long countryId;
	private long cityId;
	private int level;
	private Date ctimes;
	private String txt1;
	private String txt2;
	private String txt3;
	private String pic;
	private long yjPersent;
	private String yjMany;
	private int isdel;
	private String target;

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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPriceRMB() {
		return priceRMB;
	}

	public void setPriceRMB(String priceRMB) {
		this.priceRMB = priceRMB;
	}

	public String getPriceOther() {
		return priceOther;
	}

	public void setPriceOther(String priceOther) {
		this.priceOther = priceOther;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	public String getPropertys() {
		return propertys;
	}

	public void setPropertys(String propertys) {
		this.propertys = propertys;
	}

	public String getSizes() {
		return sizes;
	}

	public void setSizes(String sizes) {
		this.sizes = sizes;
	}

	public long getPayment() {
		return payment;
	}

	public void setPayment(long payment) {
		this.payment = payment;
	}

	public String getHousetype() {
		return housetype;
	}

	public void setHousetype(String housetype) {
		this.housetype = housetype;
	}

	public String getFitment() {
		return fitment;
	}

	public void setFitment(String fitment) {
		this.fitment = fitment;
	}

	public long getCountryId() {
		return countryId;
	}

	public void setCountryId(long countryId) {
		this.countryId = countryId;
	}

	public long getCityId() {
		return cityId;
	}

	public void setCityId(long cityId) {
		this.cityId = cityId;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public Date getCtimes() {
		return ctimes;
	}

	public void setCtimes(Date ctimes) {
		this.ctimes = ctimes;
	}

	public String getTxt1() {
		return txt1;
	}

	public void setTxt1(String txt1) {
		this.txt1 = txt1;
	}

	public String getTxt2() {
		return txt2;
	}

	public void setTxt2(String txt2) {
		this.txt2 = txt2;
	}

	public String getTxt3() {
		return txt3;
	}

	public void setTxt3(String txt3) {
		this.txt3 = txt3;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public long getYjPersent() {
		return yjPersent;
	}

	public void setYjPersent(long yjPersent) {
		this.yjPersent = yjPersent;
	}

	public String getYjMany() {
		return yjMany;
	}

	public void setYjMany(String yjMany) {
		this.yjMany = yjMany;
	}

	public int getIsdel() {
		return isdel;
	}

	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

}
