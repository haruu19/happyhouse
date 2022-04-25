package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dao.MemberDao;
import com.ssafy.happyhouse.model.dto.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao dao;
	
	@Override
	public String findPwd(String id, String name, String phone) throws SQLException {
		return dao.findPwd(id, name, phone);
	}
	
	@Override
	public void signUp(Member member) {
		try {
			dao.insertMember(member);
		}catch(SQLException e) {
			throw new HappyHouseException("회원 가입 시 오류가 발생했습니다 :(");
		}
	}
	
	
	@Override
	public Member login(String id, String pwd) throws Exception{
		Member member = dao.selectMember(id,pwd);
		if(member == null|| pwd==null) {
			throw new Exception();
		}
		return member;
	}
	
	@Override
	public void updateMember(Member member) {
		try {
			dao.updateMember(member);
		}catch(SQLException e) {
			throw new HappyHouseException("회원 수정 시 오류가 발생했습니다 :(");
		}
	}

	@Override
	public void deleteMember(String id) {
		try {
			dao.deleteMember(id);
		}catch(SQLException e) {
			throw new HappyHouseException("회원 퇼퇴 시 오류가 발생했습니다 :(");
		}
	}
}

