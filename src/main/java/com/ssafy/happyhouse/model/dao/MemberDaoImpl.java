package com.ssafy.happyhouse.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.util.DBUtil;

@Repository
public class MemberDaoImpl implements MemberDao {


	private static final String NS = "com.ssafy.happyhouse.model.dao.MemberDao.";
	
	@Autowired
	private SqlSession sqlSession;//sql문 호출하는 객체!
	
	// 데이터베이스에 저장
	@Override
	public void insertMember(Member member) throws SQLException {
		sqlSession.insert(NS+"insertMember",member);
	}
	
	@Override
	public void updateMember(Member member) throws SQLException {
		sqlSession.update(NS+"updateMember", member);
	}
	
	
	@Override
	public Member selectMember(String id, String pwd) throws SQLException {
		Member member = new Member();
		member.setId(id);
		member.setPwd(pwd);
		return sqlSession.selectOne(NS+"selectMember",member);
	}

	@Override
	public void deleteMember(String id) throws SQLException {
		sqlSession.delete(NS+"deleteMember", id);
	}

	@Override
	public String findPwd(String id, String name, String phone) throws SQLException {
		Member member = new Member();
		member.setId(id);
		member.setName(name);
		member.setPhone(phone);
		return sqlSession.selectOne(NS+"findPwd", member);
	}
}
