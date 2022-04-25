package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.StoreDao;
import com.ssafy.happyhouse.model.dao.StoreDaoImpl;
import com.ssafy.happyhouse.model.dto.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao dao;

	@Override
	public List<Store> search(String dong) {
		return dao.searchStoreByDong(dong);
		}

	@Override
	public Store searchDetail(int no) {
		return dao.searchDetail(no);
	}

	@Override
	public Store searchStoreByName(String shopname) {
		return dao.searchStoreByName(shopname);
	}
}
