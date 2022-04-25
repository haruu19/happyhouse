package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Count;
import com.ssafy.happyhouse.model.dto.Fav;

public interface FavDao {

	void insertFav(Fav fav);

	List<Fav> searchFav(String id);

	void deleteFav(Fav fav);

	Count retrieveCountByDong(String dong);
}
