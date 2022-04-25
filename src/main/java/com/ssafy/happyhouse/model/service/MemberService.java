package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;

import com.ssafy.happyhouse.model.dto.Member;

public interface MemberService {
	void signUp(Member member);
	
	Member login(String id,String pwd) throws Exception;
	
	void updateMember(Member member);
	
	void deleteMember(String id);

	String findPwd(String id, String name, String phone) throws SQLException;
}
