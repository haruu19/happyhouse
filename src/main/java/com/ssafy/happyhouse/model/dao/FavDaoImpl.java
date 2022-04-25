package com.ssafy.happyhouse.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Count;
import com.ssafy.happyhouse.model.dto.Fav;
import com.ssafy.happyhouse.util.DBUtil;

@Repository
public class FavDaoImpl implements FavDao{

private static final String NS = "com.ssafy.happyhouse.model.dao.FavDao.";
	
	@Autowired
	private SqlSession sqlSession;//sql문 호출하는 객체!
	@Override
	public void insertFav(Fav fav){
		sqlSession.insert(NS+"insertFav", fav);
	}

	@Override
	public List<Fav> searchFav(String id) {
		return sqlSession.selectList(NS+"searchFav", id);
	}

	@Override
	public void deleteFav(Fav fav){
		sqlSession.delete(NS+"deleteFav", fav);
	}

	@Override
	public Count retrieveCountByDong(String dong) {
		return sqlSession.selectOne(NS+"retrieveCountByDong", dong);
	}
}
