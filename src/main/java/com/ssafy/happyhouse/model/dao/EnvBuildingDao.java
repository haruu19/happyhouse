package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException.*;
import java.util.List;

import com.ssafy.happyhouse.model.dto.Env;
import com.ssafy.happyhouse.model.dto.EnvBuilding;

public interface EnvBuildingDao {

	List<Env> searchGreen(String dong);
	List<EnvBuilding> searchWater(String dong);
	List<EnvBuilding> searchAir(String dong);

}
