package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Env;
import com.ssafy.happyhouse.model.dto.EnvBuilding;
@Repository
public class EnvBuildingDaoImpl implements EnvBuildingDao {

	private static final String NS = "com.ssafy.happyhouse.model.dao.EnvBuildingDao.";
	
	@Autowired
	private SqlSession sqlSession;//sql문 호출하는 객체!
	
	@Override
	public List<EnvBuilding> searchWater(String dong){
		return sqlSession.selectList(NS+"searchWater",dong);
	}

	@Override
	public List<EnvBuilding> searchAir(String dong){
		return sqlSession.selectList(NS+"searchAir",dong);
		
	}

	@Override
	public List<Env> searchGreen(String dong){
		return sqlSession.selectList(NS+"searchGreen",dong);
	}
}
