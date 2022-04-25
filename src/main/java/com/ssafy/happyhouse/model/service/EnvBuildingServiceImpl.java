package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dao.EnvBuildingDao;
import com.ssafy.happyhouse.model.dao.EnvBuildingDaoImpl;
import com.ssafy.happyhouse.model.dao.FavDao;
import com.ssafy.happyhouse.model.dto.Env;
import com.ssafy.happyhouse.model.dto.EnvBuilding;
@Service
public class EnvBuildingServiceImpl implements EnvBuildingService {
	@Autowired
	private EnvBuildingDao dao;

	public EnvBuildingServiceImpl() {
		dao = new EnvBuildingDaoImpl();
	}
	@Override
	public List<Env> searchGreen(String dong){
			List<Env> envs = dao.searchGreen(dong);
			return envs;
	} 

	@Override
	public List<EnvBuilding> searchWater(String dong){
			List<EnvBuilding> envs = dao.searchWater(dong);
			return envs;
	}

	@Override
	public List<EnvBuilding> searchAir(String dong){
			List<EnvBuilding> envs = dao.searchAir(dong);
			return envs;
	}
}
