package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.util.AlgoUtil;

@Controller
@RequestMapping("/")
public class HouseController {
	@Autowired
	private HouseService houseService;
	
	/** 조회 내용 표시할 table */
	//private DefaultTableModel houseModel;
	/** model들 */
	private boolean[] searchType = { true, true, true, true };
	/** 검색 조건 */
	private String key;
	/** 검색할 단어 */
	private String word;
	
	@GetMapping("/houseList")
	public String houseList(HttpServletRequest request, Model model) {
		HousePageBean bean = new HousePageBean();
		bean.setSearchType(searchType);
		key= request.getParameter("searchType");
		word=request.getParameter("searchWord");
		if (key != null) {
			if (key.equals("dong")) {
				bean.setDong(word);
			} else if (key.equals("aptname")) {
				bean.setAptName(word);
			}
		}
		bean.setKey(key);
		bean.setWord(word);
		String page=request.getParameter("page");
		int p=0;
		if(page!=null)
			p=Integer.parseInt(page);
		bean.setPageNo(p);
		List<HouseDeal> list = houseService.searchAll(bean);
		bean.setHousePageBean();
//		list = AlgoUtil.quickSort(list);
		model.addAttribute("list", list);
		model.addAttribute("bean", bean);
		
		return "houselistsearch";
	}
	
	@GetMapping("/houseDetail")
	public String houseDetail(HttpServletRequest request, Model model) {
		int no = Integer.parseInt(request.getParameter("no"));
		HouseDeal apt = houseService.search(no);
		model.addAttribute("apt", apt);
		
		return "housedetail";
	}
	
	@GetMapping("/houseInfo")
	public String houseInfo(HttpServletRequest request, Model model) {
		String aptName = request.getParameter("aptName");
		System.out.println(aptName);
		HouseDeal apt = houseService.searchHouseByName(aptName);
		model.addAttribute("apt", apt);
		
		return "housedetail";
	}
}
