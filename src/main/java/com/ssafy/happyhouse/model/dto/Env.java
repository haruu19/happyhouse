package com.ssafy.happyhouse.model.dto;

public class Env {
	
	private String name;
	private String address;
	private Integer dongcode;
	private String dong;
	private double lng;
	private double lat;
	private Integer bizcode;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getDongcode() {
		return dongcode;
	}
	public void setDongcode(Integer dongcode) {
		this.dongcode = dongcode;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public Integer getBizcode() {
		return bizcode;
	}
	public void setBizcode(Integer bizcode) {
		this.bizcode = bizcode;
	}
	
	
}
