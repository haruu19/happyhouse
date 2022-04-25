package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.Count;
import com.ssafy.happyhouse.model.dto.Fav;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.service.FavService;

@Controller
@RequestMapping("/fav")
public class FavController {
	
	@Autowired
	private FavService service;
	
	@GetMapping("/favForm")
	public void setFav() {}
	
	@PostMapping("/setFav")
	public String insertFav(Fav fav) {
		service.setFav(fav);
		return "redirect:favList";
	}
	
	@PostMapping("/deleteFav")
	public String deleteFav(Fav fav) {
		service.deleteFav(fav);
		return "redirect:favList";
	}

	@GetMapping("/gradeList")
	public void gradeList(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("memberinfo");
		String id = member.getId();
		model.addAttribute("list", service.searchFav(id));
	}
	
	@GetMapping("/grade")
	public String grade(HttpServletRequest request, Model model) {
		String dong = request.getParameter("dong");
		Count count = service.retrieveCountByDong(dong);
		model.addAttribute("count", count);
		
		return "fav/grade";
	}

}