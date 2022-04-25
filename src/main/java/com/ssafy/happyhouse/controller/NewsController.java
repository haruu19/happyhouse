package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.service.NewsService;

@Controller
@RequestMapping("/news")
public class NewsController extends HttpServlet{
	
	@Autowired
	private NewsService newsService;
	
	
	@GetMapping("/newsList")
	public void newsList(Model model) {
		 model.addAttribute("list", newsService.retrieveNews());
	}
}
