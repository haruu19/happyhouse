package com.ssafy.happyhouse.model.dto;

public class Count {
	private int houseCnt;
	private int storeCnt;
	private int envCnt;
	private int schoolCnt;
	public int getHouseCnt() {
		return houseCnt;
	}
	public void setHouseCnt(int houseCnt) {
		this.houseCnt = houseCnt;
	}
	public int getStoreCnt() {
		return storeCnt;
	}
	public void setStoreCnt(int storeCnt) {
		this.storeCnt = storeCnt;
	}
	public int getEnvCnt() {
		return envCnt;
	}
	public void setEnvCnt(int envCnt) {
		this.envCnt = envCnt;
	}
	public int getSchoolCnt() {
		return schoolCnt;
	}
	public void setSchoolCnt(int schoolCnt) {
		this.schoolCnt = schoolCnt;
	}
	@Override
	public String toString() {
		return "Count [houseCnt=" + houseCnt + ", storeCnt=" + storeCnt + ", envCnt=" + envCnt + ", schoolCnt="
				+ schoolCnt + "]";
	}
	
}
