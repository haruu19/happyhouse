package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Dictionary;

@Repository
public class DictionaryDaoImpl implements DictionaryDao{
	private static final String NS = "com.ssafy.happyhouse.model.dao.DictionaryDao.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Dictionary> searchDictionary() {
		return sqlSession.selectList(NS+"searchDictionary");
	}

	@Override
	public Dictionary searchDictionaryByWord(String word) {
		return sqlSession.selectOne(NS+"searchDictionaryByWord", word);
	}
}
