package com.ssafy.happyhouse.model.dto;

public class Search {
	private String searchType;
	private String searchWord;
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	@Override
	public String toString() {
		return "Search [searchType=" + searchType + ", searchWord=" + searchWord + "]";
	}
}
