package com.ssafy.happyhouse.model.dto;

public class News {
	public String title;
	public String ref;
	public String press;
	public String date;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "News [title=" + title + ", ref=" + ref + ", press=" + press + ", date=" + date + "]";
	}
}
