package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.FavDao;
import com.ssafy.happyhouse.model.dao.FavDaoImpl;
import com.ssafy.happyhouse.model.dto.Count;
import com.ssafy.happyhouse.model.dto.Fav;

@Service
public class FavServiceImpl implements FavService {
	@Autowired
	FavDao dao;
	
	
	public FavServiceImpl() {
		dao = new FavDaoImpl();
	}


	@Override
	public void setFav(Fav fav){
		dao.insertFav(fav);
	}


	@Override
	public List<Fav> searchFav(String id){
		return dao.searchFav(id);
	}


	@Override
	public void deleteFav(Fav fav) {
		dao.deleteFav(fav);
	}


	@Override
	public Count retrieveCountByDong(String dong) {
		return dao.retrieveCountByDong(dong);
	}
}
