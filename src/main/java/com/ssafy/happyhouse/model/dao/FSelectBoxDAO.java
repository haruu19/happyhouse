package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Env;
import com.ssafy.happyhouse.model.dto.HouseInfoDTO;
import com.ssafy.happyhouse.model.dto.School;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;
import com.ssafy.happyhouse.model.dto.Store;

public interface FSelectBoxDAO {

	List<SidoCodeDTO> selectSido() throws Exception;

	List<SidoCodeDTO> selectGugun(String sido) throws Exception;

	List<HouseInfoDTO> selectDong(String gugun) throws Exception;

	List<HouseInfoDTO> selectApt(String dong) throws Exception;

	List<Env> selectEnv(String dong) throws Exception;

	List<Store> selectStore(String dong) throws Exception;

	List<School> selectSchool(String dong) throws Exception;

}
