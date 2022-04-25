package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.FSelectBoxDAO;
import com.ssafy.happyhouse.model.dao.FSelectBoxDAOImpl;
import com.ssafy.happyhouse.model.dto.Env;
import com.ssafy.happyhouse.model.dto.HouseInfoDTO;
import com.ssafy.happyhouse.model.dto.School;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;
import com.ssafy.happyhouse.model.dto.Store;

@Service
public class FSelectBoxServiceImpl implements FSelectBoxService {
	@Autowired
	private FSelectBoxDAO dao;

	public FSelectBoxServiceImpl() {
		dao = new FSelectBoxDAOImpl();
	}

	@Override
	public List<SidoCodeDTO> selectSido() throws Exception {
		List<SidoCodeDTO> list = dao.selectSido();
		return list;
	}

	@Override
	public List<SidoCodeDTO> selectGugun(String sido) throws Exception {
		List<SidoCodeDTO> list = dao.selectGugun(sido);
		return list;
	}

	@Override
	public List<HouseInfoDTO> selectDong(String gugun) throws Exception {
		List<HouseInfoDTO> list = dao.selectDong(gugun);
		return list;
	}

	@Override
	public List<HouseInfoDTO> selectApt(String dong) throws Exception {
		List<HouseInfoDTO> list = dao.selectApt(dong);
		return list;
	}

	@Override
	public List<Env> selectEnv(String dong) throws Exception {
		List<Env> list = dao.selectEnv(dong);
		return list;
	}

	@Override
	public List<Store> selectStore(String dong) throws Exception {
		List<Store> list = dao.selectStore(dong);
		return list;
	}

	@Override
	public List<School> selectSchool(String dong) throws Exception {
		List<School> list = dao.selectSchool(dong);
		return list;
	}

}
