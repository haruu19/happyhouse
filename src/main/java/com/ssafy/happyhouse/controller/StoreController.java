package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.Fav;
import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.service.FavService;
import com.ssafy.happyhouse.model.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@Autowired
	private StoreService service;
	
	@Autowired
	private FavService favService;
	
	@GetMapping("/storeList")
	public void storeList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("memberinfo");
		String id = member.getId();
		Fav favs = favService.searchFav(id).get(0);
		String dong = favs.getDong();
		
		model.addAttribute("stores", service.search(dong));
		
	}
	
	@GetMapping("/storeDetail")
	public void storeDetail(Model model, int no) {
		model.addAttribute("store", service.searchDetail(no));
	}
	
	@GetMapping("/storeInfo")
	public String storeInfo(HttpServletRequest request, Model model) {
		String shopname = request.getParameter("shopname");
		model.addAttribute("store", service.searchStoreByName(shopname));
		
		return "store/storeDetail";
	}
}
