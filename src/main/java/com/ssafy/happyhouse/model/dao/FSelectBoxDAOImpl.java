package com.ssafy.happyhouse.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Env;
import com.ssafy.happyhouse.model.dto.HouseInfoDTO;
import com.ssafy.happyhouse.model.dto.School;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;
import com.ssafy.happyhouse.model.dto.Store;
import com.ssafy.happyhouse.util.DBUtil;

@Repository
public class FSelectBoxDAOImpl implements FSelectBoxDAO {

	private static final String NS = "com.ssafy.happyhouse.model.dao.FSelectBoxDAO.";
	
	@Autowired
	private SqlSession sqlSession;//sql문 호출하는 객체!
	
	@Override
	public List<SidoCodeDTO> selectSido() throws Exception {
		return sqlSession.selectList(NS+"selectSido");
	}

	@Override
	public List<SidoCodeDTO> selectGugun(String sido) throws Exception {
		return sqlSession.selectList(NS+"selectGugun", sido);
	}

	@Override
	public List<HouseInfoDTO> selectDong(String gugun) throws Exception {
		return sqlSession.selectList(NS+"selectDong", gugun);
	}

	@Override
	public List<HouseInfoDTO> selectApt(String dong) throws Exception {
		return sqlSession.selectList(NS+"selectApt", dong);
	}

	@Override
	public List<Env> selectEnv(String dong) throws Exception {
		return sqlSession.selectList(NS+"selectEnv", dong);
	}

	@Override
	public List<Store> selectStore(String dong) throws Exception {
		return sqlSession.selectList(NS+"selectStore", dong);
	}

	@Override
	public List<School> selectSchool(String dong) throws Exception {
		return sqlSession.selectList(NS+"selectSchool", dong);
	}

}
