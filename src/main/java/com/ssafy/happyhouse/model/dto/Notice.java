package com.ssafy.happyhouse.model.dto;

public class Notice {
	private int isbn;
	private String title;
	private String content;
	private int views;
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	@Override
	public String toString() {
		return "Notice [isbn=" + isbn + ", title=" + title + ", content=" + content + ", views=" + views + "]";
	}
}
