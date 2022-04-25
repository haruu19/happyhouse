package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.swing.table.DefaultTableModel;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.service.HouseService;

public class HouseSearchController {
	/** 조회 내용 표시할 table */
	private DefaultTableModel houseModel;
	/** model들 */
	private HouseService houseService;
	private boolean[] searchType = { true, true, true, true };
	/** 검색 조건 */
	private String key;
	/** 검색할 단어 */
	private String word;
	private String[] title = { "번호", "동", "아파트이름", "거래금액", "거래종류" };

	public void showHouses() {
		HousePageBean bean = new HousePageBean();
		bean.setSearchType(searchType);
		if (key != null) {
			if (key.equals("dong")) {
				bean.setDong(word);
			} else if (key.equals("name")) {
				bean.setAptName(word);
			}
		}
		try {
			List<HouseDeal> deals = houseService.searchAll(bean);
			if (deals != null) {
				int i = 0;
				String[][] data = new String[deals.size()][5];
				for (HouseDeal deal : deals) {
					data[i][0] = "" + deal.getNo();
					data[i][1] = deal.getDong();
					data[i][2] = deal.getAptName();
					data[i][3] = deal.getDealAmount();
					data[i++][4] = deal.getType();
				}
				houseModel.setDataVector(data, title);
			}
		} catch (HappyHouseException ue) {

		}
	}
}
