package com.ssafy.happyhouse.model.dto;

import java.io.Serializable;
import java.util.Arrays;

@SuppressWarnings("serial")
public class HousePageBean implements Serializable {
	private String  city;
	private String  dong;
	private String  dongcode;
	private String  aptName;
	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	private String  dealtype="all";
	private String key="all";
	private String word;
	
	/** 
	 * 0 : 아파트 매매
	 * 1 : 아파트 전월세
	 * 2 : 다세대 매매
	 * 3 : 다세대 전월세  
	 * */
	private boolean[] searchType;
	
	/**웹 페이지 링크*/
	private String 	pagelink;
	
	/**조회할 페이지 번호*/
	private int 	pageNo;
	/**한 페이지에 표시할 리스트 수*/
	private int 	listval = 30;
	/**한 페이지에 표시할 데이타 수*/
	private int 	interval = 19;
	/**한 페이지에 표시할 시작 번호*/
	private int 	start=1;
	/**한 페이지에 표시할 끝 번호 */
	private int 	end=interval;
	private int totalNo;
	
	public void setHousePageBean() {
		this.start=pageNo<(interval/2)+1?0:pageNo-10;
		this.end = start+interval>totalNo/listval?totalNo/listval:start+interval;
		
	}
	
	@Override
	public String toString() {
		return "HousePageBean [city=" + city + ", dong=" + dong + ", dongcode=" + dongcode + ", aptname=" + aptName
				+ ", dealtype=" + dealtype + ", searchType=" + Arrays.toString(searchType) + ", pagelink=" + pagelink
				+ ", pageNo=" + pageNo + ", listval=" + listval + ", interval=" + interval + ", start=" + start
				+ ", end=" + end + ", totalNo=" + totalNo + "]";
	}

	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getDongcode() {
		return dongcode;
	}
	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
	}
	public String getDealtype() {
		return dealtype;
	}
	public void setDealtype(String dealtype) {
		this.dealtype = dealtype;
	}
	public boolean[] getSearchType() {
		return searchType;
	}
	public void setSearchType(boolean[] searchType) {
		this.searchType = searchType;
	}
	public String getPagelink() {
		return pagelink;
	}
	public void setPagelink(String pagelink) {
		this.pagelink = pagelink;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getInterval() {
		return interval;
	}
	public void setInterval(int interval) {
		this.interval = interval;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getTotalNo() {
		return totalNo;
	}
	public void setTotalNo(int totalNo) {
		this.totalNo = totalNo;
	}

	public int getListval() {
		return listval;
	}

	public void setListval(int listval) {
		this.listval = listval;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}
}
