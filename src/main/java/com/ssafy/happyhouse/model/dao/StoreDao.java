package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Store;

public interface StoreDao {
	public List<Store> searchStoreByDong(String dong);
	public Store searchDetail(int no);
	public Store searchStoreByName(String shopname);
}
