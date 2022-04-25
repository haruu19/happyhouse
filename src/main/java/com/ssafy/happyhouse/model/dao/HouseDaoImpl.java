package com.ssafy.happyhouse.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.util.DBUtil;
import com.ssafy.happyhouse.util.AlgoUtil;

@Repository
public class HouseDaoImpl implements HouseDao {

	private static final String NS = "com.ssafy.happyhouse.model.dao.HouseDao.";
	
	@Autowired
	private SqlSession sqlSession;//sql문 호출하는 객체!
	
	private Map<String, HouseInfo> houseInfo;
	private Map<String, List<HouseDeal>> deals;
	private int size;
	private List<HouseDeal> search;
	private String[] searchType= {HouseDeal.APT_DEAL, HouseDeal.APT_RENT, HouseDeal.HOUSE_DEAL, HouseDeal.HOUSE_RENT};
	
	public HouseDaoImpl() {
	}
	/**
	 * 아파트 정보와 아파트 거래 정보를  xml 파일에서 읽어온다.
	 */
	@Override
	public void loadData() { }
	
	@Override
	public int getTotalCount(HousePageBean  bean) throws SQLException {
		return sqlSession.selectOne(NS + "getTotalCount", bean);
	}
	
	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	@Override
	public List<HouseDeal> searchAll(HousePageBean  bean) throws SQLException{
		return sqlSession.selectList(NS + "searchAll", bean);
	}
	
	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환한다.<br/>
	 * 법정동+아파트명을 이용하여 HouseInfo에서 건축연도, 법정코드, 지번, 이미지 정보를 찾아서 HouseDeal에 setting한 정보를 반환한다. 
	 * @param no	검색할 아파트 식별 번호
	 * @return		아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	@Override
	public HouseDeal search(int no) throws SQLException {
		return sqlSession.selectOne(NS + "search", no);
	}
	@Override
	public HouseDeal searchHouseByName(String aptName) {
		return sqlSession.selectOne(NS + "searchHouseByName", aptName);
	}
	
}
