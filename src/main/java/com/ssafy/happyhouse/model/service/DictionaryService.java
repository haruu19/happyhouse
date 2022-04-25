package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Dictionary;

public interface DictionaryService {
	
	public List<Dictionary> list();
	public Dictionary listByWord(String Word);
	
}
