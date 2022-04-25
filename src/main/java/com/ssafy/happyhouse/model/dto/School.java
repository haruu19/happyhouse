package com.ssafy.happyhouse.model.dto;

public class School {
	private String id;
	private String schoolname;
	private String schoolType;
	private String date;
	private String type;
	private String bon;
	private String oper;
	private String jibun;
	private String doro;
	private String sidoeducode;
	private String sidoeduname;
	private String edusupcode;
	private String edusupname;
	private String startdate;
	private String updatedate;
	private String lat;
	private String lng;
	private String datadate;
	private String agencycode;
	private String agencyname;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSchoolname() {
		return schoolname;
	}
	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}
	public String getSchoolType() {
		return schoolType;
	}
	public void setSchoolType(String schoolType) {
		this.schoolType = schoolType;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBon() {
		return bon;
	}
	public void setBon(String bon) {
		this.bon = bon;
	}
	public String getOper() {
		return oper;
	}
	public void setOper(String oper) {
		this.oper = oper;
	}
	public String getJibun() {
		return jibun;
	}
	public void setJibun(String jibun) {
		this.jibun = jibun;
	}
	public String getDoro() {
		return doro;
	}
	public void setDoro(String doro) {
		this.doro = doro;
	}
	public String getSidoeducode() {
		return sidoeducode;
	}
	public void setSidoeducode(String sidoeducode) {
		this.sidoeducode = sidoeducode;
	}
	public String getSidoeduname() {
		return sidoeduname;
	}
	public void setSidoeduname(String sidoeduname) {
		this.sidoeduname = sidoeduname;
	}
	public String getEdusupcode() {
		return edusupcode;
	}
	public void setEdusupcode(String edusupcode) {
		this.edusupcode = edusupcode;
	}
	public String getEdusupname() {
		return edusupname;
	}
	public void setEdusupname(String edusupname) {
		this.edusupname = edusupname;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getDatadate() {
		return datadate;
	}
	public void setDatadate(String datadate) {
		this.datadate = datadate;
	}
	public String getAgencycode() {
		return agencycode;
	}
	public void setAgencycode(String agencycode) {
		this.agencycode = agencycode;
	}
	public String getAgencyname() {
		return agencyname;
	}
	public void setAgencyname(String agencyname) {
		this.agencyname = agencyname;
	}
	@Override
	public String toString() {
		return "School [schoolname=" + schoolname + ", jibun=" + jibun + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
}
