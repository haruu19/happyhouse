package com.ssafy.happyhouse.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Notice;
import com.ssafy.happyhouse.util.AlgoUtil;
import com.ssafy.happyhouse.util.DBUtil;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	private static final String NS = "com.ssafy.happyhouse.model.dao.NoticeDao.";
	
	@Autowired
	private SqlSession sqlSession;//sql문 호출하는 객체!
	
	@Override
	public List<Notice> searchNotice(){
		return sqlSession.selectList(NS+"searchNotice");
	}

	@Override
	public Notice searchNoticeByIsbn(int isbn){
		return sqlSession.selectOne(NS+"searchNoticeByIsbn", isbn);
	}

	@Override
	public void deleteNotice(int isbn){
		sqlSession.delete(NS+"deleteNotice",isbn);
	}

	@Override
	public void insertNotice(Notice notice){
		sqlSession.insert(NS+"insertNotice",notice);
	}

	@Override
	public void updateNotice(Notice notice){
		sqlSession.update(NS+"updateNotice", notice);
	}

	@Override
	public List<Notice> searchSortedByViews(){
		return sqlSession.selectList(NS+"searchSortedByViews()"); 
	}
}
