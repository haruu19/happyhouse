package com.ssafy.happyhouse.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Store;
import com.ssafy.happyhouse.util.DBUtil;

@Repository
public class StoreDaoImpl implements StoreDao {
	
	public StoreDaoImpl() {
	}

	private static final String NS = "com.ssafy.happyhouse.model.dao.StoreDao.";
	
	@Autowired
	private SqlSession sqlSession;//sql문 호출하는 객체!
	
	@Override
	public List<Store> searchStoreByDong(String dong){
		return sqlSession.selectList(NS+"searchStoreByDong",dong);
	}

	@Override
	public Store searchDetail(int no) {
		return sqlSession.selectOne(NS+"searchDetail",no);
	}

	@Override
	public Store searchStoreByName(String shopname) {
		return sqlSession.selectOne(NS+"searchStoreByName",shopname);
	}

}
