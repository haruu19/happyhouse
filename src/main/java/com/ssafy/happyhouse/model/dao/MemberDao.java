package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;

import com.ssafy.happyhouse.model.dto.Member;


public interface MemberDao {
	// 회원 가입, 검색, 수정, 삭제
	void insertMember(Member member) throws SQLException;
	
	Member selectMember(String id,String pwd) throws SQLException;
	
	void updateMember(Member member) throws SQLException;
	
	void deleteMember(String id) throws SQLException;

	String findPwd(String id, String name, String phone) throws SQLException;
}
