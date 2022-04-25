package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.DictionaryDao;
import com.ssafy.happyhouse.model.dto.Dictionary;

@Service
public class DictionaryServiceImpl implements DictionaryService {
	
	@Autowired
	private DictionaryDao dao;

	@Override
	public List<Dictionary> list() {
		return dao.searchDictionary();
	}

	@Override
	public Dictionary listByWord(String Word) {
		return dao.searchDictionaryByWord(Word);
	}
	
	
}
