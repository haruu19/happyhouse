package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.service.DictionaryService;

@Controller
@RequestMapping("/dictionary")
public class DictionaryController {
	@Autowired
	private DictionaryService service;
	
	@GetMapping("/dictionary")
	public void dictionary(Model model) {
		
		model.addAttribute("dictionary", service.list());
	}
	
	@GetMapping("/searchDictionary")
	public String searchDictionary(Model model, String Word) {
		model.addAttribute("search_dictionary", service.listByWord(Word));
		return "/dictionary/dictionary";
	}
	
}
