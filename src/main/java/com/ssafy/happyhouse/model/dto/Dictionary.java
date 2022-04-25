package com.ssafy.happyhouse.model.dto;

public class Dictionary {
	private int no;
	private String word;
	private String content;
	
	public Dictionary(int no, String word, String content) {
		super();
		this.no = no;
		this.word = word;
		this.content = content;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
