package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Dictionary;


public interface DictionaryDao {
	
	public List<Dictionary> searchDictionary();
	public Dictionary searchDictionaryByWord(String word);
}
