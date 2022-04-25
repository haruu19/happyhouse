package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Count;
import com.ssafy.happyhouse.model.dto.Fav;

public interface FavService {

	void setFav(Fav fav);

	List<Fav> searchFav(String id);

	void deleteFav(Fav fav);

	Count retrieveCountByDong(String dong);
}
