package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Store;

public interface StoreService {
	public List<Store> search(String dong);
	public Store searchDetail(int no);
	public Store searchStoreByName(String shopname);
}
