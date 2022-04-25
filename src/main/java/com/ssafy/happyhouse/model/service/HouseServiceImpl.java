package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dao.HouseDao;
import com.ssafy.happyhouse.model.dao.HouseDaoImpl;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.Search;

@Service
public class HouseServiceImpl implements HouseService {
	@Autowired
	private HouseDao dao;

	@Override
	public List<HouseDeal> searchAll(HousePageBean bean) {
		// TODO Auto-generated method stub
		try {
			boolean[] types = bean.getSearchType();
			int cnt = 0;
			for (boolean t : types) {
				if(t) {
					cnt++;
				}
			}
			if(cnt==0) {
				throw new HappyHouseException("주택 타입중 하나 이상을 선택해야 합니다.");
			}
			bean.setTotalNo(dao.getTotalCount(bean));
			return dao.searchAll(bean);
		}catch(SQLException e) {
			throw new HappyHouseException("거래 정보를 조회중 오류가 발생했습니다.");
		}
	}

	@Override
	public HouseDeal search(int no) {
		try {
			HouseDeal deal = dao.search(no);
			if(deal == null) {
				throw new HappyHouseException(String.format("거래 번호 %d번에 해당하는 거래정보는 존재하지 않습니다.", no));
			}
			return deal;
		} catch (SQLException e) {
			throw new HappyHouseException("거래 정보를 조회중 오류가 발생했습니다.");
		}
	}

	@Override
	public List<HouseDeal> searchDeals(Search param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HouseDeal searchHouseByName(String aptName) {
		return dao.searchHouseByName(aptName);
	}

}
