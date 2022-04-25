package com.ssafy.happyhouse.controller;

import java.io.IOException;


import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.Env;
import com.ssafy.happyhouse.model.dto.EnvBuilding;
import com.ssafy.happyhouse.model.dto.Fav;
import com.ssafy.happyhouse.model.dto.Notice;
import com.ssafy.happyhouse.model.dto.Store;
import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.service.EnvBuildingService;
import com.ssafy.happyhouse.model.service.EnvBuildingServiceImpl;
import com.ssafy.happyhouse.model.service.FavService;
import com.ssafy.happyhouse.model.service.FavServiceImpl;
import com.ssafy.happyhouse.model.service.StoreService;
import com.ssafy.happyhouse.model.service.StoreServiceImpl;

@Controller
@RequestMapping("/fav")
public class EnvController extends HttpServlet{

	@Autowired
	private EnvBuildingService envService;
	@Autowired
	private FavService favService;
	@Autowired
	private StoreService storeService;

	@GetMapping("/toEnv")
	private String list(Model model,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("memberinfo");
		String id = member.getId();
		Fav favs = favService.searchFav(id).get(0);
		String dong = favs.getDong();
		System.out.println(dong);
		String datas[] = request.getParameterValues("checked");

		List<Fav> list = favService.searchFav(id);
		request.setAttribute("list", list);

		for(String data: datas) {
			if(data.equals("green")) {
				model.addAttribute("greens", envService.searchGreen(dong));
			}
			if(data.equals("water")) {
				model.addAttribute("waters", envService.searchWater(dong));
			}
			if(data.equals("air")) {
				model.addAttribute("airs", envService.searchAir(dong));
			}
		}
			return "/fav/favList";
	}
}	
